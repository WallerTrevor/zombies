#!/usr/bin/env python3
"""
OverPy -> local-compressed.json converter

Input:
    Local-uncompressed.json

The input is intentionally treated as OverPy source, despite the .json
extension. It is expected to contain assignments such as:

    twoDvectorsArray = [
        compress([vect(-75.223, 0.149, 5.852), ...]),
        compress([...]),
        ...
    ]

    twoDnumbersArray = [
        compress([5000, 10000, 20000]),
        compress([1000, 2000, 4000]),
        ...
    ]

The script preserves the structure as JSON and replaces each compress(...)
with compressed data.

Put this script next to:
    Local-uncompressed.json
    alphabet.txt

alphabet.txt must contain exactly 1024 unique characters from your
pfcompressionTable.

Run:
    python local_compressor.py

Output:
    Local-compressed.json
"""

from pathlib import Path  # Imports Path from pathlib for use in this script.
import json  # Imports json for use in this script.
import math  # Imports math for use in this script.
import re  # Imports re for use in this script.

HERE = Path(__file__).resolve().parent  # Locates this script?s directory for adjacent input and output files.
INPUT = HERE / "Local-uncompressed.json"  # Builds the path to the uncompressed source data.
OUTPUT = HERE / "Local-compressed.json"  # Builds the path for the compressed output data.
ALPHABET_FILE = HERE / "alphabet.txt"  # Builds the path to the character alphabet used for compression.

# ---------------------------------------------------------------------------
# General parser helpers
# ---------------------------------------------------------------------------

NUMBER_RE = re.compile(  # Compiles the pattern used to recognize numeric values.
    r"[+-]?(?:(?:\d+(?:\.\d*)?)|(?:\.\d+))(?:[eE][+-]?\d+)?"  # Provides this value as an entry in the enclosing data structure.
)  # Closes the continued call or expression.


def split_top_level(text):  # Defines the Split top level function.
    """Split a comma-separated expression without splitting nested arrays."""  # Provides this value as an entry in the enclosing data structure.
    parts = []  # Initializes parts as an empty list for accumulating results.
    start = 0  # Sets start from the configured value or expression.
    depth = 0  # Sets depth from the configured value or expression.
    quote = False  # Sets quote from the configured value or expression.
    escaped = False  # Sets escaped from the configured value or expression.

    for i, char in enumerate(text):  # Processes each i, char from enumerate(text).
        if quote:  # Checks whether quote before entering this branch.
            if escaped:  # Checks whether escaped before entering this branch.
                escaped = False  # Sets escaped from the configured value or expression.
            elif char == "\\":  # Checks the alternate condition char == "\\".
                escaped = True  # Sets escaped from the configured value or expression.
            elif char == '"':  # Checks the alternate condition char == '"'.
                quote = False  # Sets quote from the configured value or expression.
            continue  # Skips to the next iteration of the current loop.

        if char == '"':  # Checks whether char == '"' before entering this branch.
            quote = True  # Sets quote from the configured value or expression.
        elif char in "[({":  # Checks the alternate condition char in "[({".
            depth += 1  # Updates depth using the + operation.
        elif char in "])}":  # Checks the alternate condition char in "])}".
            depth -= 1  # Updates depth using the - operation.
        elif char == "," and depth == 0:  # Checks the alternate condition char == "," and depth == 0.
            value = text[start:i].strip()  # Removes surrounding whitespace and stores the cleaned value as value.
            if value:  # Checks whether value before entering this branch.
                parts.append(value)  # Adds the supplied value to parts.
            start = i + 1  # Sets start from the configured value or expression.

    value = text[start:].strip()  # Removes surrounding whitespace and stores the cleaned value as value.
    if value:  # Checks whether value before entering this branch.
        parts.append(value)  # Adds the supplied value to parts.

    return parts  # Returns parts to the caller.


