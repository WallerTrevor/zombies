rule "137  get out of spawn bots(buggy effect)":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInSpawnRoom() == true
    
    eventPlayer.startForcingOutlineFor(getPlayers(Team.1), true, rgb(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)))
    eventPlayer.teleport(nearestWalkablePosition(directionFromAngles(random.uniform(0, 360), random.uniform(-3, 3)) * random.uniform(10, 20) + getLivingPlayers(Team.1)[0].getPosition()))
    wait(1)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.BLACK, evalOnce(eventPlayer.getPosition()) + vect(0, 1.5, 0), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.BAD_AURA_SOUND, Color.WHITE, evalOnce(eventPlayer.getPosition()), 100, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.setStatusEffect(null, Status.ROOTED, 1)
    eventPlayer.setInvisibility(Invis.ALL)
    wait(1)
    eventPlayer.setInvisibility(Invis.NONE)
    wait(3)
    destroyEffect(getLastCreatedEntity())
    #i dont think doing it twice works need to append
    destroyEffect(getLastCreatedEntity())


rule "15 Unstuck Bots(buggy effect)":
    @Event eachPlayer
    @Team 2
    @Condition isInLoS(eventPlayer, getLivingPlayers(Team.1)[0]) == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasStatus(Status.HACKED) or eventPlayer.hasStatus(Status.KNOCKED_DOWN) or eventPlayer.hasStatus(Status.FROZEN) or eventPlayer.hasStatus(Status.ASLEEP) or eventPlayer.hasStatus(Status.STUNNED) == false
    #@Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) > 2.5
    @Condition eventPlayer.idlebot == 1
    
    wait(2.5, Wait.ABORT_WHEN_FALSE)
    #eventPlayer.teleport(random.choice(Y))
    eventPlayer.teleport(nearestWalkablePosition(directionFromAngles(random.uniform(0, 360), random.uniform(-3, 3)) * random.uniform(10, 20) + getLivingPlayers(Team.1)[0].getPosition()))
    #loop()
    wait(0.4)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.BLACK, evalOnce(eventPlayer.getPosition()) + vect(0, 1.5, 0), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.GOOD_AURA_SOUND, Color.WHITE, evalOnce(eventPlayer.getPosition()), 100, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    wait(4)
    destroyEffect(getLastCreatedEntity())
    destroyEffect(getLastCreatedEntity())


rule "16 Jump If Far Away From Player":
    @Event eachPlayer
    @Team 2
    #not sure if this rule is needed
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) > random.randint(5, 20)
    @Condition O == false
    #idle bots would be great in concept, its meant to feel like L4D2
    @Condition idlebots == false
    @Condition eventPlayer.getHorizontalSpeed() < 0.7
    
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


