"""
OW Hero-vs-Hero Modifier Switchboard (0/1)

What it does
- Pick an "player" hero on the left
- For that player, set each "follower" hero to 1, 2, or 3
- Click Compile to export:
  1) A flattened table (player-major order): idx = playerIndex * N + followerIndex
  2) A per-player matrix (dict of dict)
- Save/Load to JSON
- Optional: Edit hero list in-app (or load from a text file)

Notes
- This tool stores only 0/1 as requested.
- You can later decode 0/1 -> {1.00, 1.50}

Run
- Python 3.10+ recommended
- No external dependencies (Tkinter is included with most Python installs)

If Tkinter is missing on Linux:
- Debian/Ubuntu: sudo apt install python3-tk
"""

import json  # Imports json for use in this script.
import os  # Imports os for use in this script.
import tkinter as tk  # Imports tkinter as tk for use in this script.
from tkinter import ttk, filedialog, messagebox  # Imports ttk, filedialog, messagebox from tkinter for use in this script.


DEFAULT_HEROES = [  # Defines the default hero roster used by the editor.
    # Edit this list to match your roster.
    # Kept generic because hero rosters change over time.
    "Ana", "Ashe", "Baptiste", "Bastion", "Brigitte", "Cassidy",  # Lists the selectable hero names used to build the switchboard.
    "D.Va", "Doomfist", "Echo", "Freja", "Genji", "Hanzo", "Hazard", "Illari",  # Lists the selectable hero names used to build the switchboard.
    "Junker Queen", "Junkrat", "Juno", "Kiriko", "Lifeweaver", "Lúcio",  # Lists the selectable hero names used to build the switchboard.
    "Mauga", "Mei", "Mercy", "Moira", "Orisa", "Pharah", "Ramattra",  # Lists the selectable hero names used to build the switchboard.
    "Reaper", "Reinhardt", "Roadhog", "Sigma", "Sojourn", "Soldier: 76",  # Lists the selectable hero names used to build the switchboard.
    "Sombra", "Symmetra", "Torbjörn", "Tracer", "Vendetta", "Venture", "Widowmaker",  # Lists the selectable hero names used to build the switchboard.
    "Winston", "Wrecking Ball", "Wuyang", "Zarya", "Zenyatta"  # Lists the selectable hero names used to build the switchboard.
]  # Closes the current list or indexed expression.

HERO_ROLES = {  # Maps each supported hero to its gameplay role.
    # TANKS
    "D.Va": "tank",  # Sets the 'D.Va' value in this configuration or lookup table.
    "Doomfist": "tank",  # Sets the 'Doomfist' value in this configuration or lookup table.
    "Hazard": "tank",  # Sets the 'Hazard' value in this configuration or lookup table.
    "Junker Queen": "tank",  # Sets the 'Junker Queen' value in this configuration or lookup table.
    "Mauga": "tank",  # Sets the 'Mauga' value in this configuration or lookup table.
    "Orisa": "tank",  # Sets the 'Orisa' value in this configuration or lookup table.
    "Ramattra": "tank",  # Sets the 'Ramattra' value in this configuration or lookup table.
    "Reinhardt": "tank",  # Sets the 'Reinhardt' value in this configuration or lookup table.
    "Roadhog": "tank",  # Sets the 'Roadhog' value in this configuration or lookup table.
    "Sigma": "tank",  # Sets the 'Sigma' value in this configuration or lookup table.
    "Winston": "tank",  # Sets the 'Winston' value in this configuration or lookup table.
    "Wrecking Ball": "tank",  # Sets the 'Wrecking Ball' value in this configuration or lookup table.
    "Zarya": "tank",  # Sets the 'Zarya' value in this configuration or lookup table.

    # SUPPORTS
    "Ana": "support",  # Sets the 'Ana' value in this configuration or lookup table.
    "Baptiste": "support",  # Sets the 'Baptiste' value in this configuration or lookup table.
    "Brigitte": "support",  # Sets the 'Brigitte' value in this configuration or lookup table.
    "Illari": "support",  # Sets the 'Illari' value in this configuration or lookup table.
    "Juno": "support",  # Sets the 'Juno' value in this configuration or lookup table.
    "Kiriko": "support",  # Sets the 'Kiriko' value in this configuration or lookup table.
    "Lifeweaver": "support",  # Sets the 'Lifeweaver' value in this configuration or lookup table.
    "Lúcio": "support",  # Sets the 'Lúcio' value in this configuration or lookup table.
    "Mercy": "support",  # Sets the 'Mercy' value in this configuration or lookup table.
    "Moira": "support",  # Sets the 'Moira' value in this configuration or lookup table.
    "Wuyang": "support",  # Sets the 'Wuyang' value in this configuration or lookup table.
    "Zenyatta": "support",  # Sets the 'Zenyatta' value in this configuration or lookup table.

    # EVERYTHING ELSE = DPS
}  # Closes the current mapping or grouped expression.


