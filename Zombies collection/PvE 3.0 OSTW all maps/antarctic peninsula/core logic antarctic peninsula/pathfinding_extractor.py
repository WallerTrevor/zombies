#!/usr/bin/env python3

import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
SOURCE = HERE / "allmapspathfinding.txt"
OUTPUT = HERE / "Local-pathfinding.json"
MAP_NAME = "Antarctic Peninsula"

GROUP_NAMES = ["nodes", "neighbors", "nextHops", "nodeInfo"]
ASSIGNMENT = "Global._extendedGlobalCollection[3] = "

class Reader:

    def __init__(self, text):
        self.text = text
        self.pos = 0

    def skip(self):
        while self.text[self.pos] in " \t\r\n,":
            self.pos += 1

    def take(self, word):
        if not self.text.startswith(word, self.pos):
            raise ValueError(f"expected {word!r} at: {self.text[self.pos:self.pos + 40]!r}")
        self.pos += len(word)

    def value(self):
        self.skip()
        if self.text.startswith("Array(", self.pos):
            self.take("Array(")
            items = []
            while True:
                self.skip()
                if self.text[self.pos] == ")":
                    self.pos += 1
                    return items
                items.append(self.value())
        self.take("Custom String(")
        self.skip()
        self.take('"')
        characters = []
        while self.text[self.pos] != '"':
            if self.text[self.pos] == "\\":
                characters.append(self.text[self.pos + 1])
                self.pos += 2
            else:
                characters.append(self.text[self.pos])
                self.pos += 1
        self.pos += 1
        self.skip()
        self.take(")")
        return "".join(characters)

def main():
    text = SOURCE.read_text(encoding="utf-8")
    title = f'rule("【Map】{MAP_NAME} (Floyd-Warshall)")'
    start = text.index(title)
    end = text.index("\n}\n", start)
    rule = text[start:end]
    groups = Reader(rule[rule.index(ASSIGNMENT) + len(ASSIGNMENT):]).value()
    if len(groups) != len(GROUP_NAMES):
        raise ValueError(f"expected {len(GROUP_NAMES)} groups, found {len(groups)}")
    for name, strings in zip(GROUP_NAMES, groups):
        longest = max(len(s) for s in strings)
        if longest > 128:
            raise ValueError(f"{name}: a string is {longest} characters long")
        print(f"{name}: {len(strings)} strings")
    result = {}
    result.update(zip(GROUP_NAMES, groups))
    OUTPUT.write_text(json.dumps(result, ensure_ascii=True, indent=2) + "\n", encoding="ascii")
    print(f"wrote {OUTPUT}")

if __name__ == "__main__":
    main()
