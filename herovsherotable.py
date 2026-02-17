"""
OW Hero-vs-Hero Modifier Switchboard (1/2/3)

What it does
- Pick an "Attacker" hero on the left
- For that attacker, set each "Victim" hero to 1, 2, or 3
- Click Compile to export:
  1) A flattened table (attacker-major order): idx = attackerIndex * N + victimIndex
  2) A per-attacker matrix (dict of dict)
- Save/Load to JSON
- Optional: Edit hero list in-app (or load from a text file)

Notes
- This tool stores only 1/2/3 as requested.
- You can later decode 1/2/3 -> {0.70, 1.00, 1.30} (or whatever mapping you want).

Run
- Python 3.10+ recommended
- No external dependencies (Tkinter is included with most Python installs)

If Tkinter is missing on Linux:
- Debian/Ubuntu: sudo apt install python3-tk
"""

import json
import os
import tkinter as tk
from tkinter import ttk, filedialog, messagebox


DEFAULT_HEROES = [
    # Edit this list to match your roster.
    # Kept generic because hero rosters change over time.
    "Ana", "Ashe", "Baptiste", "Bastion", "Brigitte", "Cassidy",
    "D.Va", "Doomfist", "Echo", "Freja", "Genji", "Hanzo", "Hazard", "Illari",
    "Junker Queen", "Junkrat", "Juno", "Kiriko", "Lifeweaver", "Lúcio",
    "Mauga", "Mei", "Mercy", "Moira", "Orisa", "Pharah", "Ramattra",
    "Reaper", "Reinhardt", "Roadhog", "Sigma", "Sojourn", "Soldier: 76",
    "Sombra", "Symmetra", "Torbjörn", "Tracer", "Vendetta", "Venture", "Widowmaker",
    "Winston", "Wrecking Ball", "Wuyang", "Zarya", "Zenyatta"
]

HERO_ROLES = {
    # TANKS
    "D.Va": "tank",
    "Doomfist": "tank",
    "Hazard": "tank",
    "Junker Queen": "tank",
    "Mauga": "tank",
    "Orisa": "tank",
    "Ramattra": "tank",
    "Reinhardt": "tank",
    "Roadhog": "tank",
    "Sigma": "tank",
    "Winston": "tank",
    "Wrecking Ball": "tank",
    "Zarya": "tank",

    # SUPPORTS
    "Ana": "support",
    "Baptiste": "support",
    "Brigitte": "support",
    "Illari": "support",
    "Juno": "support",
    "Kiriko": "support",
    "Lifeweaver": "support",
    "Lúcio": "support",
    "Mercy": "support",
    "Moira": "support",
    "Wuyang": "support",
    "Zenyatta": "support",

    # EVERYTHING ELSE = DPS
}


class ScrollableFrame(ttk.Frame):
    def __init__(self, parent):
        super().__init__(parent)

        self.canvas = tk.Canvas(self, highlightthickness=0, background="#1e1e1e")
        self.v_scroll = ttk.Scrollbar(self, orient="vertical", command=self.canvas.yview)
        self.canvas.configure(yscrollcommand=self.v_scroll.set)

        self.inner = ttk.Frame(self.canvas)
        self.inner.configure(style="TFrame")  # ensures ttk background applies
        self.inner_id = self.canvas.create_window((0, 0), window=self.inner, anchor="nw")

        self.canvas.grid(row=0, column=0, sticky="nsew")
        self.v_scroll.grid(row=0, column=1, sticky="ns")

        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(0, weight=1)

        self.inner.bind("<Configure>", self._on_inner_configure)
        self.canvas.bind("<Configure>", self._on_canvas_configure)

        # mousewheel support
        self.canvas.bind_all("<MouseWheel>", self._on_mousewheel)       # Windows/macOS
        self.canvas.bind_all("<Button-4>", self._on_mousewheel_linux)   # Linux up
        self.canvas.bind_all("<Button-5>", self._on_mousewheel_linux)   # Linux down

    def _on_inner_configure(self, _event=None):
        self.canvas.configure(scrollregion=self.canvas.bbox("all"))

    def _on_canvas_configure(self, event):
        # Make the inner frame match the canvas width
        self.canvas.itemconfigure(self.inner_id, width=event.width)

    def _on_mousewheel(self, event):
        # Windows: event.delta is multiples of 120
        self.canvas.yview_scroll(int(-1 * (event.delta / 120)), "units")

    def _on_mousewheel_linux(self, event):
        if event.num == 4:
            self.canvas.yview_scroll(-3, "units")
        elif event.num == 5:
            self.canvas.yview_scroll(3, "units")


