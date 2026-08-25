rule "137  get out of spawn bots":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInSpawnRoom() == true

    @Condition len(globalActiveBreaches) > 0
    eventPlayer.startForcingOutlineFor(getPlayers(Team.1), true, rgb(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))) #changes bot outline to a random color for fun!
    # teleport out to a currently active breach node if present
    eventPlayer.teleport(random.choice(globalActiveBreaches))  # We choose a currently active breach node here so the bot is redirected to the graph-based spawn area immediately after spawning, without changing the normal spawn location itself.

rule "create barricade effect":
    @Event global
    @Condition start == 1 #and globalSpawnNetworkDirty == 1
    @Condition len(globalActiveBreaches) > 0

    # destroy previous effects if any
    for botspawnindex in range(0, len(globalActiveBreachEffects)):
        destroyEffect(globalActiveBreachEffects[botspawnindex])  # Destroying the old visual entities first prevents stale breach effects from lingering after the network changes to a new set of pathfinding nodes.

    globalActiveBreachEffects = []  # Reset the effect handle list to match the newly selected breach state.
    globalActiveBreachHealth = []  # Reset health values alongside the effects so each breach starts with its current network state instead of leftover values from the previous area.
    
    for botspawnindex in range(0, len(globalActiveBreaches)):
        node = globalActiveBreaches[botspawnindex]  # Each chosen pathfinding node becomes one visible breach marker for the current area.
        # initialize barricade health (100 = full)
        globalActiveBreachHealth.append(100)  # Full health starts each breach at 100 so the visual states can degrade over repeated spawn attempts without starting damaged.
        # effect color indicates health (start green)
        color[botspawnindex] = rgb(0, 255, 0)  # Green indicates a healthy breach that is still intact and not yet weakened by zombie spawn attempts.
        createEffect(getAllPlayers(), Effect.BAD_AURA, color[botspawnindex], node + vect(0, 1.5, 0), 1, EffectReeval.VISIBILITY_AND_COLOR)  # The aura effect is placed slightly above the node so it visually marks the breach location as a barricade / window.
        globalActiveBreachEffects.append(getLastCreatedEntity())  # We record the visual entity handle so later damage or repair updates can replace it cleanly.
        createEffect(getAllPlayers(), Effect.BAD_AURA_SOUND, Color.WHITE, node, 50, EffectReeval.VISIBILITY_AND_COLOR)  # The audio effect keeps the breach readable as a clear point of interest even when the visual effect is replaced.
        globalActiveBreachEffects.append(getLastCreatedEntity())  # The second handle corresponds to the sound effect so each breach stays paired with its two entities.

    # clear dirty flag
    #globalSpawnNetworkDirty = 0  # Once the effects are rebuilt, we clear the dirty flag so the network does not keep recreating the same visuals every tick.

# Players can repair breached barricades by reloading while close to the breach.


rule "barricade repair by players":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition any([[distance(player, eventPlayer) < 2] for player, botspawnindex in globalActiveBreaches]) == true

    # repair amount per tick (per check)
    repairAmount = 25
    for botspawnindex in range(0, len(globalActiveBreaches)):
        if botspawnindex < len(globalActiveBreachHealth):
            node = globalActiveBreaches[botspawnindex]
            old = globalActiveBreachHealth[botspawnindex]
            globalActiveBreachHealth[botspawnindex] = min(100, globalActiveBreachHealth[botspawnindex] + repairAmount)
            if globalActiveBreachHealth[botspawnindex] != old:
                h = globalActiveBreachHealth[botspawnindex]
                if h <= 0:
                    color[botspawnindex] = Color.BLACK
                else:
                    # use floating-point arithmetic; rgb() will handle the rounding
                    healthPercent = h / 100.0
                    color[botspawnindex] = rgb(255 * (1 - healthPercent), 255 * healthPercent, 0)


