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

    if roundnumber < (5 + (getNumberOfPlayers(Team.1) - 1) * 3): # this needs to be done so that it hot swaps while players leave and join
        botamount = 5 + roundnumber
    else:
        botamount = 17 - ((getNumberOfPlayers(Team.1) - 1) * 3)
        if botamount < 1:
            botamount = 1

def getoutofspawn():
    @Name "out of spawn subroutine"

<<<<<<< HEAD
    if setspawn == false: #this can be a for loop and array that is outside of all maps, and map specific spawn points
=======
    if setspawn == false: #this can be a for loop and array
>>>>>>> origin/main
        eventPlayer.teleport(vect(-63.355, -148.766, -17.141)) #zone 1 need to label which of these is which
        zone1()
        makedoors()
    elif setspawn == 1:
        eventPlayer.teleport(vect(-65.701, -150.372, 136.652)) #zone 1-1
        zone1()
        makedoors()
    elif setspawn == 2:
        eventPlayer.teleport(vect(354.63, 46.375, 181.943)) #zone 2
        zone2()
        makedoors()
    elif setspawn == 3:
        eventPlayer.teleport(vect(185.152, 46.154, 185.661)) #zone 2-1
        zone2()
        makedoors()
    elif setspawn == 4:
        eventPlayer.teleport(vect(367.509, -8.358, -241.533)) #zone 3
        zone3()
        makedoors()
    elif setspawn == 5:
        eventPlayer.teleport(vect(200.42, -8.412, -242.411)) #zone 3-1
        zone3()
        makedoors()

def packapunchbuy():
    @Name "pack a punch buy subroutine"
    eventPlayer.magazines = 50
    eventPlayer.points -= 5000 * eventPlayer.cashback
    eventPlayer.damagevariable = eventPlayer.papDamageTier
    wait(0.25)
    smallMessage(eventPlayer, "  you now get (+{0}%) damage with this hero".format(eventPlayer.papTier))
    eventPlayer.setDamageDealt(eventPlayer.damagevariable)
    createEffect(getPlayers(Team.1), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED, Color.WHITE, eventPlayer, 1)
    eventPlayer.Packapunch = eventPlayer.papTier
    perkbuyanimation()

def zone1():
    @Name "zone 1 subroutine"

    startForcingSpawn(Team.ALL, 1)
    telespot = 0
    doorZoneStart = 0
    doorZoneEnd = 38

def zone2():
    @Name "zone 2 subroutine"

    startForcingSpawn(Team.ALL, 0)
    telespot = 1
    doorZoneStart = 39
    doorZoneEnd = 67


def zone3():
    @Name "zone 3 subroutine"

    startForcingSpawn(Team.ALL, 2)
    telespot = 2
    doorZoneStart = 68
    doorZoneEnd = 89

def makedoors():
    @Name "make the door effects"

    if telespot == 1 or telespot == 2:
        for doorindexsequencer in range(0, doorZoneStart * 2):
            doors[doorindexsequencer] = null
    wait(3)
    for dooreffectsequencer in range(doorZoneStart, doorZoneEnd):
        createBeam(getPlayers(Team.1), Beam.JUNKRAT_TRAP_CHAIN, Beameffectdoors[evalOnce(dooreffectsequencer * 4)], Beameffectdoors[evalOnce(dooreffectsequencer * 4 + 1)], Color.RED, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        doors[dooreffectsequencer * 2] = getLastCreatedEntity()        #append to allow the game to delete for later
        createBeam(getPlayers(Team.1), Beam.JUNKRAT_TRAP_CHAIN, Beameffectdoors[evalOnce(dooreffectsequencer * 4 + 2)], Beameffectdoors[evalOnce(dooreffectsequencer * 4 + 3)], Color.RED, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        doors[dooreffectsequencer * 2 + 1] = getLastCreatedEntity()        #append to allow the game to delete for later
        if not (dooreffectsequencer % 3): wait()
    
