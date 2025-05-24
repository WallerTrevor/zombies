#personal macros
macro stability(maxslow, svrload):
 setSlowMotion(100 - ((100 - maxslow) * getServerLoad() - svrload) / (255 - svrload))
