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

import json  # Imports json for use in this script.
import tkinter as tk  # Imports tkinter as tk for use in this script.
from tkinter import ttk, filedialog, messagebox  # Imports ttk, filedialog, messagebox from tkinter for use in this script.


HERO_COUNT = 45  # Sets the expected number of hero entries.
SLOTS_PER_HERO = 10  # Sets the number of ability slots displayed for each hero.
MIN_VAL = 0  # Sets the lowest permitted ability-use value.
MAX_VAL = 3  # Sets the highest permitted ability-use value.

DIFF_NAMES = ["Easy", "Normal", "Hard", "Nightmare"]  # rename if you want
DIFF_COUNT = len(DIFF_NAMES)  # Counts the configured difficulty sections.

# Match this ordering to your other tool if needed.
HEROES = [  # Defines the hero roster used to populate the switchboard.
    "Ana", "Ashe", "Baptiste", "Bastion", "Brigitte",  # Lists the selectable hero names used to build the switchboard.
    "Cassidy", "D.Va", "Doomfist", "Echo", "Genji",  # Lists the selectable hero names used to build the switchboard.
    "Hanzo", "Illari", "Junker Queen", "Junkrat", "Juno",  # Lists the selectable hero names used to build the switchboard.
    "Kiriko", "Lifeweaver", "Lucio", "Mauga", "Mei",  # Lists the selectable hero names used to build the switchboard.
    "Mercy", "Moira", "Orisa", "Pharah", "Ramattra",  # Lists the selectable hero names used to build the switchboard.
    "Reaper", "Reinhardt", "Roadhog", "Sigma", "Sojourn",  # Lists the selectable hero names used to build the switchboard.
    "Soldier: 76", "Sombra", "Symmetra", "Torbjorn", "Tracer",  # Lists the selectable hero names used to build the switchboard.
    "Venture", "Widowmaker", "Winston", "Wrecking Ball", "Zarya",  # Lists the selectable hero names used to build the switchboard.
    "Zenyatta", "Hero42", "Hero43", "Hero44", "Hero45",  # Lists the selectable hero names used to build the switchboard.
]  # Closes the current list or indexed expression.

# Force exactly 45 labels.
if len(HEROES) < HERO_COUNT:  # Checks whether len(HEROES) < HERO_COUNT before entering this branch.
    HEROES = HEROES + [f"Hero{len(HEROES)+i+1}" for i in range(HERO_COUNT - len(HEROES))]  # Defines the hero roster used to populate the switchboard.
elif len(HEROES) > HERO_COUNT:  # Checks the alternate condition len(HEROES) > HERO_COUNT.
    HEROES = HEROES[:HERO_COUNT]  # Defines the hero roster used to populate the switchboard.


class DarkStyle:  # Defines the DarkStyle class.
    BG = "#111315"  # Computes bg from the current input.
    PANEL = "#15181b"  # Computes panel from the current input.
    PANEL2 = "#1b2024"  # Computes panel2 from the current input.
    FG = "#d7dde3"  # Computes fg from the current input.
    MUTED = "#a8b0ba"  # Computes muted from the current input.
    ACCENT = "#3a86ff"  # Computes accent from the current input.
    BORDER = "#2a3138"  # Computes border from the current input.
    ENTRY_BG = "#0f1113"  # Computes entry bg from the current input.
    SELECT_BG = "#2b3440"  # Computes select bg from the current input.