class ScrollableFrame(ttk.Frame):  # Defines the ScrollableFrame class.
    def __init__(self, parent):  # Defines the   init   function.
        super().__init__(parent)  # Calls super to perform this step.

        self.canvas = tk.Canvas(self, highlightthickness=0, background="#1e1e1e")  # Creates a Canvas object for canvas.
        self.v_scroll = ttk.Scrollbar(self, orient="vertical", command=self.canvas.yview)  # Creates a Scrollbar object for v scroll.
        self.canvas.configure(yscrollcommand=self.v_scroll.set)  # Configures self.canvas for the desired interface behavior or appearance.

        self.inner = ttk.Frame(self.canvas)  # Creates a Frame object for inner.
        self.inner.configure(style="TFrame")  # ensures ttk background applies
        self.inner_id = self.canvas.create_window((0, 0), window=self.inner, anchor="nw")  # Computes inner id from the current input.

        self.canvas.grid(row=0, column=0, sticky="nsew")  # Places self.canvas in the interface layout.
        self.v_scroll.grid(row=0, column=1, sticky="ns")  # Places self.v_scroll in the interface layout.

        self.grid_rowconfigure(0, weight=1)  # Calls self.grid_rowconfigure to perform this step.
        self.grid_columnconfigure(0, weight=1)  # Calls self.grid_columnconfigure to perform this step.

        self.inner.bind("<Configure>", self._on_inner_configure)  # Connects an event on self.inner to its handler.
        self.canvas.bind("<Configure>", self._on_canvas_configure)  # Connects an event on self.canvas to its handler.

        # mousewheel support
        self.canvas.bind_all("<MouseWheel>", self._on_mousewheel)       # Windows/macOS
        self.canvas.bind_all("<Button-4>", self._on_mousewheel_linux)   # Linux up
        self.canvas.bind_all("<Button-5>", self._on_mousewheel_linux)   # Linux down

    def _on_inner_configure(self, _event=None):  # Defines the  on inner configure function.
        self.canvas.configure(scrollregion=self.canvas.bbox("all"))  # Configures self.canvas for the desired interface behavior or appearance.

    def _on_canvas_configure(self, event):  # Defines the  on canvas configure function.
        # Make the inner frame match the canvas width
        self.canvas.itemconfigure(self.inner_id, width=event.width)  # Calls self.canvas.itemconfigure to perform this step.

    def _on_mousewheel(self, event):  # Defines the  on mousewheel function.
        # Windows: event.delta is multiples of 120
        self.canvas.yview_scroll(int(-1 * (event.delta / 120)), "units")  # Calls self.canvas.yview_scroll to perform this step.

    def _on_mousewheel_linux(self, event):  # Defines the  on mousewheel linux function.
        if event.num == 4:  # Checks whether event.num == 4 before entering this branch.
            self.canvas.yview_scroll(-3, "units")  # Calls self.canvas.yview_scroll to perform this step.
        elif event.num == 5:  # Checks the alternate condition event.num == 5.
            self.canvas.yview_scroll(3, "units")  # Calls self.canvas.yview_scroll to perform this step.