rule "get nearest nodes for spawning":
    @Event global
    @Condition start == 1
    @Condition averagePosition == null or distance(averagePosition, getRealClosestPlayer(teamPlayers[botspawnindex].getPosition())) > 10

    teamPlayers = getLivingPlayers(Team.1)  # This gathers the current living attackers so the breach network can follow where the team is actually fighting.

    # Reset the average before calculating it again.
    averagePosition = vect(0, 0, 0)  # We start from zero so the team center can be computed from the sum of player positions instead of reusing stale data.

    # Calculate the average position of all living players.
    for botspawnindex in range(0, len(teamPlayers)):
        averagePosition += teamPlayers[botspawnindex].getPosition()  # Summing the players' positions gives a center point that represents the team's current combat area.

    averagePosition = averagePosition / len(teamPlayers)  # Dividing by the player count produces the center of the squad, which is what the pathfinding search uses to choose breach nodes.

    candidates = pfLoadedMap_nodes.filter(lambda n: distance(averagePosition, n) < 35)

    # Select up to 8 unique random nodes.
    globalActiveBreaches = []  # Resetting the breach list means each recalculation creates a fresh set of active breach nodes for the current area.

    maxBreaches = 8  # Keeping only eight active breaches prevents the map from becoming crowded with too many simultaneous spawn points.
    count = min(len(candidates), maxBreaches)  # This guarantees we never try to select more breach nodes than the graph actually has available.

    for botspawnindex in range(0, count):
        pick = random.choice(candidates)  # Randomizing the chosen nodes keeps the network varied and avoids a fixed, predictable row of breaches.
        globalActiveBreaches.append(pick)  # Each chosen graph node becomes an active breach candidate for zombie exits.
        candidates.remove(pick)  # Removing the picked node ensures each breach is unique and prevents duplicate nodes in the same network.

    # Tell the effect system that the breach network changed.
    #globalSpawnNetworkDirty = 1  # The dirty flag triggers the visual rebuild so the breach markers reflect the freshly selected graph nodes and health state.

    #wait(5)
    #loop()


rule "15 Unstuck Bots(buggy effect)":
    @Event eachPlayer
    @Team 2
    @Condition isInLoS(eventPlayer, getLivingPlayers(Team.1)[0]) == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition eventPlayer.hasStatus(Status.HACKED) or eventPlayer.hasStatus(Status.KNOCKED_DOWN) or eventPlayer.hasStatus(Status.FROZEN) or eventPlayer.hasStatus(Status.ASLEEP) or eventPlayer.hasStatus(Status.STUNNED) == false
    @Disabled
    #@Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) > 2.5
    
    wait(2.5, Wait.ABORT_WHEN_FALSE)
    #eventPlayer.teleport(random.choice(Y))
    if len(globalActiveBreaches) > 0:
        eventPlayer.teleport(random.choice(globalActiveBreaches))

rule "16 Jump If Far Away From Player":
    @Event eachPlayer
    @Team 2
    #not sure if this rule is needed
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) > random.randint(5, 20)
    @Condition O == false
    #idle bots would be great in concept, its meant to feel like L4D2
    @Condition eventPlayer.getHorizontalSpeed() < 0.7
    @Disabled

    if zombjump == false:
        goto lbl_0
    #if powerconnected == 1:
    #        goto lbl_1
    #if  < 15:
    #        goto lbl_2
    lbl_1:
    eventPlayer.forceButtonPress(Button.JUMP)
    wait(10)
    if ruleCondition:
        loop()
    lbl_0:
    lbl_2:





rule "9 Omnic Kill all powerups)":
    @Event playerDied
    @Team 2
    @Condition roundnumber > 3
    
    #insta ultimate
    if eventPlayer.getSlot() == false:
        #for some reason this goes off constantly
        #if  > 3:
        #need to rename event player b
        eventPlayer.B = random.randint(1, 75)
        if eventPlayer.B != 1:
            goto lbl_0
        M[0] = nearestWalkablePosition(eventPlayer) + vect(0, 0.5, 0)
        #might be able to remove this since there is another bot died rule
        lbl_0:
        eventPlayer.setUltCharge(0)
        #__end__()
        #double points
    elif eventPlayer.getSlot() == 1:
        eventPlayer.B = random.randint(1, 75)
        if eventPlayer.B != 1:
            goto lbl_1
        M[1] = nearestWalkablePosition(eventPlayer) + vect(0, 0.5, 0)
        lbl_1:
        eventPlayer.setUltCharge(0)
        if numberOfZombies < 6:
            goto lbl_2
        #slowmotion
    elif eventPlayer.getSlot() == 2:
        lbl_2:
        eventPlayer.B = random.randint(1, 50)
        if eventPlayer.B != 1:
            goto lbl_3
        M[2] = nearestWalkablePosition(eventPlayer) + vect(0, 0.5, 0)
        lbl_3:
        eventPlayer.setUltCharge(0)
        #vaporized
    elif eventPlayer.getSlot() == 3:
        eventPlayer.B = random.randint(1, 75)
        if eventPlayer.B != 1:
            goto lbl_4
        M[3] = nearestWalkablePosition(eventPlayer) + vect(0, 0.5, 0)
        lbl_4:
        eventPlayer.setUltCharge(0)
        #instakill
    elif eventPlayer.getSlot() == 4:
        eventPlayer.B = random.randint(1, 75)
        if eventPlayer.B != 1:
            goto lbl_5
        M[4] = nearestWalkablePosition(eventPlayer) + vect(0, 0.5, 0)
        lbl_5:
        eventPlayer.setUltCharge(0)
        #max ammo
    elif eventPlayer.getSlot() == 5:
        eventPlayer.B = random.randint(1, 75)
        if eventPlayer.B != 1:
            goto lbl_6
        M[5] = nearestWalkablePosition(eventPlayer) + vect(0, 0.5, 0)
        lbl_6:
        eventPlayer.setUltCharge(0)


