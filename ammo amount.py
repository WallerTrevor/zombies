import customtkinter as ctk  # Imports CustomTkinter and gives it the shorter name ctk.
import json  # Imports functions for reading and writing JSON data.
import os  # Imports operating-system utilities, used here to check whether a file exists.

ctk.set_appearance_mode("Dark")  # Sets the application interface to dark mode.
ctk.set_default_color_theme("blue")  # Uses the blue color theme for CustomTkinter widgets.

SAVE_FILE = "ammo.json"  # Sets the file used to store and retrieve ammo values.

heroes = [  # Starts the list of heroes shown in the editor.
    "Ana","Ashe","Baptiste","Bastion","Brigitte",  # Adds these heroes to the list.
    "Cassidy","D.Va","Doomfist","Echo","Freja",  # Adds these heroes to the list.
    "Genji","Hazard","Hanzo","Illari","Junker Queen",  # Adds these heroes to the list.
    "Junkrat","Juno","Kiriko","Lifeweaver","Lucio",  # Adds these heroes to the list.
    "Mauga","Mei","Mercy","Moira","Orisa",  # Adds these heroes to the list.
    "Pharah","Ramattra","Reaper","Reinhardt","Roadhog",  # Adds these heroes to the list.
    "Sigma","Sojourn","Soldier: 76","Sombra",  # Adds these heroes to the list.
    "Symmetra","Torbjorn","Tracer","Venture",  # Adds these heroes to the list.
    "Widowmaker","Winston","Wrecking Ball",  # Adds these heroes to the list.
    "Zarya","Zenyatta"  # Adds the final heroes and closes the list.
]  # Finishes the list of hero names.

app = ctk.CTk()  # Creates the main application window.
app.title("Overwatch Ammo Editor")  # Sets the text displayed in the window title bar.
app.geometry("700x900")  # Sets the initial window size to 700 pixels wide by 900 high.

title = ctk.CTkLabel(  # Creates a label widget for the page heading.
    app,  # Places the label in the main application window.
    text="Overwatch Ammo Capacity Editor",  # Sets the heading displayed in the label.
    font=("Segoe UI", 26, "bold")  # Sets the label font family, size, and bold style.
)  # Finishes creating the heading label.
title.pack(pady=(15,10))  # Displays the heading with extra space above and below it.

scroll = ctk.CTkScrollableFrame(app, width=650, height=550)  # Creates a scrollable area for the hero rows.
scroll.pack(fill="both", padx=10)  # Displays the scrollable area and adds horizontal padding.

entries = {}  # Creates a dictionary to associate each hero with its input widget.

for hero in heroes:  # Builds one row of widgets for each hero in the list.
    row = ctk.CTkFrame(scroll, fg_color="transparent")  # Creates a transparent frame to hold the row's widgets.
    row.pack(fill="x", pady=2)  # Displays the row across the scroll area with vertical spacing.

    label = ctk.CTkLabel(row, text=hero, width=180, anchor="w")  # Creates a left-aligned label showing the hero's name.
    label.pack(side="left")  # Places the hero name on the left side of the row.

    entry = ctk.CTkEntry(row, width=80, justify="center")  # Creates a centered text input for this hero's ammo amount.
    entry.insert(0, "0")  # Fills the input with zero by default.
    entry.pack(side="right")  # Places the input on the right side of the row.

    entries[hero] = entry  # Stores this input so other functions can retrieve its value by hero name.

output = ctk.CTkTextbox(app, height=170)  # Creates a text area for displaying the compiled array.
output.pack(fill="both", padx=10, pady=10)  # Displays the text area with padding around it.


def compile_array():  # Defines the function that converts the entered amounts into an array string.

    values = []  # Creates a list that will hold each hero's numeric ammo amount.

    for hero in heroes:  # Reads the ammo input for every hero in the original order.
        text = entries[hero].get().strip()  # Gets the input text and removes surrounding whitespace.

        try:  # Attempts to convert the input text into an integer.
            values.append(int(text))  # Adds the converted number to the list.
        except:  # Handles any exception raised while converting the input.
            values.append(0)  # Uses zero when the input cannot be converted.

    result = "Array(\n"  # Starts the output string with an Array declaration and a newline.

    for value in values:  # Processes each converted ammo amount in order.
        result += f"    {value},\n"  # Adds the amount as an indented array entry followed by a newline.

    result += ")"  # Adds the closing parenthesis to finish the array string.

    output.delete("1.0", "end")  # Clears all existing text from the output area.
    output.insert("1.0", result)  # Writes the newly compiled array at the start of the output area.


