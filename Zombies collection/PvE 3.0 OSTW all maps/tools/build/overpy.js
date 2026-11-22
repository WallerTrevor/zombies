const Module = require('module');
const path = require('path');
const original = Module._resolveFilename;
Module._resolveFilename = function (request, parent, ...rest) {
    if (request === './overpy_standalone' || request === './overpy') request = path.join('/home/trey/.vscode/extensions/zezombye.overpy-9.7.21', 'npm', 'overpy.js');
    if (request === '../package.json') request = path.join('/home/trey/.vscode/extensions/zezombye.overpy-9.7.21', 'package.json');
    return original.call(this, request, parent, ...rest);
};
require(path.join('/home/trey/.vscode/extensions/zezombye.overpy-9.7.21', 'out', 'overpy_cli.js'));
