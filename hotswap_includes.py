#!/usr/bin/env python3
"""
hotswap_includes.py

Simple Tk GUI to toggle include lines in a target file (e.g. main.opy).

Behavior:
- Maintains an identifiable block between:
    # BEGIN AUTO-INCLUDES
    ...
    # END AUTO-INCLUDES
  If those markers do not exist, the script appends the block at the end.
- Each include can be enabled (#!include ...) or disabled (##!include ...).
- Creates a backup of the original file before writing (filename.bak_TIMESTAMP).
- Provides Preview and Save buttons.
"""

import tkinter as tk  # Imports tkinter as tk for use in this script.
from tkinter import ttk, messagebox, filedialog  # Imports ttk, messagebox, filedialog from tkinter for use in this script.
import pathlib, time, re, shutil  # Imports pathlib, time, re, shutil for use in this script.

# === CONFIG: default includes (use the exact lines you showed) ===
DEFAULT_INCLUDES = [  # Sets default includes from the configured value or expression.
    '#!include "../../== corelogic all maps/bot logic/"',  # Continues the surrounding operation.
    '#!include "../../== corelogic all maps/general main/"',  # Continues the surrounding operation.
    '#!include "../../== corelogic all maps/player main/"',  # Continues the surrounding operation.
    '#!include "../../== corelogic all maps/tooling/"',  # Continues the surrounding operation.
    '#!include "../../== effects all maps/"',  # Continues the surrounding operation.
    '#!include "../bosses/"',  # Continues the surrounding operation.
    '#!include "../core logic antarctic P/"',  # Continues the surrounding operation.
    '#!include "../effects/"',  # Continues the surrounding operation.
    '#!include "../story/"',  # Continues the surrounding operation.
]  # Closes the current list or indexed expression.

BEGIN_MARKER = '# BEGIN AUTO-INCLUDES'  # Computes begin marker from the current input.
END_MARKER = '# END AUTO-INCLUDES'  # Computes end marker from the current input.

# === Helper functions ===
def make_disabled(line: str) -> str:  # Defines the Make disabled function.
    # if already double commented, leave it
    if line.startswith('##!include'):  # Checks whether line.startswith(' before entering this branch.
        return line  # Returns line to the caller.
    if line.startswith('#!include'):  # Checks whether line.startswith(' before entering this branch.
        return '##' + line[1:]  # Returns ' to the caller.
    # fallback: prefix with ##
    return '##' + line  # Returns ' to the caller.

def make_enabled(line: str) -> str:  # Defines the Make enabled function.
    if line.startswith('#!include'):  # Checks whether line.startswith(' before entering this branch.
        return line  # Returns line to the caller.
    if line.startswith('##!include'):  # Checks whether line.startswith(' before entering this branch.
        # turn '##!include "..."' -> '#!include "..."'
        return '#' + line[2:]  # Returns ' to the caller.
    # fallback: try to ensure it is a valid include
    if '!include' in line:  # Checks whether '!include' in line before entering this branch.
        return '#!' + line.split('!include',1)[1].strip()  # Returns ' to the caller.
    return '#!' + line  # Returns ' to the caller.

def read_file(path: pathlib.Path) -> str:  # Defines the Read file function.
    return path.read_text(encoding='utf-8')  # Returns path.read_text(encoding='utf-8') to the caller.

def write_file(path: pathlib.Path, text: str):  # Defines the Write file function.
    path.write_text(text, encoding='utf-8')  # Calls path.write_text to perform this step.

def backup_file(path: pathlib.Path):  # Defines the Backup file function.
    ts = time.strftime('%Y%m%d-%H%M%S')  # Computes ts from the current input.
    bak = path.with_suffix(path.suffix + f'.bak_{ts}')  # Computes bak from the current input.
    shutil.copy2(path, bak)  # Calls shutil.copy2 to perform this step.
    return bak  # Returns bak to the caller.

def build_block(include_lines, enabled_flags):  # Defines the Build block function.
    out = [BEGIN_MARKER]  # Sets out from the configured value or expression.
    for line, enabled in zip(include_lines, enabled_flags):  # Processes each line, enabled from zip(include_lines, enabled_flags).
        if enabled:  # Checks whether enabled before entering this branch.
            out.append(make_enabled(line))  # Adds the supplied value to out.
        else:  # Handles the remaining case when prior conditions did not match.
            out.append(make_disabled(line))  # Adds the supplied value to out.
    out.append(END_MARKER)  # Adds the supplied value to out.
    return '\n'.join(out) + '\n'  # Returns '\n'.join(out) + '\n' to the caller.