def copy_output():  # Defines the function that copies the output text to the clipboard.

    text = output.get("1.0", "end").strip()  # Reads the output text and removes trailing whitespace.

    app.clipboard_clear()  # Removes any previously copied content from the clipboard.
    app.clipboard_append(text)  # Places the current output text on the clipboard.


def save_json():  # Defines the function that saves the current ammo amounts as JSON.

    data = {}  # Creates a dictionary for mapping hero names to ammo amounts.

    for hero in heroes:  # Reads and processes each hero's input.

        text = entries[hero].get().strip()  # Gets this hero's input text without surrounding whitespace.

        try:  # Attempts to convert the input text to an integer.
            data[hero] = int(text)  # Stores the integer ammo amount under this hero's name.
        except:  # Handles any exception raised while converting the input.
            data[hero] = 0  # Stores zero if the input cannot be converted.

    with open(SAVE_FILE, "w") as f:  # Opens the save file for writing, creating or replacing it.
        json.dump(data, f, indent=4)  # Writes the hero-to-amount dictionary as readable, indented JSON.


def load_json():  # Defines the function that loads saved ammo amounts into the inputs.

    if not os.path.exists(SAVE_FILE):  # Checks whether the save file is missing.
        return  # Stops because there is no saved data to load.

    with open(SAVE_FILE, "r") as f:  # Opens the existing save file for reading.
        data = json.load(f)  # Parses the JSON file into a Python dictionary.

    for hero in heroes:  # Restores a value for each hero listed by the application.

        value = data.get(hero, 0)  # Gets the saved amount or defaults to zero if the hero has no entry.

        entries[hero].delete(0, "end")  # Removes the current text from this hero's input.
        entries[hero].insert(0, str(value))  # Inserts the saved value as text into this hero's input.


buttonFrame = ctk.CTkFrame(app, fg_color="transparent")  # Creates a transparent frame to group the action buttons.
buttonFrame.pack(pady=5)  # Displays the button group with vertical spacing.

ctk.CTkButton(  # Starts creating the button that compiles the array.
    buttonFrame,  # Places the button inside the grouped button frame.
    text="Compile",  # Sets the button label to Compile.
    width=120,  # Sets the button width to 120 pixels.
    command=compile_array  # Runs compile_array when the button is clicked.
).pack(side="left", padx=5)  # Displays the button on the left with horizontal padding.

ctk.CTkButton(  # Starts creating the button that copies the output.
    buttonFrame,  # Places the button inside the grouped button frame.
    text="Copy",  # Sets the button label to Copy.
    width=120,  # Sets the button width to 120 pixels.
    command=copy_output  # Runs copy_output when the button is clicked.
).pack(side="left", padx=5)  # Displays the button on the left with horizontal padding.

ctk.CTkButton(  # Starts creating the button that saves the data.
    buttonFrame,  # Places the button inside the grouped button frame.
    text="Save",  # Sets the button label to Save.
    width=120,  # Sets the button width to 120 pixels.
    command=save_json  # Runs save_json when the button is clicked.
).pack(side="left", padx=5)  # Displays the button on the left with horizontal padding.

ctk.CTkButton(  # Starts creating the button that loads saved data.
    buttonFrame,  # Places the button inside the grouped button frame.
    text="Load",  # Sets the button label to Load.
    width=120,  # Sets the button width to 120 pixels.
    command=load_json  # Runs load_json when the button is clicked.
).pack(side="left", padx=5)  # Displays the button on the left with horizontal padding.

load_json()  # Loads saved values when the application starts, if the save file exists.

app.bind("<Return>", lambda e: compile_array())  # Makes pressing Enter run the compile function.

app.mainloop()  # Starts the GUI event loop and keeps the application window responsive.