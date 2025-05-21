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
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.2)) < 6
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
    @Condition any([distance(player, eventPlayer) < heroradius[i] for player, i in buyheros]) == true
    
    #can be simplified further to be a total subroutine for each
    wait(1, Wait.ABORT_WHEN_FALSE)
    #lucio
    if distance(eventPlayer, buyheros[0]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.followerbuy = Hero.LUCIO
            wait()
            followerbuy()
            eventPlayer.points -= 1000
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} The beat drops, but the wallet doesn't.".format(heroIcon(Hero.RAMATTRA)))
        #hanzo
    elif distance(eventPlayer, buyheros[1]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.followerbuy = Hero.HANZO
            wait()
            followerbuy()
            eventPlayer.points -= 1250
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0}You require more points to fuel the dragon's fury.".format(heroIcon(Hero.RAMATTRA)))
        #zenyatta
    elif distance(eventPlayer, buyheros[2]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.followerbuy = Hero.ZENYATTA
            wait()
            followerbuy()
            eventPlayer.points -= 1000
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} your emptiness hinders our path to enlightenment.".format(heroIcon(Hero.RAMATTRA)))
        #soldier 76
    elif distance(eventPlayer, buyheros[3]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.followerbuy = Hero.SOLDIER
            wait()
            followerbuy()
            eventPlayer.points -= 1000
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} Your mission requires adequate funding, soldier.".format(heroIcon(Hero.RAMATTRA)))
        #mercy
    elif distance(eventPlayer, buyheros[4]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.followerbuy = Hero.MERCY
            wait()
            followerbuy()
            eventPlayer.points -= 1000
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} Your reserves are depleted, angel.".format(heroIcon(Hero.RAMATTRA)))
        #pharah
    elif distance(eventPlayer, buyheros[5]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.followerbuy = Hero.PHARAH
            wait()
            followerbuy()
            eventPlayer.points -= 1000
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} Refuel the jetpack with more points, commander.".format(heroIcon(Hero.RAMATTRA)))
        #junkrat
    elif distance(eventPlayer, buyheros[6]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.followerbuy = Hero.JUNKRAT
            wait()
            followerbuy()
            eventPlayer.points -= 1000
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} Your explosive plans require more points.".format(heroIcon(Hero.RAMATTRA)))
        #symmetra
    elif distance(eventPlayer, buyheros[7]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.followerbuy = Hero.SYMMETRA
            wait()
            followerbuy()
            eventPlayer.points -= 1750
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} Allocate more points for the realization of this vision.".format(heroIcon(Hero.RAMATTRA)))
        #doomfist
    elif distance(eventPlayer, buyheros[8]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.followerbuy = Hero.DOOMFIST
            wait()
            followerbuy()
            eventPlayer.points -= 1750
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} Our path to dominance is blocked by insufficient funds.".format(heroIcon(Hero.RAMATTRA)))
        #baptiste
    elif distance(eventPlayer, buyheros[9]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.followerbuy = Hero.BAPTISTE
            wait()
            followerbuy()
            eventPlayer.points -= 1250
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} To heal and protect, we require sustenance.".format(heroIcon(Hero.RAMATTRA)))
        #bastion
    elif distance(eventPlayer, buyheros[10]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.followerbuy = Hero.BASTION
            wait()
            followerbuy()
            eventPlayer.points -= 1750
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} Boop beep boop?".format(heroIcon(Hero.RAMATTRA)))
        #reaper
    elif distance(eventPlayer, buyheros[11]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.followerbuy = Hero.REAPER
            wait()
            followerbuy()
            eventPlayer.points -= 1000
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} Feed this darkness with more points.".format(heroIcon(Hero.RAMATTRA)))
        #genji
    elif distance(eventPlayer, buyheros[12]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.followerbuy = Hero.GENJI
            wait()
            followerbuy()
            eventPlayer.points -= 1250
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} Your spirit is strong, but your balance is weak. Seek points.".format(heroIcon(Hero.RAMATTRA)))
        #ashe
    elif distance(eventPlayer, buyheros[13]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.followerbuy = Hero.ASHE
            wait()
            followerbuy()
            eventPlayer.points -= 1250
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} This heist requires more capital, partner.".format(heroIcon(Hero.RAMATTRA)))
        #zarya
    elif distance(eventPlayer, buyheros[14]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.followerbuy = Hero.ZARYA
            wait()
            followerbuy()
            eventPlayer.points -= 1750
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} Acquire more points to fuel your power.".format(heroIcon(Hero.RAMATTRA)))
        #roadhog
    elif distance(eventPlayer, buyheros[15]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.followerbuy = Hero.ROADHOG
            wait()
            followerbuy()
            eventPlayer.points -= 1750
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} No scrap metal without points, you know?".format(heroIcon(Hero.RAMATTRA)))
        #dva
    elif distance(eventPlayer, buyheros[16]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.followerbuy = Hero.DVA
            wait()
            followerbuy()
            eventPlayer.points -= 1750
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0}  More points, or it's game over!".format(heroIcon(Hero.RAMATTRA)))
        #brig
    elif distance(eventPlayer, buyheros[17]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.followerbuy = Hero.BRIGITTE
            wait()
            followerbuy()
            eventPlayer.points -= 1750
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} Father would be disappointed.".format(heroIcon(Hero.RAMATTRA)))
        #rein
    elif distance(eventPlayer, buyheros[18]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.followerbuy = Hero.REINHARDT
            wait()
            followerbuy()
            eventPlayer.points -= 1750
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} Beer!".format(heroIcon(Hero.RAMATTRA)))
        #torb
    elif distance(eventPlayer, buyheros[19]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.followerbuy = Hero.TORBJORN
            wait()
            followerbuy()
            eventPlayer.points -= 1750
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} My forge runs cold without fuel".format(heroIcon(Hero.RAMATTRA)))
        #sigma
    elif distance(eventPlayer, buyheros[20]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.followerbuy = Hero.SIGMA
            wait()
            followerbuy()
            eventPlayer.points -= 1750
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} Our gravitational experiments require additional energy.".format(heroIcon(Hero.RAMATTRA)))
        #orisa
    elif distance(eventPlayer, buyheros[21]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.followerbuy = Hero.ORISA
            wait()
            followerbuy()
            eventPlayer.points -= 1250
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} Your systems require upgrades.".format(heroIcon(Hero.RAMATTRA)))
        #moira
    elif distance(eventPlayer, buyheros[22]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.followerbuy = Hero.MOIRA
            wait()
            followerbuy()
            eventPlayer.points -= 1250
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} Acquire more points for scientific advancement.".format(heroIcon(Hero.RAMATTRA)))
        #mei
    elif distance(eventPlayer, buyheros[23]) < 2:
        if eventPlayer.points >= 30000:
            eventPlayer.followerbuy = Hero.MEI
            wait()
            followerbuy()
            eventPlayer.points -= 30000
        elif eventPlayer.points < 30000:
            smallMessage(eventPlayer, "  {0} My experiments require more cryogenic energy.".format(heroIcon(Hero.RAMATTRA)))


