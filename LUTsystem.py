import math
import re

INPUT_FILE = "kingsrowuncompressed.txt"
OUTPUT_FILE = "kingsrow_lut.txt"

def run_lut_generator():
    try:
        with open(INPUT_FILE, "r") as f:
            content = f.read()
    except FileNotFoundError:
        print(f"Error: Could not find {INPUT_FILE}")
        return

    print("Extracting nodes...")
    node_matches = re.findall(r"Vector\(([-\d.]+),\s*([-\d.]+),\s*([-\d.]+)\)", content)
    nodes = [tuple(map(float, m)) for m in node_matches]
    num_nodes = len(nodes)
    
    if num_nodes == 0:
        print("Error: No nodes found! Check your input file format.")
        return
    print(f"Found {num_nodes} nodes.")


    print("Extracting neighbors...")

    neighbors_block_match = re.search(r"pfLoadedMap_neighbors\s*=\s*Array\(\s*(.*?)\s*\)\s*;", content, re.DOTALL)
    if not neighbors_block_match:
        print("Error: Could not find neighbor block.")
        return
    
    neighbors_text = neighbors_block_match.group(1)
    
    node_neighbor_lists = re.findall(r"Array\((Array\(.*?\))\)", neighbors_text, re.DOTALL)
    
    if len(node_neighbor_lists) != num_nodes:
        print(f"Warning: Node count ({num_nodes}) does not match neighbor lists ({len(node_neighbor_lists)}).")

    dist = [[float('inf')] * num_nodes for _ in range(num_nodes)]
    next_node = [[-1] * num_nodes for _ in range(num_nodes)]

    for i in range(num_nodes):
        dist[i][i] = 0
        next_node[i][i] = i
        
        if i < len(node_neighbor_lists):
            neighbor_indices = re.findall(r"Array\((\d+),", node_neighbor_lists[i])
            for n_idx_str in neighbor_indices:
                n_idx = int(n_idx_str)
                d = math.sqrt(sum((nodes[i][k] - nodes[n_idx][k])**2 for k in range(3)))
                dist[i][n_idx] = d
                next_node[i][n_idx] = n_idx

    print("Computing paths... (O(N^3))")
    for k in range(num_nodes):
        for i in range(num_nodes):
            for j in range(num_nodes):
                if dist[i][j] > dist[i][k] + dist[k][j]:
                    dist[i][j] = dist[i][k] + dist[k][j]
                    next_node[i][j] = next_node[i][k]


    flattened = []
    for row in next_node:
        flattened.extend(row)

    with open(OUTPUT_FILE, "w") as f:
        f.write(", ".join(map(str, flattened)))

    print(f"Success! Generated {len(flattened)} elements.")
    print(f"Data saved to: {OUTPUT_FILE}")

if __name__ == "__main__":
    run_lut_generator()