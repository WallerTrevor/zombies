#!/bin/sh

set -e

TOOLS="$(cd "$(dirname "$0")" && pwd)"
MAIN="$TOOLS/../antarctic peninsula/Main"
BUILD="$TOOLS/build"
mkdir -p "$BUILD"

OSTW="$(ls -d "$HOME"/.config/Code/User/globalStorage/deltin.overwatch-script-to-workshop/Server/bin/linux-x64/Deltinteger | tail -1)"
OVERPY="$(ls -d "$HOME"/.vscode/extensions/zezombye.overpy-* | sort -V | tail -1)"
NODE="/usr/share/code/code"
export ELECTRON_RUN_AS_NODE=1

mkdir -p "$BUILD/bin"
printf '#!/bin/sh\ncat > "%s"\n' "$BUILD/ostw.txt" > "$BUILD/bin/xclip"
chmod +x "$BUILD/bin/xclip"
rm -f "$BUILD/ostw.txt"
cd "$MAIN"
printf '\n' | PATH="$BUILD/bin:$PATH" "$OSTW" index.ostw > "$BUILD/ostw.log" 2>&1 || true
if [ ! -f "$BUILD/ostw.txt" ]; then
    echo "OSTW did not compile, see $BUILD/ostw.log"
    exit 1
fi
echo "OSTW: $(grep '^// Rule Element Count' "$BUILD/ostw.txt" | awk -F': ' '{s+=$2} END{print s}') elements (OSTW's count)"

cat > "$BUILD/overpy.js" <<EOF
const Module = require('module');
const path = require('path');
const original = Module._resolveFilename;
Module._resolveFilename = function (request, parent, ...rest) {
    if (request === './overpy_standalone' || request === './overpy') request = path.join('$OVERPY', 'npm', 'overpy.js');
    if (request === '../package.json') request = path.join('$OVERPY', 'package.json');
    return original.call(this, request, parent, ...rest);
};
require(path.join('$OVERPY', 'out', 'overpy_cli.js'));
EOF
cd "$BUILD"

"$NODE" overpy.js decompile -i ostw.txt -o decompiled.opy > decompile.log 2>&1

printf '#!optimizeForSize\n#!optimizeForSizeAggressive\n' > optimized.opy
cat decompiled.opy >> optimized.opy
"$NODE" overpy.js compile -i optimized.opy -o optimized.txt > optimized.log 2>&1
if grep -qi '^error' optimized.log; then
    echo "OverPy did not compile, see $BUILD/optimized.log"
    exit 1
fi

printf '#!debugElementCount\n' > count-plain.opy
cat decompiled.opy >> count-plain.opy
"$NODE" overpy.js compile -i count-plain.opy -o count-plain.txt > /dev/null 2>&1
printf '#!debugElementCount\n' > count-optimized.opy
cat optimized.opy >> count-optimized.opy
"$NODE" overpy.js compile -i count-optimized.opy -o count-optimized.txt > /dev/null 2>&1
echo "OverPy, no size optimizations: $(grep -o 'total [0-9]*' count-plain.txt | head -1)"
echo "OverPy, optimized for size:    $(grep -o 'total [0-9]*' count-optimized.txt | head -1)"
echo "Paste this into the Workshop: $BUILD/optimized.txt"