class AbilityUseApp:  # Defines the AbilityUseApp class.
    def __init__(self, root: tk.Tk):  # Defines the   init   function.
        self.root = root  # Keeps the application?s root window available to its methods.
        self.root.title("Zomnic Ability Use Switchboard (4 Difficulties)")  # Sets the window title.
        self.root.geometry("1200x740")  # Sets the window size.
        self.root.configure(bg=DarkStyle.BG)  # Configures self.root for the desired interface behavior or appearance.

        # Data model: diff_index -> hero_index -> list[int] length 20
        self.data = [  # Sets data from the configured value or expression.
            [[0 for _ in range(SLOTS_PER_HERO)] for _ in range(HERO_COUNT)]  # Continues the surrounding operation.
            for _ in range(DIFF_COUNT)  # Starts this iteration over the selected values.
        ]  # Closes the current list or indexed expression.

        self.current_hero = 0  # Sets current hero from the configured value or expression.
        self.current_diff = 0  # Sets current diff from the configured value or expression.

        self.slot_vars: list[tk.IntVar] = []  # Provides this value as an entry in the enclosing data structure.

        self._build_style()  # Calls self._build_style to perform this step.
        self._build_ui()  # Calls self._build_ui to perform this step.
        self._load_hero(0)  # Calls self._load_hero to perform this step.
        self._update_status()  # Calls self._update_status to perform this step.

    def _build_style(self):  # Defines the  build style function.
        style = ttk.Style(self.root)  # Creates a Style object for style.
        try:  # Starts a guarded operation whose failures are handled below.
            style.theme_use("clam")  # Configures style for the desired interface behavior or appearance.
        except tk.TclError:  # Handles tk.TclError raised by the guarded operation.
            pass  # Intentionally leaves this branch empty.

        style.configure("TFrame", background=DarkStyle.BG)  # Configures style for the desired interface behavior or appearance.
        style.configure("Panel.TFrame", background=DarkStyle.PANEL)  # Configures style for the desired interface behavior or appearance.
        style.configure("Panel2.TFrame", background=DarkStyle.PANEL2)  # Configures style for the desired interface behavior or appearance.

        style.configure("TLabel", background=DarkStyle.BG, foreground=DarkStyle.FG)  # Configures style for the desired interface behavior or appearance.
        style.configure("Title.TLabel", font=("Segoe UI", 14, "bold"), foreground=DarkStyle.FG)  # Configures style for the desired interface behavior or appearance.
        style.configure("Sub.TLabel", font=("Segoe UI", 10), foreground=DarkStyle.MUTED)  # Configures style for the desired interface behavior or appearance.

        style.configure(  # Configures style for the desired interface behavior or appearance.
            "TButton",  # Provides this value as an entry in the enclosing data structure.
            padding=8,  # Sets padding from the configured value or expression.
            background=DarkStyle.PANEL2,  # Sets background from the configured value or expression.
            foreground=DarkStyle.FG,  # Sets foreground from the configured value or expression.
            bordercolor=DarkStyle.BORDER,  # Sets bordercolor from the configured value or expression.
            focusthickness=0,  # Sets focusthickness from the configured value or expression.
            focuscolor=DarkStyle.ACCENT,  # Sets focuscolor from the configured value or expression.
        )  # Closes the continued call or expression.
        style.map("TButton", background=[("active", DarkStyle.SELECT_BG)])  # Configures style for the desired interface behavior or appearance.

        style.configure(  # Configures style for the desired interface behavior or appearance.
            "TEntry",  # Provides this value as an entry in the enclosing data structure.
            fieldbackground=DarkStyle.ENTRY_BG,  # Sets fieldbackground from the configured value or expression.
            foreground=DarkStyle.FG,  # Sets foreground from the configured value or expression.
            background=DarkStyle.PANEL2,  # Sets background from the configured value or expression.
            bordercolor=DarkStyle.BORDER,  # Sets bordercolor from the configured value or expression.
            lightcolor=DarkStyle.BORDER,  # Sets lightcolor from the configured value or expression.
            darkcolor=DarkStyle.BORDER,  # Sets darkcolor from the configured value or expression.
        )  # Closes the continued call or expression.

        style.configure(  # Configures style for the desired interface behavior or appearance.
            "TCombobox",  # Provides this value as an entry in the enclosing data structure.
            fieldbackground=DarkStyle.ENTRY_BG,  # Sets fieldbackground from the configured value or expression.
            foreground=DarkStyle.FG,  # Sets foreground from the configured value or expression.
            background=DarkStyle.PANEL2,  # Sets background from the configured value or expression.
            bordercolor=DarkStyle.BORDER,  # Sets bordercolor from the configured value or expression.
            lightcolor=DarkStyle.BORDER,  # Sets lightcolor from the configured value or expression.
            darkcolor=DarkStyle.BORDER,  # Sets darkcolor from the configured value or expression.
            arrowcolor=DarkStyle.FG,  # Sets arrowcolor from the configured value or expression.
        )  # Closes the continued call or expression.
        style.map("TCombobox", fieldbackground=[("readonly", DarkStyle.ENTRY_BG)])  # Configures style for the desired interface behavior or appearance.

        # Listbox + spinbox defaults
        self.root.option_add("*Listbox.background", DarkStyle.ENTRY_BG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Listbox.foreground", DarkStyle.FG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Listbox.selectBackground", DarkStyle.SELECT_BG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Listbox.selectForeground", DarkStyle.FG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Listbox.highlightBackground", DarkStyle.BORDER)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Listbox.highlightColor", DarkStyle.BORDER)  # Configures self.root for the desired interface behavior or appearance.

        self.root.option_add("*Spinbox.background", DarkStyle.ENTRY_BG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Spinbox.foreground", DarkStyle.FG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Spinbox.insertBackground", DarkStyle.FG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Spinbox.selectBackground", DarkStyle.SELECT_BG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Spinbox.selectForeground", DarkStyle.FG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Spinbox.highlightBackground", DarkStyle.BORDER)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*Spinbox.highlightColor", DarkStyle.BORDER)  # Configures self.root for the desired interface behavior or appearance.

        # TCombobox dropdown list colors (often helps on Linux/Windows)
        self.root.option_add("*TCombobox*Listbox.background", DarkStyle.ENTRY_BG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*TCombobox*Listbox.foreground", DarkStyle.FG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*TCombobox*Listbox.selectBackground", DarkStyle.SELECT_BG)  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*TCombobox*Listbox.selectForeground", DarkStyle.FG)  # Configures self.root for the desired interface behavior or appearance.

    def _build_ui(self):  # Defines the  build ui function.
        outer = ttk.Frame(self.root, style="TFrame")  # Creates a Frame object for outer.
        outer.pack(fill="both", expand=True, padx=14, pady=14)  # Places outer in the interface layout.

        header = ttk.Frame(outer, style="TFrame")  # Creates a Frame object for header.
        header.pack(fill="x")  # Places header in the interface layout.

        ttk.Label(header, text="Zomnic Ability Use Switchboard", style="Title.TLabel").pack(anchor="w")  # Calls ttk.Label to perform this step.
        ttk.Label(  # Calls ttk.Label to perform this step.
            header,  # Provides this value as an entry in the enclosing data structure.
            text=f"{DIFF_COUNT} difficulties • {HERO_COUNT} heroes • {SLOTS_PER_HERO} slots per hero • values {MIN_VAL}..{MAX_VAL}.",  # Formats the text text with the current values.
            style="Sub.TLabel",  # Computes style from the current input.
        ).pack(anchor="w", pady=(4, 0))  # Continues the surrounding operation.

        body = ttk.Frame(outer, style="TFrame")  # Creates a Frame object for body.
        body.pack(fill="both", expand=True, pady=(12, 0))  # Places body in the interface layout.
        body.columnconfigure(0, weight=1)  # Calls body.columnconfigure to perform this step.
        body.columnconfigure(1, weight=3)  # Calls body.columnconfigure to perform this step.
        body.columnconfigure(2, weight=3)  # Calls body.columnconfigure to perform this step.
        body.rowconfigure(0, weight=1)  # Calls body.rowconfigure to perform this step.

        # Left: hero list
        left = ttk.Frame(body, style="Panel.TFrame")  # Creates a Frame object for left.
        left.grid(row=0, column=0, sticky="nsew", padx=(0, 10))  # Places left in the interface layout.
        left.rowconfigure(3, weight=1)  # Calls left.rowconfigure to perform this step.
        left.columnconfigure(0, weight=1)  # Calls left.columnconfigure to perform this step.

        ttk.Label(left, text="Heroes", style="TLabel").grid(row=0, column=0, sticky="w", padx=10, pady=(10, 6))  # Calls ttk.Label to perform this step.

        # Difficulty selector
        diff_row = ttk.Frame(left, style="Panel.TFrame")  # Creates a Frame object for diff row.
        diff_row.grid(row=1, column=0, sticky="ew", padx=10)  # Places diff_row in the interface layout.
        diff_row.columnconfigure(1, weight=1)  # Calls diff_row.columnconfigure to perform this step.

        ttk.Label(diff_row, text="Difficulty:", style="Sub.TLabel").grid(row=0, column=0, sticky="w")  # Calls ttk.Label to perform this step.
        self.diff_var = tk.StringVar(value=DIFF_NAMES[0])  # Creates a StringVar object for diff var.
        self.diff_combo = ttk.Combobox(  # Creates a Combobox object for diff combo.
            diff_row, textvariable=self.diff_var, values=DIFF_NAMES, state="readonly"  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.
        self.diff_combo.grid(row=0, column=1, sticky="ew", padx=(8, 0))  # Places self.diff_combo in the interface layout.
        self.diff_combo.bind("<<ComboboxSelected>>", self._on_diff_change)  # Connects an event on self.diff_combo to its handler.

        self.search_var = tk.StringVar()  # Creates a StringVar object for search var.
        search = ttk.Entry(left, textvariable=self.search_var)  # Creates a Entry object for search.
        search.grid(row=2, column=0, sticky="ew", padx=10, pady=(10, 0))  # Places search in the interface layout.
        search.bind("<KeyRelease>", lambda _e: self._refresh_hero_list())  # Connects an event on search to its handler.

        self.hero_list = tk.Listbox(left, height=20, activestyle="none", exportselection=False)  # Creates a Listbox object for hero list.
        self.hero_list.grid(row=3, column=0, sticky="nsew", padx=10, pady=10)  # Places self.hero_list in the interface layout.
        self.hero_list.bind("<<ListboxSelect>>", self._on_hero_select)  # Connects an event on self.hero_list to its handler.

        self._refresh_hero_list(select_index=0)  # Calls self._refresh_hero_list to perform this step.

        # Middle: slots editor
        mid = ttk.Frame(body, style="Panel.TFrame")  # Creates a Frame object for mid.
        mid.grid(row=0, column=1, sticky="nsew", padx=(0, 10))  # Places mid in the interface layout.
        mid.columnconfigure(0, weight=1)  # Calls mid.columnconfigure to perform this step.

        top_mid = ttk.Frame(mid, style="Panel.TFrame")  # Creates a Frame object for top mid.
        top_mid.grid(row=0, column=0, sticky="ew", padx=10, pady=(10, 0))  # Places top_mid in the interface layout.
        top_mid.columnconfigure(1, weight=1)  # Calls top_mid.columnconfigure to perform this step.

        ttk.Label(top_mid, text="Selected Hero:", style="TLabel").grid(row=0, column=0, sticky="w")  # Calls ttk.Label to perform this step.
        self.hero_name_lbl = ttk.Label(top_mid, text="", style="TLabel")  # Creates a Label object for hero name lbl.
        self.hero_name_lbl.grid(row=0, column=1, sticky="w", padx=(8, 0))  # Places self.hero_name_lbl in the interface layout.

        self.diff_lbl = ttk.Label(top_mid, text="", style="Sub.TLabel")  # Creates a Label object for diff lbl.
        self.diff_lbl.grid(row=1, column=0, columnspan=2, sticky="w", pady=(6, 0))  # Places self.diff_lbl in the interface layout.

        slots_frame = ttk.Frame(mid, style="Panel2.TFrame")  # Creates a Frame object for slots frame.
        slots_frame.grid(row=1, column=0, sticky="nsew", padx=10, pady=10)  # Places slots_frame in the interface layout.
        for c in range(5):  # Processes each c from range(5).
            slots_frame.columnconfigure(c, weight=1)  # Calls slots_frame.columnconfigure to perform this step.

        self.slot_vars = []  # Initializes slot vars as an empty list for accumulating results.
        self.slot_boxes: list[tk.Spinbox] = []  # Provides this value as an entry in the enclosing data structure.

        for i in range(SLOTS_PER_HERO):  # Processes each i from range(SLOTS_PER_HERO).
            var = tk.IntVar(value=0)  # Creates a IntVar object for var.
            self.slot_vars.append(var)  # Adds the supplied value to self.slot_vars.

            r = i // 5  # Sets r from the configured value or expression.
            c = i % 5  # Sets c from the configured value or expression.

            cell = ttk.Frame(slots_frame, style="Panel2.TFrame")  # Creates a Frame object for cell.
            cell.grid(row=r * 2, column=c, sticky="ew", padx=6, pady=(8, 0))  # Places cell in the interface layout.

            ttk.Label(cell, text=f"{i:02d}", style="Sub.TLabel").pack(side="left", padx=(0, 6))  # Calls ttk.Label to perform this step.

            sb = tk.Spinbox(  # Creates a Spinbox object for sb.
                cell,  # Provides this value as an entry in the enclosing data structure.
                from_=MIN_VAL,  # Sets from  from the configured value or expression.
                to=MAX_VAL,  # Sets to from the configured value or expression.
                width=4,  # Sets width from the configured value or expression.
                textvariable=var,  # Sets textvariable from the configured value or expression.
                justify="center",  # Computes justify from the current input.
                command=self._on_slot_change,  # Sets command from the configured value or expression.
                relief="flat",  # Computes relief from the current input.
                highlightthickness=1,  # Sets highlightthickness from the configured value or expression.
            )  # Closes the continued call or expression.
            sb.pack(side="left")  # Places sb in the interface layout.
            sb.bind("<KeyRelease>", lambda _e: self._on_slot_change())  # Connects an event on sb to its handler.
            sb.bind("<FocusOut>", lambda _e: self._on_slot_change())  # Connects an event on sb to its handler.
            self.slot_boxes.append(sb)  # Adds the supplied value to self.slot_boxes.

        btns = ttk.Frame(mid, style="Panel.TFrame")  # Creates a Frame object for btns.
        btns.grid(row=2, column=0, sticky="ew", padx=10, pady=(0, 10))  # Places btns in the interface layout.
        btns.columnconfigure(0, weight=1)  # Calls btns.columnconfigure to perform this step.
        btns.columnconfigure(1, weight=1)  # Calls btns.columnconfigure to perform this step.
        btns.columnconfigure(2, weight=1)  # Calls btns.columnconfigure to perform this step.
        btns.columnconfigure(3, weight=1)  # Calls btns.columnconfigure to perform this step.

        ttk.Button(btns, text="Fill Slots = 0", command=lambda: self._fill_current(0)).grid(  # Calls ttk.Button to perform this step.
            row=0, column=0, sticky="ew", padx=(0, 8)  # Computes row from the current input.
        )  # Closes the continued call or expression.
        ttk.Button(btns, text="Fill Slots = 1", command=lambda: self._fill_current(1)).grid(  # Calls ttk.Button to perform this step.
            row=0, column=1, sticky="ew", padx=8  # Computes row from the current input.
        )  # Closes the continued call or expression.
        ttk.Button(btns, text="Fill Slots = 2", command=lambda: self._fill_current(2)).grid(  # Calls ttk.Button to perform this step.
            row=0, column=2, sticky="ew", padx=8  # Computes row from the current input.
        )  # Closes the continued call or expression.
        ttk.Button(btns, text="Copy current hero+diff row (20)", command=self.copy_current_row).grid(  # Calls ttk.Button to perform this step.
            row=0, column=3, sticky="ew", padx=(8, 0)  # Computes row from the current input.
        )  # Closes the continued call or expression.

        # Right: output + actions
        right = ttk.Frame(body, style="Panel.TFrame")  # Creates a Frame object for right.
        right.grid(row=0, column=2, sticky="nsew")  # Places right in the interface layout.
        right.rowconfigure(2, weight=1)  # Calls right.rowconfigure to perform this step.
        right.columnconfigure(0, weight=1)  # Calls right.columnconfigure to perform this step.

        ttk.Label(right, text="Output", style="TLabel").grid(row=0, column=0, sticky="w", padx=10, pady=(10, 6))  # Calls ttk.Label to perform this step.

        actions = ttk.Frame(right, style="Panel.TFrame")  # Creates a Frame object for actions.
        actions.grid(row=1, column=0, sticky="ew", padx=10)  # Places actions in the interface layout.
        actions.columnconfigure(0, weight=1)  # Calls actions.columnconfigure to perform this step.
        actions.columnconfigure(1, weight=1)  # Calls actions.columnconfigure to perform this step.
        actions.columnconfigure(2, weight=1)  # Calls actions.columnconfigure to perform this step.

        ttk.Button(actions, text="Compile", command=self.compile).grid(row=0, column=0, sticky="ew", padx=(0, 8))  # Calls ttk.Button to perform this step.
        ttk.Button(actions, text="Copy Output", command=self.copy_output).grid(row=0, column=1, sticky="ew", padx=8)  # Calls ttk.Button to perform this step.
        ttk.Button(actions, text="Save / Load", command=self.save_load_menu).grid(row=0, column=2, sticky="ew", padx=(8, 0))  # Calls ttk.Button to perform this step.

        out_wrap = ttk.Frame(right, style="Panel2.TFrame")  # Creates a Frame object for out wrap.
        out_wrap.grid(row=2, column=0, sticky="nsew", padx=10, pady=10)  # Places out_wrap in the interface layout.
        out_wrap.rowconfigure(0, weight=1)  # Calls out_wrap.rowconfigure to perform this step.
        out_wrap.columnconfigure(0, weight=1)  # Calls out_wrap.columnconfigure to perform this step.

        self.output = tk.Text(out_wrap, wrap="none", height=10, relief="flat", highlightthickness=1)  # Creates a Text object for output.
        self.output.configure(  # Configures self.output for the desired interface behavior or appearance.
            background=DarkStyle.ENTRY_BG,  # Sets background from the configured value or expression.
            foreground=DarkStyle.FG,  # Sets foreground from the configured value or expression.
            insertbackground=DarkStyle.FG,  # Sets insertbackground from the configured value or expression.
            selectbackground=DarkStyle.SELECT_BG,  # Sets selectbackground from the configured value or expression.
            highlightbackground=DarkStyle.BORDER,  # Sets highlightbackground from the configured value or expression.
            highlightcolor=DarkStyle.BORDER,  # Sets highlightcolor from the configured value or expression.
            font=("Consolas", 10),  # Computes font from the current input.
        )  # Closes the continued call or expression.
        self.output.grid(row=0, column=0, sticky="nsew")  # Places self.output in the interface layout.

        yscroll = ttk.Scrollbar(out_wrap, orient="vertical", command=self.output.yview)  # Creates a Scrollbar object for yscroll.
        xscroll = ttk.Scrollbar(out_wrap, orient="horizontal", command=self.output.xview)  # Creates a Scrollbar object for xscroll.
        self.output.configure(yscrollcommand=yscroll.set, xscrollcommand=xscroll.set)  # Configures self.output for the desired interface behavior or appearance.
        yscroll.grid(row=0, column=1, sticky="ns")  # Places yscroll in the interface layout.
        xscroll.grid(row=1, column=0, sticky="ew")  # Places xscroll in the interface layout.

        self.status = ttk.Label(outer, text="", style="Sub.TLabel")  # Creates a Label object for status.
        self.status.pack(anchor="w")  # Places self.status in the interface layout.

        self.root.bind("<Control-s>", lambda _e: self._save())  # Connects an event on self.root to its handler.
        self.root.bind("<Control-o>", lambda _e: self._load())  # Connects an event on self.root to its handler.
        self.root.bind("<Control-b>", lambda _e: self.compile())  # Connects an event on self.root to its handler.

        self._update_diff_label()  # Calls self._update_diff_label to perform this step.

    # ---------- Selection / navigation ----------

    def _refresh_hero_list(self, select_index: int | None = None):  # Defines the  refresh hero list function.
        query = self.search_var.get().strip().lower()  # Retrieves the current value and stores it as query.
        self.hero_list.delete(0, tk.END)  # Removes or clears the selected data from self.hero_list.

        self.filtered_indices = []  # Initializes filtered indices as an empty list for accumulating results.
        for i, name in enumerate(HEROES):  # Processes each i, name from enumerate(HEROES).
            if not query or query in name.lower():  # Checks whether not query or query in name.lower() before entering this branch.
                self.filtered_indices.append(i)  # Adds the supplied value to self.filtered_indices.
                self.hero_list.insert(tk.END, name)  # Adds the supplied value to self.hero_list.

        if not self.filtered_indices:  # Checks whether not self.filtered_indices before entering this branch.
            return  # Exits this function without returning a value.

        if select_index is None:  # Checks whether select_index is None before entering this branch.
            if self.current_hero in self.filtered_indices:  # Checks whether self.current_hero in self.filtered_indices before entering this branch.
                idx = self.filtered_indices.index(self.current_hero)  # Sets idx from the configured value or expression.
                self.hero_list.selection_set(idx)  # Calls self.hero_list.selection_set to perform this step.
                self.hero_list.see(idx)  # Calls self.hero_list.see to perform this step.
            else:  # Handles the remaining case when prior conditions did not match.
                self.hero_list.selection_set(0)  # Calls self.hero_list.selection_set to perform this step.
                self.hero_list.see(0)  # Calls self.hero_list.see to perform this step.
        else:  # Handles the remaining case when prior conditions did not match.
            select_index = max(0, min(select_index, len(self.filtered_indices) - 1))  # Counts the relevant entries and stores the total as select index.
            self.hero_list.selection_set(select_index)  # Calls self.hero_list.selection_set to perform this step.
            self.hero_list.see(select_index)  # Calls self.hero_list.see to perform this step.

    def _on_hero_select(self, _event=None):  # Defines the  on hero select function.
        sel = self.hero_list.curselection()  # Sets sel from the configured value or expression.
        if not sel:  # Checks whether not sel before entering this branch.
            return  # Exits this function without returning a value.
        vis_index = int(sel[0])  # Sets vis index from the configured value or expression.
        hero_index = self.filtered_indices[vis_index]  # Sets hero index from the configured value or expression.
        self._save_current()  # Calls self._save_current to perform this step.
        self._load_hero(hero_index)  # Calls self._load_hero to perform this step.

    def _on_diff_change(self, _event=None):  # Defines the  on diff change function.
        name = self.diff_var.get()  # Retrieves the current value and stores it as name.
        if name not in DIFF_NAMES:  # Checks whether name not in DIFF_NAMES before entering this branch.
            return  # Exits this function without returning a value.
        new_diff = DIFF_NAMES.index(name)  # Sets new diff from the configured value or expression.
        if new_diff == self.current_diff:  # Checks whether new_diff == self.current_diff before entering this branch.
            return  # Exits this function without returning a value.
        self._save_current()  # Calls self._save_current to perform this step.
        self.current_diff = new_diff  # Sets current diff from the configured value or expression.
        self._load_hero(self.current_hero)  # reload same hero in new diff

    # ---------- Data IO between UI and model ----------

    def _save_current(self):  # Defines the  save current function.
        row = []  # Initializes row as an empty list for accumulating results.
        for v in self.slot_vars:  # Processes each v from self.slot_vars.
            try:  # Starts a guarded operation whose failures are handled below.
                n = int(v.get())  # Retrieves the current value and stores it as n.
            except Exception:  # Handles Exception raised by the guarded operation.
                n = 0  # Sets n from the configured value or expression.
            n = max(MIN_VAL, min(MAX_VAL, n))  # Sets n from the configured value or expression.
            row.append(n)  # Adds the supplied value to row.
        self.data[self.current_diff][self.current_hero] = row  # Provides this value as an entry in the enclosing data structure.

    def _load_hero(self, hero_index: int):  # Defines the  load hero function.
        self.current_hero = hero_index  # Sets current hero from the configured value or expression.
        self.hero_name_lbl.configure(text=f"{HEROES[hero_index]}  (index {hero_index})")  # Configures self.hero_name_lbl for the desired interface behavior or appearance.
        self._update_diff_label()  # Calls self._update_diff_label to perform this step.

        row = self.data[self.current_diff][hero_index]  # Sets row from the configured value or expression.
        for i, n in enumerate(row):  # Processes each i, n from enumerate(row).
            self.slot_vars[i].set(int(n))  # Provides this value as an entry in the enclosing data structure.

        self._update_status()  # Calls self._update_status to perform this step.

    def _update_diff_label(self):  # Defines the  update diff label function.
        self.diff_lbl.configure(  # Configures self.diff_lbl for the desired interface behavior or appearance.
            text=f"Editing difficulty: {DIFF_NAMES[self.current_diff]} (index {self.current_diff}) • Slots represent 0..19"  # Formats the text text with the current values.
        )  # Closes the continued call or expression.

    def _on_slot_change(self):  # Defines the  on slot change function.
        for v in self.slot_vars:  # Processes each v from self.slot_vars.
            try:  # Starts a guarded operation whose failures are handled below.
                n = int(v.get())  # Retrieves the current value and stores it as n.
            except Exception:  # Handles Exception raised by the guarded operation.
                n = 0  # Sets n from the configured value or expression.
            if n < MIN_VAL:  # Checks whether n < MIN_VAL before entering this branch.
                v.set(MIN_VAL)  # Calls v.set to perform this step.
            elif n > MAX_VAL:  # Checks the alternate condition n > MAX_VAL.
                v.set(MAX_VAL)  # Calls v.set to perform this step.
        self._save_current()  # Calls self._save_current to perform this step.
        self._update_status()  # Calls self._update_status to perform this step.

    def _fill_current(self, value: int):  # Defines the  fill current function.
        value = max(MIN_VAL, min(MAX_VAL, int(value)))  # Sets value from the configured value or expression.
        for v in self.slot_vars:  # Processes each v from self.slot_vars.
            v.set(value)  # Calls v.set to perform this step.
        self._save_current()  # Calls self._save_current to perform this step.
        self._update_status()  # Calls self._update_status to perform this step.

    def _update_status(self):  # Defines the  update status function.
        flat_len = DIFF_COUNT * HERO_COUNT * SLOTS_PER_HERO  # Sets flat len from the configured value or expression.
        self.status.configure(  # Configures self.status for the desired interface behavior or appearance.
            text=f"Difficulties: {DIFF_COUNT} | Heroes: {HERO_COUNT} | Slots/hero: {SLOTS_PER_HERO} | Compiled length: {flat_len} "  # Formats the text text with the current values.
                 f"(order: diff → hero → slot)"  # Completes the formatted string value.
        )  # Closes the continued call or expression.

    # ---------- Compile / output ----------

    def compile(self):  # Defines the Compile function.
        self._save_current()  # Calls self._save_current to perform this step.

        flat = []  # Initializes flat as an empty list for accumulating results.
        for d in range(DIFF_COUNT):  # Processes each d from range(DIFF_COUNT).
            for h in range(HERO_COUNT):  # Processes each h from range(HERO_COUNT).
                row = self.data[d][h]  # Sets row from the configured value or expression.
                if len(row) != SLOTS_PER_HERO:  # Checks whether len(row) != SLOTS_PER_HERO before entering this branch.
                    row = (row + [0] * SLOTS_PER_HERO)[:SLOTS_PER_HERO]  # Computes row from the current input.
                    self.data[d][h] = row  # Provides this value as an entry in the enclosing data structure.
                flat.extend(row)  # Adds the supplied value to flat.

        out = self._format_array(flat, wrap=140)  # Computes out from the current input.

        self.output.delete("1.0", tk.END)  # Removes or clears the selected data from self.output.
        self.output.insert(tk.END, out)  # Adds the supplied value to self.output.

    def _format_array(self, arr: list[int], wrap: int = 140) -> str:  # Defines the  format array function.
        s = "["  # Computes s from the current input.
        line_len = 1  # Sets line len from the configured value or expression.
        for i, n in enumerate(arr):  # Processes each i, n from enumerate(arr).
            token = f"{n}"  # Formats the token text with the current values.
            if i != 0:  # Checks whether i != 0 before entering this branch.
                token = ", " + token  # Computes token from the current input.
            if line_len + len(token) > wrap:  # Checks whether line_len + len(token) > wrap before entering this branch.
                s += "\n  "  # Updates s using the + operation.
                line_len = 2  # Sets line len from the configured value or expression.
            s += token  # Updates s using the + operation.
            line_len += len(token)  # Updates line len using the + operation.
        s += "]"  # Updates s using the + operation.
        return s  # Returns s to the caller.

    def copy_output(self):  # Defines the Copy output function.
        txt = self.output.get("1.0", "end-1c")  # Retrieves the current value and stores it as txt.
        if not txt.strip():  # Checks whether not txt.strip() before entering this branch.
            self.compile()  # Calls self.compile to perform this step.
            txt = self.output.get("1.0", "end-1c")  # Retrieves the current value and stores it as txt.

        self.root.clipboard_clear()  # Clears the clipboard.
        self.root.clipboard_append(txt)  # Copies the selected text to the clipboard.
        self.root.update()  # Calls self.root.update to perform this step.
        messagebox.showinfo("Copied", "Output copied to clipboard.")  # Calls messagebox.showinfo to perform this step.

    def copy_current_row(self):  # Defines the Copy current row function.
        self._save_current()  # Calls self._save_current to perform this step.
        row = self.data[self.current_diff][self.current_hero]  # Sets row from the configured value or expression.
        txt = self._format_array(row, wrap=140)  # Computes txt from the current input.
        self.root.clipboard_clear()  # Clears the clipboard.
        self.root.clipboard_append(txt)  # Copies the selected text to the clipboard.
        self.root.update()  # Calls self.root.update to perform this step.
        messagebox.showinfo(  # Calls messagebox.showinfo to perform this step.
            "Copied",  # Provides this value as an entry in the enclosing data structure.
            f"Copied current 20-slot row for:\n{HEROES[self.current_hero]} • {DIFF_NAMES[self.current_diff]}",  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.

    # ---------- Save / load ----------

    def save_load_menu(self):  # Defines the Save load menu function.
        win = tk.Toplevel(self.root)  # Creates a Toplevel object for win.
        win.title("Save / Load")  # Sets the window title.
        win.configure(bg=DarkStyle.BG)  # Configures win for the desired interface behavior or appearance.
        win.resizable(False, False)  # Calls win.resizable to perform this step.

        frm = ttk.Frame(win, style="Panel.TFrame")  # Creates a Frame object for frm.
        frm.pack(fill="both", expand=True, padx=14, pady=14)  # Places frm in the interface layout.

        ttk.Label(frm, text="Save or load the 4×45×20 numeric grid.", style="TLabel").pack(anchor="w", pady=(0, 10))  # Calls ttk.Label to perform this step.

        btnrow = ttk.Frame(frm, style="Panel.TFrame")  # Creates a Frame object for btnrow.
        btnrow.pack(fill="x")  # Places btnrow in the interface layout.
        ttk.Button(btnrow, text="Save JSON", command=lambda: (win.destroy(), self._save())).pack(side="left", padx=(0, 8))  # Calls ttk.Button to perform this step.
        ttk.Button(btnrow, text="Load JSON", command=lambda: (win.destroy(), self._load())).pack(side="left", padx=8)  # Calls ttk.Button to perform this step.
        ttk.Button(btnrow, text="Cancel", command=win.destroy).pack(side="left", padx=8)  # Calls ttk.Button to perform this step.

        win.transient(self.root)  # Calls win.transient to perform this step.
        win.grab_set()  # Calls win.grab_set to perform this step.
        win.focus_set()  # Calls win.focus_set to perform this step.

    def _save(self):  # Defines the  save function.
        self._save_current()  # Calls self._save_current to perform this step.
        path = filedialog.asksaveasfilename(  # Sets path from the configured value or expression.
            title="Save ability use data",  # Computes title from the current input.
            defaultextension=".json",  # Computes defaultextension from the current input.
            filetypes=[("JSON", "*.json"), ("All Files", "*.*")],  # Computes filetypes from the current input.
        )  # Closes the continued call or expression.
        if not path:  # Checks whether not path before entering this branch.
            return  # Exits this function without returning a value.

        payload = {  # Sets payload from the configured value or expression.
            "format": "zomnic_ability_use_v2",  # Sets the 'format' value in this configuration or lookup table.
            "heroes": HEROES,  # Sets the 'heroes' value in this configuration or lookup table.
            "difficulties": DIFF_NAMES,  # Sets the 'difficulties' value in this configuration or lookup table.
            "slots_per_hero": SLOTS_PER_HERO,  # Sets the 'slots_per_hero' value in this configuration or lookup table.
            "min_val": MIN_VAL,  # Sets the 'min_val' value in this configuration or lookup table.
            "max_val": MAX_VAL,  # Sets the 'max_val' value in this configuration or lookup table.
            "data": self.data,  # [diff][hero][slot]
            "flatten_order": "diff_hero_slot",  # Sets the 'flatten_order' value in this configuration or lookup table.
        }  # Closes the current mapping or grouped expression.
        try:  # Starts a guarded operation whose failures are handled below.
            with open(path, "w", encoding="utf-8") as f:  # Opens the listed resource context for this block.
                json.dump(payload, f, indent=2)  # Calls json.dump to perform this step.
        except Exception as e:  # Handles Exception as e raised by the guarded operation.
            messagebox.showerror("Save failed", str(e))  # Calls messagebox.showerror to perform this step.
            return  # Exits this function without returning a value.

        messagebox.showinfo("Saved", f"Saved to:\n{path}")  # Calls messagebox.showinfo to perform this step.

    def _load(self):  # Defines the  load function.
        path = filedialog.askopenfilename(  # Sets path from the configured value or expression.
            title="Load ability use data",  # Computes title from the current input.
            filetypes=[("JSON", "*.json"), ("All Files", "*.*")],  # Computes filetypes from the current input.
        )  # Closes the continued call or expression.
        if not path:  # Checks whether not path before entering this branch.
            return  # Exits this function without returning a value.

        try:  # Starts a guarded operation whose failures are handled below.
            with open(path, "r", encoding="utf-8") as f:  # Opens the listed resource context for this block.
                payload = json.load(f)  # Sets payload from the configured value or expression.
        except Exception as e:  # Handles Exception as e raised by the guarded operation.
            messagebox.showerror("Load failed", str(e))  # Calls messagebox.showerror to perform this step.
            return  # Exits this function without returning a value.

        try:  # Starts a guarded operation whose failures are handled below.
            data = payload.get("data", None)  # Retrieves the current value and stores it as data.
            diffs = payload.get("difficulties", None)  # Retrieves the current value and stores it as diffs.
            slots = int(payload.get("slots_per_hero", SLOTS_PER_HERO))  # Retrieves the current value and stores it as slots.

            if slots != SLOTS_PER_HERO:  # Checks whether slots != SLOTS_PER_HERO before entering this branch.
                raise ValueError(f"slots_per_hero is {slots}, expected {SLOTS_PER_HERO}")  # Raises ValueError(f"slots_per_hero is {slots}, expected {SLOTS_PER_HERO}") to report this failure.

            if diffs is None or len(diffs) != DIFF_COUNT:  # Checks whether diffs is None or len(diffs) != DIFF_COUNT before entering this branch.
                raise ValueError(f"difficulties must have length {DIFF_COUNT}")  # Raises ValueError(f"difficulties must have length {DIFF_COUNT}") to report this failure.

            if not isinstance(data, list) or len(data) != DIFF_COUNT:  # Checks whether not isinstance(data, list) or len(data) != DIFF_COUNT before entering this branch.
                raise ValueError(f"data must be a list of length {DIFF_COUNT} (diff dimension)")  # Raises ValueError(f"data must be a list of length {DIFF_COUNT} (diff dimension)") to report this failure.

            fixed_all = []  # Initializes fixed all as an empty list for accumulating results.
            for d in range(DIFF_COUNT):  # Processes each d from range(DIFF_COUNT).
                block = data[d]  # Sets block from the configured value or expression.
                if not isinstance(block, list) or len(block) != HERO_COUNT:  # Checks whether not isinstance(block, list) or len(block) != HERO_COUNT before entering this branch.
                    raise ValueError(f"data[{d}] must be a list of length {HERO_COUNT} (hero dimension)")  # Raises ValueError(f"data[{d}] must be a list of length {HERO_COUNT} (hero dimension)") to report this failure.
                fixed_block = []  # Initializes fixed block as an empty list for accumulating results.
                for row in block:  # Processes each row from block.
                    if not isinstance(row, list):  # Checks whether not isinstance(row, list) before entering this branch.
                        row = [0] * SLOTS_PER_HERO  # Sets row from the configured value or expression.
                    clean = []  # Initializes clean as an empty list for accumulating results.
                    for x in row[:SLOTS_PER_HERO]:  # Processes each x from row[:SLOTS_PER_HERO].
                        try:  # Starts a guarded operation whose failures are handled below.
                            v = int(x)  # Sets v from the configured value or expression.
                        except Exception:  # Handles Exception raised by the guarded operation.
                            v = 0  # Sets v from the configured value or expression.
                        v = max(MIN_VAL, min(MAX_VAL, v))  # Sets v from the configured value or expression.
                        clean.append(v)  # Adds the supplied value to clean.
                    clean = (clean + [0] * SLOTS_PER_HERO)[:SLOTS_PER_HERO]  # Computes clean from the current input.
                    fixed_block.append(clean)  # Adds the supplied value to fixed_block.
                fixed_all.append(fixed_block)  # Adds the supplied value to fixed_all.

            self.data = fixed_all  # Sets data from the configured value or expression.

        except Exception as e:  # Handles Exception as e raised by the guarded operation.
            messagebox.showerror("Invalid file", str(e))  # Calls messagebox.showerror to perform this step.
            return  # Exits this function without returning a value.

        self._load_hero(self.current_hero)  # Calls self._load_hero to perform this step.
        messagebox.showinfo("Loaded", f"Loaded:\n{path}")  # Calls messagebox.showinfo to perform this step.


def main():  # Defines the Main function.
    root = tk.Tk()  # Creates a Tk object for root.
    app = AbilityUseApp(root)  # Sets app from the configured value or expression.
    root.mainloop()  # Starts the GUI event loop.


if __name__ == "__main__":  # Checks whether __name__ == "__main__" before entering this branch.
    main()  # Calls main to perform this step.