rule "17 Bots Under Player":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getVerticalFacingAngle() < -10
    @Condition O == false
    @Condition eventPlayer.getSpeed() < 0.95
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) > 1
    @Condition eventPlayer.hasStatus(Status.HACKED) or eventPlayer.hasStatus(Status.KNOCKED_DOWN) or eventPlayer.hasStatus(Status.FROZEN) or eventPlayer.hasStatus(Status.ASLEEP) or eventPlayer.hasStatus(Status.STUNNED) != true #needs a (is boss active) condition
    wait(0.33, Wait.ABORT_WHEN_FALSE)
    eventPlayer.applyImpulse(Vector.UP, 15, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    if walljumpers == false:
        goto lbl_0
    eventPlayer.disableEnvironmentCollision(false)
    wait(2.5)
    eventPlayer.enableEnvironmentCollision()
    lbl_0:


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


rule "436 OMNIC set features ALL":
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
        g = 0
        #needs a lot more types as well, since there will be the new addition, random, and legacy from 1.0
        bossSpawn = [null]
        #needs a way to make it so more than 1 wave boss can be spawned at once as well
        bot1spawn = [Hero.BRIGITTE]
        #need to make it so wave boss doesnt respawn after being killed
        bot2spawn = [Hero.BRIGITTE]
        #and need wave boss to spawn a 2nd or 3rd one if players are doing well
        wait(0.25)
        wavespawn()
    elif spawntype == 1:
        g = 0
        wait(0.25)
        bossSpawn = [null]
        bot1spawn = [Hero.TORBJORN]
        bot2spawn = [Hero.TORBJORN]
        wait(0.25)
        wavespawn()
    elif spawntype == 2:
        g = 0
        wait(0.25)
        if roundnumber < 5:
            bossSpawn = null
            bot1spawn = hero[random.randint(0, 38)]
            bot2spawn = hero[random.randint(0, 38)]
            wait(0.25)
            wavespawn()
        elif roundnumber >= 5:
            bossSpawn = hero[random.randint(0, 38)]
            bot1spawn = hero[random.randint(0, 38)]
            bot2spawn = hero[random.randint(0, 38)]
            wait(0.25)
            wavespawn()
    elif spawntype == 3:
        bossSpawn = [null, Hero.DOOMFIST, Hero.TORBJORN, Hero.REINHARDT, Hero.WINSTON, Hero.ROADHOG, Hero.JUNKER_QUEEN, Hero.ZENYATTA, Hero.MAUGA, Hero.SOMBRA, Hero.MEI, Hero.REAPER, Hero.RAMATTRA]
        bot1spawn = [Hero.BRIGITTE, Hero.TORBJORN, Hero.TORBJORN, Hero.MOIRA, Hero.LUCIO, Hero.TORBJORN, Hero.ROADHOG, Hero.MOIRA, Hero.LUCIO, Hero.MERCY, Hero.JUNKER_QUEEN, Hero.TRACER, Hero.DOOMFIST]
        bot2spawn = [Hero.BRIGITTE, Hero.BRIGITTE, Hero.REINHARDT, Hero.WINSTON, Hero.GENJI, Hero.WINSTON, Hero.GENJI, Hero.BRIGITTE, Hero.HANZO, Hero.MAUGA, Hero.DVA, Hero.ECHO, Hero.SOMBRA]
        wait(0.25)
        wavespawn()


rule "wave director incramenter":
    @Condition roundnumber / 5 == floor(roundnumber / 5)
    @Condition spawntype == 3
    @Condition roundnumber > 1
    g += 1


rule "559 stop throttle omnics":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 1.75
    @Disabled
    
    eventPlayer.stopForcingThrottle()


rule "435 basic OMNIC ALL heros":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 10
    @Condition eventPlayer.getSlot() != getPlayersInSlot(0, Team.2)
    
    #needs to be seperate rules as this is very limited conditions
    if eventPlayer.getHero() == Hero.ROADHOG:
        eventPlayer.forceButtonPress(Button.ABILITY_2)
        wait(random.randint(15, 25))
    elif eventPlayer.getHero() == Hero.REAPER:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(random.randint(15, 25))
    elif eventPlayer.getHero() == Hero.HANZO:
        eventPlayer.forceButtonPress(Button.JUMP)
        wait(0.6)
        eventPlayer.forceButtonPress(Button.JUMP)
        wait(random.randint(20, 25))
    elif eventPlayer.getHero() == Hero.PHARAH:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(0.75)
        eventPlayer.forceButtonPress(Button.ABILITY_2)
    elif eventPlayer.getHero() == Hero.WIDOWMAKER:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(0.75)
        eventPlayer.forceButtonPress(Button.ABILITY_2)
    elif eventPlayer.getHero() == Hero.BASTION:
        eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    elif eventPlayer.getHero() == Hero.SYMMETRA:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(2)
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(2)
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(2)
    elif eventPlayer.getHero() == Hero.CASSIDY:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(0.5)
        eventPlayer.forceButtonPress(Button.ABILITY_2)
    elif eventPlayer.getHero() == Hero.JUNKRAT:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(0.5)
        eventPlayer.forceButtonPress(Button.ABILITY_2)
        wait(2)
        eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    elif eventPlayer.getHero() == Hero.ZARYA:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(6)
        if ruleCondition:
            loop()
    elif eventPlayer.getHero() == Hero.SOLDIER:
        eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
        wait(6)
        if ruleCondition:
            loop()
    elif eventPlayer.getHero() == Hero.LUCIO:
        if distance(eventPlayer, getLivingPlayers(Team.1)[0]) < 3:
            eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    elif eventPlayer.getHero() == Hero.BRIGITTE:
        if roundnumber >= 20:
            eventPlayer.forceButtonPress(Button.ABILITY_1)
            wait(6)
            if ruleCondition:
                loop()
    elif eventPlayer.getHero() == Hero.TRACER:
        if eventPlayer.getNormalizedHealth() <= 0.5:
            eventPlayer.forceButtonPress(Button.ABILITY_2)
            wait(random.randint(40, 60))
    elif eventPlayer.getHero() == Hero.MERCY:
        eventPlayer.setUltCharge(100)
    elif eventPlayer.getHero() == Hero.DVA:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        if eventPlayer.getNormalizedHealth() <= 0.25:
            eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
            wait(3)
            eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    elif eventPlayer.getHero() == Hero.MEI:
        if eventPlayer.getNormalizedHealth() <= 0.4:
            eventPlayer.forceButtonPress(Button.ABILITY_1)
    elif eventPlayer.getHero() == Hero.ANA:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        if eventPlayer.getNormalizedHealth() <= 0.4:
            eventPlayer.forceButtonPress(Button.ABILITY_2)
    elif eventPlayer.getHero() == Hero.SOMBRA:
        eventPlayer.forceButtonPress(Button.MELEE)
        wait(1)
        eventPlayer.forceButtonPress(Button.ABILITY_2)
        wait(1.5)
        eventPlayer.forceButtonPress(Button.ABILITY_1)
    elif eventPlayer.getHero() == Hero.ORISA:
        if eventPlayer.getNormalizedHealth() <= 0.5:
            eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
            eventPlayer.forceButtonPress(Button.ABILITY_1)
    elif eventPlayer.getHero() == Hero.RAMATTRA:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(8)
        loop()
    elif eventPlayer.getHero() == Hero.WRECKING_BALL:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        eventPlayer.forceButtonPress(Button.ABILITY_2)
    elif eventPlayer.getHero() == Hero.SOJOURN:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        wait(1)
        eventPlayer.forceButtonPress(Button.JUMP)
    elif eventPlayer.getHero() == Hero.ASHE:
        eventPlayer.forceButtonPress(Button.ABILITY_2)
    elif eventPlayer.getHero() == Hero.ECHO:
        eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
        eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    elif eventPlayer.getHero() == Hero.BAPTISTE:
        if eventPlayer.getNormalizedHealth() <= random.randint(0.5, 0.75):
            eventPlayer.forceButtonPress(Button.ABILITY_1)
    elif eventPlayer.getHero() == Hero.KIRIKO:
        if eventPlayer.getNormalizedHealth() <= random.randint(0.5, 0.75):
            eventPlayer.forceButtonPress(Button.ABILITY_2)
    elif eventPlayer.getHero() == Hero.JUNKER_QUEEN:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        if distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 5:
            eventPlayer.forceButtonPress(Button.ABILITY_2)
    elif eventPlayer.getHero() == Hero.SIGMA:
        eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
        wait(2)
        eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
        wait(0.25)
        eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
        if eventPlayer.getNormalizedHealth() <= random.randint(0.5, 0.75):
            eventPlayer.forceButtonPress(Button.ABILITY_1)
    elif eventPlayer.getHero() == Hero.LIFEWEAVER:
        eventPlayer.forceButtonPress(Button.JUMP)
        wait(0.3)
        eventPlayer.forceButtonPress(Button.JUMP)
        eventPlayer.forceButtonPress(Button.ABILITY_1)
    elif eventPlayer.getHero() == Hero.MAUGA:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
    elif eventPlayer.getHero() == Hero.ILLARI:
        eventPlayer.forceButtonPress(Button.ABILITY_2)
        if eventPlayer.getNormalizedHealth() <= random.randint(0.5, 0.75):
            eventPlayer.forceButtonPress(Button.ABILITY_1)


rule "137  bots too far away":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition distance(eventPlayer, (sorted([player for player in getLivingPlayers(Team.1) if eventPlayer.T < 2]))[0]) > 25
    
    #good to keep but might need bigger radius when implementing pathfinding
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    #also might need to set to ongoing - global, and just teleport them one at a time
    eventPlayer.teleport(nearestWalkablePosition(directionFromAngles(random.uniform(0, 360), random.uniform(-3, 3)) * random.uniform(10, 20) + getLivingPlayers(Team.1)[0].getPosition()))


rule "164 OMNIC brigg hold sheild":
    @Event eachPlayer
    @Team 2
    @Hero brigitte
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) >= 15
    @Condition idlebots == false
    
    if powerconnected == 1:
        goto lbl_0
    if roundnumber < 10:
        goto lbl_1
    lbl_0:
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    lbl_1:


