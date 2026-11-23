#!/usr/bin/env python3
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import threading
from dataclasses import dataclass, field
from pathlib import Path

HOME = Path.home()
CACHE = Path(os.environ.get("XDG_CACHE_HOME") or HOME / ".cache") / "workshop-lobby-editor"
TEAMS = ["General", "Team 1", "Team 2", "Team FFA"]
HERO_LISTS = ["Enabled Heroes", "Disabled Heroes"]
MAP_LISTS = ["Enabled Maps", "Disabled Maps"]
LIST_TITLES = {name.lower() for name in HERO_LISTS + MAP_LISTS} | {"extensions"}
TRUE_WORDS = {"on", "yes", "enabled", "true"}
FALSE_WORDS = {"off", "no", "disabled", "false"}
BOOL_WORDS = {
    "__boolOnOff__": ("On", "Off"),
    "__boolReverseOnOff__": ("On", "Off"),
    "__boolYesNo__": ("Yes", "No"),
    "__boolEnabled__": ("Enabled", "Disabled"),
    "__boolReverseEnabled__": ("Enabled", "Disabled"),
}
PAREN_NAME = re.compile(r"^(.+?) \((.+)\)$")
MAP_ID = re.compile(r"\s+\d{6,}$")
EXTENSION_POINTS = re.compile(r"costs (\d+) extension point")

OVERPY_BRIDGE = r"""
const path = require('path');
const root = process.argv[2];
const op = require(path.join(root, 'npm', 'overpy.js'));
const en = (e) => (e && e['en-US']) || null;
const kind = (e) => {
  if (typeof e.values === 'string') return e.values;
  if (e.values && typeof e.values === 'object') return { enum: Object.values(e.values).map(en).filter(Boolean) };
  return null;
};
const block = (vals) => Object.keys(vals || {}).filter((k) => en(vals[k])).map((k) => [en(vals[k]), kind(vals[k])]);
(async () => {
  await op.readyPromise;
  const s = op.customGameSettingsSchema;
  const heroes = {};
  for (const [k, e] of Object.entries(s.heroes.values)) {
    if (!e || !e.values || typeof e.values !== 'object') continue;
    if (k !== 'general' && !op.heroKw[k]) continue;
    heroes[k === 'general' ? 'General' : en(op.heroKw[k]) || k] = block(e.values);
  }
  const modes = {};
  for (const [k, e] of Object.entries(s.gamemodes.values)) {
    const maps = Object.values(op.mapKw).filter((m) => (m.gamemodes || []).includes(k)).map(en).filter(Boolean);
    modes[k === 'general' ? 'All' : en(e) || k] = { settings: block(e.values), maps };
  }
  const out = {
    version: require(path.join(root, 'package.json')).version,
    main: block(s.main.values),
    lobby: block(s.lobby.values),
    modes,
    heroes,
    extensions: Object.fromEntries(Object.values(s.extensions.values).map((v) => [en(v), v.points])),
  };
  process.stdout.write(JSON.stringify(out));
})().catch((e) => { console.error((e && e.stack) || e); process.exit(1); });
"""


def version_key(path: Path):
    return [int(part) if part.isdigit() else part for part in re.split(r"[.\-]", path.name)]


def newest(paths):
    found = [p for p in paths if p.exists()]
    return max(found, key=version_key) if found else None


EXTENSION_ROOTS = [HOME / ".vscode" / "extensions", HOME / ".vscode-oss" / "extensions", HOME / ".vscode-server" / "extensions"]
STORAGE_ROOTS = [
    HOME / ".config" / "Code" / "User" / "globalStorage",
    HOME / ".config" / "VSCodium" / "User" / "globalStorage",
    HOME / "AppData" / "Roaming" / "Code" / "User" / "globalStorage",
    HOME / "Library" / "Application Support" / "Code" / "User" / "globalStorage",
]
ELECTRON_CANDIDATES = [
    Path("/usr/share/code/code"),
    Path("/opt/visual-studio-code/code"),
    Path("/usr/lib/code/code"),
    Path("/snap/code/current/usr/share/code/code"),
]


@dataclass
class Tools:
    ostw_extension: Path | None
    ostw_compiler: Path | None
    overpy: Path | None
    node: list[str] | None
    node_env: dict

    @classmethod
    def find(cls) -> "Tools":
        def env_path(name):
            value = os.environ.get(name)
            return Path(value) if value else None

        ostw_extension = env_path("OSTW_EXTENSION") or newest(
            p for root in EXTENSION_ROOTS if root.exists() for p in root.glob("deltin.overwatch-script-to-workshop-*")
        )
        overpy = env_path("OVERPY_EXTENSION") or newest(
            p for root in EXTENSION_ROOTS if root.exists() for p in root.glob("zezombye.overpy-*")
        )
        compiler = env_path("OSTW_COMPILER")
        if compiler is None:
            for root in STORAGE_ROOTS:
                for exe in ("Deltinteger", "Deltinteger.exe"):
                    hits = sorted((root / "deltin.overwatch-script-to-workshop" / "Server" / "bin").glob(f"*/{exe}"))
                    if hits:
                        compiler = hits[0]
                        break
                if compiler:
                    break
        node, env = None, {}
        if os.environ.get("WORKSHOP_NODE"):
            node = [os.environ["WORKSHOP_NODE"]]
        elif shutil.which("node"):
            node = [shutil.which("node")]
        else:
            electron = next((p for p in ELECTRON_CANDIDATES if p.exists()), None)
            if electron:
                node, env = [str(electron)], {"ELECTRON_RUN_AS_NODE": "1"}
        return cls(ostw_extension, compiler, overpy, node, env)


@dataclass
class Setting:
    name: str
    kind: str
    words: tuple = ("On", "Off")
    options: tuple = ()
    minimum: float | None = None
    maximum: float | None = None
    default: object = None
    percent: bool = False
    ostw: bool = False

    def parse(self, raw):
        if self.kind == "bool":
            if isinstance(raw, bool):
                return raw
            word = str(raw).strip().lower()
            if word in TRUE_WORDS:
                return True
            if word in FALSE_WORDS:
                return False
            raise ValueError(f"expected {self.words[0]} or {self.words[1]}, got {raw!r}")
        if self.kind in ("number", "int"):
            if isinstance(raw, bool):
                raise ValueError(f"expected a number, got {raw!r}")
            if isinstance(raw, (int, float)):
                number = float(raw)
            else:
                try:
                    number = float(str(raw).strip().rstrip("%").strip())
                except ValueError:
                    raise ValueError(f"expected a number, got {raw!r}") from None
            if self.kind == "int":
                return int(round(number))
            return int(number) if number.is_integer() else number
        if self.kind == "enum":
            text = str(raw).strip()
            return next((o for o in self.options if o.lower() == text.lower()), text)
        return str(raw)

    def problem(self, value):
        if self.kind == "bool" and not isinstance(value, bool):
            return f"expected {self.words[0]} or {self.words[1]}"
        if self.kind in ("number", "int"):
            if isinstance(value, bool) or not isinstance(value, (int, float)):
                return "expected a number"
            if self.minimum is not None and value < self.minimum:
                return f"{self.show(value)} is below the minimum of {self.show(self.minimum)}"
            if self.maximum is not None and value > self.maximum:
                return f"{self.show(value)} is above the maximum of {self.show(self.maximum)}"
        if self.kind == "enum" and self.options and value not in self.options:
            return f"{value!r} is not one of: {', '.join(self.options)}"
        return None

    def show(self, value):
        if value is None:
            return ""
        if self.kind == "bool" and isinstance(value, bool):
            return self.words[0] if value else self.words[1]
        if self.kind in ("number", "int") and isinstance(value, (int, float)) and not isinstance(value, bool):
            return f"{value:g}" + ("%" if self.percent else "")
        return str(value)

    def to_lobby(self, value):
        if self.ostw:
            if self.kind == "int" and isinstance(value, (int, float)) and not isinstance(value, bool):
                return int(value)
            return value
        if self.kind == "bool" and isinstance(value, bool):
            return self.show(value)
        if isinstance(value, (int, float)) and not isinstance(value, bool):
            return value if self.percent else f"{value:g}"
        return value


def find_name(name: str, settings: dict) -> str:
    if name in settings:
        return name
    match = PAREN_NAME.match(name)
    if match and f"{match.group(1)} {match.group(2)}" in settings:
        return f"{match.group(1)} {match.group(2)}"
    lowered = name.lower()
    return next((k for k in settings if k.lower() == lowered), name)


