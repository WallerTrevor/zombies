rule "426 OMNIC WAVE BOSS doomfist Attack if Near":
    @Event eachPlayer
    @Team 2
    @Hero doomfist
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 2
    #@Condition O == false
    
    wait(0.3, Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.MELEE)
    if ruleCondition:
        loop()


rule "427 OMNIC WAVE BOSS doomfist Attack if Near":
    @Event eachPlayer
    @Team 2
    @Hero doomfist
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 15
    @Condition O == false
    
    wait(0.3, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)


rule "428 OMNIC WAVE BOSS doomfist Attack if Near":
    @Event eachPlayer
    @Team 2
    @Hero doomfist
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 10
    @Condition O == false
    
    wait(0.3, Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_1)


rule "429 OMNIC WAVE BOSS zenyatta Attack if Near":
    @Event eachPlayer
    @Team 2
    @Hero zenyatta
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 2
    #@Condition O == false
    
    wait(0.3, Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.MELEE)
    if ruleCondition:
        loop()


rule "430 OMNIC WAVE BOSS zenyatta stay crouched":
    @Event eachPlayer
    @Team 2
    @Hero zenyatta
    @Condition eventPlayer.hasSpawned() == true
    
    wait(0.25)
    eventPlayer.startForcingButton(Button.CROUCH)
    eventPlayer.setUltCharge(100)


rule "431 OMNIC WAVE BOSS zenyatta give ult halfl health":
    @Event eachPlayer
    @Team 2
    @Hero zenyatta
    @Condition eventPlayer.getNormalizedHealth() <= 0.5
    
    eventPlayer.forceButtonPress(Button.ULTIMATE)


rule "432 OMNIC WAVE BOSS zenyatta discord if Near":
    @Event eachPlayer
    @Team 2
    @Hero zenyatta
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 10
    #@Condition O == false
    
    wait(0.3, Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    #if ruleCondition:
    #        loop()


rule "433 OMNIC WAVE BOSS roadhog use hook":
    @Event eachPlayer
    @Team 2
    @Hero roadhog
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 20
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) > 10
    @Condition eventPlayer.getSlot() == getPlayersInSlot(0, Team.2)
    
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(1)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(15)


rule "434 OMNIC WAVE BOSS roadhog use heal":
    @Event eachPlayer
    @Team 2
    @Hero roadhog
    @Condition eventPlayer.getNormalizedHealth() <= 0.5
    
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    wait(3)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)


