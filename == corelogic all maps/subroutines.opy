def herobuy1250():
    @Name "242 Rule 426 subroutine hero buy 1250"
    
    if eventPlayer.points > 1250:
        eventPlayer.points -= 1250
        playEffect(eventPlayer, DynamicEffect.MOIRA_FADE_DISAPPEAR_SOUND, Color.WHITE, eventPlayer, 70)
        wait(0.25)
        eventPlayer.currentmagazines = 10
        if experiencesystem == true:
            goto lbl_0
        eventPlayer.XPlevel = false
        eventPlayer.xp = false
        lbl_0:
    elif eventPlayer.points < 1250:
        smallMessage(eventPlayer, "Come back when you've got some money buddy!")


def herobuy1750():
    @Name "243 Rule 427 subroutine hero buy1750"
    
    if eventPlayer.points > 1750:
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.PURPLE, eventPlayer, 10)
        playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_DISAPPEAR_SOUND, Color.PURPLE, eventPlayer, 70)
        eventPlayer.points -= 1000 + 750
        wait(0.25)
        eventPlayer.currentmagazines = 10
        if experiencesystem == false:
            goto lbl_0
        eventPlayer.XPlevel = false
        eventPlayer.xp = false
        lbl_0:
    elif eventPlayer.points < 1750:
        smallMessage(eventPlayer, "Come back when you've got some money buddy!")


def heroswap():
    @Name "hero swap subroutine"
    
    eventPlayer.preloadHero(eventPlayer.heroswap[eventPlayer.swapvar[0]])
    #could simplify this further by using less variable names
    eventPlayer.herohp[eventPlayer.swapvar[1]] = eventPlayer.getHealth()
    eventPlayer.ultcharge[eventPlayer.swapvar[1]] = eventPlayer.currentultcharge
    eventPlayer.abilitycooldown[eventPlayer.swapvar[2]] = eventPlayer.getAbilityCooldown(Button.ABILITY_1)
    eventPlayer.abilitycooldown[eventPlayer.swapvar[3]] = eventPlayer.getAbilityCooldown(Button.ABILITY_2)
    eventPlayer.abilitycooldown[eventPlayer.swapvar[4]] = eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE)
    eventPlayer.forceButtonPress(Button.RELOAD)
    wait()
    eventPlayer.magazines[eventPlayer.swapvar[1]] = eventPlayer.currentmagazines
    eventPlayer.currentswap = eventPlayer.swapvar[0]
    wait()
    eventPlayer.currentmagazines = eventPlayer.magazines[eventPlayer.swapvar[0]]
    eventPlayer.currentultcharge = eventPlayer.ultcharge[eventPlayer.swapvar[0]]


