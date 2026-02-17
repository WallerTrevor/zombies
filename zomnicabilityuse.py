#!/usr/bin/env python3
"""
Zomnic Ability Use Switchboard (with 4 difficulties)
- 45 heroes
- 4 difficulty sections
- 20 slots per hero per difficulty
- Each slot is a value 0..5
- Compile outputs one big flat array:
    length = DIFF_COUNT * HERO_COUNT * SLOTS_PER_HERO
    order  = difficulty-major, then hero, then slot

Run:
  python3 zomnic_ability_use.py
"""

import json
import tkinter as tk
from tkinter import ttk, filedialog, messagebox


HERO_COUNT = 45
SLOTS_PER_HERO = 10
MIN_VAL = 0
MAX_VAL = 3

DIFF_NAMES = ["Easy", "Normal", "Hard", "Nightmare"]  # rename if you want
DIFF_COUNT = len(DIFF_NAMES)

# Match this ordering to your other tool if needed.
HEROES = [
    "Ana", "Ashe", "Baptiste", "Bastion", "Brigitte",
    "Cassidy", "D.Va", "Doomfist", "Echo", "Genji",
    "Hanzo", "Illari", "Junker Queen", "Junkrat", "Juno",
    "Kiriko", "Lifeweaver", "Lucio", "Mauga", "Mei",
    "Mercy", "Moira", "Orisa", "Pharah", "Ramattra",
    "Reaper", "Reinhardt", "Roadhog", "Sigma", "Sojourn",
    "Soldier: 76", "Sombra", "Symmetra", "Torbjorn", "Tracer",
    "Venture", "Widowmaker", "Winston", "Wrecking Ball", "Zarya",
    "Zenyatta", "Hero42", "Hero43", "Hero44", "Hero45",
]

# Force exactly 45 labels.
if len(HEROES) < HERO_COUNT:
    HEROES = HEROES + [f"Hero{len(HEROES)+i+1}" for i in range(HERO_COUNT - len(HEROES))]
elif len(HEROES) > HERO_COUNT:
    HEROES = HEROES[:HERO_COUNT]


class DarkStyle:
    BG = "#111315"
    PANEL = "#15181b"
    PANEL2 = "#1b2024"
    FG = "#d7dde3"
    MUTED = "#a8b0ba"
    ACCENT = "#3a86ff"
    BORDER = "#2a3138"
    ENTRY_BG = "#0f1113"
    SELECT_BG = "#2b3440"


