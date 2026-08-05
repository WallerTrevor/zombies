rule "172 FOLLOWERS  winston Omnic bomb":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isCommunicating(Comms.ULTIMATE_STATUS) == true
    #variable conflict with boss' need fix later
    @Condition eventPlayer.Movement == 1
    @Condition eventPlayer.Head_HP > 0
    
    createDummy(Hero.WINSTON, Team.1, 6, eventPlayer.getEyePosition())
    wait(0.03)
    eventPlayer.Head_HP -= 1
    eventPlayer.T = 1
    getPlayersInSlot(6, Team.1).attachTo(eventPlayer, vect(0, 0, 2))
    getPlayersInSlot(6, Team.1).startScalingSize(0.2)
    getPlayersInSlot(6, Team.1).startModifyingVoicelinePitch(1.3)
    wait(1)
    getPlayersInSlot(6, Team.1).detach()
    wait(0.2)
    getPlayersInSlot(6, Team.1).forceButtonPress(Button.JUMP)
    getPlayersInSlot(6, Team.1).applyImpulse(vectorTowards(eventPlayer, getPlayersInSlot(6, Team.1)), 25, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, getPlayersInSlot(6, Team.1), 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    wait(2)
    getPlayersInSlot(6, Team.1).communicate(Comms.COUNTDOWN)
    wait(4)
    damage(getPlayersInRadius(getPlayersInSlot(6, Team.ALL), 2, Team.2, LosCheck.SURFACES_AND_ALL_BARRIERS), eventPlayer, 100)
    damage(getPlayersInRadius(getPlayersInSlot(6, Team.ALL), 4, Team.2, LosCheck.SURFACES_AND_ALL_BARRIERS), eventPlayer, 50)
    playEffect(getAllPlayers(), DynamicEffect.DOOMFIST_METEOR_STRIKE_IMPACT, Color.WHITE, eventPlayer, 1)
    wait(0.5)
    getPlayersInSlot(6, Team.1).communicate(Comms.GOODBYE)
    destroyEffect(getLastCreatedEntity())
    wait(0.5)
    destroyDummy(Team.1, 6)
    eventPlayer.T = false


rule "352 FOLLOWERS attack All":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.2)) < 6
    @Condition eventPlayer.isDummy() == true
    
    #needs to be a variable
    goto lbl_0
    followerattack1()
    lbl_0:
    goto lbl_1
    followerattack2()
    lbl_1:
    goto lbl_2
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    lbl_2:
    wait(6)
    if ruleCondition:
        loop()
    goto lbl_3
    followerattack2()
    lbl_3:
    goto lbl_4
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    lbl_4:
    wait(1)
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    wait(6)
    if ruleCondition:
        loop()
    goto lbl_5
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    lbl_5:
    wait(1)
    eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    wait(6)
    if ruleCondition:
        loop()
    goto lbl_6
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    lbl_6:
    wait(6)
    if ruleCondition:
        loop()


def followerattack1():
    @Name "391 FOLLOWERS attack subroutine 1"
    
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(1)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    wait(6)
    if ruleCondition:
        loop()


def followerattack2():
    @Name "392 FOLLOWERS attack subroutine 2"
    
    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    wait(6)
    if ruleCondition:
        loop()


rule "202 Purchase Follower action":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    #is heroradius variable needed?
    @Condition any([distance(player, eventPlayer) < 2 for player, i in buyheros]) == true
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    # Loop through all heroes
    for i in range(len(hero)):
        if distance(eventPlayer, buyheros[i]) < 2:
            if eventPlayer.points >= round(herobuycosts[i] / 3 * costmultiplier - eventPlayer.creditcardlimit):
                eventPlayer.followerbuy = hero[i]
                wait()
                followerbuy()
                eventPlayer.points -= round(herobuycosts[i] / 3 * costmultiplier)
                eventPlayer.points2 -= round(herobuycosts[i] / 3 * costmultiplier)
            else:
                smallMessage(eventPlayer,"  {0} {1}".format(heroIcon(hero[i]), followerbuyMsg[i]))
            break

rule "Purchase Mystery Follower action":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition distance(eventPlayer, rngbox) <= 2

    wait(1, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.points >= round(herobuycosts[0] / 3 * costmultiplier - eventPlayer.creditcardlimit):
        eventPlayer.followerbuy = random.choice(hero)
        wait()
        followerbuy()
        eventPlayer.points -= round(herobuycosts[0] / 3 * costmultiplier)
        eventPlayer.points2 -= round(herobuycosts[0] / 3 * costmultiplier)
    else:
        smallMessage(eventPlayer,"  {0} {1}".format(heroIcon(hero[0]), followerbuyMsg[0]))

rule "351 followers ult":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.2)) < 8
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.getHero() != Hero.REINHARDT
    @Condition eventPlayer.getHero() != Hero.BASTION
    
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(0.25)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(6)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)


