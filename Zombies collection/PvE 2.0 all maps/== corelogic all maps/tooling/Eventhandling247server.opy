rule "68 player joined invincible":
    @Event playerJoined
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 30)
    eventPlayer.points = 500

rule "120  Remove bots when players join":
    #simplify and test this more to see how much is needed with anti crash enabled
    if getNumberOfPlayers(Team.1) == 2:
        #need a for loop
        destroyDummy(Team.2, 17)
        destroyDummy(Team.2, 16)
        destroyDummy(Team.2, 15)
        destroyDummy(Team.2, 14)
    elif getNumberOfPlayers(Team.1) == 3:
        destroyDummy(Team.2, 17)
        destroyDummy(Team.2, 16)
        destroyDummy(Team.2, 15)
        destroyDummy(Team.2, 14)
        destroyDummy(Team.2, 13)
        destroyDummy(Team.2, 12)
        destroyDummy(Team.2, 11)
        destroyDummy(Team.2, 10)
    elif getNumberOfPlayers(Team.1) == 4:
        destroyDummy(Team.2, 17)
        destroyDummy(Team.2, 16)
        destroyDummy(Team.2, 15)
        destroyDummy(Team.2, 14)
        destroyDummy(Team.2, 13)
        destroyDummy(Team.2, 12)
        destroyDummy(Team.2, 11)
        destroyDummy(Team.2, 10)
        destroyDummy(Team.2, 9)
        destroyDummy(Team.2, 8)