def replace_or_append_block(original_text: str, block_text: str) -> str:  # Defines the Replace or append block function.
    # find existing block and replace, otherwise append to end with newline
    pattern = re.compile(re.escape(BEGIN_MARKER) + r'.*?' + re.escape(END_MARKER), re.DOTALL)  # Computes pattern from the current input.
    if pattern.search(original_text):  # Checks whether pattern.search(original_text) before entering this branch.
        return pattern.sub(block_text.strip(), original_text)  # Returns pattern.sub(block_text.strip(), original_text) to the caller.
    else:  # Handles the remaining case when prior conditions did not match.
        if not original_text.endswith('\n'):  # Checks whether not original_text.endswith('\n') before entering this branch.
            original_text += '\n'  # Updates original text using the + operation.
        return original_text + '\n' + block_text  # Returns original_text + '\n' + block_text to the caller.

# === GUI ===
class App:  # Defines the App class.
    def __init__(self, root):  # Defines the   init   function.
        self.root = root  # Keeps the application?s root window available to its methods.
        root.title('Include Hotswap')  # Sets the window title.
        self.filepath = None  # Sets filepath from the configured value or expression.
        self.includes = DEFAULT_INCLUDES.copy()  # Copies the default data so includes can be changed independently.
        self.vars = []  # Initializes vars as an empty list for accumulating results.
        self._build_ui()  # Calls self._build_ui to perform this step.

    def _build_ui(self):  # Defines the  build ui function.
        frm = ttk.Frame(self.root, padding=10)  # Creates a Frame object for frm.
        frm.grid(sticky='nsew')  # Places frm in the interface layout.
        self.root.columnconfigure(0, weight=1)  # Calls self.root.columnconfigure to perform this step.
        self.root.rowconfigure(0, weight=1)  # Calls self.root.rowconfigure to perform this step.

        # File chooser
        frow = ttk.Frame(frm)  # Creates a Frame object for frow.
        frow.grid(sticky='ew', pady=(0,8))  # Places frow in the interface layout.
        ttk.Label(frow, text='Target file:').grid(row=0, column=0, sticky='w')  # Calls ttk.Label to perform this step.
        self.path_label = ttk.Label(frow, text='(not selected)', width=60)  # Creates a Label object for path label.
        self.path_label.grid(row=0, column=1, sticky='w', padx=(6,6))  # Places self.path_label in the interface layout.
        ttk.Button(frow, text='Open...', command=self.choose_file).grid(row=0, column=2)  # Calls ttk.Button to perform this step.

        # Checkboxes list
        box = ttk.LabelFrame(frm, text='Includes (toggle)', padding=8)  # Creates a LabelFrame object for box.
        box.grid(sticky='ew')  # Places box in the interface layout.
        for i, line in enumerate(self.includes):  # Processes each i, line from enumerate(self.includes).
            var = tk.BooleanVar(value=True)  # Creates a BooleanVar object for var.
            chk = ttk.Checkbutton(box, text=line, variable=var)  # Creates a Checkbutton object for chk.
            chk.grid(sticky='w', padx=4, pady=2)  # Places chk in the interface layout.
            self.vars.append(var)  # Adds the supplied value to self.vars.

        # Buttons
        brow = ttk.Frame(frm, padding=(0,8,0,0))  # Creates a Frame object for brow.
        brow.grid(sticky='e')  # Places brow in the interface layout.
        ttk.Button(brow, text='Preview', command=self.preview).grid(row=0, column=0, padx=6)  # Calls ttk.Button to perform this step.
        ttk.Button(brow, text='Save', command=self.save).grid(row=0, column=1)  # Calls ttk.Button to perform this step.

        # Text preview
        pr = ttk.LabelFrame(frm, text='Preview / Log', padding=6)  # Creates a LabelFrame object for pr.
        pr.grid(sticky='nsew', pady=(8,0))  # Places pr in the interface layout.
        pr.rowconfigure(0, weight=1)  # Calls pr.rowconfigure to perform this step.
        pr.columnconfigure(0, weight=1)  # Calls pr.columnconfigure to perform this step.
        self.preview_text = tk.Text(pr, height=18, wrap='none')  # Creates a Text object for preview text.
        self.preview_text.grid(sticky='nsew')  # Places self.preview_text in the interface layout.
        sb = ttk.Scrollbar(pr, orient='vertical', command=self.preview_text.yview)  # Creates a Scrollbar object for sb.
        sb.grid(row=0, column=1, sticky='ns')  # Places sb in the interface layout.
        self.preview_text['yscrollcommand'] = sb.set  # Provides this value as an entry in the enclosing data structure.

    def choose_file(self):  # Defines the Choose file function.
        fp = filedialog.askopenfilename(title='Select main.opy or target file',  # Computes fp from the current input.
                                        filetypes=[('opy files','*.opy'),('All files','*.*')])  # Computes filetypes from the current input.
        if not fp:  # Checks whether not fp before entering this branch.
            return  # Exits this function without returning a value.
        self.filepath = pathlib.Path(fp)  # Sets filepath from the configured value or expression.
        self.path_label.config(text=str(self.filepath))  # Configures self.path_label for the desired interface behavior or appearance.
        # Optionally, try to load existing block and set checkboxes accordingly
        try:  # Starts a guarded operation whose failures are handled below.
            txt = read_file(self.filepath)  # Sets txt from the configured value or expression.
            # attempt to read lines between markers
            m = re.search(re.escape(BEGIN_MARKER) + r'(.*?)' + re.escape(END_MARKER), txt, re.DOTALL)  # Finds the matching source section and stores it as m.
            if m:  # Checks whether m before entering this branch.
                block = m.group(1)  # Extracts the captured source text and stores it as block.
                lines = [ln.strip() for ln in block.splitlines() if ln.strip()]  # Removes surrounding whitespace and stores the cleaned value as lines.
                # map to defaults: set checkbox True if any entry equals enabled version of default
                for i, default in enumerate(self.includes):  # Processes each i, default from enumerate(self.includes).
                    en = make_enabled(default)  # Sets en from the configured value or expression.
                    dis = make_disabled(default)  # Sets dis from the configured value or expression.
                    val = any((ln.startswith(en) or ln.startswith(dis) or ln == en or ln == dis) for ln in lines)  # Computes val from the current input.
                    # If present and disabled, set false
                    if val:  # Checks whether val before entering this branch.
                        # find the specific matching line and check if it was disabled
                        matched = next((ln for ln in lines if (ln.startswith(en) or ln.startswith(dis))), None)  # Sets matched from the configured value or expression.
                        if matched and matched.startswith(dis):  # Checks whether matched and matched.startswith(dis) before entering this branch.
                            self.vars[i].set(False)  # Provides this value as an entry in the enclosing data structure.
                        else:  # Handles the remaining case when prior conditions did not match.
                            self.vars[i].set(True)  # Provides this value as an entry in the enclosing data structure.
                    else:  # Handles the remaining case when prior conditions did not match.
                        # not present in block: default True
                        self.vars[i].set(True)  # Provides this value as an entry in the enclosing data structure.
        except Exception as e:  # Handles Exception as e raised by the guarded operation.
            messagebox.showwarning('Load error', f'Could not read file: {e}')  # Calls messagebox.showwarning to perform this step.

    def build_result_text(self):  # Defines the Build result text function.
        flags = [v.get() for v in self.vars]  # Retrieves the current value and stores it as flags.
        block = build_block(self.includes, flags)  # Sets block from the configured value or expression.
        if not self.filepath:  # Checks whether not self.filepath before entering this branch.
            # just show the block
            return block  # Returns block to the caller.
        try:  # Starts a guarded operation whose failures are handled below.
            original = read_file(self.filepath)  # Sets original from the configured value or expression.
        except Exception as e:  # Handles Exception as e raised by the guarded operation.
            return f'Error reading file: {e}\n\nProposed block:\n{block}'  # Returns f'Error reading file: {e}\n\nProposed block:\n{block}' to the caller.
        result = replace_or_append_block(original, block)  # Sets result from the configured value or expression.
        return result  # Returns result to the caller.

    def preview(self):  # Defines the Preview function.
        txt = self.build_result_text()  # Sets txt from the configured value or expression.
        self.preview_text.delete('1.0', 'end')  # Removes or clears the selected data from self.preview_text.
        self.preview_text.insert('1.0', txt)  # Adds the supplied value to self.preview_text.
        messagebox.showinfo('Preview ready', 'Preview has been rendered in the panel below.')  # Calls messagebox.showinfo to perform this step.

    def save(self):  # Defines the Save function.
        if not self.filepath:  # Checks whether not self.filepath before entering this branch.
            messagebox.showerror('No file', 'Please choose a target file first.')  # Calls messagebox.showerror to perform this step.
            return  # Exits this function without returning a value.
        # Backup
        try:  # Starts a guarded operation whose failures are handled below.
            bak = backup_file(self.filepath)  # Sets bak from the configured value or expression.
        except Exception as e:  # Handles Exception as e raised by the guarded operation.
            messagebox.showerror('Backup failed', f'Could not create backup: {e}')  # Calls messagebox.showerror to perform this step.
            return  # Exits this function without returning a value.
        # Write
        new_text = self.build_result_text()  # Sets new text from the configured value or expression.
        try:  # Starts a guarded operation whose failures are handled below.
            write_file(self.filepath, new_text)  # Calls write_file to perform this step.
            messagebox.showinfo('Saved', f'File saved. Backup created: {bak.name}')  # Calls messagebox.showinfo to perform this step.
        except Exception as e:  # Handles Exception as e raised by the guarded operation.
            messagebox.showerror('Save failed', f'Could not write file: {e}')  # Calls messagebox.showerror to perform this step.

if __name__ == '__main__':  # Checks whether __name__ == '__main__' before entering this branch.
    root = tk.Tk()  # Creates a Tk object for root.
    app = App(root)  # Sets app from the configured value or expression.
    root.mainloop()  # Starts the GUI event loop.
