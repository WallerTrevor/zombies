import math  # Imports math for use in this script.
import re  # Imports re for use in this script.

INPUT_FILE = "kingsrowuncompressed.txt"  # Identifies the source file to parse.
OUTPUT_FILE = "kingsrow_lut.txt"  # Identifies where the generated lookup table is written.

def run_lut_generator():  # Defines the Run lut generator function.
    try:  # Starts a guarded operation whose failures are handled below.
        with open(INPUT_FILE, "r") as f:  # Opens the listed resource context for this block.
            content = f.read()  # Reads the selected file data into content.
    except FileNotFoundError:  # Handles FileNotFoundError raised by the guarded operation.
        print(f"Error: Could not find {INPUT_FILE}")  # Reports this result or status in the console.
        return  # Exits this function without returning a value.

    print("Extracting nodes...")  # Reports this result or status in the console.
    node_matches = re.findall(r"Vector\(([-\d.]+),\s*([-\d.]+),\s*([-\d.]+)\)", content)  # Extracts matching values from the source and stores them as node matches.
    nodes = [tuple(map(float, m)) for m in node_matches]  # Builds nodes by transforming the selected input entries.
    num_nodes = len(nodes)  # Counts the relevant entries and stores the total as num nodes.
    
    if num_nodes == 0:  # Checks whether num_nodes == 0 before entering this branch.
        print("Error: No nodes found! Check your input file format.")  # Reports this result or status in the console.
        return  # Exits this function without returning a value.
    print(f"Found {num_nodes} nodes.")  # Reports this result or status in the console.


    print("Extracting neighbors...")  # Reports this result or status in the console.

    neighbors_block_match = re.search(r"pfLoadedMap_neighbors\s*=\s*Array\(\s*(.*?)\s*\)\s*;", content, re.DOTALL)  # Finds the matching source section and stores it as neighbors block match.
    if not neighbors_block_match:  # Checks whether not neighbors_block_match before entering this branch.
        print("Error: Could not find neighbor block.")  # Reports this result or status in the console.
        return  # Exits this function without returning a value.
    
    neighbors_text = neighbors_block_match.group(1)  # Extracts the captured source text and stores it as neighbors text.
    
    node_neighbor_lists = re.findall(r"Array\((Array\(.*?\))\)", neighbors_text, re.DOTALL)  # Extracts matching values from the source and stores them as node neighbor lists.
    
    if len(node_neighbor_lists) != num_nodes:  # Checks whether len(node_neighbor_lists) != num_nodes before entering this branch.
        print(f"Warning: Node count ({num_nodes}) does not match neighbor lists ({len(node_neighbor_lists)}).")  # Reports this result or status in the console.

    dist = [[float('inf')] * num_nodes for _ in range(num_nodes)]  # Builds dist by transforming the selected input entries.
    next_node = [[-1] * num_nodes for _ in range(num_nodes)]  # Builds next node by transforming the selected input entries.

    for i in range(num_nodes):  # Processes each i from range(num_nodes).
        dist[i][i] = 0  # Provides this value as an entry in the enclosing data structure.
        next_node[i][i] = i  # Provides this value as an entry in the enclosing data structure.
        
        if i < len(node_neighbor_lists):  # Checks whether i < len(node_neighbor_lists) before entering this branch.
            neighbor_indices = re.findall(r"Array\((\d+),", node_neighbor_lists[i])  # Extracts matching values from the source and stores them as neighbor indices.
            for n_idx_str in neighbor_indices:  # Processes each n_idx_str from neighbor_indices.
                n_idx = int(n_idx_str)  # Sets n idx from the configured value or expression.
                d = math.sqrt(sum((nodes[i][k] - nodes[n_idx][k])**2 for k in range(3)))  # Calculates the distance and stores it as d.
                dist[i][n_idx] = d  # Provides this value as an entry in the enclosing data structure.
                next_node[i][n_idx] = n_idx  # Provides this value as an entry in the enclosing data structure.

    print("Computing paths... (O(N^3))")  # Reports this result or status in the console.
    for k in range(num_nodes):  # Processes each k from range(num_nodes).
        for i in range(num_nodes):  # Processes each i from range(num_nodes).
            for j in range(num_nodes):  # Processes each j from range(num_nodes).
                if dist[i][j] > dist[i][k] + dist[k][j]:  # Checks whether dist[i][j] > dist[i][k] + dist[k][j] before entering this branch.
                    dist[i][j] = dist[i][k] + dist[k][j]  # Provides this value as an entry in the enclosing data structure.
                    next_node[i][j] = next_node[i][k]  # Provides this value as an entry in the enclosing data structure.


    flattened = []  # Initializes flattened as an empty list for accumulating results.
    for row in next_node:  # Processes each row from next_node.
        flattened.extend(row)  # Adds the supplied value to flattened.

    with open(OUTPUT_FILE, "w") as f:  # Opens the listed resource context for this block.
        f.write(", ".join(map(str, flattened)))  # Calls f.write to perform this step.

    print(f"Success! Generated {len(flattened)} elements.")  # Reports this result or status in the console.
    print(f"Data saved to: {OUTPUT_FILE}")  # Reports this result or status in the console.

if __name__ == "__main__":  # Checks whether __name__ == "__main__" before entering this branch.
    run_lut_generator()  # Calls run_lut_generator to perform this step.