def find_matching_bracket(text, start):  # Defines the Find matching bracket function.
    """Find the matching ] for an array beginning at start."""  # Provides this value as an entry in the enclosing data structure.
    if text[start] != "[":  # Checks whether text[start] != "[" before entering this branch.
        raise ValueError("find_matching_bracket() requires '['")  # Raises ValueError("find_matching_bracket() requires '['") to report this failure.

    depth = 0  # Sets depth from the configured value or expression.
    quote = False  # Sets quote from the configured value or expression.
    escaped = False  # Sets escaped from the configured value or expression.

    for i in range(start, len(text)):  # Processes each i from range(start, len(text)).
        char = text[i]  # Sets char from the configured value or expression.

        if quote:  # Checks whether quote before entering this branch.
            if escaped:  # Checks whether escaped before entering this branch.
                escaped = False  # Sets escaped from the configured value or expression.
            elif char == "\\":  # Checks the alternate condition char == "\\".
                escaped = True  # Sets escaped from the configured value or expression.
            elif char == '"':  # Checks the alternate condition char == '"'.
                quote = False  # Sets quote from the configured value or expression.
            continue  # Skips to the next iteration of the current loop.

        if char == '"':  # Checks whether char == '"' before entering this branch.
            quote = True  # Sets quote from the configured value or expression.
        elif char == "[":  # Checks the alternate condition char == "[".
            depth += 1  # Updates depth using the + operation.
        elif char == "]":  # Checks the alternate condition char == "]".
            depth -= 1  # Updates depth using the - operation.
            if depth == 0:  # Checks whether depth == 0 before entering this branch.
                return i  # Returns i to the caller.

    raise ValueError("Unterminated array")  # Raises ValueError("Unterminated array") to report this failure.


def extract_assignment(text, variable):  # Defines the Extract assignment function.
    """
    Extract the complete [ ... ] belonging to:

        variable = [ ... ]
    """
    match = re.search(  # Finds the matching source section and stores it as match.
        rf"\b{re.escape(variable)}\s*=\s*\[",  # Provides this value as an entry in the enclosing data structure.
        text  # Provides this value as an entry in the enclosing data structure.
    )  # Closes the continued call or expression.

    if not match:  # Checks whether not match before entering this branch.
        raise ValueError(f"Could not find {variable}")  # Raises ValueError(f"Could not find {variable}") to report this failure.

    array_start = text.find("[", match.start())  # Computes array start from the current input.
    array_end = find_matching_bracket(text, array_start)  # Sets array end from the configured value or expression.

    return text[array_start:array_end + 1]  # Returns text[array_start:array_end + 1] to the caller.


