import os

MARKER_PREFIXES = ("<<<<<<<", "=======", ">>>>>>>")

def is_marker_line(line: str) -> bool:
    stripped = line.lstrip()
    return stripped.startswith(MARKER_PREFIXES)

def clean_file(path: str) -> bool:
    try:
        with open(path, "r", encoding="utf-8", errors="ignore") as f:
            lines = f.readlines()
    except Exception:
        return False

    cleaned = [line for line in lines if not is_marker_line(line)]

    if cleaned != lines:
        with open(path, "w", encoding="utf-8") as f:
            f.writelines(cleaned)
        return True

    return False

def main():
    modified = []

    for root, dirs, files in os.walk("."):
        # Skip .git directory entirely
        if ".git" in dirs:
            dirs.remove(".git")

        for file in files:
            path = os.path.join(root, file)
            if clean_file(path):
                modified.append(path)

    if modified:
        print("Removed merge-conflict artifacts from:")
        for path in modified:
            print(" ", path)
    else:
        print("No merge-conflict artifacts found.")

if __name__ == "__main__":
    main()