class SwitchboardApp(ttk.Frame):  # Defines the SwitchboardApp class.
    def __init__(self, root):  # Defines the   init   function.
        super().__init__(root)  # Calls super to perform this step.
        self.root = root  # Keeps the application?s root window available to its methods.

        self.heroes = list(DEFAULT_HEROES)  # Sets heroes from the configured value or expression.
        self.N = len(self.heroes)  # Counts the relevant entries and stores the total as n.

        # Data: table[player_index][follower_index] = 0/1
        # Default everything to 2
        self.table = [[0 for _ in range(self.N)] for __ in range(self.N)]  # Builds table by transforming the selected input entries.


        self.selected_player = 0  # Sets selected player from the configured value or expression.

        self._build_style()  # Calls self._build_style to perform this step.
        self._build_layout()  # Calls self._build_layout to perform this step.
        self._render_follower_rows()  # Calls self._render_follower_rows to perform this step.

        self._select_player(0)  # Calls self._select_player to perform this step.

    def _build_style(self):  # Defines the  build style function.
        style = ttk.Style()  # Creates a Style object for style.

        try:  # Starts a guarded operation whose failures are handled below.
            style.theme_use("clam")  # clam is the best base for dark themes
        except tk.TclError:  # Handles tk.TclError raised by the guarded operation.
            pass  # Intentionally leaves this branch empty.

        # --- GLOBAL COMBOBOX DROPDOWN COLORS (IMPORTANT) ---
        self.root.option_add("*TCombobox*Listbox.background", "#1e1e1e")  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*TCombobox*Listbox.foreground", "#d4d4d4")  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*TCombobox*Listbox.selectBackground", "#444444")  # Configures self.root for the desired interface behavior or appearance.
        self.root.option_add("*TCombobox*Listbox.selectForeground", "#ffffff")  # Configures self.root for the desired interface behavior or appearance.

        # ---- COLORS ----
        BG = "#1e1e1e"      # main background
        FG = "#d4d4d4"      # main text
        ACCENT = "#3a3a3a"  # buttons / frames
        HOVER = "#505050"  # Computes hover from the current input.
        ENTRY_BG = "#2a2a2a"  # Computes entry bg from the current input.

        # ---- COMBOBOX (field colors + readonly override) ----
        style.configure(  # Configures style for the desired interface behavior or appearance.
            "TCombobox",  # Provides this value as an entry in the enclosing data structure.
            fieldbackground=ENTRY_BG,  # Sets fieldbackground from the configured value or expression.
            background=ENTRY_BG,  # Sets background from the configured value or expression.
            foreground=FG  # Sets foreground from the configured value or expression.
        )  # Closes the continued call or expression.

        # This is the important part on Linux: readonly state overrides
        style.map(  # Configures style for the desired interface behavior or appearance.
            "TCombobox",  # Provides this value as an entry in the enclosing data structure.
            fieldbackground=[("readonly", ENTRY_BG), ("!disabled", ENTRY_BG)],  # Computes fieldbackground from the current input.
            foreground=[("readonly", FG), ("!disabled", FG)],  # Computes foreground from the current input.
            selectbackground=[("readonly", "#444444")],  # Computes selectbackground from the current input.
            selectforeground=[("readonly", "#ffffff")]  # Computes selectforeground from the current input.
        )  # Closes the continued call or expression.

        # ---- ROOT WINDOW ----
        self.root.configure(background=BG)  # Configures self.root for the desired interface behavior or appearance.

        # ---- BASE STYLES ----
        style.configure(  # Configures style for the desired interface behavior or appearance.
            ".",  # Provides this value as an entry in the enclosing data structure.
            background=BG,  # Sets background from the configured value or expression.
            foreground=FG,  # Sets foreground from the configured value or expression.
            fieldbackground=ENTRY_BG,  # Sets fieldbackground from the configured value or expression.
            bordercolor=ACCENT  # Sets bordercolor from the configured value or expression.
        )  # Closes the continued call or expression.

        style.configure(  # Configures style for the desired interface behavior or appearance.
            "TFrame",  # Provides this value as an entry in the enclosing data structure.
            background=BG  # Sets background from the configured value or expression.
        )  # Closes the continued call or expression.

        style.configure(  # Configures style for the desired interface behavior or appearance.
            "TLabel",  # Provides this value as an entry in the enclosing data structure.
            background=BG,  # Sets background from the configured value or expression.
            foreground=FG,  # Sets foreground from the configured value or expression.
            padding=2  # Sets padding from the configured value or expression.
        )  # Closes the continued call or expression.

        style.configure(  # Configures style for the desired interface behavior or appearance.
            "Header.TLabel",  # Provides this value as an entry in the enclosing data structure.
            background=BG,  # Sets background from the configured value or expression.
            foreground=FG,  # Sets foreground from the configured value or expression.
            font=("Segoe UI", 11, "bold")  # Computes font from the current input.
        )  # Closes the continued call or expression.

        style.configure(  # Configures style for the desired interface behavior or appearance.
            "Small.TLabel",  # Provides this value as an entry in the enclosing data structure.
            background=BG,  # Sets background from the configured value or expression.
            foreground=FG,  # Sets foreground from the configured value or expression.
            font=("Segoe UI", 9)  # Computes font from the current input.
        )  # Closes the continued call or expression.

        style.configure(  # Configures style for the desired interface behavior or appearance.
            "Mono.TLabel",  # Provides this value as an entry in the enclosing data structure.
            background=BG,  # Sets background from the configured value or expression.
            foreground=FG,  # Sets foreground from the configured value or expression.
            font=("Consolas", 9)  # Computes font from the current input.
        )  # Closes the continued call or expression.

        # ---- BUTTONS ----
        style.configure(  # Configures style for the desired interface behavior or appearance.
            "TButton",  # Provides this value as an entry in the enclosing data structure.
            background=ACCENT,  # Sets background from the configured value or expression.
            foreground=FG,  # Sets foreground from the configured value or expression.
            padding=6  # Sets padding from the configured value or expression.
        )  # Closes the continued call or expression.

        style.map(  # Configures style for the desired interface behavior or appearance.
            "TButton",  # Provides this value as an entry in the enclosing data structure.
            background=[("active", HOVER)]  # Computes background from the current input.
        )  # Closes the continued call or expression.

        # ---- COMBOBOX ----
        style.configure(  # Configures style for the desired interface behavior or appearance.
            "TCombobox",  # Provides this value as an entry in the enclosing data structure.
            fieldbackground=ENTRY_BG,  # Sets fieldbackground from the configured value or expression.
            background=ENTRY_BG,  # Sets background from the configured value or expression.
            foreground=FG,  # Sets foreground from the configured value or expression.
            arrowcolor=FG  # Sets arrowcolor from the configured value or expression.
        )  # Closes the continued call or expression.

        # ---- SCROLLBAR ----
        style.configure(  # Configures style for the desired interface behavior or appearance.
            "Vertical.TScrollbar",  # Provides this value as an entry in the enclosing data structure.
            background=ACCENT,  # Sets background from the configured value or expression.
            troughcolor=BG,  # Sets troughcolor from the configured value or expression.
            arrowcolor=FG  # Sets arrowcolor from the configured value or expression.
        )  # Closes the continued call or expression.

    def _build_layout(self):  # Defines the  build layout function.
        self.root.title("OW Hero Switchboard (0/1)")  # Sets the window title.
        self.root.geometry("1050x700")  # Sets the window size.
        self.root.minsize(900, 600)  # Calls self.root.minsize to perform this step.

        self.pack(fill="both", expand=True)  # Places self in the interface layout.
        self.grid_rowconfigure(0, weight=1)  # Calls self.grid_rowconfigure to perform this step.
        self.grid_columnconfigure(1, weight=1)  # Calls self.grid_columnconfigure to perform this step.

        # Left: player list
        left = ttk.Frame(self)  # Creates a Frame object for left.
        left.grid(row=0, column=0, sticky="nsew", padx=10, pady=10)  # Places left in the interface layout.
        left.grid_rowconfigure(2, weight=1)  # Calls left.grid_rowconfigure to perform this step.

        ttk.Label(left, text="player Hero", style="Header.TLabel").grid(row=0, column=0, sticky="w")  # Calls ttk.Label to perform this step.

        ttk.Button(left, text="Edit Hero List…", command=self._open_hero_editor).grid(row=1, column=0, sticky="we", pady=(6, 6))  # Calls ttk.Button to perform this step.

        self.player_list = tk.Listbox(left, height=22, exportselection=False)  # Creates a Listbox object for player list.
        self.player_list.configure(background="#1e1e1e",    foreground="#d4d4d4",    selectbackground="#444444",    selectforeground="#ffffff",    highlightthickness=0)  # Configures self.player_list for the desired interface behavior or appearance.
        self.player_list.grid(row=2, column=0, sticky="nsew")  # Places self.player_list in the interface layout.
        self.player_list.bind("<<ListboxSelect>>", self._on_player_select)  # Connects an event on self.player_list to its handler.

        for h in self.heroes:  # Processes each h from self.heroes.
            self.player_list.insert("end", h)  # Adds the supplied value to self.player_list.

        # Right: follower grid + controls
        right = ttk.Frame(self)  # Creates a Frame object for right.
        right.grid(row=0, column=1, sticky="nsew", padx=10, pady=10)  # Places right in the interface layout.
        right.grid_rowconfigure(2, weight=1)  # Calls right.grid_rowconfigure to perform this step.
        right.grid_columnconfigure(0, weight=1)  # Calls right.grid_columnconfigure to perform this step.

        self.player_title = ttk.Label(right, text="follower Modifiers", style="Header.TLabel")  # Creates a Label object for player title.
        self.player_title.grid(row=0, column=0, sticky="w")  # Places self.player_title in the interface layout.

        controls = ttk.Frame(right)  # Creates a Frame object for controls.
        controls.grid(row=1, column=0, sticky="we", pady=(6, 8))  # Places controls in the interface layout.
        controls.grid_columnconfigure(6, weight=1)  # Calls controls.grid_columnconfigure to perform this step.

        ttk.Label(controls, text="Quick Fill for current player:", style="Small.TLabel").grid(row=0, column=0, sticky="w")  # Calls ttk.Label to perform this step.

        ttk.Button(controls, text="Set All = 0", command=lambda: self._fill_player_row(0)).grid(row=0, column=1, padx=4)  # Calls ttk.Button to perform this step.
        ttk.Button(controls, text="Set All = 1", command=lambda: self._fill_player_row(1)).grid(row=0, column=2, padx=4)  # Calls ttk.Button to perform this step.

        ttk.Button(controls, text="Compile", command=self._compile).grid(row=0, column=7, sticky="e")  # Calls ttk.Button to perform this step.
        ttk.Button(controls, text="Save JSON…", command=self._save_json).grid(row=0, column=8, padx=6)  # Calls ttk.Button to perform this step.
        ttk.Button(controls, text="Load JSON…", command=self._load_json).grid(row=0, column=9)  # Calls ttk.Button to perform this step.

        self.follower_frame = ScrollableFrame(right)  # Sets follower frame from the configured value or expression.
        self.follower_frame.grid(row=2, column=0, sticky="nsew")  # Places self.follower_frame in the interface layout.

        # Bottom: output
        out = ttk.Frame(right)  # Creates a Frame object for out.
        out.grid(row=3, column=0, sticky="nsew", pady=(8, 0))  # Places out in the interface layout.
        out.grid_columnconfigure(0, weight=1)  # Calls out.grid_columnconfigure to perform this step.


        out_header = ttk.Frame(out)  # Creates a Frame object for out header.
        out_header.grid(row=0, column=0, sticky="we")  # Places out_header in the interface layout.
        out_header.grid_columnconfigure(0, weight=1)  # Calls out_header.grid_columnconfigure to perform this step.

        ttk.Label(out_header, text="Output (Flattened + JSON preview):", style="Small.TLabel").grid(row=0, column=0, sticky="w")  # Calls ttk.Label to perform this step.
        ttk.Button(out_header, text="Copy", command=self._copy_output).grid(row=0, column=1, sticky="e")  # Calls ttk.Button to perform this step.
        self.output = tk.Text(out, height=10, wrap="none")  # Creates a Text object for output.
        self.output.configure(  # Configures self.output for the desired interface behavior or appearance.
            background="#1e1e1e",  # Computes background from the current input.
            foreground="#d4d4d4",  # Computes foreground from the current input.
            insertbackground="#ffffff",  # Computes insertbackground from the current input.
            selectbackground="#444444",  # Computes selectbackground from the current input.
            selectforeground="#ffffff"  # Computes selectforeground from the current input.
        )  # Closes the continued call or expression.

        self.output.grid(row=1, column=0, sticky="nsew")  # Places self.output in the interface layout.
        self.output.configure(font=("Consolas", 9))  # Configures self.output for the desired interface behavior or appearance.

        # Horizontal scrollbar for output
        xscroll = ttk.Scrollbar(out, orient="horizontal", command=self.output.xview)  # Creates a Scrollbar object for xscroll.
        self.output.configure(xscrollcommand=xscroll.set)  # Configures self.output for the desired interface behavior or appearance.
        xscroll.grid(row=2, column=0, sticky="we")  # Places xscroll in the interface layout.

    def _copy_output(self):  # Defines the  copy output function.
        text = self.output.get("1.0", "end-1c")  # Retrieves the current value and stores it as text.
        self.root.clipboard_clear()  # Clears the clipboard.
        self.root.clipboard_append(text)  # Copies the selected text to the clipboard.

    def _render_follower_rows(self):  # Defines the  render follower rows function.
        # Clear existing follower rows
        for w in self.follower_frame.inner.winfo_children():  # Processes each w from self.follower_frame.inner.winfo_children().
            w.destroy()  # Calls w.destroy to perform this step.

        header = ttk.Frame(self.follower_frame.inner)  # Creates a Frame object for header.
        header.grid(row=0, column=0, sticky="we", padx=6, pady=(6, 4))  # Places header in the interface layout.
        header.grid_columnconfigure(0, weight=1)  # Calls header.grid_columnconfigure to perform this step.

        ttk.Label(header, text="follower Hero", style="Small.TLabel").grid(row=0, column=0, sticky="w")  # Calls ttk.Label to perform this step.
        ttk.Label(header, text="Value (0/1)", style="Small.TLabel").grid(row=0, column=1, sticky="e")  # Calls ttk.Label to perform this step.

        self.follower_vars = []  # Initializes follower vars as an empty list for accumulating results.
        for i, follower in enumerate(self.heroes):  # Processes each i, follower from enumerate(self.heroes).
            row = ttk.Frame(self.follower_frame.inner)  # Creates a Frame object for row.
            row.grid(row=i + 1, column=0, sticky="we", padx=6, pady=2)  # Places row in the interface layout.
            row.grid_columnconfigure(0, weight=1)  # Calls row.grid_columnconfigure to perform this step.

            ttk.Label(row, text=follower).grid(row=0, column=0, sticky="w")  # Calls ttk.Label to perform this step.

            var = tk.StringVar(value="0")  # Creates a StringVar object for var.
            self.follower_vars.append(var)  # Adds the supplied value to self.follower_vars.

            combo = ttk.Combobox(row, textvariable=var, values=("0", "1"), width=4, state="readonly")  # Creates a Combobox object for combo.
            combo.configure(background="#2a2a2a", foreground="#d4d4d4")  # Configures combo for the desired interface behavior or appearance.
            combo.grid(row=0, column=1, sticky="e")  # Places combo in the interface layout.
            combo.bind("<<ComboboxSelected>>", lambda _e, follower_index=i: self._on_follower_value_changed(follower_index))  # Connects an event on combo to its handler.

    def _on_follower_value_changed(self, follower_index: int):  # Defines the  on follower value changed function.
        try:  # Starts a guarded operation whose failures are handled below.
            v = int(self.follower_vars[follower_index].get())  # Retrieves the current value and stores it as v.
        except ValueError:  # Handles ValueError raised by the guarded operation.
            v = 0  # Sets v from the configured value or expression.
        v = 0 if v < 0 else 1 if v > 1 else v  # Computes v from the current input.

        self.table[self.selected_player][follower_index] = v  # Provides this value as an entry in the enclosing data structure.

    def _on_player_select(self, _event=None):  # Defines the  on player select function.
        sel = self.player_list.curselection()  # Sets sel from the configured value or expression.
        if not sel:  # Checks whether not sel before entering this branch.
            return  # Exits this function without returning a value.
        self._select_player(sel[0])  # Calls self._select_player to perform this step.

    def _select_player(self, player_index: int):  # Defines the  select player function.
        self.selected_player = player_index  # Sets selected player from the configured value or expression.
        player_name = self.heroes[player_index]  # Sets player name from the configured value or expression.
        self.player_title.configure(text=f'follower Modifiers (player: "{player_name}")')  # Configures self.player_title for the desired interface behavior or appearance.

        # update follower dropdowns to match this player row
        for i in range(self.N):  # Processes each i from range(self.N).
            self.follower_vars[i].set(str(self.table[player_index][i]))  # Provides this value as an entry in the enclosing data structure.

    def _fill_player_row(self, value: int):  # Defines the  fill player row function.
    # clamp to 0/1
        value = 0 if value < 0 else 1 if value > 1 else int(value)  # Computes value from the current input.

        a = self.selected_player  # Sets a from the configured value or expression.
        for i in range(self.N):  # Processes each i from range(self.N).
            self.table[a][i] = value  # Provides this value as an entry in the enclosing data structure.
            self.follower_vars[i].set(str(value))  # Provides this value as an entry in the enclosing data structure.


    def _set_diagonal_2(self):  # Defines the  set diagonal 2 function.
        for i in range(self.N):  # Processes each i from range(self.N).
            self.table[i][i] = 0  # Provides this value as an entry in the enclosing data structure.
        # Refresh current player view
        self._select_player(self.selected_player)  # Calls self._select_player to perform this step.

    def _compile(self):  # Defines the  compile function.
        # Build role index lists
        role_indices = {  # Sets role indices from the configured value or expression.
            "damage": [],  # Sets the 'damage' value in this configuration or lookup table.
            "tank": [],  # Sets the 'tank' value in this configuration or lookup table.
            "support": []  # Sets the 'support' value in this configuration or lookup table.
        }  # Closes the current mapping or grouped expression.

        for i, hero in enumerate(self.heroes):  # Processes each i, hero from enumerate(self.heroes).
            role = HERO_ROLES.get(hero, "damage")  # Retrieves the current value and stores it as role.
            role_indices[role].append(i)  # Provides this value as an entry in the enclosing data structure.

        # Build separate flattened tables
        damage_table = []  # Initializes damage table as an empty list for accumulating results.
        tank_table = []  # Initializes tank table as an empty list for accumulating results.
        support_table = []  # Initializes support table as an empty list for accumulating results.

        for a in range(self.N):  # Processes each a from range(self.N).
            player_role = HERO_ROLES.get(self.heroes[a], "damage")  # Retrieves the current value and stores it as player role.

            if player_role == "damage":  # Checks whether player_role == "damage" before entering this branch.
                target = damage_table  # Sets target from the configured value or expression.
            elif player_role == "tank":  # Checks the alternate condition player_role == "tank".
                target = tank_table  # Sets target from the configured value or expression.
            else:  # Handles the remaining case when prior conditions did not match.
                target = support_table  # Sets target from the configured value or expression.

            for v in range(self.N):  # Processes each v from range(self.N).
                target.append(self.table[a][v])  # Adds the supplied value to target.

        # Output
        self.output.delete("1.0", "end")  # Removes or clears the selected data from self.output.

        self.output.insert("end", "DAMAGE HERO ARRAY:\n")  # Adds the supplied value to self.output.
        self.output.insert("end", json.dumps(damage_table))  # Adds the supplied value to self.output.
        self.output.insert("end", "\n\nTANK HERO ARRAY:\n")  # Adds the supplied value to self.output.
        self.output.insert("end", json.dumps(tank_table))  # Adds the supplied value to self.output.
        self.output.insert("end", "\n\nSUPPORT HERO ARRAY:\n")  # Adds the supplied value to self.output.
        self.output.insert("end", json.dumps(support_table))  # Adds the supplied value to self.output.

        # Copy all three as a single object for convenience
        compiled = {  # Sets compiled from the configured value or expression.
            "damage": damage_table,  # Sets the 'damage' value in this configuration or lookup table.
            "tank": tank_table,  # Sets the 'tank' value in this configuration or lookup table.
            "support": support_table  # Sets the 'support' value in this configuration or lookup table.
        }  # Closes the current mapping or grouped expression.

        self.root.clipboard_clear()  # Clears the clipboard.
        self.root.clipboard_append(json.dumps(compiled))  # Copies the selected text to the clipboard.

        messagebox.showinfo(  # Calls messagebox.showinfo to perform this step.
            "Compiled",  # Provides this value as an entry in the enclosing data structure.
            "Compiled into 3 role-based arrays.\n\nAll arrays copied to clipboard as JSON."  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.

    def _save_json(self):  # Defines the  save json function.
        path = filedialog.asksaveasfilename(  # Sets path from the configured value or expression.
            defaultextension=".json",  # Computes defaultextension from the current input.
            filetypes=[("JSON files", "*.json"), ("All files", "*.*")]  # Computes filetypes from the current input.
        )  # Closes the continued call or expression.
        if not path:  # Checks whether not path before entering this branch.
            return  # Exits this function without returning a value.

        flat = []  # Initializes flat as an empty list for accumulating results.
        for a in range(self.N):  # Processes each a from range(self.N).
            flat.extend(self.table[a])  # Adds the supplied value to flat.

        payload = {  # Sets payload from the configured value or expression.
            "heroes": self.heroes,  # Sets the 'heroes' value in this configuration or lookup table.
            "N": self.N,  # Sets the 'N' value in this configuration or lookup table.
            "flat_player_major": flat,  # Sets the 'flat_player_major' value in this configuration or lookup table.
            "table": self.table,  # 2D, same data
        }  # Closes the current mapping or grouped expression.

        try:  # Starts a guarded operation whose failures are handled below.
            with open(path, "w", encoding="utf-8") as f:  # Opens the listed resource context for this block.
                json.dump(payload, f, ensure_ascii=False, indent=2)  # Calls json.dump to perform this step.
            messagebox.showinfo("Saved", f"Saved to:\n{path}")  # Calls messagebox.showinfo to perform this step.
        except Exception as e:  # Handles Exception as e raised by the guarded operation.
            messagebox.showerror("Save failed", str(e))  # Calls messagebox.showerror to perform this step.

    def _load_json(self):  # Defines the  load json function.
        path = filedialog.askopenfilename(  # Sets path from the configured value or expression.
            filetypes=[("JSON files", "*.json"), ("All files", "*.*")]  # Computes filetypes from the current input.
        )  # Closes the continued call or expression.
        if not path:  # Checks whether not path before entering this branch.
            return  # Exits this function without returning a value.

        try:  # Starts a guarded operation whose failures are handled below.
            with open(path, "r", encoding="utf-8") as f:  # Opens the listed resource context for this block.
                data = json.load(f)  # Sets data from the configured value or expression.

            heroes = data.get("heroes")  # Retrieves the current value and stores it as heroes.
            table = data.get("table")  # Retrieves the current value and stores it as table.

            if not isinstance(heroes, list) or not isinstance(table, list):  # Checks whether not isinstance(heroes, list) or not isinstance(table, list) before entering this branch.
                raise ValueError("Invalid JSON format: missing 'heroes' or 'table'.")  # Raises ValueError("Invalid JSON format: missing 'heroes' or 'table'.") to report this failure.

            N = len(heroes)  # Counts the relevant entries and stores the total as n.
            if any(not isinstance(r, list) or len(r) != N for r in table) or len(table) != N:  # Checks whether any(not isinstance(r, list) or len(r) != N for r in table) or len(table) != N before entering this branch.
                raise ValueError("Invalid JSON format: 'table' must be NxN list.")  # Raises ValueError("Invalid JSON format: 'table' must be NxN list.") to report this failure.

            self.heroes = heroes  # Sets heroes from the configured value or expression.
            self.N = N  # Sets n from the configured value or expression.
            self.table = table  # Sets table from the configured value or expression.

            # Rebuild UI
            self.player_list.delete(0, "end")  # Removes or clears the selected data from self.player_list.
            for h in self.heroes:  # Processes each h from self.heroes.
                self.player_list.insert("end", h)  # Adds the supplied value to self.player_list.

            self._render_follower_rows()  # Calls self._render_follower_rows to perform this step.
            self._select_player(0)  # Calls self._select_player to perform this step.

            messagebox.showinfo("Loaded", f"Loaded:\n{os.path.basename(path)}")  # Calls messagebox.showinfo to perform this step.
        except Exception as e:  # Handles Exception as e raised by the guarded operation.
            messagebox.showerror("Load failed", str(e))  # Calls messagebox.showerror to perform this step.

    def _open_hero_editor(self):  # Defines the  open hero editor function.
        win = tk.Toplevel(self.root)  # Creates a Toplevel object for win.
        win.title("Edit Hero List")  # Sets the window title.
        win.geometry("520x520")  # Sets the window size.
        win.minsize(420, 420)  # Calls win.minsize to perform this step.

        frame = ttk.Frame(win, padding=10)  # Creates a Frame object for frame.
        frame.pack(fill="both", expand=True)  # Places frame in the interface layout.
        frame.grid_rowconfigure(1, weight=1)  # Calls frame.grid_rowconfigure to perform this step.
        frame.grid_columnconfigure(0, weight=1)  # Calls frame.grid_columnconfigure to perform this step.

        ttk.Label(frame, text="One hero per line.", style="Small.TLabel").grid(row=0, column=0, sticky="w")  # Calls ttk.Label to perform this step.

        txt = tk.Text(frame, wrap="none", height=20)  # Creates a Text object for txt.
        txt.grid(row=1, column=0, sticky="nsew", pady=(6, 8))  # Places txt in the interface layout.
        txt.configure(font=("Consolas", 10))  # Configures txt for the desired interface behavior or appearance.
        txt.insert("1.0", "\n".join(self.heroes))  # Adds the supplied value to txt.

        btns = ttk.Frame(frame)  # Creates a Frame object for btns.
        btns.grid(row=2, column=0, sticky="we")  # Places btns in the interface layout.
        btns.grid_columnconfigure(2, weight=1)  # Calls btns.grid_columnconfigure to perform this step.

        def apply_changes():  # Defines the Apply changes function.
            lines = [ln.strip() for ln in txt.get("1.0", "end").splitlines()]  # Retrieves the current value and stores it as lines.
            new_heroes = [h for h in lines if h]  # Builds new heroes by transforming the selected input entries.
            if len(new_heroes) < 2:  # Checks whether len(new_heroes) < 2 before entering this branch.
                messagebox.showerror("Invalid", "Need at least 2 heroes.")  # Calls messagebox.showerror to perform this step.
                return  # Exits this function without returning a value.

            # If size changes, reinitialize table conservatively:
            # - Keep overlap where possible
            old_heroes = self.heroes  # Sets old heroes from the configured value or expression.
            old_table = self.table  # Sets old table from the configured value or expression.
            old_index = {h: i for i, h in enumerate(old_heroes)}  # Builds old index as a lookup table from the selected entries.

            N = len(new_heroes)  # Counts the relevant entries and stores the total as n.
            new_table = [[0 for _ in range(N)] for __ in range(N)]  # Builds new table by transforming the selected input entries.

            for a_name in new_heroes:  # Processes each a_name from new_heroes.
                for v_name in new_heroes:  # Processes each v_name from new_heroes.
                    if a_name in old_index and v_name in old_index:  # Checks whether a_name in old_index and v_name in old_index before entering this branch.
                        new_table[new_heroes.index(a_name)][new_heroes.index(v_name)] = old_table[old_index[a_name]][old_index[v_name]]  # Provides this value as an entry in the enclosing data structure.

            self.heroes = new_heroes  # Sets heroes from the configured value or expression.
            self.N = N  # Sets n from the configured value or expression.
            self.table = new_table  # Sets table from the configured value or expression.

            # rebuild UI
            self.player_list.delete(0, "end")  # Removes or clears the selected data from self.player_list.
            for h in self.heroes:  # Processes each h from self.heroes.
                self.player_list.insert("end", h)  # Adds the supplied value to self.player_list.

            self._render_follower_rows()  # Calls self._render_follower_rows to perform this step.
            self._select_player(0)  # Calls self._select_player to perform this step.
            win.destroy()  # Calls win.destroy to perform this step.

        def load_from_txt():  # Defines the Load from txt function.
            path = filedialog.askopenfilename(filetypes=[("Text files", "*.txt"), ("All files", "*.*")])  # Computes path from the current input.
            if not path:  # Checks whether not path before entering this branch.
                return  # Exits this function without returning a value.
            try:  # Starts a guarded operation whose failures are handled below.
                with open(path, "r", encoding="utf-8") as f:  # Opens the listed resource context for this block.
                    txt.delete("1.0", "end")  # Removes or clears the selected data from txt.
                    txt.insert("1.0", f.read())  # Adds the supplied value to txt.
            except Exception as e:  # Handles Exception as e raised by the guarded operation.
                messagebox.showerror("Load failed", str(e))  # Calls messagebox.showerror to perform this step.

        ttk.Button(btns, text="Load .txt…", command=load_from_txt).grid(row=0, column=0, padx=(0, 6))  # Calls ttk.Button to perform this step.
        ttk.Button(btns, text="Apply", command=apply_changes).grid(row=0, column=1, padx=(0, 6))  # Calls ttk.Button to perform this step.
        ttk.Button(btns, text="Cancel", command=win.destroy).grid(row=0, column=3, sticky="e")  # Calls ttk.Button to perform this step.

        ttk.Label(frame, text="Tip: keep your list order stable if you rely on playerIndex * N + followerIndex.", style="Small.TLabel").grid(  # Calls ttk.Label to perform this step.
            row=3, column=0, sticky="w", pady=(8, 0)  # Computes row from the current input.
        )  # Closes the continued call or expression.


def main():  # Defines the Main function.
    root = tk.Tk()  # Creates a Tk object for root.
    app = SwitchboardApp(root)  # Sets app from the configured value or expression.
    root.mainloop()  # Starts the GUI event loop.


if __name__ == "__main__":  # Checks whether __name__ == "__main__" before entering this branch.
    main()  # Calls main to perform this step.