rule "165 OMNIC brigg hold sheild":
    @Event eachPlayer
    @Team 2
    @Hero brigitte
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 12
    
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)


rule "183 Rule 303 bots spawn idle":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    @Condition idlebots == true
    
    #eventPlayer.idlebot = 1
    eventPlayer.stopForcingThrottle()


rule "184 zombies move if player close":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 6
    @Condition idlebots == true
    
    eventPlayer.idlebot = 1
    eventPlayer.startForcingThrottle(1, 1, 0, 1, 0, 1)
    eventPlayer.communicate(Comms.HELLO)


rule "185 zombie took damage start moving":
    @Event playerTookDamage
    @Team 2
    @Condition eventPlayer.idlebot == false
    @Condition idlebots == true
    
    eventPlayer.idlebot = 1
    eventPlayer.startForcingThrottle(1, 1, 0, 1, 0, 1)


rule "402 Omnic movespeed + health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer.setMaxHealth(5 * roundnumber)
    if roundnumber <= 6:
        eventPlayer.setMoveSpeed(52 + 8 * roundnumber)
    elif roundnumber > 6:
        eventPlayer.setMoveSpeed(100)


rule "407 OMNIC Bots Move Toward Players":
    @Event eachPlayer
    @Team 2
    @Condition O == false
    @Condition idlebots == false
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) >= 1.75
    
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
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 1.8
    @Condition O == false
    @Condition eventPlayer.getHero() == Hero.TORBJORN or Hero.BRIGITTE or Hero.WINSTON or Hero.GENJI or Hero.RAMATTRA or Hero.REAPER or Hero.REINHARDT
    
    wait(createWorkshopSettingFloat("difficulty", "zombie reaction time", 0.35, 0, 1), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)


