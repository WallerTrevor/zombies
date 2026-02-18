import tkinter as tk
from tkinter import ttk

HEROES = [
    "Ana","Ashe","Baptiste","Bastion","Brigitte","Cassidy","D.Va","Doomfist",
    "Echo","Genji","Hanzo","Illari","Junker Queen","Junkrat","Kiriko","Lifeweaver",
    "Lucio","Mei","Mercy","Moira","Orisa","Pharah","Ramattra","Reaper",
    "Reinhardt","Roadhog","Sigma","Sojourn","Soldier 76","Sombra","Symmetra",
    "Torbjorn","Tracer","Widowmaker","Winston","Wrecking Ball","Zarya","Zenyatta",
    "Venture","Mauga","Queen Test","Hero42","Hero43","Hero44","Hero45"
]

FLAG_LABELS = ["Ability 1", "Ability 2", "Ultimate", "Regular"]


class FlagTableApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Toggle fall damage flags for each hero")
        self.root.geometry("900x600")

        self._build_style()
        self._build_ui()


    def _build_style(self):
        style = ttk.Style()
        style.theme_use("clam")

        bg = "#1e1e1e"
        fg = "#d4d4d4"
        accent = "#2d2d2d"

        self.root.configure(bg=bg)

        style.configure("TFrame", background=bg)
        style.configure("TLabel", background=bg, foreground=fg)
        style.configure("TButton", background=accent, foreground=fg)
        style.configure("TCheckbutton", background=bg, foreground=fg)


    def _build_ui(self):

        main = ttk.Frame(self.root)
        main.pack(fill="both", expand=True, padx=10, pady=10)

        left = ttk.Frame(main)
        left.pack(side="left", fill="both", expand=True)

        right = ttk.Frame(main)
        right.pack(side="right", fill="both", expand=True)

        canvas = tk.Canvas(left, bg="#1e1e1e", highlightthickness=0)
        scrollbar = ttk.Scrollbar(left, orient="vertical", command=canvas.yview)
        self.scroll_frame = ttk.Frame(canvas)

        self.scroll_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(scrollregion=canvas.bbox("all"))
        )

        canvas.create_window((0, 0), window=self.scroll_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)

        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

        # Store flag variables
        self.flag_vars = []

        # Make scroll_frame use grid columns that line up
        # Column 0 = hero name, Columns 1-4 = the 4 flags
        self.scroll_frame.grid_columnconfigure(0, minsize=180)
        for c in range(1, 5):
            self.scroll_frame.grid_columnconfigure(c, minsize=110)

        # Header row
        ttk.Label(self.scroll_frame, text="Hero").grid(row=0, column=0, sticky="w", padx=(0, 10), pady=(0, 6))
        for c, label in enumerate(FLAG_LABELS, start=1):
            ttk.Label(self.scroll_frame, text=label).grid(row=0, column=c, sticky="w", padx=(0, 10), pady=(0, 6))

        # Hero rows
        for r, hero in enumerate(HEROES, start=1):
            ttk.Label(self.scroll_frame, text=hero).grid(row=r, column=0, sticky="w", padx=(0, 10), pady=2)

            hero_flags = []
            for c in range(1, 5):
                var = tk.IntVar(value=0)

                # Put each checkbox in its own "cell" frame so it aligns cleanly
                cell = ttk.Frame(self.scroll_frame)
                cell.grid(row=r, column=c, sticky="w", padx=(0, 10), pady=2)

                chk = ttk.Checkbutton(cell, variable=var)
                chk.grid(row=0, column=0, sticky="w")

                hero_flags.append(var)

            self.flag_vars.append(hero_flags)


        ttk.Label(right, text="Compiled Flat Array").pack(anchor="w")

        self.output = tk.Text(
            right,
            height=25,
            wrap="none",
            bg="#1e1e1e",
            fg="#d4d4d4",
            insertbackground="#ffffff",
            selectbackground="#444444"
        )
        self.output.pack(fill="both", expand=True, pady=5)

        btn_frame = ttk.Frame(right)
        btn_frame.pack(fill="x", pady=5)

        ttk.Button(btn_frame, text="Compile", command=self.compile).pack(side="left", padx=5)
        ttk.Button(btn_frame, text="Copy", command=self.copy_output).pack(side="left", padx=5)


    def compile(self):
        flat = []

        for hero_flags in self.flag_vars:
            for var in hero_flags:
                flat.append(var.get())

        output_text = "[" + ", ".join(map(str, flat)) + "]"

        self.output.delete("1.0", tk.END)
        self.output.insert(tk.END, output_text)

        print(f"Compiled length: {len(flat)}")


    def copy_output(self):
        text = self.output.get("1.0", tk.END).strip()
        self.root.clipboard_clear()
        self.root.clipboard_append(text)


def main():
    root = tk.Tk()
    app = FlagTableApp(root)
    root.mainloop()

if __name__ == "__main__":
    main()