rule "50 is hacked":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasStatus(Status.HACKED) == true
    
    eventPlayer.setMoveSpeed(0)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setStatusEffect(null, Status.BURNING, 4)
    eventPlayer.startDamageOverTime(null, 10, 60)
    eventPlayer.disallowButton(Button.JUMP)
    wait(4)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setPrimaryFireEnabled(true)


rule "118  Omnic Kill (Global Var B) ALL SLOTS":
    @Event playerDied
    @Team 2
    
    #this is probably causing constant infinite ult perk
    eventPlayer.B = random.randint(1, 50)
    if eventPlayer.B != 1:
        goto lbl_0
    M[0] = nearestWalkablePosition(eventPlayer) + vect(0, 0.5, 0)
    lbl_0:
    eventPlayer.setUltCharge(0)
    wait(0.2)
    numberOfZombies -= 1
    if numberOfZombies < getNumberOfLivingPlayers(Team.2):
        goto lbl_1
    eventPlayer.respawn()
    lbl_1:


rule "436 OMNIC set features ALL": # could be data driven
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getSlot() != getPlayersInSlot(0, Team.2)
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer.startModifyingVoicelinePitch(0.5)
    if eventPlayer.getHero() == Hero.ROADHOG:
        eventPlayer.startScalingSize(0.6)
    elif eventPlayer.getHero() == Hero.LUCIO:
        eventPlayer.startScalingSize(0.4)
    elif eventPlayer.getHero() == Hero.DVA:
        eventPlayer.startScalingSize(0.7)
        eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    elif eventPlayer.getHero() == Hero.WRECKING_BALL:
        eventPlayer.startScalingSize(0.65)
        wait(2.5)
        eventPlayer.forceButtonPress(Button.ABILITY_1)
    elif eventPlayer.getHero() == Hero.ORISA:
        eventPlayer.startScalingSize(0.65)
    elif eventPlayer.getHero() == Hero.SIGMA:
        eventPlayer.startScalingSize(0.65)
    elif eventPlayer.getHero() == Hero.MAUGA:
        eventPlayer.startScalingSize(0.65)
    elif eventPlayer.getHero() == Hero.TORBJORN:
        eventPlayer.startScalingSize(1.5)
    elif eventPlayer.getHero() == Hero.WINSTON:
        eventPlayer.startScalingSize(0.5)
        eventPlayer.startModifyingVoicelinePitch(1.5)


rule "519 Spawn wave director":
    #@Condition getPlayers(Team.1).hasSpawned() == true
    @Condition roundnumber / 1 >= abs(1)
    @Condition numberOfZombies >= 4
    @Condition isGameInProgress() == true

    #needs a 3, for directors cut version, where each hero is on for 5 rounds then changes using a loop
    if spawntype == false:
        g = false
        #needs a lot more types as well, since there will be the new addition, random, and legacy from 1.0
        bossSpawn = [null]
        #needs a way to make it so more than 1 wave boss can be spawned at once as well
        bot1spawn = [Hero.BRIGITTE]
        #need to make it so wave boss doesnt respawn after being killed
        bot2spawn = [Hero.BRIGITTE]
        #and need wave boss to spawn a 2nd or 3rd one if players are doing well
        wait(0.25)
        wavespawn()
    elif spawntype == 1: #this all needs to work with spawntypes and its for loop
        g = false
        wait(0.25)
        bossSpawn = [null]
        bot1spawn = [Hero.TORBJORN]
        bot2spawn = [Hero.TORBJORN]
        wait(0.25)
        wavespawn()
    elif spawntype == 2:
        g = false
        wait(0.25)
        if roundnumber < 5:
            bossSpawn = null
            bot1spawn = hero[random.randint(0, 37)]
            bot2spawn = hero[random.randint(0, 37)]
            wait(0.25)
            wavespawn()
        elif roundnumber >= 5:
            bossSpawn = hero[random.randint(0, 37)]
            bot1spawn = hero[random.randint(0, 37)]
            bot2spawn = hero[random.randint(0, 37)]
            wait(0.25)
            wavespawn()
    elif spawntype == 3:
        bossSpawn = [null, Hero.DOOMFIST, Hero.TORBJORN, Hero.REINHARDT, Hero.WINSTON, Hero.ROADHOG, Hero.JUNKER_QUEEN, Hero.ZENYATTA, Hero.MAUGA, Hero.SOMBRA, Hero.MEI, Hero.REAPER, Hero.RAMATTRA]
        bot1spawn = [Hero.BRIGITTE, Hero.TORBJORN, Hero.TORBJORN, Hero.MOIRA, Hero.LUCIO, Hero.TORBJORN, Hero.ROADHOG, Hero.MOIRA, Hero.LUCIO, Hero.MERCY, Hero.JUNKER_QUEEN, Hero.TRACER, Hero.DOOMFIST]
        bot2spawn = [Hero.BRIGITTE, Hero.BRIGITTE, Hero.REINHARDT, Hero.WINSTON, Hero.GENJI, Hero.WINSTON, Hero.GENJI, Hero.BRIGITTE, Hero.HANZO, Hero.MAUGA, Hero.DVA, Hero.ECHO, Hero.SOMBRA]
        wait(0.25)
        wavespawn()
    elif spawntype == 4:
        wait(0.25)
        totalrandomspawn()

