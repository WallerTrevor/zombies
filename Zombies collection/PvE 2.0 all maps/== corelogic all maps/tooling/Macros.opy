#personal macros
macro stability(maxslow, svrload):
    setSlowMotion(100 - ((100 - maxslow) * getPeakServerLoad() - svrload) / (255 - svrload))


macro loopwait(loopItr, cycle):
    if not (loopItr % cycle): wait()