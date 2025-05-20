#Global variables

globalvar roundnumber 0
globalvar numberOfZombies 1
globalvar Difficulty 3
globalvar powerconnected 13
globalvar Died 18
globalvar Vectordoorpositions 21
globalvar doors 26
globalvar impulseDoorArray 27
globalvar telespot 28
globalvar lesszomb 29
globalvar walljumpers 30
globalvar dispencerposition 31
globalvar zombspeed 32
globalvar zombstrafe 33
globalvar zombjump 34
globalvar experiencesystem 35
globalvar hero 36
globalvar idlebots 37
globalvar dispencerplaced 38
globalvar trapeffect 41
globalvar start 42
globalvar buyheros 43
globalvar buyperks 44
globalvar doorradius 46
globalvar mysterylocations 47
globalvar rngbox 48
globalvar boxcounter 49
globalvar rngbox2 50
globalvar boxcounter2 51
globalvar Mysterylocations2 52
globalvar omnicspawn 53
globalvar bossSpawn 54
globalvar bot1spawn 55
globalvar bot2spawn 56
globalvar challengewave 58
globalvar chwaveinterval 59
globalvar setspawn 60
globalvar aprilquotes 61
globalvar aprilrng 62
globalvar spawntype 63
globalvar botspawnzone 64
globalvar Beameffectdoors 65
globalvar Bosssequencer 66
globalvar dooreffectsequencer 67
globalvar appenddoorsequencer 68
globalvar startlines 70
globalvar heroradius 71
globalvar diedradius 72
globalvar tipstrings 73
globalvar bossbuypositions 74
globalvar herobuyrandomized 75
globalvar perkbuyrandomized 76
globalvar outofpsawn 77
globalvar romanN 78
globalvar romanNcounter 79
globalvar teleportercolor 80
globalvar teleporterwait 81
globalvar forindex 82
globalvar forindex2 83


#Player variables

playervar points 0
playervar magazines 3
playervar doublemag 4
playervar sprintburstperk 9
playervar healthmax 10
playervar damagevariable 11
playervar healvariable 12
playervar InfoUI 13
playervar InfoCooldown 14
playervar botTarget 16
playervar HideHints 17
playervar XPlevel 23
playervar Jugg 26
playervar singlelives 27
playervar Packapunch 28
playervar Maniac 30
playervar revived 31
playervar revivebought 32
playervar UI 33
playervar idlebot 36
playervar healovertime 38
playervar xp 39
playervar Movement 40
playervar Head_HP 41
playervar Part 42
playervar Part2 43
playervar Speed 44
playervar doorimpulse 45
playervar dispencereffect 46
playervar xparray 47
playervar herohp 49
playervar currentheroxp 51
playervar doormessage 52
playervar currentdoor 53
playervar Major_Attacks 55
playervar currentdoorIndex 56
playervar do 57
playervar doorresponse 58
playervar heroswap 59
playervar currentswap 60
playervar perkinfo 61
playervar Perkui 62
playervar currentmagazines 63
playervar currentultcharge 64
playervar ultcharge 65
playervar heroiconswap 66
playervar abilitycooldown 67
playervar followerbuy 68


#Subroutine names

subroutine herobuy1250 0
subroutine herobuy1750 2
subroutine doorimpulse 3
subroutine wavespawn 4
subroutine followerattack1 5
subroutine followerattack2 6
subroutine perkbuyanimation 7
subroutine followerbuy 8


#Activated extensions

#!extension buffStatusEffects
#!extension kineticExplosionEffects
#!extension explosionSounds


rule "273 Colossal charger stats Big boss 2 ===================================================":
    @Event eachPlayer
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.isAlive() == true
    @Condition Bosssequencer == 2
    @Disabled
    
    createDummy(Hero.REINHARDT, Team.2, 0, vect(-80.776, -159.164, 59.549))
    omnicspawn[0] = getPlayersInSlot(0, Team.2).getSlot()
    eventPlayer.setDamageDealt(50)
    eventPlayer.setMoveSpeed(50)
    eventPlayer.Part = 1
    eventPlayer.setKnockbackReceived(20)
    eventPlayer.Head_HP = 1500
    eventPlayer.setStatusEffect(null, Status.UNKILLABLE, 9999)
    eventPlayer.setMaxHealth(1000)
    eventPlayer.startForcingName("Colossal Charger ")
    eventPlayer.startScalingSize(2)
    wait(0.25)
    createEffect(getAllPlayers(), Effect.ECHO_CLONING, Color.WHITE, eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    wait()
    createDummy(Hero.BASTION, Team.2, -1, eventPlayer)
    wait(0.5)
    getLastCreatedEntity().attachTo(getPlayersOnHero(Hero.REINHARDT, Team.2), vect(-1.5, 1.25, 0))
    getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection(), 1000)
    getLastCreatedEntity().Part = "Minigun"
    wait()
    createDummy(Hero.WRECKING_BALL, Team.2, -1, eventPlayer)
    wait()
    getLastCreatedEntity().attachTo(getPlayersOnHero(Hero.REINHARDT, Team.2), vect(1.25, 2.5, 0.75))
    eventPlayer.addHealthPool(Health.NORMAL, 2000, true)
    getLastCreatedEntity().Part = "Arm connector"
    waitUntil(eventPlayer.isDead() == true, 99999)
    eventPlayer.removeAllHealthPools()


