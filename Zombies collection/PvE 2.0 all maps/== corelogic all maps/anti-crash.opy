rule "anticrash (not truely enjoyed by most developers but not too noticable for most players)":
    @Condition getServerLoad() >= svrLdThreshold
    
    stability(85, 200)


rule "anticrash":
    @Condition getServerLoad() < svrLdThreshold
    
    setSlowMotion(100)


rule "148 Remove bots ANTI CRASH":
    @Condition getAverageServerLoad() >= svrLdThreshold
    @Disabled
    
    destroyDummy(Team.2, 17)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 16)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 15)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 14)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 13)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 12)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 11)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 10)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 9)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 8)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 7)
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    destroyDummy(Team.2, 6)