class OstwSchema:
    def __init__(self, data: dict, version: str):
        self.data = data
        self.defs = data.get("definitions", {})
        self.version = version

    @classmethod
    def load(cls, tools: Tools):
        if not tools.ostw_extension:
            return None
        path = tools.ostw_extension / "json-schemas" / "LobbySettingValidation.json"
        if not path.exists():
            return None
        version = tools.ostw_extension.name.rsplit("-", 1)[-1]
        return cls(json.loads(path.read_text(encoding="utf-8")), version)

    def resolve(self, node):
        while isinstance(node, dict) and "$ref" in node:
            node = self.defs[node["$ref"].split("/")[-1]]
        return node

    def props(self, node) -> dict:
        node = self.resolve(node)
        out = {}
        for part in [node, *[self.resolve(p) for p in node.get("allOf", [])]]:
            for key, value in part.get("properties", {}).items():
                out[key] = self.resolve(value)
        return out

    def root(self):
        return self.props(self.data)

    def lobby(self):
        return self.props(self.root()["Lobby"])

    def modes(self):
        return {k: self.props(v) for k, v in self.props(self.root()["Modes"]).items()}

    def heroes(self):
        return {k: self.props(v) for k, v in self.props(self.defs["HeroList"]).items() if k not in HERO_LISTS}

    def extensions(self):
        out = {}
        for name, prop in self.props(self.root()["Extensions"]).items():
            match = EXTENSION_POINTS.search(prop.get("description", ""))
            out[name] = int(match.group(1)) if match else 0
        return out


def setting_from_overpy(name: str, kind) -> Setting:
    if isinstance(kind, dict):
        return Setting(name, "enum", options=tuple(kind.get("enum", [])))
    if kind in BOOL_WORDS:
        return Setting(name, "bool", words=BOOL_WORDS[kind])
    if kind == "__percent__":
        return Setting(name, "number", minimum=0.0, percent=True)
    if kind == "__int__":
        return Setting(name, "int", minimum=0.0)
    if kind == "__float__":
        return Setting(name, "number", minimum=0.0)
    return Setting(name, "text")


def setting_from_ostw(name: str, prop: dict, words=("On", "Off")):
    kind = prop.get("type")
    if kind == "boolean":
        setting = Setting(name, "bool", words=words)
    elif kind == "integer":
        setting = Setting(name, "int")
    elif kind == "number":
        setting = Setting(name, "number", percent=True)
    elif kind == "string" and prop.get("enum"):
        setting = Setting(name, "enum", options=tuple(prop["enum"]))
    elif kind == "string":
        setting = Setting(name, "text")
    else:
        return None
    apply_ostw(setting, prop)
    return setting


def apply_ostw(setting: Setting, prop: dict) -> bool:
    family = {"bool": "boolean", "number": ("number", "integer"), "int": ("number", "integer"), "enum": "string", "text": "string"}
    expected = family[setting.kind]
    if prop.get("type") not in (expected if isinstance(expected, tuple) else (expected,)):
        return False
    setting.ostw = True
    if setting.kind in ("number", "int"):
        setting.minimum = prop.get("minimum", 0.0)
        setting.maximum = prop.get("maximum", setting.maximum)
    if setting.kind == "enum" and not setting.options:
        setting.options = tuple(prop.get("enum", []))
    setting.default = prop.get("default", setting.default)
    if setting.kind == "int" and isinstance(setting.default, float):
        setting.default = int(setting.default)
    return True


def merge(overpy_list, ostw_props: dict | None, words=("On", "Off")) -> dict:
    ostw_props = ostw_props or {}
    out = {}
    if overpy_list is None:
        for name, prop in ostw_props.items():
            if name == "Enabled" or name in MAP_LISTS or PAREN_NAME.match(name) and name.startswith("Ultimate"):
                continue
            setting = setting_from_ostw(name, prop, words)
            if setting:
                out[name] = setting
        return out
    for name, kind in overpy_list:
        setting = setting_from_overpy(name, kind)
        if name in ostw_props:
            apply_ostw(setting, ostw_props[name])
        out[name] = setting
    return out


@dataclass
class Catalog:
    main: dict
    lobby: dict
    modes: dict
    maps: dict
    heroes: dict
    extensions: dict
    sources: list = field(default_factory=list)

    @property
    def hero_names(self):
        return [h for h in self.heroes if h != "General"]

    def mode_settings(self, mode: str) -> dict:
        return self.modes.get(mode) or self.modes.get("All", {})

    def mode_name(self, raw: str) -> str:
        raw = raw.strip()
        if raw.lower() == "general":
            return "All"
        return next((m for m in self.modes if m.lower() == raw.lower()), raw)

    def hero_name(self, raw: str) -> str:
        raw = raw.strip()
        return next((h for h in self.heroes if h.lower() == raw.lower()), raw)

    def section(self, path: tuple) -> dict:
        if path[0] == "Lobby":
            return self.lobby
        if path[0] == "Main":
            return self.main
        if path[0] == "Modes":
            return self.mode_settings(path[1])
        if path[0] == "Heroes":
            return self.heroes.get(path[2], {})
        return {}


def load_overpy_catalog(tools: Tools, refresh: bool = False):
    if not tools.overpy or not tools.node:
        return None, "OverPy or a Node runtime was not found"
    try:
        version = json.loads((tools.overpy / "package.json").read_text(encoding="utf-8"))["version"]
    except (OSError, KeyError, ValueError):
        version = tools.overpy.name
    digest = hashlib.sha1(OVERPY_BRIDGE.encode()).hexdigest()[:8]
    cache_file = CACHE / f"overpy-{version}-{digest}.json"
    if cache_file.exists() and not refresh:
        return json.loads(cache_file.read_text(encoding="utf-8")), None
    CACHE.mkdir(parents=True, exist_ok=True)
    bridge = CACHE / "overpy-bridge.js"
    bridge.write_text(OVERPY_BRIDGE, encoding="utf-8")
    try:
        result = subprocess.run(
            [*tools.node, str(bridge), str(tools.overpy)],
            capture_output=True, text=True, timeout=240, env={**os.environ, **tools.node_env},
        )
    except (OSError, subprocess.TimeoutExpired) as error:
        return None, f"OverPy could not be loaded: {error}"
    if result.returncode != 0:
        return None, "OverPy could not be loaded: " + (result.stderr.strip().splitlines() or ["unknown error"])[-1]
    data = json.loads(result.stdout)
    cache_file.write_text(json.dumps(data), encoding="utf-8")
    return data, None


def build_catalog(tools: Tools, refresh: bool = False) -> Catalog:
    ostw = OstwSchema.load(tools)
    overpy, overpy_error = load_overpy_catalog(tools, refresh)
    sources = []
    if ostw:
        sources.append(f"OSTW {ostw.version}")
    if overpy:
        sources.append(f"OverPy {overpy['version']}")
    elif overpy_error:
        sources.append(overpy_error)
    if not ostw and not overpy:
        raise RuntimeError("Neither the OSTW nor the OverPy VS Code extension was found, so there is no settings catalog.")

    ostw_lobby = ostw.lobby() if ostw else {}
    ostw_modes = ostw.modes() if ostw else {}
    ostw_heroes = ostw.heroes() if ostw else {}

    main = {"Mode Name": Setting("Mode Name", "text", ostw=True), "Description": Setting("Description", "text", ostw=True)}
    lobby = merge(overpy["lobby"] if overpy else None, ostw_lobby, ("Yes", "No"))

    modes, maps = {}, {}
    if overpy:
        for name, entry in overpy["modes"].items():
            modes[name] = merge(entry["settings"], ostw_modes.get(name) or ostw_modes.get("All"))
            maps[name] = entry["maps"]
        for name in ostw_modes:
            if name not in modes:
                modes[name] = merge(None, ostw_modes[name])
    else:
        for name, props in ostw_modes.items():
            modes[name] = merge(None, props)
    for name, props in ostw_modes.items():
        enum = (props.get("Enabled Maps", {}).get("items") or {}).get("enum")
        if enum and not maps.get(name):
            maps[name] = sorted(enum)
    if "All" in modes:
        all_settings = modes["All"]
        for name, settings in modes.items():
            if name != "All":
                for key, setting in all_settings.items():
                    settings.setdefault(key, setting)

    heroes = {}
    if overpy:
        for name, entries in overpy["heroes"].items():
            heroes[name] = merge(entries, ostw_heroes.get(name))
    else:
        for name, props in ostw_heroes.items():
            heroes[name] = merge(None, props)

    extensions = dict(overpy["extensions"]) if overpy else (ostw.extensions() if ostw else {})
    return Catalog(main, lobby, modes, maps, heroes, extensions, sources)


@dataclass
class Issue:
    level: str
    node: str
    where: str
    message: str

    def __str__(self):
        return f"{self.level}: {self.where}: {self.message}"


def read_values(raw: dict, settings: dict, where: str, node: str, issues: list) -> dict:
    out = {}
    for key, value in raw.items():
        name = find_name(key, settings)
        setting = settings.get(name)
        if setting is None:
            issues.append(Issue("warning", node, f"{where} / {name}", "not in the settings catalog, kept as written"))
            out[name] = value
            continue
        try:
            out[name] = setting.parse(value)
        except ValueError as error:
            issues.append(Issue("error", node, f"{where} / {name}", str(error)))
            out[name] = value
    return out


def canonical(raw: str, choices) -> str:
    return next((c for c in choices if c.lower() == raw.strip().lower()), raw.strip())