rule "410 OMNIC Bots Dont Attack if Not Near":
    @Event eachPlayer
    @Team 2
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) >= 1.8
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


rule "413 OMNIC torb use ability":
    @Event eachPlayer
    @Team 2
    @Hero torbjorn
    @Condition eventPlayer.isMoving() == true
    @Condition roundnumber / 1 >= abs(15)
    
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(5)
    loop()


rule "414 OMNIC rien use ability 2":
    @Event eachPlayer
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.isMoving() == true
    @Condition roundnumber >= abs(26)
    
    eventPlayer.forceButtonPress(Button.ABILITY_2)


rule "415 OMNIC brigg wave 16":
    @Event eachPlayer
    @Team 2
    @Hero brigitte
    @Condition roundnumber >= abs(16)
    
    eventPlayer.setUltCharge(100)
    eventPlayer.setMoveSpeed(120)


rule "417 OMNIC torb use ability":
    @Event eachPlayer
    @Team 2
    @Hero torbjorn
    @Condition eventPlayer.isMoving() == true
    @Condition powerconnected == 1
    @Condition roundnumber < 15
    
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(5)
    loop()


rule "419 OMNIC set winston always has ult":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getHero() in [Hero.WINSTON, Hero.GENJI]
    @Condition eventPlayer.isMoving() == true

    eventPlayer.setUltCharge(100)


rule "422 OMNIC Dont Attack if Not Near genji":
    @Event eachPlayer
    @Team 2
    @Hero genji
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) >= 1.8
    @Condition eventPlayer.isFiringPrimaryFire() == true
    
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)


rule "423 OMNIC genji use reflect after hitting player":
    @Event playerDealtDamage
    @Team 2
    @Hero genji
    
    eventPlayer.forceButtonPress(Button.ABILITY_2)


rule "424 OMNIC moira Attack if Near":
    @Event eachPlayer
    @Team 2
    @Hero moira
    @Condition distance(eventPlayer, getClosestPlayer(eventPlayer, Team.1)) < 1.8
    @Condition O == false
    
    wait(0.49, Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.MELEE)
    if ruleCondition:
        loop()


rule "425 OMNIC moira fade if far away":
    @Event eachPlayer
    @Team 2
    @Hero moira
    @Condition distance(eventPlayer, sorted([player for player in getLivingPlayers(Team.1) if eventPlayer.T == false])[0]) > 8
    
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(5)
    if ruleCondition:
        loop()