def followerbuy():
    @Name "follower subroutine"
    
    destroyDummy(Team.1, eventPlayer.getSlot() + 4)
    wait(0.25)
    createDummy(eventPlayer.followerbuy, Team.1, eventPlayer.getSlot() + 4, vect(0, 0, 0))
    wait(0.03)
    (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
    wait(0.1)
    (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).startScalingSize(0.2)
    (eventPlayer.getSlot() + 4).startModifyingVoicelinePitch(1.3)
    #if experiencesystem == false:
    #        goto lbl_0
    #eventPlayer.XPlevel = false
    #eventPlayer.xp = false
    lbl_0:


def PaPsound():
    @Name "PaP Sound subroutine"
    
    playEffect(getAllPlayers(), DynamicEffect.BAPTISTE_BIOTIC_LAUNCHER_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 80)
    wait(0.2)
    if ruleCondition:
        loop()


def wavespawn():
    @Name "518 spawn bots subroutine"
    
    #need a for loop
    wait(9, Wait.ABORT_WHEN_FALSE)
    random.choice(getLivingPlayers(Team.1)).communicate(Comms.COUNTDOWN)
    wait(random.uniform(3, 4), Wait.ABORT_WHEN_FALSE)
    random.choice(getLivingPlayers(Team.1)).communicate(Comms.INCOMING)
    wait(0.5)
    createDummy(bossSpawn[g], Team.2, 0, getSpawnPoints(Team.2))
    omnicspawn[0] = getPlayersInSlot(0, Team.2).getSlot()
    wait(0.5)
    createDummy(bot1spawn[g], Team.2, 1, getSpawnPoints(Team.2))
    omnicspawn[1] = getPlayersInSlot(1, Team.2).getSlot()
    wait(0.5)
    createDummy(bot2spawn[g], Team.2, 2, getSpawnPoints(Team.2))
    omnicspawn[2] = getPlayersInSlot(2, Team.2).getSlot()
    wait(0.5)
    createDummy(bot1spawn[g], Team.2, 3, getSpawnPoints(Team.2))
    omnicspawn[3] = getPlayersInSlot(3, Team.2).getSlot()
    wait(0.5)
    createDummy(bot2spawn[g], Team.2, 4, getSpawnPoints(Team.2))
    omnicspawn[4] = getPlayersInSlot(4, Team.2).getSlot()
    wait(0.5)
    createDummy(bot1spawn[g], Team.2, 5, getSpawnPoints(Team.2))
    omnicspawn[5] = getPlayersInSlot(5, Team.2).getSlot()
    if roundnumber < 5:
        goto lbl_0
    wait(0.5)
    createDummy(bot2spawn[g], Team.2, 6, getSpawnPoints(Team.2))
    omnicspawn[6] = getPlayersInSlot(6, Team.2).getSlot()
    wait(0.5)
    createDummy(bot1spawn[g], Team.2, 7, getSpawnPoints(Team.2))
    omnicspawn[7] = getPlayersInSlot(7, Team.2).getSlot()
    #if getNumberOfPlayers(Team.1) > 3:
    #        goto lbl_1
    if lesszomb == true:
        goto lbl_2
    wait(0.5)
    createDummy(bot2spawn[g], Team.2, 8, getSpawnPoints(Team.2))
    omnicspawn[8] = getPlayersInSlot(8, Team.2).getSlot()
    wait(0.5)
    createDummy(bot1spawn[g], Team.2, 9, getSpawnPoints(Team.2))
    omnicspawn[9] = getPlayersInSlot(9, Team.2).getSlot()
    wait(0.5)
    createDummy(bot1spawn[g], Team.2, 10, getSpawnPoints(Team.2))
    omnicspawn[10] = getPlayersInSlot(10, Team.2).getSlot()
    wait(0.5)
    createDummy(bot2spawn[g], Team.2, 11, getSpawnPoints(Team.2))
    omnicspawn[11] = getPlayersInSlot(11, Team.2).getSlot()
    #if getNumberOfPlayers(Team.1) > 2:
    #        goto lbl_3
    wait(0.5)
    createDummy(bot1spawn[g], Team.2, 12, getSpawnPoints(Team.2))
    omnicspawn[12] = getPlayersInSlot(12, Team.2).getSlot()
    if roundnumber < 10:
        goto lbl_4
    wait(0.5)
    createDummy(bot2spawn[g], Team.2, 13, getSpawnPoints(Team.2))
    omnicspawn[13] = getPlayersInSlot(13, Team.2).getSlot()
    #if getNumberOfPlayers(Team.1) > 1:
    #        goto lbl_5
    wait(0.5)
    createDummy(bot1spawn[g], Team.2, 14, getSpawnPoints(Team.2))
    omnicspawn[14] = getPlayersInSlot(14, Team.2).getSlot()
    wait(0.5)
    createDummy(bot2spawn[g], Team.2, 15, getSpawnPoints(Team.2))
    omnicspawn[15] = getPlayersInSlot(15, Team.2).getSlot()
    wait(0.5)
    createDummy(bot1spawn[g], Team.2, 16, getSpawnPoints(Team.2))
    lbl_1:
    omnicspawn[16] = getPlayersInSlot(16, Team.2).getSlot()
    wait(0.5)
    createDummy(bot2spawn[g], Team.2, 17, getSpawnPoints(Team.2))
    omnicspawn[17] = getPlayersInSlot(17, Team.2).getSlot()
    lbl_0:
    lbl_2:
    lbl_3:
    lbl_4:
    lbl_5:


