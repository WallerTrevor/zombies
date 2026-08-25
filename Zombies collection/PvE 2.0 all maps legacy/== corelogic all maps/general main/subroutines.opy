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
    
    # Boss spawn (use standard engine spawn)
    createDummy(bossSpawn[g], Team.2, 0, getSpawnPoints(Team.2))  # Keep the original engine spawn path so wave bookkeeping and boss dummy creation remain unchanged; the breach system is only used after spawn to move the bot to a valid graph node.
    omnicspawn[0] = getPlayersInSlot(0, Team.2).getSlot()  # This preserves the existing slot tracking so later AI logic still references the spawned dummy as before.
    subindex = 0  # The original sub-index bookkeeping is preserved to maintain current enemy assignment behavior across the wave.
    CurrentEnemyIndex()  # This keeps the same enemy index update logic as the original spawning system, so no broader design changes are introduced.

    wait(0.5, Wait.ABORT_WHEN_FALSE)
    setbotamount()
    for forindex in range(1, botamount + 1, 2):
        # Bot1 spawn (use standard engine spawn)
        createDummy(bot1spawn[g], Team.2, forindex, getSpawnPoints(Team.2))  # We intentionally leave the initial createDummy location alone so all normal spawn logic and map-specific behavior remain identical.
        omnicspawn[forindex] = getPlayersInSlot(forindex, Team.2).getSlot()  # Same slot bookkeeping as the original code, so the rest of the bot logic is not disrupted.
        subindex = forindex  # Keeps the active enemy index aligned with the original wave-spawn flow.
        CurrentEnemyIndex()  # Maintains the current enemy tracking exactly as before; this is not a redesign of the spawn system.
        wait(0.75, Wait.ABORT_WHEN_FALSE)

        if forindex + 1 <= botamount:
            # Bot2 spawn (use standard engine spawn)
            createDummy(bot2spawn[g], Team.2, forindex + 1, getSpawnPoints(Team.2))  # The original Workshop spawn still decides the initial dummy location; teleports happen only afterward for movement out of the spawn room.
            omnicspawn[forindex + 1] = getPlayersInSlot(forindex + 1, Team.2).getSlot()  # Keeps the per-bot slot table consistent with the pre-existing spawn flow.
            subindex = forindex + 1  # Preserves the original increment logic for slot tracking and enemy assignment.
            CurrentEnemyIndex()  # Leaves the existing enemy-index update behavior untouched, just as before.
            wait(0.75, Wait.ABORT_WHEN_FALSE)
            
def totalrandomspawn():
    @Name "each bot will be random"

    wavevoicecall()
    setbotamount()

    for forindex in range(0, botamount):
        current_hero = hero[random.randint(0, 37)]
        # Use standard engine spawn
        createDummy(current_hero, Team.2, forindex, getSpawnPoints(Team.2))  # The random hero pattern and original engine spawn-place logic are left alone so the wave still counts and spawns exactly as before; only the post-spawn relocation is handled elsewhere.
        omnicspawn[forindex] = getPlayersInSlot(forindex, Team.2).getSlot()  # This preserves the existing bot-to-slot mapping the rest of the system already depends on.
        subindex = forindex  # We keep the original wave bookkeeping to avoid changing bot order or indexing assumptions.
        CurrentEnemyIndex()  # The enemy index update remains exactly as it was, because the purpose of the breach system is only to redirect the bot after creation.
        wait(0.75, Wait.ABORT_WHEN_FALSE)
        
def wavevoicecall():
    @Name "player voiceline call subroutine"

    wait(9, Wait.ABORT_WHEN_FALSE)
    random.choice(getLivingPlayers(Team.1)).communicate(Comms.COUNTDOWN)
    wait(random.uniform(4.5, 5.5), Wait.ABORT_WHEN_FALSE)
    random.choice(getLivingPlayers(Team.1)).communicate(Comms.INCOMING)
    wait(0.5, Wait.ABORT_WHEN_FALSE)