rule "wave director incramenter":
    @Condition spawntype == 3
    @Condition roundnumber > 1
    @Condition roundnumber / 3 == floor(roundnumber / 3) #incrament every 3 rounds

    if g >= 12:
        g = 0
    else:
        g += 1

rule "559 stop throttle omnics":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) < 1.75
    @Disabled
    
    eventPlayer.stopForcingThrottle()


rule "use ability loop":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) < 10

        for eventPlayer.idx in range(0, 10):
            eventPlayer.abilityFlag = abilityTable[hero[eventPlayer.currentEnemyIndex] * 10 * Difficulty + eventPlayer.idx]
            if eventPlayer.abilityFlag > 0:
                eventPlayer.forceButtonPress(buttons[eventPlayer.abilityFlag - 1])
            wait(1.0)
        wait(5.0)
            

rule "137  bots too far away":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition distance(eventPlayer, (sorted([player for player in getLivingPlayers(Team.1) if eventPlayer.T < 2]))[0]) > 90
    
    #good to keep but might need bigger radius when implementing pathfinding
    wait(6.0 + (eventPlayer.getSlot() * 0.032), Wait.ABORT_WHEN_FALSE) # good to make this 5+ seconds for teleporter maps
    if len(globalSpawnNodes) > 0:
        eventPlayer.teleport(random.choice(globalSpawnNodes))


rule "402 Omnic movespeed + health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer.setMaxHealth(15 * roundnumber)
    if roundnumber <= 6:
        eventPlayer.setMoveSpeed(80 + 8 * roundnumber)
    elif roundnumber > 6:
        eventPlayer.setMoveSpeed(128) #needs playtesting

/*
rule "407 OMNIC Bots Move Toward Players":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) < 20 and isInLoS(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) == true

    eventPlayer.startForcingThrottle(1, 1, 0, 1, 0, 1)
    if zombstrafe == false:
        goto lbl_0
    if powerconnected == 1:
        goto lbl_1
    if roundnumber < 15:
        goto lbl_2
    lbl_1:
    wait(random.randint(3, 4))
    eventPlayer.startForcingThrottle(1, 1, 0, 1, 1, 1)
    wait(random.randint(0.3, 1))
    eventPlayer.startThrottleInDirection(Vector.LEFT, 1, Relativity.TO_PLAYER)
    wait(random.randint(0.3, 1))
    eventPlayer.stopThrottleInDirection()
    if ruleCondition:
        loop()
    lbl_0:
    lbl_2:
*/

rule "17 Bots Under Player":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getVerticalFacingAngle() < -10
    @Condition eventPlayer.pfDestination == null

    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.pfDestination = getRealClosestPlayer(eventPlayer, Team.1).getPosition()
    wait(3.5 + (eventPlayer.getSlot() * 0.032))
    if ruleCondition:
        loop()


