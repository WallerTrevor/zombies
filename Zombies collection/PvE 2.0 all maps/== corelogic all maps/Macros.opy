#personal macros
macro stability(maxslow, serverload):
 setSlowMotion(100 - ((100 - maxslow) * (max(0, getServerLoad() - serverload) / (255 - serverload))))
