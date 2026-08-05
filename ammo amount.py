import customtkinter as ctk
import json
import os

ctk.set_appearance_mode("Dark")
ctk.set_default_color_theme("blue")

SAVE_FILE = "ammo.json"

heroes = [
    "Ana","Ashe","Baptiste","Bastion","Brigitte",
    "Cassidy","D.Va","Doomfist","Echo","Freja",
    "Genji","Hazard","Hanzo","Illari","Junker Queen",
    "Junkrat","Juno","Kiriko","Lifeweaver","Lucio",
    "Mauga","Mei","Mercy","Moira","Orisa",
    "Pharah","Ramattra","Reaper","Reinhardt","Roadhog",
    "Sigma","Sojourn","Soldier: 76","Sombra",
    "Symmetra","Torbjorn","Tracer","Venture",
    "Widowmaker","Winston","Wrecking Ball",
    "Zarya","Zenyatta"
]

app = ctk.CTk()
app.title("Overwatch Ammo Editor")
app.geometry("700x900")

title = ctk.CTkLabel(
    app,
    text="Overwatch Ammo Capacity Editor",
    font=("Segoe UI", 26, "bold")
)
title.pack(pady=(15,10))

scroll = ctk.CTkScrollableFrame(app, width=650, height=550)
scroll.pack(fill="both", padx=10)

entries = {}

for hero in heroes:
    row = ctk.CTkFrame(scroll, fg_color="transparent")
    row.pack(fill="x", pady=2)

    label = ctk.CTkLabel(row, text=hero, width=180, anchor="w")
    label.pack(side="left")

    entry = ctk.CTkEntry(row, width=80, justify="center")
    entry.insert(0, "0")
    entry.pack(side="right")

    entries[hero] = entry

output = ctk.CTkTextbox(app, height=170)
output.pack(fill="both", padx=10, pady=10)


def compile_array():

    values = []

    for hero in heroes:
        text = entries[hero].get().strip()

        try:
            values.append(int(text))
        except:
            values.append(0)

    result = "Array(\n"

    for value in values:
        result += f"    {value},\n"

    result += ")"

    output.delete("1.0", "end")
    output.insert("1.0", result)


def copy_output():

    text = output.get("1.0", "end").strip()

    app.clipboard_clear()
    app.clipboard_append(text)


def save_json():

    data = {}

    for hero in heroes:

        text = entries[hero].get().strip()

        try:
            data[hero] = int(text)
        except:
            data[hero] = 0

    with open(SAVE_FILE, "w") as f:
        json.dump(data, f, indent=4)


def load_json():

    if not os.path.exists(SAVE_FILE):
        return

    with open(SAVE_FILE, "r") as f:
        data = json.load(f)

    for hero in heroes:

        value = data.get(hero, 0)

        entries[hero].delete(0, "end")
        entries[hero].insert(0, str(value))


buttonFrame = ctk.CTkFrame(app, fg_color="transparent")
buttonFrame.pack(pady=5)

ctk.CTkButton(
    buttonFrame,
    text="Compile",
    width=120,
    command=compile_array
).pack(side="left", padx=5)

ctk.CTkButton(
    buttonFrame,
    text="Copy",
    width=120,
    command=copy_output
).pack(side="left", padx=5)

ctk.CTkButton(
    buttonFrame,
    text="Save",
    width=120,
    command=save_json
).pack(side="left", padx=5)

ctk.CTkButton(
    buttonFrame,
    text="Load",
    width=120,
    command=load_json
).pack(side="left", padx=5)

load_json()

app.bind("<Return>", lambda e: compile_array())

app.mainloop()