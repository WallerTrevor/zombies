def herobuy1250():
    @Name "242 Rule 426 subroutine hero buy 1250"
    
        eventPlayer.points -= 1250
        playEffect(eventPlayer, DynamicEffect.MOIRA_FADE_DISAPPEAR_SOUND, Color.WHITE, eventPlayer, 70)
        wait(0.25)
        eventPlayer.currentmagazines = 10
        if experiencesystem == true:
            goto lbl_0
        eventPlayer.XPlevel = false
        eventPlayer.xp = false
        lbl_0:


def herobuy1750():
    @Name "243 Rule 427 subroutine hero buy1750"
    
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


def heroswap():
    @Name "hero swap subroutine"
    
    eventPlayer.preloadHero(eventPlayer.heroswap[eventPlayer.swapvar[0]])
    #need to switch this for overpy extended variables
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

    wavevoicecall()
    createDummy(bossSpawn[g], Team.2, 0, getSpawnPoints(Team.2))
    omnicspawn[0] = getPlayersInSlot(0, Team.2).getSlot()
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    setbotamount()
    for forindex in range(1, botamount + 1, 2):    # Alternate spawning bot1 and bot2 in unique slots
        createDummy(bot1spawn[g], Team.2, forindex, getSpawnPoints(Team.2))        # bot1 in slot forindex
        omnicspawn[forindex] = getPlayersInSlot(forindex, Team.2).getSlot()
        wait(0.75, Wait.ABORT_WHEN_FALSE)
        if forindex + 1 <= botamount:        # bot2 in slot forindex + 1 (if within botamount)
            createDummy(bot2spawn[g], Team.2, forindex + 1, getSpawnPoints(Team.2))
            omnicspawn[forindex + 1] = getPlayersInSlot(forindex + 1, Team.2).getSlot()
            wait(0.75, Wait.ABORT_WHEN_FALSE)

def totalrandomspawn():
    @Name "each bot will be random"

    wavevoicecall()
    setbotamount()
    for forindex in range(0, botamount):
        createDummy(hero[random.randint(0, 37)], Team.2, forindex, getSpawnPoints(Team.2))
        omnicspawn[forindex] = getPlayersInSlot(forindex, Team.2).getSlot()
        wait(0.75, Wait.ABORT_WHEN_FALSE)

def wavevoicecall():
    @Name "player voiceline call subroutine"

    wait(9, Wait.ABORT_WHEN_FALSE)
    random.choice(getLivingPlayers(Team.1)).communicate(Comms.COUNTDOWN)
    wait(random.uniform(3.5, 4.5), Wait.ABORT_WHEN_FALSE)
    random.choice(getLivingPlayers(Team.1)).communicate(Comms.INCOMING)
    wait(0.5, Wait.ABORT_WHEN_FALSE)

def setbotamount():
    @Name "set bot amount subroutine"

    if roundnumber < 17:    # Determine botamount based on roundnumber
        botamount = 5 + roundnumber
    else:
        botamount = 17