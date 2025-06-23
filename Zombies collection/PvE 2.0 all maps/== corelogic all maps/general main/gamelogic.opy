rule "1 Setup":
    roundnumber = 0
    numberOfZombies = false
    C = false
    P = false
    Q = []
    T = []
    Y = []
    #Y.append(vect(-23.738, 22.631, -120.65))
    #hudSubtext(getPlayers(Team.1), l"{0}: {1}".format(numberOfZombies, l"Enemies"), HudPosition.RIGHT, 0, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    O = false
    M[0] = vect(500, 25, 500)
    M[1] = vect(500, 25, 500)
    M[2] = vect(500, 25, 500)
    M[3] = vect(500, 25, 500)
    M[4] = vect(500, 25, 500)
    M[5] = vect(500, 25, 500)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.WHITE, M[0], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.YELLOW, M[1], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.GREEN, M[2], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.VIOLET, M[3], 0.1, EffectReeval.NONE)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.RED, M[4], 1, EffectReeval.POSITION_AND_RADIUS)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.ORANGE, M[5], 1, EffectReeval.POSITION_AND_RADIUS)
    hudText([player for player in getPlayers(Team.1) if player.S[1] == 1], "{0}".format(heroIcon(Hero.RAMATTRA)), null, " Double points!", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudText([player for player in getPlayers(Team.1) if player.S[2] == 1], "{0}".format(heroIcon(Hero.RAMATTRA)), null, " Time Freeze", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudText([player for player in getPlayers(Team.1) if player.S[4] == 1], "{0}".format(heroIcon(Hero.RAMATTRA)), null, " Insta-Kill!", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudText([player for player in getPlayers(Team.1) if player.S[0] == 1], "{0}".format(heroIcon(Hero.RAMATTRA)), null, " Ultimate Mayhem!", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudText([player for player in getPlayers(Team.1) if player.S[5] == 1], "{0}".format(heroIcon(Hero.RAMATTRA)), null, "Max Ammo!", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudText([player for player in getPlayers(Team.1) if player.S[3] == 1], "{0}".format(heroIcon(Hero.RAMATTRA)), null, "Data Reset.", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    appenddoorsequencer = []
    dooreffectsequencer = []
    teleportercolor = Color.BLUE
    disableInspector()

rule "2 round change":
    @Condition numberOfZombies <= 0
    @Condition O == false
    @Condition start == 1
    
    for forindex in range(len(omnicspawn)):
        destroyDummy(Team.2, omnicspawn[forindex])
    roundnumber += 1
    Z = 1
    getPlayers(Team.1).setUltCharge(100)
    bigMessage(getAllPlayers(), l"Round {0}".format(romanN[romanNcounter]))
    P = false
    getDeadPlayers(Team.1).Packapunch = false
    getDeadPlayers(Team.1).clearStatusEffect(Status.BURNING)
    getDeadPlayers(Team.1).damagevariable = 100
    getDeadPlayers(Team.1).teleport(nearestWalkablePosition(random.choice(getLivingPlayers(Team.1)) + vect(random.randint(-5, 5), 0, random.randint(-5, 5))))
    getDeadPlayers(Team.1).startForcingHero(Hero.CASSIDY)
    getDeadPlayers(Team.1).resurrect()
    #set a loop
    Died[0] = vect(500, 0, 500)
    Died[1] = vect(500, 0, 500)
    Died[2] = vect(500, 0, 500)
    Died[3] = vect(500, 0, 500)
    #can set these to false
    getPlayers(Team.1).InfoCooldown = false
    getPlayers(Team.1).P = false
    getPlayers(Team.1).botTarget = false
    getPlayers(Team.1).HideHints = false
    getLivingPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 2)
    getPlayers(Team.1).Head_HP = 3
    chwaveinterval += 1
    if roundnumber < 12:
        romanNcounter += 1
    getPlayers(Team.1).ultcharge[0] = 100
    getPlayers(Team.1).ultcharge[1] = 100


rule "3 Set Round Kills":
    @Condition Z == 1
    @Condition O == false
    
    #modify this based on difficulty
        numberOfZombies = 6 + roundnumber * 3
        wait(1)
        Z = false



rule "5 Time manager":
    #@Condition O == false
    
    #need to change later when using soft restart
    if isAssemblingHeroes() == true:
        setMatchTime(5)
        #needs to check when game is not started yet that way player always spends time in spawn
        wait(6)
    #currently causes issues when the first game ends and all players die
    wait(40)
    setMatchTime(3599)
    wait(3000, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "6 Defeat (needs to be refined for soft restart)":
    @Condition all([player.isDead() for player in getPlayers(Team.1)]) == true
    @Condition getPlayers(Team.1).hasSpawned() == true
    
    wait(2, Wait.ABORT_WHEN_FALSE)
    setspawn = random.randint(0, 0)
    destroyAllDummies()
    getPlayers(Team.1).startCamera(vect(317.328, -25.644, -140.906), vect(320.513, -24.05, -134.612))
    destroyAllHudTexts()
    destroyAllEffects()
    wait(4)
    goToAssembleHeroes()
    #might be able to make this a subroutine
    if setspawn == false:
        getPlayers(Team.1).teleport(vect(-63.355, -148.766, -17.141))
        startForcingSpawn(Team.ALL, 1)
        telespot = 101
    elif setspawn == 1:
        getPlayers(Team.1).teleport(vect(-65.701, -150.372, 136.652))
        startForcingSpawn(Team.ALL, 1)
        telespot = 101
    elif setspawn == 2:
        getPlayers(Team.1).teleport(vect(354.63, 46.375, 181.943))
        startForcingSpawn(Team.ALL, 0)
        telespot = 102
    elif setspawn == 3:
        getPlayers(Team.1).teleport(vect(185.152, 46.154, 185.661))
        startForcingSpawn(Team.ALL, 0)
        telespot = 102
    elif setspawn == 4:
        getPlayers(Team.1).teleport(vect(367.509, -8.358, -241.533))
        startForcingSpawn(Team.ALL, 2)
        telespot = 103
    elif setspawn == 5:
        getPlayers(Team.1).teleport(vect(200.42, -8.412, -242.411))
        startForcingSpawn(Team.ALL, 2)
        telespot = 103
    getPlayers(Team.1).resurrect()
    wait(2)
    outofpsawn = false
    roundnumber = 0
    start = false
    romanNcounter = 1
    g = false
    

rule "7 Disable Bot Respawn":
    @Event playerJoined
    @Team 2
    
    #set this to ongoing - global
    eventPlayer.disableRespawn()


rule "8 respawn bots":
    @Event eachPlayer
    @Team 2
    #need to include a condition for boss fights being active
    @Condition getNumberOfLivingPlayers(Team.2) < numberOfZombies
    @Condition numberOfZombies >= 1
    #check if this needs to be here
    #@Condition  > 1
    #@Condition eventPlayer.isDead() == true
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    #needs to check if player is a wave boss?
    random.choice(getDeadPlayers(Team.2)).respawn()
    if ruleCondition:
        loop()


rule "26 Revive Player system":
    @Event eachPlayer
    @Team 1
    #might rebuild downed system to have players be unkillable
    @Condition distance(eventPlayer, Died[0]) <= 4
    #and only stay alive for 25 seconds then dissapear
    @Condition eventPlayer != getPlayersInSlot(0, Team.1)
    #then lose their hero and will need to rebuild spectator cam
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition any([distance(player, eventPlayer) < diedradius[i] for player, i in Died]) == true
    
    eventPlayer.C = getPlayersInSlot(0, Team.1)
    chaseOverTime(getPlayersInSlot(0, Team.1).C, 4, 2 + P * 2)
    wait(2 + P * 2, Wait.ABORT_WHEN_FALSE)
    getPlayersInSlot(0, Team.1).teleport(eventPlayer)
    getPlayersInSlot(0, Team.1).resurrect()
    P += 1
    #wait(0.25)
    Died[0] = vect(500, 0, 500)
    eventPlayer.points += 100 * eventPlayer.H
    if eventPlayer.H != 1:
        goto lbl_0
    if eventPlayer.H == 1:
        goto lbl_1
    lbl_0:
    getPlayers(Team.1).InfoCooldown = false
    lbl_1:
    R += 100 * eventPlayer.H
    getPlayersInSlot(0, Team.1).setStatusEffect(null, Status.PHASED_OUT, 5)
    getPlayersInSlot(0, Team.1).setMaxHealth(100)



rule "27 Cancel Revive all players":
    @Event eachPlayer
    @Team 1
    #work in progress
    @Condition any([distance(player, eventPlayer) > diedradius[i] for player, i in Died]) == true
    @Condition eventPlayer != getPlayersInSlot(0, Team.1)
    
    getPlayersInSlot(0, Team.1).C = false
    stopChasingVariable(getPlayersInSlot(0, Team.1).C)


rule "35 Player Respawn, Move Revive Effect":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isAlive() == true
    
    #might want to delete downed effect instead of move
    Died[eventPlayer.getSlot()] = vect(500, 0, 500)


rule "36 Pickup perk drops(should be able to write this as one rule)":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[1]) <= 1.5
    @Condition getPlayers(Team.1).G[1] == false
    @Condition roundnumber >= 1
    @Condition any([distance(player, eventPlayer) < diedradius[i] for player, i in M]) == true
    
    M[1] = vect(500, 25, 500)
    getPlayers(Team.1).G[1] = true
    getPlayers(Team.1).S[1] = 1
    bigMessage(getAllPlayers(), "Double points!")
    getPlayers(Team.1).H = 2
    wait(60)
    getPlayers(Team.1).H = 1
    getPlayers(Team.1).G[1] = false
    getPlayers(Team.1).S[1] = false


rule "37 Pickup slowmotion":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[2]) <= 1.5
    @Condition getPlayers(Team.1).G[2] == false
    @Condition roundnumber >= 1
    
    M[2] = vect(500, 25, 500)
    getPlayers(Team.1).G[2] = true
    getPlayers(Team.1).S[2] = 1
    bigMessage(getAllPlayers(), l"{0} {1} {2}".format(l"Slower", l"Time", l"-> {0}".format(l"{0} sec".format(10))))
    setSlowMotion(50)
    wait(5)
    setSlowMotion(100)
    getPlayers(Team.1).G[2] = false
    getPlayers(Team.1).S[2] = false


rule "38 Pickup insta kill":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[4]) <= 1.5
    @Condition getPlayers(Team.1).G[4] == false
    @Condition roundnumber >= 1
    
    M[4] = vect(500, 25, 500)
    getPlayers(Team.1).G[4] = true
    getPlayers(Team.1).S[4] = 1
    bigMessage(getAllPlayers(), "Insta-Kill!")
    getPlayers(Team.1).setDamageDealt(999999)
    getPlayers(Team.2).setDamageReceived(1000)
    wait(30)
    getPlayersInSlot(0, Team.1).setDamageDealt(getPlayersInSlot(0, Team.1).damagevariable)
    getPlayersInSlot(1, Team.1).setDamageDealt(getPlayersInSlot(1, Team.1).damagevariable)
    getPlayersInSlot(2, Team.1).setDamageDealt(getPlayersInSlot(2, Team.1).damagevariable)
    getPlayersInSlot(3, Team.1).setDamageDealt(getPlayersInSlot(3, Team.1).damagevariable)
    getPlayers(Team.2).setDamageReceived(100)
    getPlayers(Team.1).G[4] = false
    getPlayers(Team.1).S[4] = false


rule "39 Pickup InstaUlt":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[0]) <= 1.5
    @Condition getPlayers(Team.1).G[0] == false
    @Condition roundnumber >= 1
    
    M[0] = vect(500, 25, 500)
    getPlayers(Team.1).G[0] = true
    getPlayers(Team.1).S[0] = 1
    bigMessage(getAllPlayers(), l"{0} {1} {2}".format(l"Unlimited", l"Ultimate Ability", l"-> {0}".format(l"{0} sec".format(15))))
    wait(15)
    getPlayers(Team.1).G[0] = false
    getPlayers(Team.1).S[0] = false


rule "40 InstaUlt Active":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.G[0] == true
    
    eventPlayer.setUltCharge(100)
    wait(2, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "43 zone blockers (needs arrays)":
    @Event eachPlayer
    @Team 1
    #should use a is true for any
    @Condition distance(eventPlayer, vect(-92.307, -149.655, 143.069)) <= 3
    #@Condition any([distance(player, eventPlayer) < diedradius[i] for player, i in Z]) == true
    @Condition distance(eventPlayer, vect(-71.911, -149.645, 141.974)) <= 3
    @Condition distance(eventPlayer, vect(-83.688, -149.566, 141.589)) <= 3    
    @Condition getPlayersInRadius(vect(202.856, -7.605, -227.935), 2.5, Team.1) == true
    @Condition getPlayersInRadius(vect(204.956, -7.585, -218.951), 2.5, Team.1) == true
    @Condition getPlayersInRadius(vect(-109.785, -151.582, 129.01), 2.5, Team.1) == true
    @Condition getPlayersInRadius(vect(196.085, -7.577, -239.357), 2.5, Team.1) == true
    @Condition outofpsawn == 1
    
    eventPlayer.teleport(vect(-93.817, -151.08, 135.029))
    eventPlayer.teleport(vect(-85.208, -152.021, 134.181))
    eventPlayer.teleport(vect(-70.751, -150.926, 132.657))    
    eventPlayer.teleport(vect(208.001, -8.354, -232.409))
    eventPlayer.teleport(vect(208.268, -8.333, -222.771))
    eventPlayer.teleport(vect(-108.361, -151.555, 133.284))
    eventPlayer.teleport(vect(202.24, -7.533, -244.729))


rule "48 WORKSHOP SETTINGS":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    
    wait(3)
    walljumpers = createWorkshopSettingBool("difficulty", "zombies jump with no colision", true)
    eventPlayer.healvariable = createWorkshopSettingInt("difficulty", "healing dealt", 25, 0, 500)
    eventPlayer.setGravity(createWorkshopSettingFloat("fun", "gravity", 100, 25, 200))
    wait(3)
    eventPlayer.setHealingDealt(eventPlayer.healvariable)
    zombspeed = createWorkshopSettingBool("difficulty", "zombies speed varies", true)
    zombstrafe = createWorkshopSettingInt("difficulty", "zombies strafe", 1, 0, 1)
    zombjump = createWorkshopSettingInt("difficulty", "zombies jump", 1, 0, 1)
    experiencesystem = createWorkshopSettingBool("fun", "experience system", true)
    if experiencesystem == false:
        goto lbl_0
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setUltEnabled(false)
    lbl_0:
    idlebots = createWorkshopSettingBool("stability", "idle bots", false)
    getPlayers(Team.1).setProjectileGravity(createWorkshopSettingInt("fun", "projectile gravity team 1", 100, 25, 500))
    getPlayers(Team.1).setProjectileSpeed(createWorkshopSettingInt("fun", "projectile speed team 1", 100, 25, 500))
    getPlayers(Team.2).setProjectileGravity(createWorkshopSettingInt("fun", "projectile gravity team 2", 75, 25, 500))
    getPlayers(Team.2).setProjectileSpeed(createWorkshopSettingInt("fun", "projectile speed team 2", 50, 25, 500))
    spawntype = createWorkshopSettingInt("difficulty", "brig=0 torb=1 random=2 directed=3 totalrng=4", 4, 0, 4)


rule "83 power challenge effects":
    @Condition powerconnected == 1
    @Condition roundnumber < 15
    
    #change this to be all heros on team 2
    getPlayersOnHero(Hero.BRIGITTE, Team.2).setUltCharge(100)


rule "88 disable vanilla features":
    @Event playerJoined
    
    disableMusic()
    getAllPlayers().disableKillFeed()
    disableAnnouncer()
    #getAllPlayers().disableScoreboard()
    getLivingPlayers(Team.2).disableNameplatesFor(getPlayers(Team.1))
    #disableInspector()
    disableScoring()
    disableGamemodeCompletion()
    getAllPlayers().disableGamemodeInWorldUi()
    getAllPlayers().disableGamemodeHud()
    getAllPlayers().disableRespawn()
    eventPlayer.F = false
    eventPlayer.H = 1
    #eventPlayer.disableTextChat()
    wait(4)
    eventPlayer.allowedheroes = []
    wait(4)
    eventPlayer.allowedheroes.append(eventPlayer.getHero())

rule "498 Rule 480 start screen":
    @Event eachPlayer
    @Team 1
    #need more player feedback on how they enjoy the start screen
    @Condition start == false
    
    eventPlayer.startCamera(vect(255.366, 9.471, -169.75), vect(261.155, 6.939, -180.808))
    eventPlayer.disableHeroHud()
    wait(15, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(159.409, 82.32, 212.576), vect(267.128, 50, 130.027))
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(343.545, 75.093, 219.552), vect(267.128, 50, 130.027), 0.2)
    wait(15, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(353.189, 30.177, -98.238), vect(284.894, -20, -243.771))
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(272.905, 4.398, -171.199), vect(284.894, -20, -243.771), 0.2)
    wait(15, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(-135.038, -140.843, -18.138), vect(-16.898, -155.331, 62.147))
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(-137.925, -143.078, 135.228), vect(-16.898, -155.331, 62.147), 0.2)
    wait(15, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "497 start control":
    @Event eachPlayer
    @Team 1
    @Condition start == false
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    
    setspawn = random.randint(0, 5)
    wait(0.25)
    start = 1
    aprilrng = random.randint(1, 100)
    startlines = random.randint(0, 8)
    eventPlayer.heroswap[0] = eventPlayer.getHero()
    rngbox2 = random.choice(Mysterylocations2)
    wait(1)
    roundnumber = createWorkshopSettingInt("Set Wave number", "Set starting wave", 1, 1, 100)
    enableMusic()
    rngbox = random.choice(mysterylocations)
    getAllPlayers().startCamera(vect(269.985, 35.41, 143.855), vect(269.985, 35.06, 140.284))
    createInWorldText(getAllPlayers(), "Good Luck...", vect(269.985, 35.06, 140.284), 5, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    wait(4)
    getAllPlayers().stopCamera()
    wait(0.1)
    getAllPlayers().enableHeroHud()


rule "521 start screen message":
    @Event eachPlayer
    @Condition start == false
    
    smallMessage(eventPlayer, "  Press melee for settings")
    smallMessage(eventPlayer, "  Press jump to start")
    wait(8)
    if ruleCondition:
        loop()

rule "565 door message":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.doormessage == 1
    
    wait(5)
    eventPlayer.doormessage = false


rule "38 Pickup vaporized":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[3]) <= 1.5
    @Condition getPlayers(Team.1).G[3] == false
    @Condition roundnumber >= 1
    
    M[4] = vect(500, 25, 500)
    getPlayers(Team.1).G[3] = true
    getPlayers(Team.1).S[3] = 1
    bigMessage(getAllPlayers(), "Vaporized")
    kill(getLivingPlayers(Team.2), getLivingPlayers(Team.1)[0])
    wait(3)
    getPlayers(Team.1).G[3] = false
    getPlayers(Team.1).S[3] = false


rule "39 Pickup max ammo":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[5]) <= 1.5
    @Condition getPlayers(Team.1).G[5] == false
    @Condition roundnumber >= 1
    
    M[5] = vect(500, 25, 500)
    getPlayers(Team.1).G[5] = true
    getPlayers(Team.1).S[5] = 1
    getLivingPlayers(Team.1).magazines += 10
    bigMessage(getAllPlayers(), "Max ammo!")
    wait(3)
    getPlayers(Team.1).G[5] = false
    getPlayers(Team.1).S[5] = false


