import tkinter as tk  # Imports tkinter as tk for use in this script.
from tkinter import ttk  # Imports ttk from tkinter for use in this script.

HEROES = [  # Defines the hero roster used to populate the switchboard.
    "Ana","Ashe","Baptiste","Bastion","Brigitte","Cassidy","D.Va","Doomfist",  # Lists the selectable hero names used to build the switchboard.
    "Echo","Genji","Hanzo","Illari","Junker Queen","Junkrat","Kiriko","Lifeweaver",  # Lists the selectable hero names used to build the switchboard.
    "Lucio","Mei","Mercy","Moira","Orisa","Pharah","Ramattra","Reaper",  # Lists the selectable hero names used to build the switchboard.
    "Reinhardt","Roadhog","Sigma","Sojourn","Soldier 76","Sombra","Symmetra",  # Lists the selectable hero names used to build the switchboard.
    "Torbjorn","Tracer","Widowmaker","Winston","Wrecking Ball","Zarya","Zenyatta",  # Lists the selectable hero names used to build the switchboard.
    "Venture","Mauga","Queen Test","Hero42","Hero43","Hero44","Hero45"  # Lists the selectable hero names used to build the switchboard.
]  # Closes the current list or indexed expression.

FLAG_LABELS = ["Ability 1", "Ability 2", "Ultimate", "Regular"]  # Names the flag columns shown for each hero.