def extract_compress_argument(expression):  # Defines the Extract compress argument function.
    """
    Extract the contents of:

        compress(...)
    """
    match = re.match(  # Finds the matching source section and stores it as match.
        r"\s*compress\s*\(",  # Provides this value as an entry in the enclosing data structure.
        expression,  # Provides this value as an entry in the enclosing data structure.
        re.IGNORECASE  # Provides this value as an entry in the enclosing data structure.
    )  # Closes the continued call or expression.

    if not match:  # Checks whether not match before entering this branch.
        raise ValueError(  # Raises ValueError( to report this failure.
            f"Expected compress(...), got: {expression[:100]}"  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.

    open_paren = expression.find("(", match.start())  # Computes open paren from the current input.

    depth = 0  # Sets depth from the configured value or expression.
    quote = False  # Sets quote from the configured value or expression.
    escaped = False  # Sets escaped from the configured value or expression.

    for i in range(open_paren, len(expression)):  # Processes each i from range(open_paren, len(expression)).
        char = expression[i]  # Sets char from the configured value or expression.

        if quote:  # Checks whether quote before entering this branch.
            if escaped:  # Checks whether escaped before entering this branch.
                escaped = False  # Sets escaped from the configured value or expression.
            elif char == "\\":  # Checks the alternate condition char == "\\".
                escaped = True  # Sets escaped from the configured value or expression.
            elif char == '"':  # Checks the alternate condition char == '"'.
                quote = False  # Sets quote from the configured value or expression.
            continue  # Skips to the next iteration of the current loop.

        if char == '"':  # Checks whether char == '"' before entering this branch.
            quote = True  # Sets quote from the configured value or expression.
        elif char == "(":  # Checks the alternate condition char == "(".
            depth += 1  # Updates depth using the + operation.
        elif char == ")":  # Checks the alternate condition char == ")".
            depth -= 1  # Updates depth using the - operation.
            if depth == 0:  # Checks whether depth == 0 before entering this branch.
                argument = expression[  # Sets argument from the configured value or expression.
                    open_paren + 1:i  # Provides this value as an entry in the enclosing data structure.
                ].strip()  # Continues the surrounding operation.

                if expression[i + 1:].strip():  # Checks whether expression[i + 1:].strip() before entering this branch.
                    raise ValueError(  # Raises ValueError( to report this failure.
                        "Unexpected text after compress(...)"  # Provides this value as an entry in the enclosing data structure.
                    )  # Closes the continued call or expression.

                return argument  # Returns argument to the caller.

    raise ValueError("Unterminated compress(...)")  # Raises ValueError("Unterminated compress(...)") to report this failure.


# ---------------------------------------------------------------------------
# Parsing vect(...) and number arrays
# ---------------------------------------------------------------------------

def parse_vector_array(array_expression):  # Defines the Parse vector array function.
    """
    Parse:

        [vect(x,y,z), vect(x,y,z), ...]
    """
    if not array_expression.startswith("["):  # Checks whether not array_expression.startswith("[") before entering this branch.
        raise ValueError("Expected vector array")  # Raises ValueError("Expected vector array") to report this failure.

    end = find_matching_bracket(array_expression, 0)  # Sets end from the configured value or expression.

    if array_expression[end + 1:].strip():  # Checks whether array_expression[end + 1:].strip() before entering this branch.
        raise ValueError("Unexpected text after vector array")  # Raises ValueError("Unexpected text after vector array") to report this failure.

    entries = split_top_level(  # Sets entries from the configured value or expression.
        array_expression[1:end]  # Provides this value as an entry in the enclosing data structure.
    )  # Closes the continued call or expression.

    vectors = []  # Initializes vectors as an empty list for accumulating results.

    for entry in entries:  # Processes each entry from entries.
        match = re.fullmatch(  # Sets match from the configured value or expression.
            rf"""
            \s*vect\s*\(\s*
            ({NUMBER_RE.pattern})
            \s*,\s*
            ({NUMBER_RE.pattern})
            \s*,\s*
            ({NUMBER_RE.pattern})
            \s*\)\s*
            """,  # Closes the multiline pattern argument.
            entry,  # Provides this value as an entry in the enclosing data structure.
            re.VERBOSE | re.IGNORECASE  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.

        if not match:  # Checks whether not match before entering this branch.
            raise ValueError(  # Raises ValueError( to report this failure.
                f"Could not parse vector:\n{entry[:150]}"  # Provides this value as an entry in the enclosing data structure.
            )  # Closes the continued call or expression.

        vectors.append(  # Adds the supplied value to vectors.
            [  # Continues the surrounding operation.
                float(match.group(1)),  # Calls float to perform this step.
                float(match.group(2)),  # Calls float to perform this step.
                float(match.group(3)),  # Calls float to perform this step.
            ]  # Closes the current list or indexed expression.
        )  # Closes the continued call or expression.

    return vectors  # Returns vectors to the caller.


def parse_number_array(array_expression):  # Defines the Parse number array function.
    """
    Parse:

        [1, 2, 3, -7, 0.25, ...]
    """
    if not array_expression.startswith("["):  # Checks whether not array_expression.startswith("[") before entering this branch.
        raise ValueError("Expected number array")  # Raises ValueError("Expected number array") to report this failure.

    end = find_matching_bracket(array_expression, 0)  # Sets end from the configured value or expression.

    if array_expression[end + 1:].strip():  # Checks whether array_expression[end + 1:].strip() before entering this branch.
        raise ValueError("Unexpected text after number array")  # Raises ValueError("Unexpected text after number array") to report this failure.

    entries = split_top_level(  # Sets entries from the configured value or expression.
        array_expression[1:end]  # Provides this value as an entry in the enclosing data structure.
    )  # Closes the continued call or expression.

    numbers = []  # Initializes numbers as an empty list for accumulating results.

    for entry in entries:  # Processes each entry from entries.
        entry = entry.strip()  # Removes surrounding whitespace and stores the cleaned value as entry.

        if not NUMBER_RE.fullmatch(entry):  # Checks whether not NUMBER_RE.fullmatch(entry) before entering this branch.
            raise ValueError(  # Raises ValueError( to report this failure.
                f"Could not parse number: {entry!r}"  # Provides this value as an entry in the enclosing data structure.
            )  # Closes the continued call or expression.

        numbers.append(float(entry))  # Adds the supplied value to numbers.

    return numbers  # Returns numbers to the caller.


# ---------------------------------------------------------------------------
# Alphabet
# ---------------------------------------------------------------------------

def load_alphabet():  # Defines the Load alphabet function.
    if not ALPHABET_FILE.exists():  # Checks whether not ALPHABET_FILE.exists() before entering this branch.
        raise FileNotFoundError(  # Raises FileNotFoundError( to report this failure.
            "alphabet.txt was not found next to this script.\n"  # Provides this value as an entry in the enclosing data structure.
            "Put your exact 1024-character pfcompressionTable in "  # Provides this value as an entry in the enclosing data structure.
            "alphabet.txt."  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.

    alphabet = ALPHABET_FILE.read_text(  # Reads the selected file data into alphabet.
        encoding="utf-8"  # Computes encoding from the current input.
    )  # Closes the continued call or expression.

    # Permit the normal newline at the end of a text file.
    if alphabet.endswith("\r\n"):  # Checks whether alphabet.endswith("\r\n") before entering this branch.
        alphabet = alphabet[:-2]  # Computes alphabet from the current input.
    elif alphabet.endswith("\n"):  # Checks the alternate condition alphabet.endswith("\n").
        alphabet = alphabet[:-1]  # Computes alphabet from the current input.

    if len(alphabet) != 1024:  # Checks whether len(alphabet) != 1024 before entering this branch.
        raise ValueError(  # Raises ValueError( to report this failure.
            "alphabet.txt must contain exactly 1024 characters. "
            f"Found {len(alphabet)}."  # Completes the formatted string value.
        )  # Closes the continued call or expression.

    if len(set(alphabet)) != 1024:  # Checks whether len(set(alphabet)) != 1024 before entering this branch.
        raise ValueError(  # Raises ValueError( to report this failure.
            "alphabet.txt contains duplicate characters."  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.

    return alphabet  # Returns alphabet to the caller.


# ---------------------------------------------------------------------------
# Base-1024 compression
# ---------------------------------------------------------------------------

def encode_base1024(value, width, alphabet):  # Defines the Encode base1024 function.
    """
    Encode an unsigned integer as exactly `width` base-1024 characters.

    Base 1024 = 2^10, so every character carries exactly 10 bits.
    """
    if value < 0:  # Checks whether value < 0 before entering this branch.
        raise ValueError("Cannot encode a negative unsigned integer")  # Raises ValueError("Cannot encode a negative unsigned integer") to report this failure.

    result = []  # Initializes result as an empty list for accumulating results.

    for _ in range(width):  # Processes each _ from range(width).
        digit = value & 1023  # Computes digit from the current input.
        result.append(alphabet[digit])  # Adds the supplied value to result.
        value >>= 10  # Provides this value as an entry in the enclosing data structure.

    if value != 0:  # Checks whether value != 0 before entering this branch.
        raise ValueError(  # Raises ValueError( to report this failure.
            "Integer does not fit in requested base-1024 width"  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.

    return "".join(result)  # Returns "".join(result) to the caller.


def compress_integer_values(values, alphabet, decimals):  # Defines the Compress integer values function.
    """
    Compress one numeric array.

    Values are converted to fixed-point integers, offset so that the minimum
    value becomes zero, then encoded using fixed-width base-1024 digits.
    """
    scale = 10 ** decimals  # Sets scale from the configured value or expression.

    integer_values = [  # Sets integer values from the configured value or expression.
        int(round(value * scale))  # Calls int to perform this step.
        for value in values  # Starts this iteration over the selected values.
    ]  # Closes the current list or indexed expression.

    minimum = min(integer_values)  # Sets minimum from the configured value or expression.
    offset = -minimum if minimum < 0 else 0  # Computes offset from the current input.

    shifted = [  # Sets shifted from the configured value or expression.
        value + offset  # Provides this value as an entry in the enclosing data structure.
        for value in integer_values  # Starts this iteration over the selected values.
    ]  # Closes the current list or indexed expression.

    maximum = max(shifted)  # Sets maximum from the configured value or expression.

    width = max(  # Sets width from the configured value or expression.
        1,  # Provides this value as an entry in the enclosing data structure.
        math.ceil(maximum.bit_length() / 10)  # Calls math.ceil to perform this step.
    )  # Closes the continued call or expression.

    payload = "".join(  # Computes payload from the current input.
        encode_base1024(  # Calls encode_base1024 to perform this step.
            value,  # Provides this value as an entry in the enclosing data structure.
            width,  # Provides this value as an entry in the enclosing data structure.
            alphabet  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.
        for value in shifted  # Starts this iteration over the selected values.
    )  # Closes the continued call or expression.

    return {  # Returns { to the caller.
        "type": "numbers",  # Sets the 'type' value in this configuration or lookup table.
        "decimals": decimals,  # Sets the 'decimals' value in this configuration or lookup table.
        "offset": offset,  # Sets the 'offset' value in this configuration or lookup table.
        "width": width,  # Sets the 'width' value in this configuration or lookup table.
        "count": len(values),  # Sets the 'count' value in this configuration or lookup table.
        "data": payload,  # Sets the 'data' value in this configuration or lookup table.
    }  # Closes the current mapping or grouped expression.


def compress_vector_values(vectors, alphabet, decimals):  # Defines the Compress vector values function.
    """
    Compress one vect(...) array.

    Coordinates are quantized to `decimals`, globally offset, then encoded
    X,Y,Z for every vector.
    """
    scale = 10 ** decimals  # Sets scale from the configured value or expression.

    integer_vectors = [  # Sets integer vectors from the configured value or expression.
        [  # Continues the surrounding operation.
            int(round(component * scale))  # Calls int to perform this step.
            for component in vector  # Starts this iteration over the selected values.
        ]  # Closes the current list or indexed expression.
        for vector in vectors  # Starts this iteration over the selected values.
    ]  # Closes the current list or indexed expression.

    minimum = min(  # Sets minimum from the configured value or expression.
        component  # Provides this value as an entry in the enclosing data structure.
        for vector in integer_vectors  # Starts this iteration over the selected values.
        for component in vector  # Starts this iteration over the selected values.
    )  # Closes the continued call or expression.

    offset = -minimum if minimum < 0 else 0  # Computes offset from the current input.

    shifted = [  # Sets shifted from the configured value or expression.
        [  # Continues the surrounding operation.
            component + offset  # Provides this value as an entry in the enclosing data structure.
            for component in vector  # Starts this iteration over the selected values.
        ]  # Closes the current list or indexed expression.
        for vector in integer_vectors  # Starts this iteration over the selected values.
    ]  # Closes the current list or indexed expression.

    maximum = max(  # Sets maximum from the configured value or expression.
        component  # Provides this value as an entry in the enclosing data structure.
        for vector in shifted  # Starts this iteration over the selected values.
        for component in vector  # Starts this iteration over the selected values.
    )  # Closes the continued call or expression.

    width = max(  # Sets width from the configured value or expression.
        1,  # Provides this value as an entry in the enclosing data structure.
        math.ceil(maximum.bit_length() / 10)  # Calls math.ceil to perform this step.
    )  # Closes the continued call or expression.

    payload = "".join(  # Computes payload from the current input.
        encode_base1024(  # Calls encode_base1024 to perform this step.
            component,  # Provides this value as an entry in the enclosing data structure.
            width,  # Provides this value as an entry in the enclosing data structure.
            alphabet  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.
        for vector in shifted  # Starts this iteration over the selected values.
        for component in vector  # Starts this iteration over the selected values.
    )  # Closes the continued call or expression.

    return {  # Returns { to the caller.
        "type": "vectors",  # Sets the 'type' value in this configuration or lookup table.
        "decimals": decimals,  # Sets the 'decimals' value in this configuration or lookup table.
        "offset": offset,  # Sets the 'offset' value in this configuration or lookup table.
        "width": width,  # Sets the 'width' value in this configuration or lookup table.
        "count": len(vectors),  # Sets the 'count' value in this configuration or lookup table.
        "data": payload,  # Sets the 'data' value in this configuration or lookup table.
    }  # Closes the current mapping or grouped expression.


# ---------------------------------------------------------------------------
# Conversion
# ---------------------------------------------------------------------------

def compress_entry(entry, alphabet):  # Defines the Compress entry function.
    """
    Convert one:

        compress([...])

    into a JSON object describing the compressed data.
    """
    argument = extract_compress_argument(entry)  # Sets argument from the configured value or expression.

    argument = argument.strip()  # Removes surrounding whitespace and stores the cleaned value as argument.

    if not argument.startswith("["):  # Checks whether not argument.startswith("[") before entering this branch.
        raise ValueError(  # Raises ValueError( to report this failure.
            "compress() argument must be an array"  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.

    if re.search(  # Checks whether re.search( before entering this branch.
        r"\bvect\s*\(",  # Provides this value as an entry in the enclosing data structure.
        argument,  # Provides this value as an entry in the enclosing data structure.
        re.IGNORECASE  # Provides this value as an entry in the enclosing data structure.
    ):  # Continues the surrounding operation.
        vectors = parse_vector_array(argument)  # Sets vectors from the configured value or expression.

        # Your existing vector data uses up to 3 decimal places.
        return compress_vector_values(  # Returns compress_vector_values( to the caller.
            vectors,  # Provides this value as an entry in the enclosing data structure.
            alphabet,  # Provides this value as an entry in the enclosing data structure.
            decimals=3  # Sets decimals from the configured value or expression.
        )  # Closes the continued call or expression.

    numbers = parse_number_array(argument)  # Sets numbers from the configured value or expression.

    # Numbers in your example contain both integers and decimal values.
    return compress_integer_values(  # Returns compress_integer_values( to the caller.
        numbers,  # Provides this value as an entry in the enclosing data structure.
        alphabet,  # Provides this value as an entry in the enclosing data structure.
        decimals=3  # Sets decimals from the configured value or expression.
    )  # Closes the continued call or expression.


def compress_assignment(text, variable, alphabet):  # Defines the Compress assignment function.
    """
    Find one assignment and convert every top-level compress() inside it.
    """
    array_expression = extract_assignment(  # Sets array expression from the configured value or expression.
        text,  # Provides this value as an entry in the enclosing data structure.
        variable  # Provides this value as an entry in the enclosing data structure.
    )  # Closes the continued call or expression.

    end = find_matching_bracket(  # Sets end from the configured value or expression.
        array_expression,  # Provides this value as an entry in the enclosing data structure.
        0  # Provides this value as an entry in the enclosing data structure.
    )  # Closes the continued call or expression.

    entries = split_top_level(  # Sets entries from the configured value or expression.
        array_expression[1:end]  # Provides this value as an entry in the enclosing data structure.
    )  # Closes the continued call or expression.

    compressed = []  # Initializes compressed as an empty list for accumulating results.

    for index, entry in enumerate(entries):  # Processes each index, entry from enumerate(entries).
        try:  # Starts a guarded operation whose failures are handled below.
            compressed.append(  # Adds the supplied value to compressed.
                compress_entry(  # Calls compress_entry to perform this step.
                    entry,  # Provides this value as an entry in the enclosing data structure.
                    alphabet  # Provides this value as an entry in the enclosing data structure.
                )  # Closes the continued call or expression.
            )  # Closes the continued call or expression.
        except Exception as error:  # Handles Exception as error raised by the guarded operation.
            raise ValueError(  # Raises ValueError( to report this failure.
                f"{variable}, compress entry {index}: {error}"  # Provides this value as an entry in the enclosing data structure.
            ) from error  # Continues the surrounding operation.

    return compressed  # Returns compressed to the caller.


def main():  # Defines the Main function.
    print("Loading compression alphabet...")  # Reports this result or status in the console.
    alphabet = load_alphabet()  # Sets alphabet from the configured value or expression.

    print(f"Reading {INPUT.name}...")  # Reports this result or status in the console.
    source = INPUT.read_text(  # Reads the selected file data into source.
        encoding="utf-8"  # Computes encoding from the current input.
    )  # Closes the continued call or expression.

    result = {}  # Initializes result as an empty lookup table.

    # These are the arrays actually present in the supplied example.
    assignments = [  # Sets assignments from the configured value or expression.
        "twoDvectorsArray",  # Provides this value as an entry in the enclosing data structure.
        "twoDnumbersArray2",  # Provides this value as an entry in the enclosing data structure.
        "twoDnumbersArray",  # Provides this value as an entry in the enclosing data structure.
    ]  # Closes the current list or indexed expression.

    for variable in assignments:  # Processes each variable from assignments.
        try:  # Starts a guarded operation whose failures are handled below.
            compressed = compress_assignment(  # Sets compressed from the configured value or expression.
                source,  # Provides this value as an entry in the enclosing data structure.
                variable,  # Provides this value as an entry in the enclosing data structure.
                alphabet  # Provides this value as an entry in the enclosing data structure.
            )  # Closes the continued call or expression.

            result[variable] = compressed  # Provides this value as an entry in the enclosing data structure.

            print(  # Reports this result or status in the console.
                f"{variable}: "
                f"{len(compressed)} chunks compressed"  # Completes the formatted string value.
            )  # Closes the continued call or expression.

        except ValueError as error:  # Handles ValueError as error raised by the guarded operation.
            print(  # Reports this result or status in the console.
                f"Skipping {variable}: {error}"  # Provides this value as an entry in the enclosing data structure.
            )  # Closes the continued call or expression.

    if not result:  # Checks whether not result before entering this branch.
        raise RuntimeError(  # Raises RuntimeError( to report this failure.
            "No recognized arrays were found."  # Provides this value as an entry in the enclosing data structure.
        )  # Closes the continued call or expression.

    OUTPUT.write_text(  # Calls OUTPUT.write_text to perform this step.
        json.dumps(  # Calls json.dumps to perform this step.
            result,  # Provides this value as an entry in the enclosing data structure.
            ensure_ascii=False,  # Sets ensure ascii from the configured value or expression.
            indent=2  # Sets indent from the configured value or expression.
        ),  # Closes the continued call or expression.
        encoding="utf-8"  # Computes encoding from the current input.
    )  # Closes the continued call or expression.

    print()  # Reports this result or status in the console.
    print(f"Done: {OUTPUT}")  # Reports this result or status in the console.


if __name__ == "__main__":  # Checks whether __name__ == "__main__" before entering this branch.
    main()  # Calls main to perform this step.