rule "274 Minigun stats":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.Part == "Minigun"
    @Disabled
    
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setProjectileSpeed(125)
    eventPlayer.setKnockbackDealt(0)
    eventPlayer.setMaxHealth(1000)
    eventPlayer.startForcingName("Minigun")
    eventPlayer.startForcingThrottle(1, 1, 0, 1, 0, 1)
    wait(0.25)
    #createEffect(getAllPlayers(), Effect.ECHO_CLONING, Color.WHITE, eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    waitUntil(eventPlayer.isDead() == true, 99999)
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 1)


rule "Minigun stay in form":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition eventPlayer.isUsingAbility1() != true
    @Disabled
    
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    wait(0.25)
    if ruleCondition:
        loop()


rule "276 Arm connector stats":
    @Event eachPlayer
    @Team 2
    @Hero wreckingBall
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.Part == "Arm connector"
    @Disabled
    
    eventPlayer.setHealingReceived(0)
    eventPlayer.setMaxHealth(500)
    eventPlayer.startForcingName("Arm connector")
    eventPlayer.startScalingSize(0.8)
    eventPlayer.Part2 = true
    wait(0.25)
    createEffect(getAllPlayers(), Effect.ECHO_CLONING, Color.WHITE, eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    waitUntil(eventPlayer.isDead() == true, 99999)
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 1)
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).setUltEnabled(false)
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).Part = false


rule "277 Colossal charger dies":
    @Event playerTookDamage
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.getHealth() == 1
    @Condition roundnumber == 20
    @Disabled
    
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 6)
    wait(3)
    eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 9999)
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).stopForcingThrottle()
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).detach()
    wait(1)
    eventPlayer.clearStatusEffect(Status.UNKILLABLE)
    wait()
    kill(getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()))
    waitUntil(eventPlayer.isAlive() == true, 99999)
    destroyAllEffects()


rule "278 Colossal charger head hp function":
    @Event playerTookDamage
    @Team 2
    @Hero reinhardt
    @Condition eventWasCriticalHit == true
    @Condition eventPlayer.Head_HP > 0
    @Condition roundnumber == 20
    @Disabled
    
    eventPlayer.Head_HP -= eventDamage


rule "279 Colossal charger lose head":
    @Event eachPlayer
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.Head_HP <= 0
    @Condition roundnumber == 20
    @Disabled
    
    eventPlayer.setStatusEffect(null, Status.STUNNED, 2)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.RED, eventPlayer.getEyePosition() + vect(0, 0, 0), 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    playEffect(getAllPlayers(), DynamicEffect.WRECKING_BALL_MINEFIELD_EXPLOSION, Color.WHITE, eventPlayer.getEyePosition(), 1)
    playEffect(getAllPlayers(), DynamicEffect.WRECKING_BALL_MINEFIELD_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)


rule "280 Colossal charger slam":
    @Event eachPlayer
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition roundnumber == 20
    @Disabled
    
    playEffect(getAllPlayers(), DynamicEffect.DOOMFIST_METEOR_STRIKE_IMPACT, Color.WHITE, eventPlayer.getPosition(), 1)
    playEffect(getAllPlayers(), DynamicEffect.DOOMFIST_METEOR_STRIKE_IMPACT_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    damage(getPlayersInRadius(eventPlayer, 15, getOppositeTeam(eventPlayer.getTeam()), LosCheck.SURFACES_AND_ENEMY_BARRIERS), eventPlayer, 75)


rule "281 Colossal charger firestrike barrage":
    @Event eachPlayer
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition roundnumber == 20
    @Disabled
    
    eventPlayer.cancelPrimaryAction()
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(0.5)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 8)


rule "282 Making minigun shoot":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition getPlayersOnHero(Hero.REINHARDT, Team.2).isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.Part == "Minigun"
    @Disabled
    
    eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    wait(0.05)
    eventPlayer.cancelPrimaryAction()
    wait(0.05)
    wait(5)
    if ruleCondition:
        loop()


