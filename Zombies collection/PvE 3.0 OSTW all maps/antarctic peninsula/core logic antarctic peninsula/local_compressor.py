#!/usr/bin/env python3

import json
import math
from collections import Counter
from pathlib import Path

HERE = Path(__file__).resolve().parent
CORE_FOLDER = HERE.parent.parent / "== Corelogic All maps" / "general main"
ALPHABET_FILE = HERE / "alphabet.txt"

JOBS = [
    (HERE / "Local-uncompressed.json", HERE / "Local-compressed.json", False),
    (CORE_FOLDER / "Core-Uncompressed.json", CORE_FOLDER / "Core-compressed.json", True),
]

BASE = 1024
MAX_DECIMALS = 3
MAX_CHUNK_LENGTH = 125
MAX_WIDTH = 3

TEXT_KEY = "texts"
END_STRING = 0
END_GROUP = 1
PAD = "\u00b6"
TOKENS_PER_PIECE = 62
EXTRA_CHARACTERS = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?'-:;()/&%$#@*+=_[]"

def load_alphabet():
    text = ALPHABET_FILE.read_text(encoding="utf-8")
    text = text.rstrip("\r\n")
    if len(text) != BASE:
        raise ValueError(f"alphabet.txt must hold exactly {BASE} characters, it has {len(text)}")
    if len(set(text)) != BASE:
        raise ValueError("alphabet.txt has a character in it more than once")
    return text

def is_vector(item):
    return isinstance(item, list) and len(item) == 3

def choose_scale(numbers):
    for decimals in range(MAX_DECIMALS + 1):
        scale = 10 ** decimals
        if all(abs(n * scale - round(n * scale)) < 1e-6 for n in numbers):
            return scale
    print(f"    warning: some values have more than {MAX_DECIMALS} decimals and will be rounded")
    return 10 ** MAX_DECIMALS

def to_digits(whole, width, alphabet):
    characters = []
    for _ in range(width):
        characters.append(alphabet[whole % BASE])
        whole //= BASE
    if whole != 0:
        raise ValueError("number does not fit in the chosen width")
    return "".join(characters)