class SwitchboardApp(ttk.Frame):
    def __init__(self, root):
        super().__init__(root)
        self.root = root

        self.heroes = list(DEFAULT_HEROES)
        self.N = len(self.heroes)

        # Data: table[attacker_index][victim_index] = 1/2/3
        # Default everything to 2
        self.table = [[2 for _ in range(self.N)] for __ in range(self.N)]

        self.selected_attacker = 0

        self._build_style()
        self._build_layout()
        self._render_victim_rows()

        self._select_attacker(0)

    def _build_style(self):
        style = ttk.Style()

        try:
            style.theme_use("clam")  # clam is the best base for dark themes
        except tk.TclError:
            pass

        # --- GLOBAL COMBOBOX DROPDOWN COLORS (IMPORTANT) ---
        self.root.option_add("*TCombobox*Listbox.background", "#1e1e1e")
        self.root.option_add("*TCombobox*Listbox.foreground", "#d4d4d4")
        self.root.option_add("*TCombobox*Listbox.selectBackground", "#444444")
        self.root.option_add("*TCombobox*Listbox.selectForeground", "#ffffff")

        # ---- COLORS ----
        BG = "#1e1e1e"      # main background
        FG = "#d4d4d4"      # main text
        ACCENT = "#3a3a3a"  # buttons / frames
        HOVER = "#505050"
        ENTRY_BG = "#2a2a2a"

        # ---- COMBOBOX (field colors + readonly override) ----
        style.configure(
            "TCombobox",
            fieldbackground=ENTRY_BG,
            background=ENTRY_BG,
            foreground=FG
        )

        # This is the important part on Linux: readonly state overrides
        style.map(
            "TCombobox",
            fieldbackground=[("readonly", ENTRY_BG), ("!disabled", ENTRY_BG)],
            foreground=[("readonly", FG), ("!disabled", FG)],
            selectbackground=[("readonly", "#444444")],
            selectforeground=[("readonly", "#ffffff")]
        )

        # ---- ROOT WINDOW ----
        self.root.configure(background=BG)

        # ---- BASE STYLES ----
        style.configure(
            ".",
            background=BG,
            foreground=FG,
            fieldbackground=ENTRY_BG,
            bordercolor=ACCENT
        )

        style.configure(
            "TFrame",
            background=BG
        )

        style.configure(
            "TLabel",
            background=BG,
            foreground=FG,
            padding=2
        )

        style.configure(
            "Header.TLabel",
            background=BG,
            foreground=FG,
            font=("Segoe UI", 11, "bold")
        )

        style.configure(
            "Small.TLabel",
            background=BG,
            foreground=FG,
            font=("Segoe UI", 9)
        )

        style.configure(
            "Mono.TLabel",
            background=BG,
            foreground=FG,
            font=("Consolas", 9)
        )

        # ---- BUTTONS ----
        style.configure(
            "TButton",
            background=ACCENT,
            foreground=FG,
            padding=6
        )

        style.map(
            "TButton",
            background=[("active", HOVER)]
        )

        # ---- COMBOBOX ----
        style.configure(
            "TCombobox",
            fieldbackground=ENTRY_BG,
            background=ENTRY_BG,
            foreground=FG,
            arrowcolor=FG
        )

        # ---- SCROLLBAR ----
        style.configure(
            "Vertical.TScrollbar",
            background=ACCENT,
            troughcolor=BG,
            arrowcolor=FG
        )

    def _build_layout(self):
        self.root.title("OW Hero Switchboard (1/2/3)")
        self.root.geometry("1050x700")
        self.root.minsize(900, 600)

        self.pack(fill="both", expand=True)
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)

        # Left: attacker list
        left = ttk.Frame(self)
        left.grid(row=0, column=0, sticky="nsew", padx=10, pady=10)
        left.grid_rowconfigure(2, weight=1)

        ttk.Label(left, text="Attacker Hero", style="Header.TLabel").grid(row=0, column=0, sticky="w")

        ttk.Button(left, text="Edit Hero List…", command=self._open_hero_editor).grid(row=1, column=0, sticky="we", pady=(6, 6))

        self.attacker_list = tk.Listbox(left, height=22, exportselection=False)
        self.attacker_list.configure(background="#1e1e1e",    foreground="#d4d4d4",    selectbackground="#444444",    selectforeground="#ffffff",    highlightthickness=0)
        self.attacker_list.grid(row=2, column=0, sticky="nsew")
        self.attacker_list.bind("<<ListboxSelect>>", self._on_attacker_select)

        for h in self.heroes:
            self.attacker_list.insert("end", h)

        # Right: victim grid + controls
        right = ttk.Frame(self)
        right.grid(row=0, column=1, sticky="nsew", padx=10, pady=10)
        right.grid_rowconfigure(2, weight=1)
        right.grid_columnconfigure(0, weight=1)

        self.attacker_title = ttk.Label(right, text="Victim Modifiers", style="Header.TLabel")
        self.attacker_title.grid(row=0, column=0, sticky="w")

        controls = ttk.Frame(right)
        controls.grid(row=1, column=0, sticky="we", pady=(6, 8))
        controls.grid_columnconfigure(6, weight=1)

        ttk.Label(controls, text="Quick Fill for current attacker:", style="Small.TLabel").grid(row=0, column=0, sticky="w")

        ttk.Button(controls, text="Set All = 1", command=lambda: self._fill_attacker_row(1)).grid(row=0, column=1, padx=4)
        ttk.Button(controls, text="Set All = 2", command=lambda: self._fill_attacker_row(2)).grid(row=0, column=2, padx=4)
        ttk.Button(controls, text="Set All = 3", command=lambda: self._fill_attacker_row(3)).grid(row=0, column=3, padx=4)

        ttk.Button(controls, text="Diagonal = 2", command=self._set_diagonal_2).grid(row=0, column=4, padx=12)

        ttk.Button(controls, text="Compile", command=self._compile).grid(row=0, column=7, sticky="e")
        ttk.Button(controls, text="Save JSON…", command=self._save_json).grid(row=0, column=8, padx=6)
        ttk.Button(controls, text="Load JSON…", command=self._load_json).grid(row=0, column=9)

        self.victim_frame = ScrollableFrame(right)
        self.victim_frame.grid(row=2, column=0, sticky="nsew")

        # Bottom: output
        out = ttk.Frame(right)
        out.grid(row=3, column=0, sticky="nsew", pady=(8, 0))
        out.grid_columnconfigure(0, weight=1)


        out_header = ttk.Frame(out)
        out_header.grid(row=0, column=0, sticky="we")
        out_header.grid_columnconfigure(0, weight=1)

        ttk.Label(out_header, text="Output (Flattened + JSON preview):", style="Small.TLabel").grid(row=0, column=0, sticky="w")
        ttk.Button(out_header, text="Copy", command=self._copy_output).grid(row=0, column=1, sticky="e")
        self.output = tk.Text(out, height=10, wrap="none")
        self.output.configure(
            background="#1e1e1e",
            foreground="#d4d4d4",
            insertbackground="#ffffff",
            selectbackground="#444444",
            selectforeground="#ffffff"
        )

        self.output.grid(row=1, column=0, sticky="nsew")
        self.output.configure(font=("Consolas", 9))

        # Horizontal scrollbar for output
        xscroll = ttk.Scrollbar(out, orient="horizontal", command=self.output.xview)
        self.output.configure(xscrollcommand=xscroll.set)
        xscroll.grid(row=2, column=0, sticky="we")

    def _copy_output(self):
        text = self.output.get("1.0", "end-1c")
        self.root.clipboard_clear()
        self.root.clipboard_append(text)

    def _render_victim_rows(self):
        # Clear existing victim rows
        for w in self.victim_frame.inner.winfo_children():
            w.destroy()

        header = ttk.Frame(self.victim_frame.inner)
        header.grid(row=0, column=0, sticky="we", padx=6, pady=(6, 4))
        header.grid_columnconfigure(0, weight=1)

        ttk.Label(header, text="Victim Hero", style="Small.TLabel").grid(row=0, column=0, sticky="w")
        ttk.Label(header, text="Value (1/2/3)", style="Small.TLabel").grid(row=0, column=1, sticky="e")

        self.victim_vars = []
        for i, victim in enumerate(self.heroes):
            row = ttk.Frame(self.victim_frame.inner)
            row.grid(row=i + 1, column=0, sticky="we", padx=6, pady=2)
            row.grid_columnconfigure(0, weight=1)

            ttk.Label(row, text=victim).grid(row=0, column=0, sticky="w")

            var = tk.StringVar(value="2")
            self.victim_vars.append(var)

            combo = ttk.Combobox(row, textvariable=var, values=("1", "2", "3"), width=4, state="readonly")
            combo.configure(background="#2a2a2a", foreground="#d4d4d4")
            combo.grid(row=0, column=1, sticky="e")
            combo.bind("<<ComboboxSelected>>", lambda _e, victim_index=i: self._on_victim_value_changed(victim_index))

    def _on_victim_value_changed(self, victim_index: int):
        try:
            v = int(self.victim_vars[victim_index].get())
        except ValueError:
            v = 2
        v = 1 if v < 1 else 3 if v > 3 else v
        self.table[self.selected_attacker][victim_index] = v

    def _on_attacker_select(self, _event=None):
        sel = self.attacker_list.curselection()
        if not sel:
            return
        self._select_attacker(sel[0])

    def _select_attacker(self, attacker_index: int):
        self.selected_attacker = attacker_index
        attacker_name = self.heroes[attacker_index]
        self.attacker_title.configure(text=f'Victim Modifiers (Attacker: "{attacker_name}")')

        # update victim dropdowns to match this attacker row
        for i in range(self.N):
            self.victim_vars[i].set(str(self.table[attacker_index][i]))

    def _fill_attacker_row(self, value: int):
        value = 1 if value < 1 else 3 if value > 3 else value
        a = self.selected_attacker
        for i in range(self.N):
            self.table[a][i] = value
            self.victim_vars[i].set(str(value))

    def _set_diagonal_2(self):
        for i in range(self.N):
            self.table[i][i] = 2
        # Refresh current attacker view
        self._select_attacker(self.selected_attacker)

    def _compile(self):
        # Build role index lists
        role_indices = {
            "damage": [],
            "tank": [],
            "support": []
        }

        for i, hero in enumerate(self.heroes):
            role = HERO_ROLES.get(hero, "damage")
            role_indices[role].append(i)

        # Build separate flattened tables
        damage_table = []
        tank_table = []
        support_table = []

        for a in range(self.N):
            attacker_role = HERO_ROLES.get(self.heroes[a], "damage")

            if attacker_role == "damage":
                target = damage_table
            elif attacker_role == "tank":
                target = tank_table
            else:
                target = support_table

            for v in range(self.N):
                target.append(self.table[a][v])

        # Output
        self.output.delete("1.0", "end")

        self.output.insert("end", "DAMAGE HERO ARRAY:\n")
        self.output.insert("end", json.dumps(damage_table))
        self.output.insert("end", "\n\nTANK HERO ARRAY:\n")
        self.output.insert("end", json.dumps(tank_table))
        self.output.insert("end", "\n\nSUPPORT HERO ARRAY:\n")
        self.output.insert("end", json.dumps(support_table))

        # Copy all three as a single object for convenience
        compiled = {
            "damage": damage_table,
            "tank": tank_table,
            "support": support_table
        }

        self.root.clipboard_clear()
        self.root.clipboard_append(json.dumps(compiled))

        messagebox.showinfo(
            "Compiled",
            "Compiled into 3 role-based arrays.\n\nAll arrays copied to clipboard as JSON."
        )

    def _save_json(self):
        path = filedialog.asksaveasfilename(
            defaultextension=".json",
            filetypes=[("JSON files", "*.json"), ("All files", "*.*")]
        )
        if not path:
            return

        flat = []
        for a in range(self.N):
            flat.extend(self.table[a])

        payload = {
            "heroes": self.heroes,
            "N": self.N,
            "flat_attacker_major": flat,
            "table": self.table,  # 2D, same data
        }

        try:
            with open(path, "w", encoding="utf-8") as f:
                json.dump(payload, f, ensure_ascii=False, indent=2)
            messagebox.showinfo("Saved", f"Saved to:\n{path}")
        except Exception as e:
            messagebox.showerror("Save failed", str(e))

    def _load_json(self):
        path = filedialog.askopenfilename(
            filetypes=[("JSON files", "*.json"), ("All files", "*.*")]
        )
        if not path:
            return

        try:
            with open(path, "r", encoding="utf-8") as f:
                data = json.load(f)

            heroes = data.get("heroes")
            table = data.get("table")

            if not isinstance(heroes, list) or not isinstance(table, list):
                raise ValueError("Invalid JSON format: missing 'heroes' or 'table'.")

            N = len(heroes)
            if any(not isinstance(r, list) or len(r) != N for r in table) or len(table) != N:
                raise ValueError("Invalid JSON format: 'table' must be NxN list.")

            self.heroes = heroes
            self.N = N
            self.table = table

            # Rebuild UI
            self.attacker_list.delete(0, "end")
            for h in self.heroes:
                self.attacker_list.insert("end", h)

            self._render_victim_rows()
            self._select_attacker(0)

            messagebox.showinfo("Loaded", f"Loaded:\n{os.path.basename(path)}")
        except Exception as e:
            messagebox.showerror("Load failed", str(e))

    def _open_hero_editor(self):
        win = tk.Toplevel(self.root)
        win.title("Edit Hero List")
        win.geometry("520x520")
        win.minsize(420, 420)

        frame = ttk.Frame(win, padding=10)
        frame.pack(fill="both", expand=True)
        frame.grid_rowconfigure(1, weight=1)
        frame.grid_columnconfigure(0, weight=1)

        ttk.Label(frame, text="One hero per line.", style="Small.TLabel").grid(row=0, column=0, sticky="w")

        txt = tk.Text(frame, wrap="none", height=20)
        txt.grid(row=1, column=0, sticky="nsew", pady=(6, 8))
        txt.configure(font=("Consolas", 10))
        txt.insert("1.0", "\n".join(self.heroes))

        btns = ttk.Frame(frame)
        btns.grid(row=2, column=0, sticky="we")
        btns.grid_columnconfigure(2, weight=1)

        def apply_changes():
            lines = [ln.strip() for ln in txt.get("1.0", "end").splitlines()]
            new_heroes = [h for h in lines if h]
            if len(new_heroes) < 2:
                messagebox.showerror("Invalid", "Need at least 2 heroes.")
                return

            # If size changes, reinitialize table conservatively:
            # - Keep overlap where possible
            old_heroes = self.heroes
            old_table = self.table
            old_index = {h: i for i, h in enumerate(old_heroes)}

            N = len(new_heroes)
            new_table = [[2 for _ in range(N)] for __ in range(N)]

            for a_name in new_heroes:
                for v_name in new_heroes:
                    if a_name in old_index and v_name in old_index:
                        new_table[new_heroes.index(a_name)][new_heroes.index(v_name)] = old_table[old_index[a_name]][old_index[v_name]]

            self.heroes = new_heroes
            self.N = N
            self.table = new_table

            # rebuild UI
            self.attacker_list.delete(0, "end")
            for h in self.heroes:
                self.attacker_list.insert("end", h)

            self._render_victim_rows()
            self._select_attacker(0)
            win.destroy()

        def load_from_txt():
            path = filedialog.askopenfilename(filetypes=[("Text files", "*.txt"), ("All files", "*.*")])
            if not path:
                return
            try:
                with open(path, "r", encoding="utf-8") as f:
                    txt.delete("1.0", "end")
                    txt.insert("1.0", f.read())
            except Exception as e:
                messagebox.showerror("Load failed", str(e))

        ttk.Button(btns, text="Load .txt…", command=load_from_txt).grid(row=0, column=0, padx=(0, 6))
        ttk.Button(btns, text="Apply", command=apply_changes).grid(row=0, column=1, padx=(0, 6))
        ttk.Button(btns, text="Cancel", command=win.destroy).grid(row=0, column=3, sticky="e")

        ttk.Label(frame, text="Tip: keep your list order stable if you rely on attackerIndex * N + victimIndex.", style="Small.TLabel").grid(
            row=3, column=0, sticky="w", pady=(8, 0)
        )


def main():
    root = tk.Tk()
    app = SwitchboardApp(root)
    root.mainloop()


if __name__ == "__main__":
    main()
