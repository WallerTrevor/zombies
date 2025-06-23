#personal macros
macro stability(maxslow, svrload):
    setSlowMotion(100 - ((100 - maxslow) * getServerLoad() - svrload) / (255 - svrload))

macro loopwait(theloopvar, howOften):
    if theloopvar / howOften == floor(theloopvar / howOften):
        wait()

macro loopWait(loopItr, cycle):
    if not (loopItr % cycle): wait()