def doc_from_lobby(data: dict, catalog: Catalog):
    issues: list[Issue] = []
    doc: dict = {}
    for key in ("Mode Name", "Description"):
        if data.get(key):
            doc[key] = str(data[key])
    if data.get("Lobby"):
        doc["Lobby"] = read_values(data["Lobby"], catalog.lobby, "Lobby", "lobby", issues)
    for raw_name, raw in (data.get("Modes") or {}).items():
        name = catalog.mode_name(raw_name)
        mode, rest = {}, {}
        for key, value in (raw or {}).items():
            if key.lower() == "enabled":
                mode["Enabled"] = value if isinstance(value, bool) else str(value).lower() in TRUE_WORDS
            elif key.lower() in {m.lower() for m in MAP_LISTS}:
                mode[canonical(key, MAP_LISTS)] = [MAP_ID.sub("", str(m)) for m in value]
            else:
                rest[key] = value
        mode.update(read_values(rest, catalog.mode_settings(name), f"Modes / {name}", f"mode|{name}", issues))
        doc.setdefault("Modes", {})[name] = mode
    for raw_team, team_raw in (data.get("Heroes") or {}).items():
        team_name = canonical(raw_team, TEAMS)
        team, team_wide = {}, {}
        for key, value in (team_raw or {}).items():
            if key.lower() in {h.lower() for h in HERO_LISTS}:
                team[canonical(key, HERO_LISTS)] = [catalog.hero_name(h) for h in value]
            elif key == "General" and isinstance(value, dict):
                team_wide.update(value)
            elif isinstance(value, dict):
                hero = catalog.hero_name(key)
                team[hero] = read_values(value, catalog.heroes.get(hero, {}), f"{team_name} / {hero}", f"hero|{team_name}|{hero}", issues)
            else:
                team_wide[key] = value
        if team_wide:
            team["General"] = read_values(team_wide, catalog.heroes.get("General", {}), f"{team_name} / Team-wide", f"hero|{team_name}|General", issues)
        doc.setdefault("Heroes", {})[team_name] = team
    if data.get("Workshop"):
        doc["Workshop"] = {k: workshop_text(v) for k, v in data["Workshop"].items()}
    extensions = data.get("Extensions")
    if isinstance(extensions, dict):
        doc["Extensions"] = [k for k, v in extensions.items() if v]
    elif isinstance(extensions, list):
        doc["Extensions"] = list(extensions)
    return doc, issues


def workshop_text(value) -> str:
    if isinstance(value, bool):
        return "On" if value else "Off"
    if isinstance(value, (int, float)):
        return f"{value:g}"
    return str(value)


@dataclass
class Block:
    title: str
    kv: list = field(default_factory=list)
    items: list = field(default_factory=list)
    blocks: list = field(default_factory=list)

    def child(self, title: str):
        return next((b for b in self.blocks if b.title.lower() == title.lower()), None)


def parse_blocks(text: str) -> Block:
    lines = [line.strip() for line in text.splitlines()]
    lines = [line for line in lines if line and not line.startswith("//")]
    root = Block("")
    stack = [root]
    pending = None

    def flush():
        nonlocal pending
        if pending is not None:
            stack[-1].items.append(pending)
            pending = None

    for index, line in enumerate(lines):
        following = lines[index + 1] if index + 1 < len(lines) else ""
        if line == "{":
            child = Block(pending or "")
            pending = None
            stack[-1].blocks.append(child)
            stack.append(child)
            continue
        if line == "}":
            flush()
            if len(stack) > 1:
                stack.pop()
            continue
        flush()
        if following == "{":
            pending = line
        elif stack[-1].title.lower() in LIST_TITLES or ":" not in line:
            stack[-1].items.append(line)
        else:
            key, value = line.split(":", 1)
            stack[-1].kv.append((key.strip(), value.strip().strip('"')))
    flush()
    return root


def doc_from_text(text: str, catalog: Catalog):
    issues: list[Issue] = []
    root = parse_blocks(text)
    settings = root.child("settings") or root
    doc: dict = {}
    main = settings.child("main")
    if main:
        for key, value in main.kv:
            doc[canonical(key, ["Mode Name", "Description"])] = value
    lobby = settings.child("lobby")
    if lobby:
        doc["Lobby"] = read_values(dict(lobby.kv), catalog.lobby, "Lobby", "lobby", issues)
    modes_block = settings.child("modes")
    if modes_block:
        modes = doc.setdefault("Modes", {})
        for title in modes_block.items:
            if title.lower().startswith("disabled "):
                modes[catalog.mode_name(title[9:])] = {"Enabled": False}
        for block in modes_block.blocks:
            title = block.title
            enabled = not title.lower().startswith("disabled ")
            name = catalog.mode_name(title if enabled else title[9:])
            mode = {} if name == "All" else {"Enabled": enabled}
            for sub in block.blocks:
                if sub.title.lower() in {m.lower() for m in MAP_LISTS}:
                    mode[canonical(sub.title, MAP_LISTS)] = [MAP_ID.sub("", m) for m in sub.items]
            mode.update(read_values(dict(block.kv), catalog.mode_settings(name), f"Modes / {name}", f"mode|{name}", issues))
            modes[name] = mode
    heroes_block = settings.child("heroes")
    if heroes_block:
        for team_block in heroes_block.blocks:
            team_name = canonical(team_block.title, TEAMS)
            team = {}
            if team_block.kv:
                team["General"] = read_values(dict(team_block.kv), catalog.heroes.get("General", {}), f"{team_name} / Team-wide", f"hero|{team_name}|General", issues)
            for hero_block in team_block.blocks:
                if hero_block.title.lower() in {h.lower() for h in HERO_LISTS}:
                    team[canonical(hero_block.title, HERO_LISTS)] = [catalog.hero_name(h) for h in hero_block.items]
                    continue
                hero = catalog.hero_name(hero_block.title)
                team[hero] = read_values(dict(hero_block.kv), catalog.heroes.get(hero, {}), f"{team_name} / {hero}", f"hero|{team_name}|{hero}", issues)
            doc.setdefault("Heroes", {})[team_name] = team
    workshop = settings.child("workshop")
    if workshop and workshop.kv:
        doc["Workshop"] = dict(workshop.kv)
    extensions = settings.child("extensions")
    if extensions:
        doc["Extensions"] = list(extensions.items)
    return doc, issues


def read_any(path, catalog: Catalog):
    text = Path(path).read_text(encoding="utf-8-sig")
    if text.lstrip().startswith("{"):
        return doc_from_lobby(json.loads(text), catalog)
    return doc_from_text(text, catalog)


def encode_values(values: dict, settings: dict) -> dict:
    out = {}
    for name in sorted(values, key=str.lower):
        value = values[name]
        setting = settings.get(name)
        out[name] = setting.to_lobby(value) if setting else value
    return out


def doc_to_lobby(doc: dict, catalog: Catalog) -> dict:
    out: dict = {}
    for key in ("Mode Name", "Description"):
        if doc.get(key):
            out[key] = doc[key]
    if doc.get("Lobby"):
        out["Lobby"] = encode_values(doc["Lobby"], catalog.lobby)
    modes = doc.get("Modes") or {}
    if modes:
        encoded = {}
        for name in sorted(modes, key=lambda m: (m != "All", m.lower())):
            mode = modes[name]
            entry = {}
            if "Enabled" in mode and name != "All":
                entry["Enabled"] = bool(mode["Enabled"])
            for key in MAP_LISTS:
                if key in mode:
                    entry[key] = list(mode[key])
            settings = {k: v for k, v in mode.items() if k != "Enabled" and k not in MAP_LISTS}
            entry.update(encode_values(settings, catalog.mode_settings(name)))
            if entry:
                encoded[name] = entry
        if encoded:
            out["Modes"] = encoded
    heroes = doc.get("Heroes") or {}
    if heroes:
        encoded = {}
        for team_name in sorted(heroes, key=lambda t: TEAMS.index(t) if t in TEAMS else len(TEAMS)):
            team = heroes[team_name]
            entry = {}
            if team.get("General"):
                entry["General"] = encode_values(team["General"], catalog.heroes.get("General", {}))
            for hero in sorted((h for h in team if h != "General" and h not in HERO_LISTS), key=str.lower):
                if team[hero]:
                    entry[hero] = encode_values(team[hero], catalog.heroes.get(hero, {}))
            for key in HERO_LISTS:
                if key in team:
                    entry[key] = list(team[key])
            if entry:
                encoded[team_name] = entry
        if encoded:
            out["Heroes"] = encoded
    if doc.get("Workshop"):
        out["Workshop"] = {k: str(v) for k, v in doc["Workshop"].items()}
    if doc.get("Extensions"):
        order = list(catalog.extensions)
        names = sorted(doc["Extensions"], key=lambda e: order.index(e) if e in order else len(order))
        out["Extensions"] = {name: True for name in names}
    return out


def lobby_text(doc: dict, catalog: Catalog) -> str:
    return json.dumps(doc_to_lobby(doc, catalog), indent=2, ensure_ascii=False) + "\n"


def check_values(values: dict, settings: dict, where: str, node: str, issues: list):
    for name, value in values.items():
        setting = settings.get(name)
        if setting is None:
            issues.append(Issue("warning", node, f"{where} / {name}", "not in the settings catalog, OSTW writes it as-is"))
            continue
        message = setting.problem(value)
        if message:
            issues.append(Issue("error", node, f"{where} / {name}", message))


