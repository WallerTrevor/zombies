#!/usr/bin/env python3

import json
import math
from pathlib import Path

HERE = Path(__file__).resolve().parent
SOURCE = HERE / "Local-pathfinding.json"
MAP_DATA = HERE / "Local-uncompressed.json"
OUTPUT = HERE / "Local-pathfinding-zones.json"

BASE = 1024
UNREACHABLE = 6
RUN_LIMIT = 128
NODES_PER_STRING = 21
INFO_PER_STRING = 42
CHUNK = 128

def load_table():
    alphabet = (HERE / "alphabet.txt").read_text(encoding="utf-8").rstrip("\n")
    table = " " + alphabet
    first = {}
    for digit, character in enumerate(table):
        first.setdefault(character, digit)
    return table, first

def decode(data, digit_of):
    text = "".join(data["nodes"])
    nodes = []
    for start in range(0, len(text), 6):
        nodes.append(text[start:start + 6])
    neighbors = []
    current = []
    state = 0
    for string in data["neighbors"]:
        for character in string:
            value = digit_of[character]
            if state == 0:
                if value == 0:
                    neighbors.append(current)
                    current = []
                else:
                    current.append([value - 1, []])
                    state = 1
            else:
                if value == 0:
                    state = 0
                else:
                    current[-1][1].append(value - 1)
    info = "".join(data["nodeInfo"])
    hops = data["nextHops"]

    def hop_digit(position):
        return digit_of[hops[position // CHUNK][position % CHUNK]]

    def next_slot(node, goal):
        position = digit_of[info[node * 3]] * BASE + digit_of[info[node * 3 + 1]]
        remaining = goal
        digit = hop_digit(position)
        while remaining > digit % RUN_LIMIT:
            remaining -= digit % RUN_LIMIT + 1
            position += 1
            digit = hop_digit(position)
        return digit // RUN_LIMIT

    return nodes, neighbors, next_slot

def chunks(text, size):
    return [text[start:start + size] for start in range(0, len(text), size)] or [""]

def build_zone(members, nodes, neighbors, next_slot, table):
    local = {node: number for number, node in enumerate(members)}

    node_text = "".join(nodes[node] for node in members)

    neighbor_text = ""
    for node in members:
        for neighbor, attributes in neighbors[node]:
            neighbor_text += table[local[neighbor] + 1]
            neighbor_text += "".join(table[a + 1] for a in attributes)
            neighbor_text += table[0]
        neighbor_text += table[0]

    hop_text = ""
    row_starts = []
    for node in members:
        row_starts.append(len(hop_text))
        slots = [next_slot(node, goal) for goal in members]
        run_slot, run_length = slots[0], 0
        for slot in slots:
            if slot == run_slot and run_length < RUN_LIMIT:
                run_length += 1
            else:
                hop_text += table[run_slot * RUN_LIMIT + run_length - 1]
                run_slot, run_length = slot, 1
        hop_text += table[run_slot * RUN_LIMIT + run_length - 1]

    info_text = ""
    for start in row_starts:
        if start >= BASE * BASE:
            raise ValueError("next-hop table too long for 2 digits")
        info_text += table[start // BASE] + table[start % BASE] + table[0]

    return {
        "nodes": chunks(node_text, NODES_PER_STRING * 6),
        "neighbors": chunks(neighbor_text, CHUNK),
        "nextHops": chunks(hop_text, CHUNK),
        "nodeInfo": chunks(info_text, INFO_PER_STRING * 3),
    }

def check_zone(zone, members, neighbors, next_slot, digit_of):
    _, zone_neighbors, zone_next = decode(zone, digit_of)
    if len(zone_neighbors) != len(members):
        raise ValueError("wrong number of nodes after splitting")
    for a, node in enumerate(members):
        for b, goal in enumerate(members):
            if zone_next(a, b) != next_slot(node, goal):
                raise ValueError(f"path from {node} to {goal} changed")

def main():
    table, digit_of = load_table()
    data = json.loads(SOURCE.read_text(encoding="utf-8"))
    nodes, neighbors, next_slot = decode(data, digit_of)
    teleporters = json.loads(MAP_DATA.read_text(encoding="utf-8"))["twoDvectorsArray"]["teleporterpositions"]

    def position(node):
        text = nodes[node]
        return [(digit_of[text[k * 2]] * BASE + digit_of[text[k * 2 + 1]] - 524288) / 100 for k in range(3)]

    zone_of = [min(range(len(teleporters)), key=lambda z: math.dist(position(n), teleporters[z])) for n in range(len(nodes))]
    for node in range(len(nodes)):
        for neighbor, _ in neighbors[node]:
            if zone_of[neighbor] != zone_of[node]:
                raise ValueError(f"nodes {node} and {neighbor} are linked across zones")

    result = {}
    for zone in range(len(teleporters)):
        members = [n for n in range(len(nodes)) if zone_of[n] == zone]
        graph = build_zone(members, nodes, neighbors, next_slot, table)
        check_zone(graph, members, neighbors, next_slot, digit_of)
        result[f"zone{zone + 1}"] = graph
        sizes = {name: sum(len(s) for s in strings) for name, strings in graph.items()}
        print(f"zone {zone + 1}: {len(members)} nodes, characters {sizes}")
    whole = {name: sum(len(s) for s in data[name]) for name in ["nodes", "neighbors", "nextHops", "nodeInfo"]}
    print(f"whole map before: {len(nodes)} nodes, characters {whole}")
    OUTPUT.write_text(json.dumps(result, ensure_ascii=True, indent=2) + "\n", encoding="ascii")
    print(f"wrote {OUTPUT}")

if __name__ == "__main__":
    main()
