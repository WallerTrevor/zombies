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

import tkinter as tk
from tkinter import ttk, messagebox, filedialog
import pathlib, time, re, shutil

# === CONFIG: default includes (use the exact lines you showed) ===
DEFAULT_INCLUDES = [
    '#!include "../../== corelogic all maps/bot logic/"',
    '#!include "../../== corelogic all maps/general main/"',
    '#!include "../../== corelogic all maps/player main/"',
    '#!include "../../== corelogic all maps/tooling/"',
    '#!include "../../== effects all maps/"',
    '#!include "../bosses/"',
    '#!include "../core logic antarctic P/"',
    '#!include "../effects/"',
    '#!include "../story/"',
]

BEGIN_MARKER = '# BEGIN AUTO-INCLUDES'
END_MARKER = '# END AUTO-INCLUDES'

# === Helper functions ===
def make_disabled(line: str) -> str:
    # if already double commented, leave it
    if line.startswith('##!include'):
        return line
    if line.startswith('#!include'):
        return '##' + line[1:]
    # fallback: prefix with ##
    return '##' + line

def make_enabled(line: str) -> str:
    if line.startswith('#!include'):
        return line
    if line.startswith('##!include'):
        # turn '##!include "..."' -> '#!include "..."'
        return '#' + line[2:]
    # fallback: try to ensure it is a valid include
    if '!include' in line:
        return '#!' + line.split('!include',1)[1].strip()
    return '#!' + line

def read_file(path: pathlib.Path) -> str:
    return path.read_text(encoding='utf-8')

def write_file(path: pathlib.Path, text: str):
    path.write_text(text, encoding='utf-8')

def backup_file(path: pathlib.Path):
    ts = time.strftime('%Y%m%d-%H%M%S')
    bak = path.with_suffix(path.suffix + f'.bak_{ts}')
    shutil.copy2(path, bak)
    return bak

def build_block(include_lines, enabled_flags):
    out = [BEGIN_MARKER]
    for line, enabled in zip(include_lines, enabled_flags):
        if enabled:
            out.append(make_enabled(line))
        else:
            out.append(make_disabled(line))
    out.append(END_MARKER)
    return '\n'.join(out) + '\n'

def replace_or_append_block(original_text: str, block_text: str) -> str:
    # find existing block and replace, otherwise append to end with newline
    pattern = re.compile(re.escape(BEGIN_MARKER) + r'.*?' + re.escape(END_MARKER), re.DOTALL)
    if pattern.search(original_text):
        return pattern.sub(block_text.strip(), original_text)
    else:
        if not original_text.endswith('\n'):
            original_text += '\n'
        return original_text + '\n' + block_text

# === GUI ===
class App:
    def __init__(self, root):
        self.root = root
        root.title('Include Hotswap')
        self.filepath = None
        self.includes = DEFAULT_INCLUDES.copy()
        self.vars = []
        self._build_ui()

    def _build_ui(self):
        frm = ttk.Frame(self.root, padding=10)
        frm.grid(sticky='nsew')
        self.root.columnconfigure(0, weight=1)
        self.root.rowconfigure(0, weight=1)

        # File chooser
        frow = ttk.Frame(frm)
        frow.grid(sticky='ew', pady=(0,8))
        ttk.Label(frow, text='Target file:').grid(row=0, column=0, sticky='w')
        self.path_label = ttk.Label(frow, text='(not selected)', width=60)
        self.path_label.grid(row=0, column=1, sticky='w', padx=(6,6))
        ttk.Button(frow, text='Open...', command=self.choose_file).grid(row=0, column=2)

        # Checkboxes list
        box = ttk.LabelFrame(frm, text='Includes (toggle)', padding=8)
        box.grid(sticky='ew')
        for i, line in enumerate(self.includes):
            var = tk.BooleanVar(value=True)
            chk = ttk.Checkbutton(box, text=line, variable=var)
            chk.grid(sticky='w', padx=4, pady=2)
            self.vars.append(var)

        # Buttons
        brow = ttk.Frame(frm, padding=(0,8,0,0))
        brow.grid(sticky='e')
        ttk.Button(brow, text='Preview', command=self.preview).grid(row=0, column=0, padx=6)
        ttk.Button(brow, text='Save', command=self.save).grid(row=0, column=1)

        # Text preview
        pr = ttk.LabelFrame(frm, text='Preview / Log', padding=6)
        pr.grid(sticky='nsew', pady=(8,0))
        pr.rowconfigure(0, weight=1)
        pr.columnconfigure(0, weight=1)
        self.preview_text = tk.Text(pr, height=18, wrap='none')
        self.preview_text.grid(sticky='nsew')
        sb = ttk.Scrollbar(pr, orient='vertical', command=self.preview_text.yview)
        sb.grid(row=0, column=1, sticky='ns')
        self.preview_text['yscrollcommand'] = sb.set

    def choose_file(self):
        fp = filedialog.askopenfilename(title='Select main.opy or target file',
                                        filetypes=[('opy files','*.opy'),('All files','*.*')])
        if not fp:
            return
        self.filepath = pathlib.Path(fp)
        self.path_label.config(text=str(self.filepath))
        # Optionally, try to load existing block and set checkboxes accordingly
        try:
            txt = read_file(self.filepath)
            # attempt to read lines between markers
            m = re.search(re.escape(BEGIN_MARKER) + r'(.*?)' + re.escape(END_MARKER), txt, re.DOTALL)
            if m:
                block = m.group(1)
                lines = [ln.strip() for ln in block.splitlines() if ln.strip()]
                # map to defaults: set checkbox True if any entry equals enabled version of default
                for i, default in enumerate(self.includes):
                    en = make_enabled(default)
                    dis = make_disabled(default)
                    val = any((ln.startswith(en) or ln.startswith(dis) or ln == en or ln == dis) for ln in lines)
                    # If present and disabled, set false
                    if val:
                        # find the specific matching line and check if it was disabled
                        matched = next((ln for ln in lines if (ln.startswith(en) or ln.startswith(dis))), None)
                        if matched and matched.startswith(dis):
                            self.vars[i].set(False)
                        else:
                            self.vars[i].set(True)
                    else:
                        # not present in block: default True
                        self.vars[i].set(True)
        except Exception as e:
            messagebox.showwarning('Load error', f'Could not read file: {e}')

    def build_result_text(self):
        flags = [v.get() for v in self.vars]
        block = build_block(self.includes, flags)
        if not self.filepath:
            # just show the block
            return block
        try:
            original = read_file(self.filepath)
        except Exception as e:
            return f'Error reading file: {e}\n\nProposed block:\n{block}'
        result = replace_or_append_block(original, block)
        return result

    def preview(self):
        txt = self.build_result_text()
        self.preview_text.delete('1.0', 'end')
        self.preview_text.insert('1.0', txt)
        messagebox.showinfo('Preview ready', 'Preview has been rendered in the panel below.')

    def save(self):
        if not self.filepath:
            messagebox.showerror('No file', 'Please choose a target file first.')
            return
        # Backup
        try:
            bak = backup_file(self.filepath)
        except Exception as e:
            messagebox.showerror('Backup failed', f'Could not create backup: {e}')
            return
        # Write
        new_text = self.build_result_text()
        try:
            write_file(self.filepath, new_text)
            messagebox.showinfo('Saved', f'File saved. Backup created: {bak.name}')
        except Exception as e:
            messagebox.showerror('Save failed', f'Could not write file: {e}')

if __name__ == '__main__':
    root = tk.Tk()
    app = App(root)
    root.mainloop()