def check_doc(doc: dict, catalog: Catalog) -> list[Issue]:
    issues: list[Issue] = []
    check_values(doc.get("Lobby") or {}, catalog.lobby, "Lobby", "lobby", issues)
    for name, mode in (doc.get("Modes") or {}).items():
        node = f"mode|{name}"
        if name not in catalog.modes:
            issues.append(Issue("warning", node, f"Modes / {name}", "unknown game mode"))
        valid_maps = set(catalog.maps.get(name, []))
        for key in MAP_LISTS:
            for map_name in mode.get(key, []):
                if valid_maps and map_name not in valid_maps:
                    issues.append(Issue("error", node, f"Modes / {name} / {key}", f"{map_name!r} is not a {name} map"))
        settings = {k: v for k, v in mode.items() if k != "Enabled" and k not in MAP_LISTS}
        check_values(settings, catalog.mode_settings(name), f"Modes / {name}", node, issues)
    for team_name, team in (doc.get("Heroes") or {}).items():
        if team_name not in TEAMS:
            issues.append(Issue("error", f"team|{team_name}", f"Heroes / {team_name}", f"unknown team, use one of {', '.join(TEAMS)}"))
        for key in HERO_LISTS:
            for hero in team.get(key, []):
                if hero not in catalog.heroes:
                    issues.append(Issue("error", f"team|{team_name}", f"{team_name} / {key}", f"unknown hero {hero!r}"))
        for hero, values in team.items():
            if hero in HERO_LISTS:
                continue
            label = "Team-wide" if hero == "General" else hero
            node = f"hero|{team_name}|{hero}"
            if hero not in catalog.heroes:
                issues.append(Issue("warning", node, f"{team_name} / {hero}", "unknown hero"))
            check_values(values, catalog.heroes.get(hero, {}), f"{team_name} / {label}", node, issues)
    for name in doc.get("Extensions") or []:
        if name not in catalog.extensions:
            issues.append(Issue("warning", "extensions", f"Extensions / {name}", "unknown extension"))
    return issues


def ostw_preview(lobby_data: dict, tools: Tools) -> str:
    if not tools.ostw_compiler:
        raise RuntimeError("The OSTW compiler (Deltinteger) was not found. Install the OSTW VS Code extension or set OSTW_COMPILER.")
    with tempfile.TemporaryDirectory() as folder:
        folder = Path(folder)
        out = folder / "out.txt"
        shims = folder / "bin"
        shims.mkdir()
        shim = shims / "xclip"
        shim.write_text(f'#!/bin/sh\ncat > "{out}"\n', encoding="utf-8")
        shim.chmod(0o755)
        (folder / "preview.lobby").write_text(json.dumps(lobby_data, ensure_ascii=False, indent=2), encoding="utf-8")
        (folder / "preview.ostw").write_text('import "preview.lobby";\n', encoding="utf-8")
        env = {**os.environ, "PATH": f"{shims}{os.pathsep}{os.environ.get('PATH', '')}"}
        result = subprocess.run(
            [str(tools.ostw_compiler), "preview.ostw"],
            cwd=folder, input="\n", capture_output=True, text=True, timeout=240, env=env,
        )
        log = (result.stdout + result.stderr).splitlines()
        errors = [line for line in log if "Error" in line]
        if errors or not out.exists():
            raise RuntimeError("OSTW did not compile the settings:\n" + "\n".join(errors or log[-15:]))
        text = out.read_text(encoding="utf-8")
    cut = text.find("\nvariables")
    return (text[:cut] if cut >= 0 else text).strip() + "\n"


def split_args(text: str, start: int):
    args, depth, current, quote = [], 0, "", None
    index = start
    while index < len(text):
        char = text[index]
        if quote:
            current += char
            if char == "\\" and index + 1 < len(text):
                current += text[index + 1]
                index += 1
            elif char == quote:
                quote = None
        elif char in "\"'":
            quote = char
            current += char
        elif char in "([{":
            depth += 1
            current += char
        elif char in ")]}":
            if depth == 0:
                args.append(current.strip())
                return args
            depth -= 1
            current += char
        elif char == "," and depth == 0:
            args.append(current.strip())
            current = ""
        else:
            current += char
        index += 1
    return args


@dataclass
class WorkshopSetting:
    category: str
    name: str
    kind: str
    default: object
    minimum: float | None = None
    maximum: float | None = None
    options: tuple = ()

    def format(self, value) -> str:
        if self.kind == "Toggle":
            return "On" if value else "Off"
        if self.kind == "Integer":
            return str(int(value))
        if self.kind == "Real":
            return f"{float(value):.3f}"
        return str(value)

    def show_default(self) -> str:
        if self.kind == "Combo" and isinstance(self.default, int) and 0 <= self.default < len(self.options):
            return self.options[self.default]
        return self.format(self.default) if self.default is not None else ""


def literal(arg: str):
    arg = arg.strip()
    if arg[:1] in "\"'":
        return arg[1:-1]
    if arg.lower() in ("true", "false"):
        return arg.lower() == "true"
    try:
        return float(arg) if "." in arg else int(arg)
    except ValueError:
        return arg


def scan_workshop_settings(folder) -> list[WorkshopSetting]:
    found: dict[str, WorkshopSetting] = {}
    for path in sorted(Path(folder).rglob("*.ostw")):
        text = path.read_text(encoding="utf-8-sig", errors="replace")
        for match in re.finditer(r"WorkshopSetting(Toggle|Integer|Real|Combo|Hero)\s*\(", text):
            args = split_args(text, match.end())
            if len(args) < 3:
                continue
            kind = match.group(1)
            category, name = literal(args[0]), literal(args[1])
            if not isinstance(name, str) or name in found:
                continue
            setting = WorkshopSetting(str(category), name, kind, literal(args[2]))
            if kind in ("Integer", "Real") and len(args) >= 5:
                setting.minimum, setting.maximum = literal(args[3]), literal(args[4])
            if kind == "Combo" and len(args) >= 4:
                setting.options = tuple(literal(o) for o in split_args(args[3].strip()[1:] + ")", 0))
            found[name] = setting
    return sorted(found.values(), key=lambda s: (s.category.lower(), s.name.lower()))


def run_cli(argv) -> int:
    parser = argparse.ArgumentParser(prog=Path(sys.argv[0]).name, description="Edit, convert and check OSTW lobby settings.")
    sub = parser.add_subparsers(dest="command", required=True)
    convert = sub.add_parser("convert", help="convert a settings export or .lobby file into a clean .lobby file")
    convert.add_argument("input")
    convert.add_argument("-o", "--output", help="where to write the .lobby file, prints it when left out")
    check = sub.add_parser("check", help="check a .lobby file or settings export against the catalog")
    check.add_argument("input")
    preview = sub.add_parser("preview", help="print the settings text OSTW compiles from a .lobby file")
    preview.add_argument("input")
    catalog_cmd = sub.add_parser("catalog", help="show where the settings catalog comes from")
    catalog_cmd.add_argument("--refresh", action="store_true", help="rebuild the cached OverPy catalog")
    args = parser.parse_args(argv)

    tools = Tools.find()
    catalog = build_catalog(tools, refresh=getattr(args, "refresh", False))
    if args.command == "catalog":
        print("Sources:", ", ".join(catalog.sources))
        print(f"Lobby settings: {len(catalog.lobby)}")
        print(f"Game modes: {len(catalog.modes)}")
        print(f"Heroes: {len(catalog.hero_names)}")
        print(f"Extensions: {len(catalog.extensions)}")
        print(f"OSTW compiler: {tools.ostw_compiler or 'not found'}")
        return 0
    doc, issues = read_any(args.input, catalog)
    if args.command == "convert":
        for issue in issues:
            print(issue, file=sys.stderr)
        text = lobby_text(doc, catalog)
        if args.output:
            Path(args.output).write_text(text, encoding="utf-8")
        else:
            sys.stdout.write(text)
        return 0
    if args.command == "check":
        seen = {(i.level, i.where) for i in issues}
        issues += [i for i in check_doc(doc, catalog) if (i.level, i.where) not in seen]
        for issue in issues:
            print(issue)
        errors = sum(1 for i in issues if i.level == "error")
        print(f"{errors} errors, {len(issues) - errors} warnings")
        return 1 if errors else 0
    if args.command == "preview":
        sys.stdout.write(ostw_preview(doc_to_lobby(doc, catalog), tools))
        return 0
    return 2