class FlagTableApp:  # Defines the FlagTableApp class.
    def __init__(self, root):  # Defines the   init   function.
        self.root = root  # Keeps the application?s root window available to its methods.
        self.root.title("Toggle fall damage flags for each hero")  # Sets the window title.
        self.root.geometry("900x600")  # Sets the window size.

        self._build_style()  # Calls self._build_style to perform this step.
        self._build_ui()  # Calls self._build_ui to perform this step.


    def _build_style(self):  # Defines the  build style function.
        style = ttk.Style()  # Creates a Style object for style.
        style.theme_use("clam")  # Configures style for the desired interface behavior or appearance.

        bg = "#1e1e1e"  # Computes bg from the current input.
        fg = "#d4d4d4"  # Computes fg from the current input.
        accent = "#2d2d2d"  # Computes accent from the current input.

        self.root.configure(bg=bg)  # Configures self.root for the desired interface behavior or appearance.

        style.configure("TFrame", background=bg)  # Configures style for the desired interface behavior or appearance.
        style.configure("TLabel", background=bg, foreground=fg)  # Configures style for the desired interface behavior or appearance.
        style.configure("TButton", background=accent, foreground=fg)  # Configures style for the desired interface behavior or appearance.
        style.configure("TCheckbutton", background=bg, foreground=fg)  # Configures style for the desired interface behavior or appearance.


    def _build_ui(self):  # Defines the  build ui function.

        main = ttk.Frame(self.root)  # Creates a Frame object for main.
        main.pack(fill="both", expand=True, padx=10, pady=10)  # Places main in the interface layout.

        left = ttk.Frame(main)  # Creates a Frame object for left.
        left.pack(side="left", fill="both", expand=True)  # Places left in the interface layout.

        right = ttk.Frame(main)  # Creates a Frame object for right.
        right.pack(side="right", fill="both", expand=True)  # Places right in the interface layout.

        canvas = tk.Canvas(left, bg="#1e1e1e", highlightthickness=0)  # Creates a Canvas object for canvas.
        scrollbar = ttk.Scrollbar(left, orient="vertical", command=canvas.yview)  # Creates a Scrollbar object for scrollbar.
        self.scroll_frame = ttk.Frame(canvas)  # Creates a Frame object for scroll frame.

        self.scroll_frame.bind(  # Connects an event on self.scroll_frame to its handler.
            "<Configure>",  # Provides this value as an entry in the enclosing data structure.
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.

        canvas.create_window((0, 0), window=self.scroll_frame, anchor="nw")  # Calls canvas.create_window to perform this step.
        canvas.configure(yscrollcommand=scrollbar.set)  # Configures canvas for the desired interface behavior or appearance.

        canvas.pack(side="left", fill="both", expand=True)  # Places canvas in the interface layout.
        scrollbar.pack(side="right", fill="y")  # Places scrollbar in the interface layout.

        # Store flag variables
        self.flag_vars = []  # Initializes flag vars as an empty list for accumulating results.

        # Make scroll_frame use grid columns that line up
        # Column 0 = hero name, Columns 1-4 = the 4 flags
        self.scroll_frame.grid_columnconfigure(0, minsize=180)  # Calls self.scroll_frame.grid_columnconfigure to perform this step.
        for c in range(1, 5):  # Processes each c from range(1, 5).
            self.scroll_frame.grid_columnconfigure(c, minsize=110)  # Calls self.scroll_frame.grid_columnconfigure to perform this step.

        # Header row
        ttk.Label(self.scroll_frame, text="Hero").grid(row=0, column=0, sticky="w", padx=(0, 10), pady=(0, 6))  # Calls ttk.Label to perform this step.
        for c, label in enumerate(FLAG_LABELS, start=1):  # Processes each c, label from enumerate(FLAG_LABELS, start=1).
            ttk.Label(self.scroll_frame, text=label).grid(row=0, column=c, sticky="w", padx=(0, 10), pady=(0, 6))  # Calls ttk.Label to perform this step.

        # Hero rows
        for r, hero in enumerate(HEROES, start=1):  # Processes each r, hero from enumerate(HEROES, start=1).
            ttk.Label(self.scroll_frame, text=hero).grid(row=r, column=0, sticky="w", padx=(0, 10), pady=2)  # Calls ttk.Label to perform this step.

            hero_flags = []  # Initializes hero flags as an empty list for accumulating results.
            for c in range(1, 5):  # Processes each c from range(1, 5).
                var = tk.IntVar(value=0)  # Creates a IntVar object for var.

                # Put each checkbox in its own "cell" frame so it aligns cleanly
                cell = ttk.Frame(self.scroll_frame)  # Creates a Frame object for cell.
                cell.grid(row=r, column=c, sticky="w", padx=(0, 10), pady=2)  # Places cell in the interface layout.

                chk = ttk.Checkbutton(cell, variable=var)  # Creates a Checkbutton object for chk.
                chk.grid(row=0, column=0, sticky="w")  # Places chk in the interface layout.

                hero_flags.append(var)  # Adds the supplied value to hero_flags.

            self.flag_vars.append(hero_flags)  # Adds the supplied value to self.flag_vars.


        ttk.Label(right, text="Compiled Flat Array").pack(anchor="w")  # Calls ttk.Label to perform this step.

        self.output = tk.Text(  # Creates a Text object for output.
            right,  # Provides this value as an entry in the enclosing data structure.
            height=25,  # Sets height from the configured value or expression.
            wrap="none",  # Computes wrap from the current input.
            bg="#1e1e1e",  # Computes bg from the current input.
            fg="#d4d4d4",  # Computes fg from the current input.
            insertbackground="#ffffff",  # Computes insertbackground from the current input.
            selectbackground="#444444"  # Computes selectbackground from the current input.
        )  # Closes the continued call or expression.
        self.output.pack(fill="both", expand=True, pady=5)  # Places self.output in the interface layout.

        btn_frame = ttk.Frame(right)  # Creates a Frame object for btn frame.
        btn_frame.pack(fill="x", pady=5)  # Places btn_frame in the interface layout.

        ttk.Button(btn_frame, text="Compile", command=self.compile).pack(side="left", padx=5)  # Calls ttk.Button to perform this step.
        ttk.Button(btn_frame, text="Copy", command=self.copy_output).pack(side="left", padx=5)  # Calls ttk.Button to perform this step.


    def compile(self):  # Defines the Compile function.
        flat = []  # Initializes flat as an empty list for accumulating results.

        for hero_flags in self.flag_vars:  # Processes each hero_flags from self.flag_vars.
            for var in hero_flags:  # Processes each var from hero_flags.
                flat.append(var.get())  # Adds the supplied value to flat.

        output_text = "[" + ", ".join(map(str, flat)) + "]"  # Computes output text from the current input.

        self.output.delete("1.0", tk.END)  # Removes or clears the selected data from self.output.
        self.output.insert(tk.END, output_text)  # Adds the supplied value to self.output.

        print(f"Compiled length: {len(flat)}")  # Reports this result or status in the console.


    def copy_output(self):  # Defines the Copy output function.
        text = self.output.get("1.0", tk.END).strip()  # Retrieves the current value and stores it as text.
        self.root.clipboard_clear()  # Clears the clipboard.
        self.root.clipboard_append(text)  # Copies the selected text to the clipboard.


def main():  # Defines the Main function.
    root = tk.Tk()  # Creates a Tk object for root.
    app = FlagTableApp(root)  # Sets app from the configured value or expression.
    root.mainloop()  # Starts the GUI event loop.

if __name__ == "__main__":  # Checks whether __name__ == "__main__" before entering this branch.
    main()  # Calls main to perform this step.
