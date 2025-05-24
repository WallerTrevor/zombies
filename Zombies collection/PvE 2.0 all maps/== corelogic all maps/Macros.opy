#personal macros
macro stability(maxslow, svrload):
 setSlowMotion(100 - ((100 - maxslow) * (max(0, getServerLoad() - svrload) / (255 - svrload))))