rule "241  follower mystery box":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(eventPlayer, rngbox2) <= 2
    @Condition eventPlayer.points >= 950
    
    if eventPlayer.points > 950:
        if eventPlayer.emotebox < 1:
            eventPlayer.emotebox = 1
            eventPlayer.communicate(Comms.EMOTE_UP)
        destroyDummy(Team.1, eventPlayer.getSlot() + 4)
        wait(0.25)
        createDummy(random.choice(getAllHeroes()), Team.1, eventPlayer.getSlot() + 4, vect(0, 0, 0))
        wait(0.03)
        (eventPlayer.getSlot() + 4).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
        wait(0.1)
        (eventPlayer.getSlot() + 4).startScalingSize(0.2)
        (eventPlayer.getSlot() + 4).startModifyingVoicelinePitch(1.3)
        #eventPlayer.resurrect()
        eventPlayer.points -= 950
        #if ruleCondition:
        #            loop()
        eventPlayer.magazines = 10
        #if experiencesystem == false:
        #            goto lbl_0
        #eventPlayer.XPlevel = false
        #eventPlayer.xp = false
        lbl_0:
        boxcounter2 += 1
        wait(1)
        if boxcounter2 < random.randint(6, 10):
            goto lbl_1
        rngbox2 = random.choice(Mysterylocations2)
        boxcounter2 = false
        lbl_1:
    elif eventPlayer.points < 950:
        bigMessage(eventPlayer, "Come back when you've got some money buddy!")


rule "351 followers ult":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.2)) < 8
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.getHero() != Hero.REINHARDT
    @Condition eventPlayer.getHero() != Hero.BASTION
    
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(0.25)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(6)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)