rule "143 DIFFICULTY damage resistance":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    
    if Difficulty == 1:
        #needs to be changed if i introduce armor
        eventPlayer.setDamageReceived(25)
    elif Difficulty == 2:
        eventPlayer.setDamageReceived(50)
    elif Difficulty == 3:
        eventPlayer.setDamageReceived(100)


rule "159 workshop setting explosive rounds(could add a cheats menu somewhere)":
    @Event playerDealtDamage
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition createWorkshopSettingBool("fun", "explosive rounds", false) == true
    
    damage(getPlayersInRadius(victim, 3, Team.2), attacker, 300)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.RED, victim, 3)
    wait(0.45)


rule "191 Trap logic":
    @Condition trapeffect == true
    
    createDummy(Hero.BASTION, Team.1, 12, vect(-86.342, -150.729, 39.793))
    omnicspawn[18] = getPlayersInSlot(12, Team.1).getSlot()
    createDummy(Hero.BASTION, Team.1, 13, vect(-82.277, -150.687, 80.335))
    omnicspawn[19] = getPlayersInSlot(13, Team.1).getSlot()
    getPlayersInSlot(12, Team.1).startForcingButton(Button.PRIMARY_FIRE)
    wait(0.25)
    getPlayersInSlot(12, Team.1).T = 1
    getPlayersInSlot(13, Team.1).T = 1
    getPlayersInSlot(12, Team.1).forceButtonPress(Button.ABILITY_1)
    getPlayersInSlot(13, Team.1).forceButtonPress(Button.ABILITY_1)
    getPlayersInSlot(13, Team.1).startForcingButton(Button.PRIMARY_FIRE)
    wait(20)
    destroyDummy(Team.1, omnicspawn[18])
    destroyDummy(Team.1, omnicspawn[19])