def pack_list(values, alphabet):
    vectors = len(values) > 0 and all(is_vector(item) for item in values)
    components = 3 if vectors else 1
    numbers = [n for item in values for n in item] if vectors else list(values)

    if not numbers:
        return {"type": "vectors" if vectors else "numbers", "count": 0, "width": 1, "scale": 1, "offset": 0, "data": []}

    scale = choose_scale(numbers)
    wholes = [round(n * scale) for n in numbers]
    offset = min(wholes)
    shifted = [w - offset for w in wholes]
    width = max(1, math.ceil(max(shifted).bit_length() / 10))
    if width > MAX_WIDTH:
        raise ValueError(f"values need {width} digits each, the in-game decoder reads at most {MAX_WIDTH}")

    item_length = width * components
    chunk_length = (MAX_CHUNK_LENGTH // item_length) * item_length
    text = "".join(to_digits(s, width, alphabet) for s in shifted)
    data = [text[i:i + chunk_length] for i in range(0, len(text), chunk_length)]

    return {
        "type": "vectors" if vectors else "numbers",
        "count": len(values),
        "width": width,
        "scale": scale,
        "offset": offset,
        "data": data,
    }

def unpack_list(record, alphabet):
    position = {character: n for n, character in enumerate(alphabet)}
    width, scale, offset = record["width"], record["scale"], record["offset"]
    numbers = []
    for chunk in record["data"]:
        for p in range(0, len(chunk), width):
            whole = sum(position[chunk[p + k]] * BASE ** k for k in range(width))
            numbers.append((whole + offset) / scale)
    if record["type"] == "vectors":
        return [numbers[i:i + 3] for i in range(0, len(numbers), 3)]
    return numbers

def check(original, record, alphabet, name):
    unpacked = unpack_list(record, alphabet)
    flat_in = [n for item in original for n in (item if isinstance(item, list) else [item])]
    flat_out = [n for item in unpacked for n in (item if isinstance(item, list) else [item])]
    scale = record["scale"]
    if len(flat_in) != len(flat_out):
        raise ValueError(f"{name}: {len(flat_in)} values went in, {len(flat_out)} came out")
    for a, b in zip(flat_in, flat_out):
        if abs(round(a * scale) / scale - b) > 1e-9:
            raise ValueError(f"{name}: {a} came back as {b}")
    for chunk in record["data"]:
        if len(chunk) > MAX_CHUNK_LENGTH:
            raise ValueError(f"{name}: a data string is {len(chunk)} characters long")

def compress_tree(node, alphabet, name):
    if isinstance(node, dict):
        result = {}
        for key, value in node.items():
            if key.startswith("_"):
                continue
            result[key] = compress_tree(value, alphabet, f"{name}.{key}")
        return result
    if isinstance(node, list):
        record = pack_list(node, alphabet)
        check(node, record, alphabet, name)
        print(f"    {name}: {record['count']} {record['type']}, width {record['width']}, "
              f"scale {record['scale']}, {len(record['data'])} strings")
        return record
    raise ValueError(f"{name}: expected a list or a group, found {type(node).__name__}")

def text_strings(value):
    for item in value:
        if isinstance(item, list):
            yield from text_strings(item)
        elif item is not None:
            yield item

def build_text_table(all_lists):
    texts = [s for value in all_lists for s in text_strings(value)]
    for s in texts:
        if PAD in s:
            raise ValueError(f"text uses the pad character {PAD!r}: {s!r}")
        for bad in "{}<>":
            if bad in s:
                raise ValueError(f"text uses {bad!r}, which Workshop strings treat as a placeholder: {s!r}")
        for bad in (chr(34), chr(92)):
            if bad in s:
                raise ValueError(f"text uses {bad!r}, which imported text cannot hold (use \u201c and \u201d for quotes): {s!r}")
    tokens = [PAD + PAD, PAD + PAD]
    singles = sorted(set(EXTRA_CHARACTERS) | {c for s in texts for c in s})
    tokens += [c + PAD for c in singles]
    pair_counts = Counter(s[i:i + 2] for s in texts for i in range(len(s) - 1))
    for pair, _ in pair_counts.most_common():
        if len(tokens) == BASE:
            break
        tokens.append(pair)
    letter_counts = Counter(c for s in texts for c in s)
    common = [c for c, _ in letter_counts.most_common()]
    spare = (a + b for a in common for b in common)
    for pair in spare:
        if len(tokens) == BASE:
            break
        if pair not in tokens:
            tokens.append(pair)
    while len(tokens) < BASE:
        tokens.append(PAD + PAD)
    return tokens

def encode_string(text, token_of):
    numbers = []
    i = 0
    while i < len(text):
        if text[i:i + 2] in token_of and len(text[i:i + 2]) == 2:
            numbers.append(token_of[text[i:i + 2]])
            i += 2
        else:
            numbers.append(token_of[text[i] + PAD])
            i += 1
    return numbers

def pack_text(value, tokens, alphabet):
    token_of = {token: n for n, token in enumerate(tokens)}
    nested = any(isinstance(item, list) for item in value)
    stream = []
    for item in value:
        strings = item if nested else [item]
        for s in strings:
            stream += encode_string(s or "", token_of)
            stream.append(END_STRING)
        if nested:
            stream.append(END_GROUP)
    text = "".join(alphabet[n] for n in stream)
    data = [text[i:i + MAX_CHUNK_LENGTH] for i in range(0, len(text), MAX_CHUNK_LENGTH)]
    return {"type": "text", "nested": nested, "count": len(value), "data": data}

def unpack_text(record, tokens, alphabet):
    position = {character: n for n, character in enumerate(alphabet)}
    table = "".join(tokens)
    result, group, current = [], [], ""
    for chunk in record["data"]:
        for character in chunk:
            n = position[character]
            if n == END_STRING:
                group.append(current if current != "" else None)
                current = ""
            elif n == END_GROUP:
                result.append(group)
                group = []
            else:
                pair = table[2 * n: 2 * n + 2]
                current += pair[0] if pair[1] == PAD else pair
    return result if record["nested"] else group

def check_text(original, record, tokens, alphabet, name):
    unpacked = unpack_text(record, tokens, alphabet)
    def normal(v):
        return [normal(x) if isinstance(x, list) else (x if x != "" else None) for x in v]
    if unpacked != normal(original):
        raise ValueError(f"{name}: the text does not unpack to the original")
    for chunk in record["data"]:
        if len(chunk) > MAX_CHUNK_LENGTH:
            raise ValueError(f"{name}: a data string is {len(chunk)} characters long")

DIFFICULTY_COLUMNS = 6

def add_difficulty_lines(data):
    group = data.get("difficulty")
    if group is None:
        return
    labels = group["_labels"]
    ammo = group["_ammo"]
    table = group["table"]
    lines = []
    for d in range(len(table) // DIFFICULTY_COLUMNS):
        row = table[d * DIFFICULTY_COLUMNS:(d + 1) * DIFFICULTY_COLUMNS]
        damage, healing, reaction, per_wave, revive = row[:5]
        lines.append(f"{labels[0]} {damage:g}%   {labels[1]} {healing:g}%   {labels[2]} {reaction:g} s")
        wave_text = labels[6] if per_wave > 100 else f"{per_wave:g}"
        revive_text = labels[6] if revive == 0 else f"{revive:g} s"
        lines.append(f"{labels[3]}: {wave_text}   {labels[4]}: {revive_text}   {labels[5]}: {ammo[d]}")
    data[TEXT_KEY]["settingsText"] = data[TEXT_KEY]["settingsText"] + lines

def main():
    alphabet = load_alphabet()
    jobs = [job for job in JOBS if job[0].exists()]
    for source, _, _ in JOBS:
        if not source.exists():
            print(f"Skipping {source.name}: file not found")
    files = {source: json.loads(source.read_text(encoding="utf-8")) for source, _, _ in jobs}
    for data in files.values():
        add_difficulty_lines(data)
    all_text = [value for data in files.values() for key, value in data.get(TEXT_KEY, {}).items()
                if not key.startswith("_")]
    tokens = build_text_table(all_text)
    for source, target, store_alphabet in jobs:
        print(f"{source.name} -> {target.name}")
        data = dict(files[source])
        text_lists = data.pop(TEXT_KEY, {})
        compressed = compress_tree(data, alphabet, source.stem)
        if text_lists:
            compressed[TEXT_KEY] = {}
            for name, value in text_lists.items():
                if name.startswith("_"):
                    continue
                record = pack_text(value, tokens, alphabet)
                check_text(value, record, tokens, alphabet, f"{source.stem}.{TEXT_KEY}.{name}")
                letters = sum(len(s) for s in text_strings(value))
                packed = sum(len(chunk) for chunk in record["data"])
                print(f"    {TEXT_KEY}.{name}: {record['count']} entries, {letters} letters -> {packed} characters, "
                      f"{len(record['data'])} strings")
                compressed[TEXT_KEY][name] = record
        if store_alphabet:
            compressed["alphabet"] = [alphabet[i:i + MAX_CHUNK_LENGTH] for i in range(0, BASE, MAX_CHUNK_LENGTH)]
            print(f"    alphabet: {len(compressed['alphabet'])} strings")
            table = "".join(tokens)
            piece = 2 * TOKENS_PER_PIECE
            compressed["textPairs"] = [table[i:i + piece] for i in range(0, len(table), piece)]
            print(f"    textPairs: {len(compressed['textPairs'])} strings")
        text = json.dumps(compressed, ensure_ascii=True, indent=2)
        target.write_text(text + "\n", encoding="ascii")
        print(f"    wrote {target}")

if __name__ == "__main__":
    main()
