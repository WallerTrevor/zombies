#personal macros
macro stability(maxslow, svrload):
    setSlowMotion(100 - ((100 - maxslow) * getPeakServerLoad() - svrload) / (255 - svrload))


macro loopwait(loopItr, cycle):
    if not (loopItr % cycle): wait()

macro compN(var, data):
    decompressN = compress(data)
    decompressNSub()
    var = decompressN

macro compV(var, data):
    decompressV = compress(data)
    decompressVSub()
    var = decompressV