rule "192 Purchase trap":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, vect(-83.799, -160.001, 64.224)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition trapeffect == false
    
    if eventPlayer.points >= 1000:
        trapeffect = 1
        playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
        eventPlayer.points -= 2000
        wait(22)
        trapeffect = false
    elif eventPlayer.points < 1000:
        smallMessage(eventPlayer, "  {0}  A Trap? No! Omnics need purpose!".format(heroIcon(Hero.RAMATTRA)))
        wait(4)


rule "299 out of bounce boundry":
    @Event eachPlayer
    @Team 1
    @Condition getPlayersInRadius(vect(-109.55, -151.893, -6.832), 2.5, Team.1) == true
    @Condition start == 1
    
    eventPlayer.teleport(vect(-104.638, -150.413, -15.437))


rule "403 Challenge waves":
    @Event eachPlayer
    @Team 2
    @Condition challengewave == 1
    @Condition eventPlayer.isAlive() == true
    
    eventPlayer.setUltCharge(100)
    if numberOfZombies < 4:
        challengewave = false


rule "404 set challenge wave every few rounds":
    @Condition chwaveinterval >= 4
    
    challengewave = random.randint(0, 1)
    if challengewave == 1:
        chwaveinterval = false


rule "bastion bot re enter turret mode (need to add cooldown reduction to seemlessly re-enter turret mode)":
    @Event eachPlayer
    @Team 1
    @Hero bastion
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    wait(0.25)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(6.5)
    loop()


rule "235 is not assembling heroes get out of spawn":
    #might need another condition to check if softrestarted
    @Condition isAssemblingHeroes() == false
    
    wait(30)
    outofpsawn = 1


rule "teleporter timer":
    @Condition teleporterwait > 0
    
    wait(60)
    teleporterwait = false
    #if ruleCondition:
    #        loop()


rule "teleporter back to blue":
    @Condition teleporterwait == false
    
    teleportercolor = Color.BLUE


rule "Rule 235":
    @Condition isAssemblingHeroes() == false
    
    wait(30)
    outofpsawn = 1


rule "bastion re enter turret mode (need to add cooldown reduction to seemlessly re-enter turret mode)":
    @Event eachPlayer
    @Team 1
    @Hero bastion
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    wait(0.25)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(6.5)
    loop()