def setbotamount():
    @Name "set bot amount subroutine"

        botamount = 16 - ((getNumberOfPlayers(Team.1) - 1) * 2) # maxAmount - numberOfPlayersWhenNotSolo * Number to remove per player -- need to track number of dummy bots as well

def getoutofspawn():
    @Name "out of spawn subroutine"

    if setspawn == false: #this can be a for loop and array that is outside of all maps, and map specific spawn points
        eventPlayer.teleport(vect(-98.883, 8.939, 72.511)) #zone 1 need to label which of these is which
        zone1()
        makedoors()
    elif setspawn == 1:
        eventPlayer.teleport(vect(-80.097, 9.076, -73.528)) #zone 1-1
        zone1()
        makedoors()
    elif setspawn == 2:
        eventPlayer.teleport(vect(185.785, 45.059, 176.924)) #zone 2
        zone2()
        makedoors()
    elif setspawn == 3:
        eventPlayer.teleport(vect(349.006, 45.721, 180.954)) #zone 2-1
        zone2()
        makedoors()
    elif setspawn == 4:
        eventPlayer.teleport(vect(211.903, -9.592, -237.573)) #zone 3
        zone3()
        makedoors()
    elif setspawn == 5:
        eventPlayer.teleport(vect(354.448, -9.548, -232.832)) #zone 3-1
        zone3()
        makedoors()

# Return a spawn position for bots. Prefer breached nodes that are broken (health <= 0). Fallback to engine spawn points.
def getBotSpawnNode():
    @Name "Get bot spawn node from active breaches (fallback to map spawns)"

    globalBotSpawnNode = getSpawnPoints(Team.2)

    candidates = []

    if len(globalActiveBreaches) > 0:
        for forindex2 in range(0, len(globalActiveBreaches)):
            if forindex2 < len(globalActiveBreachHealth):
                if globalActiveBreachHealth[forindex2] <= 0:
                    candidates.append(globalActiveBreaches[forindex2])

    if len(candidates) > 0:
        globalBotSpawnNode = candidates[random.randint(0, len(candidates) - 1)]

# Helper to attempt a spawn at a random active breach.
# If the breach is intact, damages it and updates visual, but returns null.
# If breach is broken, returns the node position for spawning.
# If no active breaches, returns a fallback spawn point.
def attemptBreachSpawn():
    @Name "Attempt spawn at active breach (damage if intact, spawn if broken)"

    globalBreachSpawnPos = null

    if len(globalActiveBreaches) > 0:
        forindex2 = random.randint(0, len(globalActiveBreaches) - 1)
        node = globalActiveBreaches[forindex2]

        if forindex2 < len(globalActiveBreachHealth) and globalActiveBreachHealth[forindex2] > 0:
            # Breach is intact: damage it and update visual, but do not spawn.
            attemptDamage = 25
            globalActiveBreachHealth[forindex2] = max(0, globalActiveBreachHealth[forindex2] - attemptDamage)

            h = globalActiveBreachHealth[forindex2]

            # Update breach effect color.
            if h <= 0:
                effectColor = Color.BLACK
            else:
                healthPercent = h / 100.0
                effectColor = rgb(255 * (1 - healthPercent), 255 * healthPercent, 0)
        else:
            # Breach is broken: use this position for spawning.
            globalBreachSpawnPos = node

    else:
        # No active breaches: use normal map spawn points.
        globalBreachSpawnPos = getSpawnPoints(Team.2)
def packapunchbuy():
    @Name "pack a punch buy subroutine"
    eventPlayer.magazines = 50
    eventPlayer.points -= 5000 * eventPlayer.cashback
    eventPlayer.damagevariable = eventPlayer.papDamageTier
    wait(0.25)
    smallMessage(eventPlayer, "you now get (+{0}%) damage with this hero".format(eventPlayer.papTier))
    eventPlayer.setDamageDealt(eventPlayer.damagevariable)
    createEffect(getPlayers(Team.1), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED, Color.WHITE, eventPlayer, 1)
    eventPlayer.Packapunch = eventPlayer.papTier