def run_gui(path=None):
    import tkinter as tk
    from tkinter import filedialog, messagebox, ttk
    import tkinter.font as tkfont

    palette = {
        "bg": "#0f1419", "panel": "#151b23", "field": "#0b0f14", "border": "#283241",
        "text": "#e6edf3", "muted": "#8b98a8", "accent": "#f5a524", "bad": "#f0716f",
    }

    def apply_theme(root):
        p = palette
        style = ttk.Style(root)
        style.theme_use("clam")
        base = tkfont.nametofont("TkDefaultFont")
        base.configure(size=10)
        bold = base.copy()
        bold.configure(weight="bold")
        title = base.copy()
        title.configure(size=13, weight="bold")
        root.configure(bg=p["bg"])
        style.configure(".", background=p["bg"], foreground=p["text"], fieldbackground=p["field"],
                        bordercolor=p["border"], lightcolor=p["border"], darkcolor=p["border"],
                        troughcolor=p["panel"], selectbackground=p["border"], selectforeground=p["text"],
                        insertcolor=p["text"], arrowcolor=p["text"], focuscolor=p["accent"])
        for name in ("Panel.TFrame", "Panel.TLabel", "Panel.TCheckbutton", "Panel.TRadiobutton"):
            style.configure(name, background=p["panel"])
        style.configure("Muted.TLabel", background=p["panel"], foreground=p["muted"])
        style.configure("Set.TLabel", background=p["panel"], foreground=p["accent"], font=bold)
        style.configure("Bad.TLabel", background=p["panel"], foreground=p["bad"])
        style.configure("Title.TLabel", background=p["panel"], font=title)
        style.configure("Status.TLabel", background=p["bg"], foreground=p["muted"])
        style.configure("TButton", background=p["panel"], padding=(10, 4))
        style.map("TButton", background=[("active", p["border"]), ("disabled", p["panel"])], foreground=[("disabled", p["border"])])
        style.configure("Accent.TButton", background=p["accent"], foreground="#111111")
        style.map("Accent.TButton", background=[("active", "#ffb83d")])
        style.configure("Small.TButton", padding=(6, 1))
        style.configure("Treeview", background=p["panel"], fieldbackground=p["panel"], foreground=p["text"], rowheight=24, borderwidth=0)
        style.map("Treeview", background=[("selected", p["border"])], foreground=[("selected", p["text"])])
        style.configure("Treeview.Heading", background=p["bg"], foreground=p["muted"], relief="flat")
        style.configure("TNotebook", background=p["bg"], borderwidth=0)
        style.configure("TNotebook.Tab", background=p["bg"], foreground=p["muted"], padding=(14, 6))
        style.map("TNotebook.Tab", background=[("selected", p["panel"])], foreground=[("selected", p["accent"])])
        style.map("TCombobox", fieldbackground=[("readonly", p["field"])], foreground=[("readonly", p["text"])],
                  selectbackground=[("readonly", p["field"])], selectforeground=[("readonly", p["text"])])
        style.configure("TSpinbox", arrowsize=12)
        root.option_add("*TCombobox*Listbox.background", p["field"])
        root.option_add("*TCombobox*Listbox.foreground", p["text"])
        root.option_add("*TCombobox*Listbox.selectBackground", p["border"])
        root.option_add("*TCombobox*Listbox.selectForeground", p["accent"])

    def text_widget(parent):
        widget = tk.Text(parent, bg=palette["field"], fg=palette["text"], insertbackground=palette["text"],
                         relief="flat", wrap="none", font=tkfont.nametofont("TkFixedFont"), padx=10, pady=8,
                         highlightthickness=0, selectbackground=palette["border"])
        return widget

    class ScrollFrame(ttk.Frame):
        def __init__(self, master):
            super().__init__(master, style="Panel.TFrame")
            self.canvas = tk.Canvas(self, bg=palette["panel"], highlightthickness=0, bd=0)
            bar = ttk.Scrollbar(self, orient="vertical", command=self.canvas.yview)
            self.inner = ttk.Frame(self.canvas, style="Panel.TFrame")
            self.window = self.canvas.create_window((0, 0), window=self.inner, anchor="nw")
            self.inner.bind("<Configure>", lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")))
            self.canvas.bind("<Configure>", lambda e: self.canvas.itemconfigure(self.window, width=e.width))
            self.canvas.configure(yscrollcommand=bar.set)
            self.canvas.pack(side="left", fill="both", expand=True)
            bar.pack(side="right", fill="y")
            self.bind("<Enter>", lambda e: self._wheel(True))
            self.bind("<Leave>", lambda e: self._wheel(False))

        def _wheel(self, on):
            for sequence in ("<MouseWheel>", "<Button-4>", "<Button-5>"):
                if on:
                    self.bind_all(sequence, self._scroll)
                else:
                    self.unbind_all(sequence)

        def _scroll(self, event):
            if event.num == 4 or getattr(event, "delta", 0) > 0:
                self.canvas.yview_scroll(-3, "units")
            elif event.num == 5 or getattr(event, "delta", 0) < 0:
                self.canvas.yview_scroll(3, "units")

        def clear(self):
            for child in self.inner.winfo_children():
                child.destroy()
            self.canvas.yview_moveto(0)

    class App(tk.Tk):
        def __init__(self, tools: Tools, catalog: Catalog, start_path=None):
            super().__init__()
            self.tools, self.catalog = tools, catalog
            self.doc: dict = {}
            self.path: Path | None = None
            self.dirty = False
            self.issues: list[Issue] = []
            self.workshop_known: list[WorkshopSetting] = []
            self.node = "lobby"
            apply_theme(self)
            self.geometry("1320x840")
            self.minsize(980, 620)
            self._build()
            self.protocol("WM_DELETE_WINDOW", self.quit_app)
            self.bind_all("<Control-o>", lambda e: self.open_file())
            self.bind_all("<Control-s>", lambda e: self.save())
            self.bind_all("<Control-S>", lambda e: self.save_as())
            self.bind_all("<F5>", lambda e: self.run_preview())
            if start_path:
                self.load(Path(start_path))
            else:
                self.refresh_all()

        def _build(self):
            bar = ttk.Frame(self, padding=(10, 8))
            bar.pack(fill="x")
            ttk.Button(bar, text="Open…", command=self.open_file).pack(side="left")
            ttk.Button(bar, text="Save", command=self.save).pack(side="left", padx=(6, 0))
            ttk.Button(bar, text="Save as…", command=self.save_as).pack(side="left", padx=(6, 0))
            ttk.Button(bar, text="New", command=self.new_doc).pack(side="left", padx=(6, 0))
            ttk.Button(bar, text="Preview with OSTW", style="Accent.TButton", command=self.run_preview).pack(side="right")
            ttk.Button(bar, text="Check", command=self.run_check).pack(side="right", padx=(0, 6))

            body = ttk.PanedWindow(self, orient="horizontal")
            body.pack(fill="both", expand=True, padx=10)

            left = ttk.Frame(body, style="Panel.TFrame", padding=8)
            body.add(left, weight=1)
            self.tree_filter = tk.StringVar()
            self.tree_filter.trace_add("write", lambda *a: self.build_tree())
            ttk.Entry(left, textvariable=self.tree_filter).pack(fill="x")
            self.tree_only_set = tk.BooleanVar(value=False)
            ttk.Checkbutton(left, text="Only show what is set", variable=self.tree_only_set, style="Panel.TCheckbutton",
                            command=self.build_tree).pack(anchor="w", pady=(6, 6))
            self.tree = ttk.Treeview(left, show="tree", selectmode="browse")
            self.tree.tag_configure("set", foreground=palette["accent"])
            self.tree.tag_configure("off", foreground=palette["muted"])
            self.tree.pack(fill="both", expand=True)
            self.tree.bind("<<TreeviewSelect>>", self.on_tree_select)

            self.tabs = ttk.Notebook(body)
            body.add(self.tabs, weight=3)

            settings_tab = ttk.Frame(self.tabs, style="Panel.TFrame")
            self.tabs.add(settings_tab, text="Settings")
            head = ttk.Frame(settings_tab, style="Panel.TFrame", padding=(12, 10))
            head.pack(fill="x")
            self.title_label = ttk.Label(head, text="", style="Title.TLabel")
            self.title_label.pack(side="left")
            self.only_set = tk.BooleanVar(value=False)
            ttk.Checkbutton(head, text="Only set", variable=self.only_set, style="Panel.TCheckbutton",
                            command=self.render).pack(side="right")
            self.setting_filter = tk.StringVar()
            self.setting_filter.trace_add("write", lambda *a: self.render())
            ttk.Entry(head, textvariable=self.setting_filter, width=26).pack(side="right", padx=(0, 10))
            self.form = ScrollFrame(settings_tab)
            self.form.pack(fill="both", expand=True)

            lobby_tab = ttk.Frame(self.tabs, style="Panel.TFrame")
            self.tabs.add(lobby_tab, text=".lobby file")
            self.lobby_view = text_widget(lobby_tab)
            self.lobby_view.pack(fill="both", expand=True)

            preview_tab = ttk.Frame(self.tabs, style="Panel.TFrame")
            self.tabs.add(preview_tab, text="OSTW output")
            preview_bar = ttk.Frame(preview_tab, style="Panel.TFrame", padding=(10, 8))
            preview_bar.pack(fill="x")
            ttk.Button(preview_bar, text="Compile", command=self.run_preview).pack(side="left")
            ttk.Button(preview_bar, text="Copy", command=self.copy_preview).pack(side="left", padx=(6, 0))
            self.preview_status = ttk.Label(preview_bar, text="Runs the OSTW compiler on the current settings.", style="Muted.TLabel")
            self.preview_status.pack(side="left", padx=12)
            self.preview_view = text_widget(preview_tab)
            self.preview_view.pack(fill="both", expand=True)

            problems_tab = ttk.Frame(self.tabs, style="Panel.TFrame")
            self.tabs.add(problems_tab, text="Problems")
            self.problems = ttk.Treeview(problems_tab, columns=("level", "where", "message"), show="headings")
            for column, width in (("level", 80), ("where", 320), ("message", 520)):
                self.problems.heading(column, text=column.capitalize())
                self.problems.column(column, width=width, stretch=column == "message")
            self.problems.tag_configure("error", foreground=palette["bad"])
            self.problems.tag_configure("warning", foreground=palette["accent"])
            self.problems.pack(fill="both", expand=True)
            self.problems.bind("<Double-1>", self.on_problem_open)

            self.tabs.bind("<<NotebookTabChanged>>", lambda e: self.refresh_lobby_view())
            self.status = ttk.Label(self, text="", style="Status.TLabel", padding=(12, 6))
            self.status.pack(fill="x")

        def set_status(self, message=""):
            where = str(self.path) if self.path else "unsaved"
            sources = ", ".join(self.catalog.sources)
            self.status.configure(text=f"{where}   ·   catalog: {sources}" + (f"   ·   {message}" if message else ""))

        def update_title(self):
            name = self.path.name if self.path else "untitled.lobby"
            self.title(f"{name}{' *' if self.dirty else ''} - Workshop Lobby Editor")

        def mark_dirty(self):
            if not self.dirty:
                self.dirty = True
                self.update_title()

        def refresh_all(self):
            self.update_title()
            self.set_status()
            self.build_tree()
            self.select(self.node if self.tree.exists(self.node) else "lobby")

        def node_has_values(self, node: str) -> bool:
            parts = node.split("|")
            if node == "main":
                return bool(self.doc.get("Mode Name") or self.doc.get("Description"))
            if node == "lobby":
                return bool(self.doc.get("Lobby"))
            if node == "workshop":
                return bool(self.doc.get("Workshop"))
            if node == "extensions":
                return bool(self.doc.get("Extensions"))
            if parts[0] == "mode":
                return bool((self.doc.get("Modes") or {}).get(parts[1]))
            if parts[0] == "team":
                team = (self.doc.get("Heroes") or {}).get(parts[1]) or {}
                return any(team.get(k) for k in team)
            if parts[0] == "hero":
                return bool(((self.doc.get("Heroes") or {}).get(parts[1]) or {}).get(parts[2]))
            return False

        def build_tree(self):
            selected = self.node
            self.tree.delete(*self.tree.get_children())
            text = self.tree_filter.get().strip().lower()
            only = self.tree_only_set.get()

            def visible(node, label):
                return (not text or text in label.lower()) and (not only or self.node_has_values(node))

            def add(parent, node, label, **kw):
                tags = ("set",) if self.node_has_values(node) else ()
                self.tree.insert(parent, "end", iid=node, text=label, tags=tags, **kw)

            for node, label in (("main", "Name and description"), ("lobby", "Lobby")):
                if visible(node, label) or not text and not only:
                    add("", node, label)
            self.tree.insert("", "end", iid="group|modes", text="Game modes", open=bool(text) or only)
            doc_modes = self.doc.get("Modes") or {}
            mode_names = ["All"] + sorted((m for m in self.catalog.modes if m != "All"), key=str.lower)
            mode_names += [m for m in doc_modes if m not in mode_names]
            for name in mode_names:
                node = f"mode|{name}"
                label = "All game modes" if name == "All" else name
                if visible(node, label):
                    tags = ["set"] if self.node_has_values(node) else []
                    if doc_modes.get(name, {}).get("Enabled") is False:
                        tags = ["off"]
                        label += "  (off)"
                    self.tree.insert("group|modes", "end", iid=node, text=label, tags=tuple(tags))
            self.tree.insert("", "end", iid="group|heroes", text="Heroes", open=True)
            doc_heroes = self.doc.get("Heroes") or {}
            teams = TEAMS + [t for t in doc_heroes if t not in TEAMS]
            hero_names = sorted(self.catalog.hero_names, key=str.lower)
            for team in teams:
                team_node = f"team|{team}"
                children = []
                for hero in ["General"] + hero_names + [h for h in doc_heroes.get(team, {}) if h not in hero_names and h != "General" and h not in HERO_LISTS]:
                    node = f"hero|{team}|{hero}"
                    label = "Team-wide" if hero == "General" else hero
                    if visible(node, label) or text and text in team.lower() and (not only or self.node_has_values(node)):
                        children.append((node, label))
                if not children and not visible(team_node, team):
                    continue
                add("group|heroes", team_node, team, open=bool(text) or only)
                for node, label in children:
                    add(team_node, node, label)
            for node, label in (("workshop", "Workshop settings"), ("extensions", "Extensions")):
                if visible(node, label) or not text and not only:
                    add("", node, label)
            if self.tree.exists(selected):
                self.tree.selection_set(selected)
                self.tree.see(selected)

        def retag(self, node: str):
            if not self.tree.exists(node):
                return
            tags = ("set",) if self.node_has_values(node) else ()
            if node.startswith("mode|") and ((self.doc.get("Modes") or {}).get(node[5:]) or {}).get("Enabled") is False:
                tags = ("off",)
            self.tree.item(node, tags=tags)
            parent = self.tree.parent(node)
            if parent.startswith("team|"):
                self.tree.item(parent, tags=("set",) if self.node_has_values(parent) else ())

        def select(self, node: str):
            if self.tree.exists(node):
                self.tree.selection_set(node)
                self.tree.see(node)
            self.node = node
            self.render()

        def on_tree_select(self, event=None):
            selection = self.tree.selection()
            if not selection or selection[0].startswith("group|"):
                return
            if selection[0] != self.node:
                self.node = selection[0]
                self.render()

        def section(self, path: tuple, create: bool) -> dict:
            if path[0] == "Main":
                return self.doc
            if path[0] == "Lobby":
                return self.doc.setdefault("Lobby", {}) if create else self.doc.get("Lobby") or {}
            if path[0] == "Modes":
                modes = self.doc.setdefault("Modes", {}) if create else self.doc.get("Modes") or {}
                return modes.setdefault(path[1], {}) if create else modes.get(path[1]) or {}
            if path[0] == "Heroes":
                heroes = self.doc.setdefault("Heroes", {}) if create else self.doc.get("Heroes") or {}
                team = heroes.setdefault(path[1], {}) if create else heroes.get(path[1]) or {}
                if len(path) == 2:
                    return team
                return team.setdefault(path[2], {}) if create else team.get(path[2]) or {}
            return {}

        def prune(self):
            for key in ("Lobby", "Workshop", "Extensions", "Mode Name", "Description"):
                if key in self.doc and not self.doc[key]:
                    del self.doc[key]
            modes = self.doc.get("Modes") or {}
            for name in [m for m, v in modes.items() if not v]:
                del modes[name]
            heroes = self.doc.get("Heroes") or {}
            for team_name, team in list(heroes.items()):
                for hero in [h for h, v in team.items() if not v and h not in HERO_LISTS]:
                    del team[hero]
                if not team:
                    del heroes[team_name]
            for key in ("Modes", "Heroes"):
                if key in self.doc and not self.doc[key]:
                    del self.doc[key]

        def set_value(self, path: tuple, name: str, value):
            values = self.section(path, value is not None)
            if value is None:
                values.pop(name, None)
            else:
                values[name] = value
            self.prune()
            self.mark_dirty()
            self.retag(self.node)

        def node_path(self, node: str):
            parts = node.split("|")
            if node == "main":
                return ("Main",)
            if node == "lobby":
                return ("Lobby",)
            if parts[0] == "mode":
                return ("Modes", parts[1])
            if parts[0] == "hero":
                return ("Heroes", parts[1], parts[2])
            if parts[0] == "team":
                return ("Heroes", parts[1])
            return (node,)

        def render(self):
            self.form.clear()
            node = self.node
            parts = node.split("|")
            grid = ttk.Frame(self.form.inner, style="Panel.TFrame", padding=(4, 4))
            grid.pack(fill="both", expand=True)
            grid.columnconfigure(0, weight=1, minsize=260)
            grid.columnconfigure(1, minsize=180)
            grid.columnconfigure(2, weight=1)
            if node == "main":
                self.title_label.configure(text="Name and description")
                self.render_rows(grid, ("Main",), self.catalog.main, start=0)
            elif node == "lobby":
                self.title_label.configure(text="Lobby")
                self.render_rows(grid, ("Lobby",), self.catalog.lobby, start=0)
            elif parts[0] == "mode":
                self.render_mode(grid, parts[1])
            elif parts[0] == "team":
                self.render_team(grid, parts[1])
            elif parts[0] == "hero":
                label = "Team-wide" if parts[2] == "General" else parts[2]
                self.title_label.configure(text=f"{parts[1]}  ·  {label}")
                self.render_rows(grid, ("Heroes", parts[1], parts[2]), self.catalog.heroes.get(parts[2], {}), start=0)
            elif node == "workshop":
                self.render_workshop(grid)
            elif node == "extensions":
                self.render_extensions(grid)

        def render_rows(self, grid, path, settings, start=0, skip=()):
            values = self.section(path, False)
            text = self.setting_filter.get().strip().lower()
            names = [n for n in settings] + [n for n in values if n not in settings and n not in skip]
            row = start
            for name in names:
                if name in skip:
                    continue
                if text and text not in name.lower():
                    continue
                if self.only_set.get() and name not in values:
                    continue
                self.add_row(grid, row, path, name, settings.get(name), values.get(name))
                row += 1
            if row == start:
                ttk.Label(grid, text="Nothing matches." if text or self.only_set.get() else "No settings here.",
                          style="Muted.TLabel").grid(row=row, column=0, sticky="w", padx=12, pady=8)
                row += 1
            return row

        def add_row(self, grid, row, path, name, setting, value):
            is_set = value is not None
            label = ttk.Label(grid, text=name, style=("Bad.TLabel" if setting is None else "Set.TLabel" if is_set else "Panel.TLabel"))
            label.grid(row=row, column=0, sticky="w", padx=(12, 8), pady=2)
            reset = ttk.Button(grid, text="Reset", style="Small.TButton")
            reset.grid(row=row, column=3, sticky="e", padx=(6, 12), pady=2)

            def changed(new_value):
                self.set_value(path, name, new_value)
                now_set = new_value is not None
                if setting is not None:
                    label.configure(style="Set.TLabel" if now_set else "Panel.TLabel")
                reset.state(["!disabled"] if now_set else ["disabled"])

            editor, clear = self.make_editor(grid, setting, value, changed)
            editor.grid(row=row, column=1, sticky="ew", pady=2)
            ttk.Label(grid, text=self.hint(setting), style="Muted.TLabel").grid(row=row, column=2, sticky="w", padx=(10, 0))

            def do_reset():
                clear()
                changed(None)

            reset.configure(command=do_reset)
            reset.state(["!disabled"] if is_set else ["disabled"])

        def make_editor(self, parent, setting, value, changed):
            if setting is not None and setting.kind in ("bool", "enum"):
                choices = ["Default"] + (list(setting.words) if setting.kind == "bool" else list(setting.options))
                current = setting.show(value) if value is not None else "Default"
                if current not in choices:
                    choices.append(current)
                box = ttk.Combobox(parent, values=choices, state="readonly", width=24)
                box.set(current)

                def picked(event=None):
                    text = box.get()
                    changed(None if text == "Default" else setting.parse(text))

                box.bind("<<ComboboxSelected>>", picked)
                return box, lambda: box.set("Default")
            if setting is not None and setting.kind in ("number", "int"):
                low = setting.minimum if setting.minimum is not None else 0
                high = setting.maximum if setting.maximum is not None else 1000
                step = 1 if setting.kind == "int" or not setting.percent else 5
                var = tk.StringVar(value=f"{value:g}" if isinstance(value, (int, float)) and not isinstance(value, bool) else ("" if value is None else str(value)))
                box = ttk.Spinbox(parent, from_=low, to=high, increment=step, textvariable=var, width=12)
                state = {"last": var.get()}

                def commit(event=None):
                    text = var.get().strip()
                    if text == state["last"]:
                        return
                    if not text:
                        state["last"] = ""
                        changed(None)
                        return
                    try:
                        number = setting.parse(text)
                    except ValueError:
                        self.bell()
                        var.set(state["last"])
                        return
                    state["last"] = text
                    changed(number)

                box.configure(command=commit)
                box.bind("<Return>", commit)
                box.bind("<FocusOut>", commit)
                return box, lambda: (var.set(""), state.update(last=""))
            var = tk.StringVar(value="" if value is None else str(value))
            entry = ttk.Entry(parent, textvariable=var, width=26)
            state = {"last": var.get()}

            def commit_text(event=None):
                text = var.get()
                if text == state["last"]:
                    return
                state["last"] = text
                changed(text if text.strip() else None)

            entry.bind("<Return>", commit_text)
            entry.bind("<FocusOut>", commit_text)
            return entry, lambda: (var.set(""), state.update(last=""))

        def hint(self, setting):
            if setting is None:
                return "not in the catalog, written as-is"
            parts = []
            if setting.kind in ("number", "int") and setting.maximum is not None:
                low = setting.minimum if setting.minimum is not None else 0
                parts.append(f"{setting.show(low)} to {setting.show(setting.maximum)}")
            if setting.default is not None:
                parts.append(f"default {setting.show(setting.default)}")
            if not setting.ostw:
                parts.append("written as the game spells it")
            return "   ·   ".join(parts)

        def list_editor(self, parent, row, heading, keys, choices, values, on_change):
            ttk.Label(parent, text=heading, style="Panel.TLabel").grid(row=row, column=0, sticky="nw", padx=(12, 8), pady=(8, 2))
            box = ttk.Frame(parent, style="Panel.TFrame")
            box.grid(row=row, column=1, columnspan=3, sticky="ew", pady=(8, 2), padx=(0, 12))
            current_key = next((k for k in keys if k in values), "")
            mode = tk.StringVar(value=current_key)
            radios = ttk.Frame(box, style="Panel.TFrame")
            radios.pack(fill="x")
            listbox = tk.Listbox(box, selectmode="multiple", height=10, exportselection=False, bg=palette["field"],
                                 fg=palette["text"], selectbackground=palette["border"], selectforeground=palette["accent"],
                                 highlightthickness=0, relief="flat")
            items = list(choices) + [c for c in values.get(current_key, []) if c not in choices]
            for item in items:
                listbox.insert("end", item)
            for index, item in enumerate(items):
                if item in values.get(current_key, []):
                    listbox.selection_set(index)

            def update(*args):
                key = mode.get()
                listbox.configure(state="normal" if key else "disabled")
                on_change(key, [items[i] for i in listbox.curselection()] if key else None)

            for key, text in [("", "Not set")] + [(k, k) for k in keys]:
                ttk.Radiobutton(radios, text=text, value=key, variable=mode, command=update,
                                style="Panel.TRadiobutton").pack(side="left", padx=(0, 14))
            listbox.pack(fill="x", pady=(6, 0))
            listbox.configure(state="normal" if current_key else "disabled")
            listbox.bind("<<ListboxSelect>>", update)
            return row + 1

        def render_mode(self, grid, name):
            self.title_label.configure(text="All game modes" if name == "All" else name)
            mode = self.section(("Modes", name), False)
            row = 0
            if name != "All":
                ttk.Label(grid, text="Mode", style="Set.TLabel" if "Enabled" in mode else "Panel.TLabel").grid(row=row, column=0, sticky="w", padx=(12, 8), pady=2)
                choice = {True: "On", False: "Off"}.get(mode.get("Enabled"), "Default")
                box = ttk.Combobox(grid, values=["Default", "On", "Off"], state="readonly", width=24)
                box.set(choice)

                def picked(event=None):
                    text = box.get()
                    self.set_value(("Modes", name), "Enabled", None if text == "Default" else text == "On")
                    self.build_tree()

                box.bind("<<ComboboxSelected>>", picked)
                box.grid(row=row, column=1, sticky="ew", pady=2)
                ttk.Label(grid, text="Off writes it as a disabled mode", style="Muted.TLabel").grid(row=row, column=2, sticky="w", padx=(10, 0))
                row += 1
                maps = self.catalog.maps.get(name, [])
                if maps or any(k in mode for k in MAP_LISTS):

                    def maps_changed(key, items):
                        values = self.section(("Modes", name), True)
                        for k in MAP_LISTS:
                            values.pop(k, None)
                        if key:
                            values[key] = items
                        self.prune()
                        self.mark_dirty()
                        self.retag(self.node)

                    row = self.list_editor(grid, row, "Maps", MAP_LISTS, sorted(maps, key=str.lower), mode, maps_changed)
            ttk.Separator(grid).grid(row=row, column=0, columnspan=4, sticky="ew", pady=8)
            self.render_rows(grid, ("Modes", name), self.catalog.mode_settings(name), start=row + 1, skip={"Enabled", *MAP_LISTS})

        def render_team(self, grid, team_name):
            self.title_label.configure(text=f"{team_name}  ·  hero pool")
            team = self.section(("Heroes", team_name), False)
            ttk.Label(grid, text="Team-wide values and each hero's values are under this team in the list.",
                      style="Muted.TLabel").grid(row=0, column=0, columnspan=4, sticky="w", padx=12, pady=(4, 8))

            def heroes_changed(key, items):
                values = self.section(("Heroes", team_name), True)
                for k in HERO_LISTS:
                    values.pop(k, None)
                if key:
                    values[key] = items
                self.prune()
                self.mark_dirty()
                self.retag(self.node)

            self.list_editor(grid, 1, "Heroes", HERO_LISTS, sorted(self.catalog.hero_names, key=str.lower), team, heroes_changed)

        def render_extensions(self, grid):
            self.title_label.configure(text="Extensions")
            enabled = set(self.doc.get("Extensions") or [])
            total = ttk.Label(grid, text="", style="Muted.TLabel")
            total.grid(row=0, column=0, columnspan=4, sticky="w", padx=12, pady=(4, 8))
            variables = {}

            def update_total():
                points = sum(self.catalog.extensions.get(n, 0) for n, v in variables.items() if v.get())
                total.configure(text=f"{points} extension points used")

            def toggled():
                names = [n for n, v in variables.items() if v.get()]
                names += [n for n in enabled if n not in variables]
                self.doc["Extensions"] = names
                self.prune()
                self.mark_dirty()
                self.retag("extensions")
                update_total()

            for row, (name, points) in enumerate(self.catalog.extensions.items(), start=1):
                var = tk.BooleanVar(value=name in enabled)
                variables[name] = var
                ttk.Checkbutton(grid, text=name, variable=var, command=toggled, style="Panel.TCheckbutton").grid(row=row, column=0, sticky="w", padx=12, pady=2)
                ttk.Label(grid, text=f"{points} point{'s' if points != 1 else ''}", style="Muted.TLabel").grid(row=row, column=1, sticky="w")
            update_total()

        def render_workshop(self, grid):
            self.title_label.configure(text="Workshop settings")
            values = self.doc.get("Workshop") or {}
            top = ttk.Frame(grid, style="Panel.TFrame")
            top.grid(row=0, column=0, columnspan=4, sticky="ew", padx=12, pady=(4, 10))
            ttk.Button(top, text="Scan an OSTW project…", command=self.scan_project).pack(side="left")
            ttk.Label(top, text="Values are written exactly as shown. OSTW titles this block 'Workshop'.",
                      style="Muted.TLabel").pack(side="left", padx=12)
            row = 1

            def setter(name):
                def changed(new_value):
                    work = self.doc.setdefault("Workshop", {})
                    if new_value is None:
                        work.pop(name, None)
                    else:
                        work[name] = new_value
                    self.prune()
                    self.mark_dirty()
                    self.retag("workshop")
                return changed

            known_names = set()
            for item in self.workshop_known:
                known_names.add(item.name)
                current = values.get(item.name)
                ttk.Label(grid, text=item.name, style="Set.TLabel" if current is not None else "Panel.TLabel").grid(row=row, column=0, sticky="w", padx=(12, 8), pady=2)
                if item.kind == "Toggle":
                    fake = Setting(item.name, "bool")
                    editor, _ = self.make_editor(grid, fake, None if current is None else fake.parse(current), lambda v, s=setter(item.name), i=item: s(None if v is None else i.format(v)))
                elif item.kind in ("Integer", "Real"):
                    fake = Setting(item.name, "int" if item.kind == "Integer" else "number", minimum=item.minimum, maximum=item.maximum)
                    parsed = None if current is None else fake.parse(current)
                    editor, _ = self.make_editor(grid, fake, parsed, lambda v, s=setter(item.name), i=item: s(None if v is None else i.format(v)))
                elif item.kind == "Combo" and item.options:
                    fake = Setting(item.name, "enum", options=tuple(str(o) for o in item.options))
                    editor, _ = self.make_editor(grid, fake, current, setter(item.name))
                else:
                    editor, _ = self.make_editor(grid, None, current, setter(item.name))
                editor.grid(row=row, column=1, sticky="ew", pady=2)
                ttk.Label(grid, text=f"{item.category}   ·   default {item.show_default()}", style="Muted.TLabel").grid(row=row, column=2, sticky="w", padx=(10, 0))
                row += 1
            for name, value in values.items():
                if name in known_names:
                    continue
                ttk.Label(grid, text=name, style="Set.TLabel").grid(row=row, column=0, sticky="w", padx=(12, 8), pady=2)
                editor, _ = self.make_editor(grid, None, value, setter(name))
                editor.grid(row=row, column=1, sticky="ew", pady=2)
                ttk.Button(grid, text="Remove", style="Small.TButton", command=lambda n=name: (setter(n)(None), self.render())).grid(row=row, column=3, sticky="e", padx=(6, 12))
                row += 1
            add = ttk.Frame(grid, style="Panel.TFrame")
            add.grid(row=row, column=0, columnspan=4, sticky="ew", padx=12, pady=(12, 4))
            new_name, new_value = tk.StringVar(), tk.StringVar()
            ttk.Entry(add, textvariable=new_name, width=32).pack(side="left")
            ttk.Entry(add, textvariable=new_value, width=16).pack(side="left", padx=6)

            def add_setting():
                if new_name.get().strip() and new_value.get().strip():
                    setter(new_name.get().strip())(new_value.get().strip())
                    self.render()

            ttk.Button(add, text="Add setting", command=add_setting).pack(side="left")

        def scan_project(self):
            start = self.path.parent if self.path else Path.cwd()
            folder = filedialog.askdirectory(title="OSTW project folder", initialdir=str(start), parent=self)
            if not folder:
                return
            self.workshop_known = scan_workshop_settings(folder)
            self.set_status(f"found {len(self.workshop_known)} workshop settings in {folder}")
            self.render()

        def refresh_lobby_view(self):
            if self.tabs.index(self.tabs.select()) != 1:
                return
            self.lobby_view.configure(state="normal")
            self.lobby_view.delete("1.0", "end")
            self.lobby_view.insert("1.0", lobby_text(self.doc, self.catalog))
            self.lobby_view.configure(state="disabled")

        def run_preview(self):
            self.tabs.select(2)
            self.preview_status.configure(text="Compiling with OSTW…")
            data = doc_to_lobby(self.doc, self.catalog)

            def work():
                try:
                    result, message = ostw_preview(data, self.tools), "Compiled by OSTW. Paste this into the game, or import the .lobby file in your project."
                except Exception as error:
                    result, message = str(error), "OSTW could not compile these settings."
                self.after(0, lambda: self.show_preview(result, message))

            threading.Thread(target=work, daemon=True).start()

        def show_preview(self, text, message):
            self.preview_view.configure(state="normal")
            self.preview_view.delete("1.0", "end")
            self.preview_view.insert("1.0", text)
            self.preview_view.configure(state="disabled")
            self.preview_status.configure(text=message)

        def copy_preview(self):
            text = self.preview_view.get("1.0", "end").strip()
            if text:
                self.clipboard_clear()
                self.clipboard_append(text)
                self.preview_status.configure(text="Copied.")

        def run_check(self):
            issues = check_doc(self.doc, self.catalog)
            self.show_issues(issues)
            self.tabs.select(3)
            errors = sum(1 for i in issues if i.level == "error")
            self.set_status(f"{errors} errors, {len(issues) - errors} warnings")

        def show_issues(self, issues):
            self.issues = issues
            self.problems.delete(*self.problems.get_children())
            for index, issue in enumerate(issues):
                self.problems.insert("", "end", iid=str(index), values=(issue.level, issue.where, issue.message), tags=(issue.level,))
            self.tabs.tab(3, text=f"Problems ({len(issues)})" if issues else "Problems")

        def on_problem_open(self, event=None):
            selection = self.problems.selection()
            if not selection:
                return
            node = self.issues[int(selection[0])].node
            self.tree_filter.set("")
            self.tree_only_set.set(False)
            self.build_tree()
            self.tabs.select(0)
            self.select(node)

        def confirm_discard(self) -> bool:
            if not self.dirty:
                return True
            answer = messagebox.askyesnocancel("Unsaved changes", "Save the changes first?", parent=self)
            if answer is None:
                return False
            return self.save() if answer else True

        def new_doc(self):
            if not self.confirm_discard():
                return
            self.doc, self.path, self.dirty = {}, None, False
            self.show_issues([])
            self.refresh_all()

        def load(self, path: Path):
            try:
                doc, issues = read_any(path, self.catalog)
            except (OSError, ValueError) as error:
                messagebox.showerror("Could not open", f"{path}\n\n{error}", parent=self)
                return
            self.doc = doc
            self.path = path if path.suffix.lower() in (".lobby", ".json") else None
            self.dirty = self.path is None
            self.show_issues(issues)
            self.refresh_all()
            note = "imported from a settings export, save it as a .lobby file" if self.path is None else ""
            self.set_status(note or (f"{len(issues)} problems while reading" if issues else "opened"))

        def open_file(self):
            if not self.confirm_discard():
                return
            filename = filedialog.askopenfilename(
                parent=self, title="Open lobby settings",
                filetypes=[("Lobby settings", "*.lobby *.json"), ("Settings export", "*.txt *.ostw *.ow *.workshop"), ("All files", "*")],
            )
            if filename:
                self.dirty = False
                self.load(Path(filename))

        def save(self) -> bool:
            if self.path is None:
                return self.save_as()
            self.path.write_text(lobby_text(self.doc, self.catalog), encoding="utf-8")
            self.dirty = False
            self.update_title()
            self.set_status("saved")
            return True

        def save_as(self) -> bool:
            filename = filedialog.asksaveasfilename(
                parent=self, title="Save lobby settings", defaultextension=".lobby",
                initialfile=self.path.name if self.path else "customGameSettings.lobby",
                filetypes=[("Lobby settings", "*.lobby"), ("All files", "*")],
            )
            if not filename:
                return False
            self.path = Path(filename)
            return self.save()

        def quit_app(self):
            if self.confirm_discard():
                self.destroy()

    tools = Tools.find()
    try:
        catalog = build_catalog(tools)
    except RuntimeError as error:
        root = tk.Tk()
        root.withdraw()
        messagebox.showerror("Workshop Lobby Editor", str(error))
        return 1
    App(tools, catalog, path).mainloop()
    return 0


def main(argv=None) -> int:
    argv = sys.argv[1:] if argv is None else argv
    if argv and argv[0] in ("convert", "check", "preview", "catalog", "-h", "--help"):
        return run_cli(argv)
    return run_gui(argv[0] if argv else None)


if __name__ == "__main__":
    sys.exit(main())