rule "force no pathfinding when close":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) < 20 and isInLoS(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) == true
    #@Condition eventPlayer.pfIsPathfinding == false

    wait(0.25, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.pfIsPathfinding == true:
        eventPlayer.pfIsPathfinding = false
    eventPlayer.pfDestination = null
    eventPlayer.pfSavedTarget = null
    eventPlayer.pfPath = []
    eventPlayer.pfWait = null
    eventPlayer.pfWasBroadcasted = false
    eventPlayer.pfIsPathfinding = false
    eventPlayer.pfCurrentNodeIndex = -1
    eventPlayer.pfActiveNode = -1
    eventPlayer.pfWalkingToPosition = null
    eventPlayer.pfWalkingFromPosition = null
    eventPlayer.pfStartTime = 0
    eventPlayer.pfAttributes = []
    eventPlayer.pfopen = []
    eventPlayer.pfscores_gScore = []
    eventPlayer.pfscores_fScore = []
    eventPlayer.pfscores_parent = []
    eventPlayer.pfscores_nodeIndex = []
    eventPlayer.pfiter = 0
    eventPlayer.pfcurrent = -1
    eventPlayer.pfgoal = -1
    eventPlayer.pfStuckOnNode = -1
    eventPlayer.pfIsStuck = false
    eventPlayer.stopThrottleInDirection()
    eventPlayer.stopForcingThrottle()
    wait(0.10)
    eventPlayer.startThrottleInDirection(directionTowards(eventPlayer.getPosition(), getRealClosestPlayer(eventPlayer, Team.1).getPosition()), 1, Relativity.TO_WORLD)


rule "use pathfinding":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.pfIsPathfinding == false
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) >= 20 or isInLoS(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) == false
    @Condition eventPlayer.pfDestination == null or distance(eventPlayer.pfDestination, getRealClosestPlayer(eventPlayer, Team.1).getPosition()) > 4
    @Condition eventPlayer.pfWait != null

    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.stopForcingThrottle()
    eventPlayer.pfDestination = getRealClosestPlayer(eventPlayer, Team.1).getPosition()
    wait(2.5 + (eventPlayer.getSlot() * 0.032))
    if ruleCondition:
        loop()

rule "use pathfinding if on wall":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.pfIsPathfinding == false
    @Condition eventPlayer.getSpeed() <= 0.7
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) > 2
    @Condition eventPlayer.pfDestination == null or distance(eventPlayer.pfDestination, getRealClosestPlayer(eventPlayer, Team.1).getPosition()) > 4

    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.stopForcingThrottle()
    eventPlayer.pfDestination = getRealClosestPlayer(eventPlayer, Team.1).getPosition()
    wait(2.5 + (eventPlayer.getSlot() * 0.032))
    if ruleCondition:
        loop()

rule "408 OMNIC Bots Face Nearest Player":
    @Event eachPlayer
    @Team 2
    #@Condition eventPlayer.hasSpawned() == true
    @Condition O == false
    #if eventPlayer == Team.2:
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), sorted([player for player in getLivingPlayers(Team.1) if player.T == false], lambda i: distance(eventPlayer, i))[0].getEyePosition()), 400)
    #elif eventPlayer == Team.1:
    #eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), sorted([player for player in getLivingPlayers(Team.2) if __assignTo__(player.T, false)], lambda i: distance(eventPlayer, i))[0].getEyePosition()), 400)


rule "409 OMNIC Bots Attack if Near":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) < 1.8
    @Condition O == false
    @Condition eventPlayer.getHero() == Hero.TORBJORN or Hero.BRIGITTE or Hero.WINSTON or Hero.GENJI or Hero.RAMATTRA or Hero.REAPER or Hero.REINHARDT
    wait(createWorkshopSettingFloat("difficulty", "zombie reaction time", 0.35, 0, 1), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)


rule "410 OMNIC Bots Dont Attack if Not Near":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer, getRealClosestPlayer(eventPlayer, Team.1)) >= 1.8
    @Condition eventPlayer.isFiringPrimaryFire() == true
    @Condition eventPlayer.isUsingUltimate() == false
    @Condition eventPlayer.getHero() == Hero.TORBJORN or Hero.BRIGITTE or Hero.WINSTON or Hero.GENJI or Hero.RAMATTRA or Hero.REAPER or Hero.REINHARDT
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.setAbility2Enabled(true)


rule "411 OMNIC Bots AutoUlt":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.getHero() != Hero.ZENYATTA
    
    wait(0.16 * eventPlayer.getSlot() + 1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(random.randint(0.25, 0.45))
    if ruleCondition:
        loop()


rule "412 OMNIC Bots Ult Attack":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition eventPlayer.getHero() != Hero.GENJI
    @Condition eventPlayer.getHero() != Hero.MOIRA
    @Condition eventPlayer.getHero() != Hero.ZENYATTA
    @Condition eventPlayer.getHero() != Hero.MERCY
    
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(2)
    if ruleCondition:
        loop()



rule "419 OMNIC set winston always has ult":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getHero() in [Hero.WINSTON, Hero.GENJI]
    @Condition eventPlayer.isMoving() == true

    eventPlayer.setUltCharge(100)