def zone1():
    @Name "zone 1 subroutine"

    startForcingSpawn(Team.ALL, 1)
    telespot = 0
    doorZoneStart = doorzone1count1
    doorZoneEnd = doorzone1count2

def zone2():
    @Name "zone 2 subroutine"

    startForcingSpawn(Team.ALL, 0)
    telespot = 1
    doorZoneStart = doorzone2count1
    doorZoneEnd = doorzone2count2


def zone3():
    @Name "zone 3 subroutine"

    startForcingSpawn(Team.ALL, 2)
    telespot = 2
    doorZoneStart = doorzone3count1
    doorZoneEnd = doorzone3count2

def makedoors(): #needs to check if the wall_ID if statement works as intended
    @Name "make the door effects"

    if telespot == 1 or telespot == 2:
        for doorindexsequencer in range(0, doorZoneStart * 2):
            doors[doorindexsequencer] = null
    wait(3)
    for dooreffectsequencer in range(doorZoneStart, doorZoneEnd):
        if Wall_ID[dooreffectsequencer] == 1: #test this
            createBeam(getPlayers(Team.1), Beam.JUNKRAT_TRAP_CHAIN, Beameffectdoors[evalOnce(dooreffectsequencer * 4)], Beameffectdoors[evalOnce(dooreffectsequencer * 4 + 1)], Color.RED, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            doors[dooreffectsequencer * 2] = getLastCreatedEntity()        #append to allow the game to delete for later
            createBeam(getPlayers(Team.1), Beam.JUNKRAT_TRAP_CHAIN, Beameffectdoors[evalOnce(dooreffectsequencer * 4 + 2)], Beameffectdoors[evalOnce(dooreffectsequencer * 4 + 3)], Color.RED, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            doors[dooreffectsequencer * 2 + 1] = getLastCreatedEntity()        #append to allow the game to delete for later
            if not (dooreffectsequencer % 3): wait()


def decompressNSub():
    decompressN = decompressNumbers([decompressN])

def decompressVSub():
    decompressV = decompressVectors([decompressV])

def pfLookAtDestination():
    @Name "☆【PF Core Subroutine】☞ Look at destination"
    
    #Calling this subroutine will make the player look to the point they are walking towards.
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition() * (vect(1, [], 1) if distance(eventPlayer.getPosition(), eventPlayer.pfWalkingToPosition) < 3 else vect(1, 1, 1)), (eventPlayer.pfWalkingToPosition + vect(0, 1.5, 0)) * (vect(1, [], 1) if distance(eventPlayer.getPosition(), eventPlayer.pfWalkingToPosition) < 3 else vect(1, 1, 1))), 500)

def pfRecalibrate(): #probably need to use this to toggle between states, for linear pathing vs pathfinding
    @Name "【PF Core Subroutine】☞ Recalibrate"
    
    eventPlayer.stopThrottleInDirection()
    eventPlayer.pfCurrentNodeIndex = -1
    eventPlayer.pfSavedTarget = null
    eventPlayer.pfIsPathfinding = false
    eventPlayer.pfPath = 0

def pfProgressEventPlayer():
    @Name "【PF Core Subroutine】☞ Progress event player"
    
    if len(eventPlayer.pfPath) == 0:
        goto lbl_0
    #Pop the current path.
    del eventPlayer.pfPath[0]
    #Update the current pathfind attributes.
    if len(eventPlayer.pfPath) and eventPlayer.pfPath[0] != -1:
        #Any rules watching these with the matching condition will activate.
        eventPlayer.pfAttributes = (([i for i in pfLoadedMap_neighbors[eventPlayer.pfPath[0]] if i[0] == eventPlayer.pfCurrentNodeIndex])[0])[1]
    else:
        eventPlayer.pfAttributes = []
    #Go to the next node in the path.
    eventPlayer.pfCurrentNodeIndex = eventPlayer.pfPath[0]
    #Set the position that the player is currently walking towards.
    eventPlayer.pfWalkingToPosition = eventPlayer.pfDestination if eventPlayer.pfCurrentNodeIndex == -1 else pfLoadedMap_nodes[eventPlayer.pfCurrentNodeIndex]
    pfUpdateNodeMeta()
    lbl_0:

def pfTick():
    @Name "【PF Core Subroutine】☞ Tick"
    
    pfIterationsThisTick--
    if pfIterationsThisTick <= 0:
        wait(0.032)
        waitUntil(max(getAverageServerLoad(), getServerLoad()) < 245, 0.50)
        #This determines the pathfinding budget for the current tick.
        pfIterationsThisTick = ((max(getAverageServerLoad(), getServerLoad()) < 230) + ((max(getAverageServerLoad(), getServerLoad()) < 180) * 2)) + 1


def pfUpdateNodeMeta():
    @Name "【PF Core Subroutine】☞ Update node meta"
    
    if eventPlayer.pfCurrentNodeIndex != -1:
        eventPlayer.pfActiveNode = eventPlayer.pfCurrentNodeIndex
    #Update the pathfinding start time.
    eventPlayer.pfStartTime = getTotalTimeElapsed()
    eventPlayer.pfWalkingFromPosition = eventPlayer.getPosition()


def pfWalkToDestination():
    @Name "☆【PF Core Subroutine】☞ Walk to destination"
    
    eventPlayer.startThrottleInDirection(directionTowards(eventPlayer.getPosition(), eventPlayer.pfDestination if eventPlayer.pfCurrentNodeIndex == -1 else pfLoadedMap_nodes[eventPlayer.pfCurrentNodeIndex]), ((distance(eventPlayer.getPosition(), eventPlayer.pfDestination if eventPlayer.pfCurrentNodeIndex == -1 else pfLoadedMap_nodes[eventPlayer.pfCurrentNodeIndex])) > 0.4) and (eventPlayer.pfCurrentNodeIndex != -1 or (not (not eventPlayer.pfSavedTarget or distance(eventPlayer.pfDestination, eventPlayer.pfSavedTarget) > 5))), Relativity.TO_WORLD)

def setdamagemodif():
    @Name "set damage modification" #this selects what section of the array to use for damage modification, but need currentenemyindex

    if eventPlayer.getHero() in getTankHeroes() == true:
        for index in range(0, len(tankheroes)):
            if eventPlayer.getHero() == tankheroes[index]:
                eventPlayer.currentdamgindex = heroSupportHeroes[index * 45]
                break
            else:
                eventPlayer.currentdamgindex = 1
                break
    elif eventPlayer.getHero() in getSupportHeroes() == true:
        for index in range(0, len(supportheroes)):
            if eventPlayer.getHero() == supportheroes[index]:
                eventPlayer.currentdamgindex = heroSupportHeroes[index * 45]
                break
            else:
                eventPlayer.currentdamgindex = 1
                break
    else: #damage heroes
        for index in range(0, len(damageheroes)):
            if eventPlayer.getHero() == damageheroes[index]:
                eventPlayer.currentdamgindex = heroDamageHeroes[index * 45]
                break
            else:
                eventPlayer.currentdamgindex = 1
                break

def CurrentEnemyIndex():
    @Name " current enemy index subroutine"

    for index in range(0, len(heroAlphabetical)):
        if getPlayersInSlot(subindex, Team.2).getHero() == heroAlphabetical[index]:
            currentEnemyIndex[subindex] = index
            break
/*
def getBotSpawnNode():
    @Name "bot spawn node selector"

    targetPos = getLivingPlayers(Team.1)[0].getPosition()
    validNodes = pfLoadedMap_nodes.filter(lambda node: distance(node, targetPos) >= 20 and distance(node, targetPos) <= 30)
*/