class AbilityUseApp:
    def __init__(self, root: tk.Tk):
        self.root = root
        self.root.title("Zomnic Ability Use Switchboard (4 Difficulties)")
        self.root.geometry("1200x740")
        self.root.configure(bg=DarkStyle.BG)

        # Data model: diff_index -> hero_index -> list[int] length 20
        self.data = [
            [[0 for _ in range(SLOTS_PER_HERO)] for _ in range(HERO_COUNT)]
            for _ in range(DIFF_COUNT)
        ]

        self.current_hero = 0
        self.current_diff = 0

        self.slot_vars: list[tk.IntVar] = []

        self._build_style()
        self._build_ui()
        self._load_hero(0)
        self._update_status()

    def _build_style(self):
        style = ttk.Style(self.root)
        try:
            style.theme_use("clam")
        except tk.TclError:
            pass

        style.configure("TFrame", background=DarkStyle.BG)
        style.configure("Panel.TFrame", background=DarkStyle.PANEL)
        style.configure("Panel2.TFrame", background=DarkStyle.PANEL2)

        style.configure("TLabel", background=DarkStyle.BG, foreground=DarkStyle.FG)
        style.configure("Title.TLabel", font=("Segoe UI", 14, "bold"), foreground=DarkStyle.FG)
        style.configure("Sub.TLabel", font=("Segoe UI", 10), foreground=DarkStyle.MUTED)

        style.configure(
            "TButton",
            padding=8,
            background=DarkStyle.PANEL2,
            foreground=DarkStyle.FG,
            bordercolor=DarkStyle.BORDER,
            focusthickness=0,
            focuscolor=DarkStyle.ACCENT,
        )
        style.map("TButton", background=[("active", DarkStyle.SELECT_BG)])

        style.configure(
            "TEntry",
            fieldbackground=DarkStyle.ENTRY_BG,
            foreground=DarkStyle.FG,
            background=DarkStyle.PANEL2,
            bordercolor=DarkStyle.BORDER,
            lightcolor=DarkStyle.BORDER,
            darkcolor=DarkStyle.BORDER,
        )

        style.configure(
            "TCombobox",
            fieldbackground=DarkStyle.ENTRY_BG,
            foreground=DarkStyle.FG,
            background=DarkStyle.PANEL2,
            bordercolor=DarkStyle.BORDER,
            lightcolor=DarkStyle.BORDER,
            darkcolor=DarkStyle.BORDER,
            arrowcolor=DarkStyle.FG,
        )
        style.map("TCombobox", fieldbackground=[("readonly", DarkStyle.ENTRY_BG)])

        # Listbox + spinbox defaults
        self.root.option_add("*Listbox.background", DarkStyle.ENTRY_BG)
        self.root.option_add("*Listbox.foreground", DarkStyle.FG)
        self.root.option_add("*Listbox.selectBackground", DarkStyle.SELECT_BG)
        self.root.option_add("*Listbox.selectForeground", DarkStyle.FG)
        self.root.option_add("*Listbox.highlightBackground", DarkStyle.BORDER)
        self.root.option_add("*Listbox.highlightColor", DarkStyle.BORDER)

        self.root.option_add("*Spinbox.background", DarkStyle.ENTRY_BG)
        self.root.option_add("*Spinbox.foreground", DarkStyle.FG)
        self.root.option_add("*Spinbox.insertBackground", DarkStyle.FG)
        self.root.option_add("*Spinbox.selectBackground", DarkStyle.SELECT_BG)
        self.root.option_add("*Spinbox.selectForeground", DarkStyle.FG)
        self.root.option_add("*Spinbox.highlightBackground", DarkStyle.BORDER)
        self.root.option_add("*Spinbox.highlightColor", DarkStyle.BORDER)

        # TCombobox dropdown list colors (often helps on Linux/Windows)
        self.root.option_add("*TCombobox*Listbox.background", DarkStyle.ENTRY_BG)
        self.root.option_add("*TCombobox*Listbox.foreground", DarkStyle.FG)
        self.root.option_add("*TCombobox*Listbox.selectBackground", DarkStyle.SELECT_BG)
        self.root.option_add("*TCombobox*Listbox.selectForeground", DarkStyle.FG)

    def _build_ui(self):
        outer = ttk.Frame(self.root, style="TFrame")
        outer.pack(fill="both", expand=True, padx=14, pady=14)

        header = ttk.Frame(outer, style="TFrame")
        header.pack(fill="x")

        ttk.Label(header, text="Zomnic Ability Use Switchboard", style="Title.TLabel").pack(anchor="w")
        ttk.Label(
            header,
            text=f"{DIFF_COUNT} difficulties • {HERO_COUNT} heroes • {SLOTS_PER_HERO} slots per hero • values {MIN_VAL}..{MAX_VAL}.",
            style="Sub.TLabel",
        ).pack(anchor="w", pady=(4, 0))

        body = ttk.Frame(outer, style="TFrame")
        body.pack(fill="both", expand=True, pady=(12, 0))
        body.columnconfigure(0, weight=1)
        body.columnconfigure(1, weight=3)
        body.columnconfigure(2, weight=3)
        body.rowconfigure(0, weight=1)

        # Left: hero list
        left = ttk.Frame(body, style="Panel.TFrame")
        left.grid(row=0, column=0, sticky="nsew", padx=(0, 10))
        left.rowconfigure(3, weight=1)
        left.columnconfigure(0, weight=1)

        ttk.Label(left, text="Heroes", style="TLabel").grid(row=0, column=0, sticky="w", padx=10, pady=(10, 6))

        # Difficulty selector
        diff_row = ttk.Frame(left, style="Panel.TFrame")
        diff_row.grid(row=1, column=0, sticky="ew", padx=10)
        diff_row.columnconfigure(1, weight=1)

        ttk.Label(diff_row, text="Difficulty:", style="Sub.TLabel").grid(row=0, column=0, sticky="w")
        self.diff_var = tk.StringVar(value=DIFF_NAMES[0])
        self.diff_combo = ttk.Combobox(
            diff_row, textvariable=self.diff_var, values=DIFF_NAMES, state="readonly"
        )
        self.diff_combo.grid(row=0, column=1, sticky="ew", padx=(8, 0))
        self.diff_combo.bind("<<ComboboxSelected>>", self._on_diff_change)

        self.search_var = tk.StringVar()
        search = ttk.Entry(left, textvariable=self.search_var)
        search.grid(row=2, column=0, sticky="ew", padx=10, pady=(10, 0))
        search.bind("<KeyRelease>", lambda _e: self._refresh_hero_list())

        self.hero_list = tk.Listbox(left, height=20, activestyle="none", exportselection=False)
        self.hero_list.grid(row=3, column=0, sticky="nsew", padx=10, pady=10)
        self.hero_list.bind("<<ListboxSelect>>", self._on_hero_select)

        self._refresh_hero_list(select_index=0)

        # Middle: slots editor
        mid = ttk.Frame(body, style="Panel.TFrame")
        mid.grid(row=0, column=1, sticky="nsew", padx=(0, 10))
        mid.columnconfigure(0, weight=1)

        top_mid = ttk.Frame(mid, style="Panel.TFrame")
        top_mid.grid(row=0, column=0, sticky="ew", padx=10, pady=(10, 0))
        top_mid.columnconfigure(1, weight=1)

        ttk.Label(top_mid, text="Selected Hero:", style="TLabel").grid(row=0, column=0, sticky="w")
        self.hero_name_lbl = ttk.Label(top_mid, text="", style="TLabel")
        self.hero_name_lbl.grid(row=0, column=1, sticky="w", padx=(8, 0))

        self.diff_lbl = ttk.Label(top_mid, text="", style="Sub.TLabel")
        self.diff_lbl.grid(row=1, column=0, columnspan=2, sticky="w", pady=(6, 0))

        slots_frame = ttk.Frame(mid, style="Panel2.TFrame")
        slots_frame.grid(row=1, column=0, sticky="nsew", padx=10, pady=10)
        for c in range(5):
            slots_frame.columnconfigure(c, weight=1)

        self.slot_vars = []
        self.slot_boxes: list[tk.Spinbox] = []

        for i in range(SLOTS_PER_HERO):
            var = tk.IntVar(value=0)
            self.slot_vars.append(var)

            r = i // 5
            c = i % 5

            cell = ttk.Frame(slots_frame, style="Panel2.TFrame")
            cell.grid(row=r * 2, column=c, sticky="ew", padx=6, pady=(8, 0))

            ttk.Label(cell, text=f"{i:02d}", style="Sub.TLabel").pack(side="left", padx=(0, 6))

            sb = tk.Spinbox(
                cell,
                from_=MIN_VAL,
                to=MAX_VAL,
                width=4,
                textvariable=var,
                justify="center",
                command=self._on_slot_change,
                relief="flat",
                highlightthickness=1,
            )
            sb.pack(side="left")
            sb.bind("<KeyRelease>", lambda _e: self._on_slot_change())
            sb.bind("<FocusOut>", lambda _e: self._on_slot_change())
            self.slot_boxes.append(sb)

        btns = ttk.Frame(mid, style="Panel.TFrame")
        btns.grid(row=2, column=0, sticky="ew", padx=10, pady=(0, 10))
        btns.columnconfigure(0, weight=1)
        btns.columnconfigure(1, weight=1)
        btns.columnconfigure(2, weight=1)
        btns.columnconfigure(3, weight=1)

        ttk.Button(btns, text="Fill Slots = 0", command=lambda: self._fill_current(0)).grid(
            row=0, column=0, sticky="ew", padx=(0, 8)
        )
        ttk.Button(btns, text="Fill Slots = 1", command=lambda: self._fill_current(1)).grid(
            row=0, column=1, sticky="ew", padx=8
        )
        ttk.Button(btns, text="Fill Slots = 2", command=lambda: self._fill_current(2)).grid(
            row=0, column=2, sticky="ew", padx=8
        )
        ttk.Button(btns, text="Copy current hero+diff row (20)", command=self.copy_current_row).grid(
            row=0, column=3, sticky="ew", padx=(8, 0)
        )

        # Right: output + actions
        right = ttk.Frame(body, style="Panel.TFrame")
        right.grid(row=0, column=2, sticky="nsew")
        right.rowconfigure(2, weight=1)
        right.columnconfigure(0, weight=1)

        ttk.Label(right, text="Output", style="TLabel").grid(row=0, column=0, sticky="w", padx=10, pady=(10, 6))

        actions = ttk.Frame(right, style="Panel.TFrame")
        actions.grid(row=1, column=0, sticky="ew", padx=10)
        actions.columnconfigure(0, weight=1)
        actions.columnconfigure(1, weight=1)
        actions.columnconfigure(2, weight=1)

        ttk.Button(actions, text="Compile", command=self.compile).grid(row=0, column=0, sticky="ew", padx=(0, 8))
        ttk.Button(actions, text="Copy Output", command=self.copy_output).grid(row=0, column=1, sticky="ew", padx=8)
        ttk.Button(actions, text="Save / Load", command=self.save_load_menu).grid(row=0, column=2, sticky="ew", padx=(8, 0))

        out_wrap = ttk.Frame(right, style="Panel2.TFrame")
        out_wrap.grid(row=2, column=0, sticky="nsew", padx=10, pady=10)
        out_wrap.rowconfigure(0, weight=1)
        out_wrap.columnconfigure(0, weight=1)

        self.output = tk.Text(out_wrap, wrap="none", height=10, relief="flat", highlightthickness=1)
        self.output.configure(
            background=DarkStyle.ENTRY_BG,
            foreground=DarkStyle.FG,
            insertbackground=DarkStyle.FG,
            selectbackground=DarkStyle.SELECT_BG,
            highlightbackground=DarkStyle.BORDER,
            highlightcolor=DarkStyle.BORDER,
            font=("Consolas", 10),
        )
        self.output.grid(row=0, column=0, sticky="nsew")

        yscroll = ttk.Scrollbar(out_wrap, orient="vertical", command=self.output.yview)
        xscroll = ttk.Scrollbar(out_wrap, orient="horizontal", command=self.output.xview)
        self.output.configure(yscrollcommand=yscroll.set, xscrollcommand=xscroll.set)
        yscroll.grid(row=0, column=1, sticky="ns")
        xscroll.grid(row=1, column=0, sticky="ew")

        self.status = ttk.Label(outer, text="", style="Sub.TLabel")
        self.status.pack(anchor="w")

        self.root.bind("<Control-s>", lambda _e: self._save())
        self.root.bind("<Control-o>", lambda _e: self._load())
        self.root.bind("<Control-b>", lambda _e: self.compile())

        self._update_diff_label()

    # ---------- Selection / navigation ----------

    def _refresh_hero_list(self, select_index: int | None = None):
        query = self.search_var.get().strip().lower()
        self.hero_list.delete(0, tk.END)

        self.filtered_indices = []
        for i, name in enumerate(HEROES):
            if not query or query in name.lower():
                self.filtered_indices.append(i)
                self.hero_list.insert(tk.END, name)

        if not self.filtered_indices:
            return

        if select_index is None:
            if self.current_hero in self.filtered_indices:
                idx = self.filtered_indices.index(self.current_hero)
                self.hero_list.selection_set(idx)
                self.hero_list.see(idx)
            else:
                self.hero_list.selection_set(0)
                self.hero_list.see(0)
        else:
            select_index = max(0, min(select_index, len(self.filtered_indices) - 1))
            self.hero_list.selection_set(select_index)
            self.hero_list.see(select_index)

    def _on_hero_select(self, _event=None):
        sel = self.hero_list.curselection()
        if not sel:
            return
        vis_index = int(sel[0])
        hero_index = self.filtered_indices[vis_index]
        self._save_current()
        self._load_hero(hero_index)

    def _on_diff_change(self, _event=None):
        name = self.diff_var.get()
        if name not in DIFF_NAMES:
            return
        new_diff = DIFF_NAMES.index(name)
        if new_diff == self.current_diff:
            return
        self._save_current()
        self.current_diff = new_diff
        self._load_hero(self.current_hero)  # reload same hero in new diff

    # ---------- Data IO between UI and model ----------

    def _save_current(self):
        row = []
        for v in self.slot_vars:
            try:
                n = int(v.get())
            except Exception:
                n = 0
            n = max(MIN_VAL, min(MAX_VAL, n))
            row.append(n)
        self.data[self.current_diff][self.current_hero] = row

    def _load_hero(self, hero_index: int):
        self.current_hero = hero_index
        self.hero_name_lbl.configure(text=f"{HEROES[hero_index]}  (index {hero_index})")
        self._update_diff_label()

        row = self.data[self.current_diff][hero_index]
        for i, n in enumerate(row):
            self.slot_vars[i].set(int(n))

        self._update_status()

    def _update_diff_label(self):
        self.diff_lbl.configure(
            text=f"Editing difficulty: {DIFF_NAMES[self.current_diff]} (index {self.current_diff}) • Slots represent 0..19"
        )

    def _on_slot_change(self):
        for v in self.slot_vars:
            try:
                n = int(v.get())
            except Exception:
                n = 0
            if n < MIN_VAL:
                v.set(MIN_VAL)
            elif n > MAX_VAL:
                v.set(MAX_VAL)
        self._save_current()
        self._update_status()

    def _fill_current(self, value: int):
        value = max(MIN_VAL, min(MAX_VAL, int(value)))
        for v in self.slot_vars:
            v.set(value)
        self._save_current()
        self._update_status()

    def _update_status(self):
        flat_len = DIFF_COUNT * HERO_COUNT * SLOTS_PER_HERO
        self.status.configure(
            text=f"Difficulties: {DIFF_COUNT} | Heroes: {HERO_COUNT} | Slots/hero: {SLOTS_PER_HERO} | Compiled length: {flat_len} "
                 f"(order: diff → hero → slot)"
        )

    # ---------- Compile / output ----------

    def compile(self):
        self._save_current()

        flat = []
        for d in range(DIFF_COUNT):
            for h in range(HERO_COUNT):
                row = self.data[d][h]
                if len(row) != SLOTS_PER_HERO:
                    row = (row + [0] * SLOTS_PER_HERO)[:SLOTS_PER_HERO]
                    self.data[d][h] = row
                flat.extend(row)

        out = self._format_array(flat, wrap=140)

        self.output.delete("1.0", tk.END)
        self.output.insert(tk.END, out)

    def _format_array(self, arr: list[int], wrap: int = 140) -> str:
        s = "["
        line_len = 1
        for i, n in enumerate(arr):
            token = f"{n}"
            if i != 0:
                token = ", " + token
            if line_len + len(token) > wrap:
                s += "\n  "
                line_len = 2
            s += token
            line_len += len(token)
        s += "]"
        return s

    def copy_output(self):
        txt = self.output.get("1.0", "end-1c")
        if not txt.strip():
            self.compile()
            txt = self.output.get("1.0", "end-1c")

        self.root.clipboard_clear()
        self.root.clipboard_append(txt)
        self.root.update()
        messagebox.showinfo("Copied", "Output copied to clipboard.")

    def copy_current_row(self):
        self._save_current()
        row = self.data[self.current_diff][self.current_hero]
        txt = self._format_array(row, wrap=140)
        self.root.clipboard_clear()
        self.root.clipboard_append(txt)
        self.root.update()
        messagebox.showinfo(
            "Copied",
            f"Copied current 20-slot row for:\n{HEROES[self.current_hero]} • {DIFF_NAMES[self.current_diff]}",
        )

    # ---------- Save / load ----------

    def save_load_menu(self):
        win = tk.Toplevel(self.root)
        win.title("Save / Load")
        win.configure(bg=DarkStyle.BG)
        win.resizable(False, False)

        frm = ttk.Frame(win, style="Panel.TFrame")
        frm.pack(fill="both", expand=True, padx=14, pady=14)

        ttk.Label(frm, text="Save or load the 4×45×20 numeric grid.", style="TLabel").pack(anchor="w", pady=(0, 10))

        btnrow = ttk.Frame(frm, style="Panel.TFrame")
        btnrow.pack(fill="x")
        ttk.Button(btnrow, text="Save JSON", command=lambda: (win.destroy(), self._save())).pack(side="left", padx=(0, 8))
        ttk.Button(btnrow, text="Load JSON", command=lambda: (win.destroy(), self._load())).pack(side="left", padx=8)
        ttk.Button(btnrow, text="Cancel", command=win.destroy).pack(side="left", padx=8)

        win.transient(self.root)
        win.grab_set()
        win.focus_set()

    def _save(self):
        self._save_current()
        path = filedialog.asksaveasfilename(
            title="Save ability use data",
            defaultextension=".json",
            filetypes=[("JSON", "*.json"), ("All Files", "*.*")],
        )
        if not path:
            return

        payload = {
            "format": "zomnic_ability_use_v2",
            "heroes": HEROES,
            "difficulties": DIFF_NAMES,
            "slots_per_hero": SLOTS_PER_HERO,
            "min_val": MIN_VAL,
            "max_val": MAX_VAL,
            "data": self.data,  # [diff][hero][slot]
            "flatten_order": "diff_hero_slot",
        }
        try:
            with open(path, "w", encoding="utf-8") as f:
                json.dump(payload, f, indent=2)
        except Exception as e:
            messagebox.showerror("Save failed", str(e))
            return

        messagebox.showinfo("Saved", f"Saved to:\n{path}")

    def _load(self):
        path = filedialog.askopenfilename(
            title="Load ability use data",
            filetypes=[("JSON", "*.json"), ("All Files", "*.*")],
        )
        if not path:
            return

        try:
            with open(path, "r", encoding="utf-8") as f:
                payload = json.load(f)
        except Exception as e:
            messagebox.showerror("Load failed", str(e))
            return

        try:
            data = payload.get("data", None)
            diffs = payload.get("difficulties", None)
            slots = int(payload.get("slots_per_hero", SLOTS_PER_HERO))

            if slots != SLOTS_PER_HERO:
                raise ValueError(f"slots_per_hero is {slots}, expected {SLOTS_PER_HERO}")

            if diffs is None or len(diffs) != DIFF_COUNT:
                raise ValueError(f"difficulties must have length {DIFF_COUNT}")

            if not isinstance(data, list) or len(data) != DIFF_COUNT:
                raise ValueError(f"data must be a list of length {DIFF_COUNT} (diff dimension)")

            fixed_all = []
            for d in range(DIFF_COUNT):
                block = data[d]
                if not isinstance(block, list) or len(block) != HERO_COUNT:
                    raise ValueError(f"data[{d}] must be a list of length {HERO_COUNT} (hero dimension)")
                fixed_block = []
                for row in block:
                    if not isinstance(row, list):
                        row = [0] * SLOTS_PER_HERO
                    clean = []
                    for x in row[:SLOTS_PER_HERO]:
                        try:
                            v = int(x)
                        except Exception:
                            v = 0
                        v = max(MIN_VAL, min(MAX_VAL, v))
                        clean.append(v)
                    clean = (clean + [0] * SLOTS_PER_HERO)[:SLOTS_PER_HERO]
                    fixed_block.append(clean)
                fixed_all.append(fixed_block)

            self.data = fixed_all

        except Exception as e:
            messagebox.showerror("Invalid file", str(e))
            return

        self._load_hero(self.current_hero)
        messagebox.showinfo("Loaded", f"Loaded:\n{path}")


def main():
    root = tk.Tk()
    app = AbilityUseApp(root)
    root.mainloop()


if __name__ == "__main__":
    main()
