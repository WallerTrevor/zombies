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

#!extension kineticExplosionEffects
#!extension explosionSounds
#!extension energyExplosionEffects
#!extension buffStatusEffects


rule "257 Devestator Big Boss 1===============================================":
    @Event eachPlayer
    @Team 2
    @Condition Bosssequencer == 1
    @Disabled
    
    #might make it so the hammonds arent attached and roll around
    createDummy(Hero.ORISA, Team.2, -1, vect(-80.776, -159.164, 59.549))
    omnicspawn[0] = getPlayersInSlot(0, Team.2).getSlot()
    wait(5)
    eventPlayer.setDamageDealt(200)
    eventPlayer.setKnockbackReceived(0)
    eventPlayer.Speed = 100
    eventPlayer.startScalingSize(3)
    eventPlayer.setMaxHealth(1000)
    eventPlayer.startForcingName("Devastator")
    wait()
    createDummy(Hero.WRECKING_BALL, Team.2, -1, eventPlayer)
    wait()
    getLastCreatedEntity().attachTo(getPlayersOnHero(Hero.ORISA, Team.2), vect(1, 3, 1))
    wait()
    getLastCreatedEntity().Part = "Rocket launcher"
    eventPlayer.addHealthPool(Health.ARMOR, 3000, true)
    eventPlayer.addHealthPool(Health.NORMAL, 3000, true)
    wait()
    createDummy(Hero.WRECKING_BALL, Team.2, -1, eventPlayer)
    wait()
    getLastCreatedEntity().attachTo(eventPlayer, vect(-1, 3, 1))
    wait()
    getLastCreatedEntity().Part = "Rocket launcher"
    wait()
    createDummy(Hero.WRECKING_BALL, Team.2, -1, eventPlayer)
    wait()
    getLastCreatedEntity().attachTo(eventPlayer, vect(0, 4, -1))
    wait()
    getLastCreatedEntity().Part = "Generator"
    wait()
    createDummy(Hero.BASTION, Team.2, -1, eventPlayer)
    wait()
    getLastCreatedEntity().attachTo(eventPlayer, vect(1.75, 4.25, 0))
    wait()
    getLastCreatedEntity().Part = "Cannon"
    wait()
    createDummy(Hero.BASTION, Team.2, -1, eventPlayer)
    wait()
    getLastCreatedEntity().attachTo(eventPlayer, vect(-1.75, 4.25, 0))
    wait()
    getLastCreatedEntity().Part = "Cannon"
    wait()
    createDummy(Hero.WRECKING_BALL, Team.2, -1, eventPlayer)
    wait()
    getLastCreatedEntity().attachTo(eventPlayer, vect(0, 1.75, -1.25))
    wait()
    getLastCreatedEntity().Part = "Leg joint"
    if eventPlayer.isDead():
        #set this to be looped and simplified
        eventPlayer.removeAllHealthPools()
        playEffect(getAllPlayers(), DynamicEffect.JUNKRAT_RIP_TIRE_EXPLOSION, Color.WHITE, eventPlayer, 1)
        playEffect(getAllPlayers(), DynamicEffect.JUNKRAT_RIP_TIRE_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
        playEffect(getAllPlayers(), DynamicEffect.ASHE_DYNAMITE_EXPLOSION, Color.WHITE, eventPlayer, 1)
        playEffect(getAllPlayers(), DynamicEffect.ASHE_DYNAMITE_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
        playEffect(getAllPlayers(), DynamicEffect.DVA_SELF_DESTRUCT_EXPLOSION, Color.WHITE, eventPlayer, 1)
        playEffect(getAllPlayers(), DynamicEffect.DVA_SELF_DESTRUCT_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
        wait(0.25)
    waitUntil(eventPlayer.isAlive() == true, 99999)
    if eventPlayer.Part == "rocket launcher":
        eventPlayer.startForcingName("Rocket launcher")
        eventPlayer.setMaxHealth(500)
        wait(2)
        eventPlayer.setHealingReceived(0)
    elif eventPlayer.Part == "generator":
        eventPlayer.startForcingName("Generator")
        createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED, Color.WHITE, eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.setMaxHealth(500)
        wait(2)
        eventPlayer.setHealingReceived(0)
    elif eventPlayer.Part == "Cannon":
        wait(0.25, Wait.ABORT_WHEN_FALSE)
        eventPlayer.startForcingThrottle(1, 1, 0, 1, 0, 1)
        eventPlayer.setKnockbackDealt(0)
        eventPlayer.startForcingName("Cannon")
        eventPlayer.setMaxHealth(1000)
        eventPlayer.startScalingSize(1.5)
        wait(2)
        eventPlayer.setHealingReceived(0)
    elif eventPlayer.Part == "Leg joint":
        eventPlayer.startForcingName("Leg joint")
        eventPlayer.setMaxHealth(500)
        eventPlayer.startScalingSize(1.2)
        createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED, Color.WHITE, eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        wait(2)
        eventPlayer.setHealingReceived(0)
    elif eventPlayer.Part == "Leg joint":


rule "263 Cannon stay in form":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition eventPlayer.isUsingAbility1() != true
    @Condition eventPlayer.Part == "Cannon"
    @Disabled
    
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.25)
    if ruleCondition:
        loop()


rule "266 Omnic Big Boss Part destroyed":
    @Event playerDied
    @Team 2
    @Disabled
    
    if eventPlayer.Part == "leg joint":
        getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).Speed = false
        getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 2)
    elif eventPlayer.Part == "rocket launcher":
        getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 2)
    elif eventPlayer.Part == "Cannon":
        getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 2)
        playEffect(getAllPlayers(), DynamicEffect.ASHE_DYNAMITE_EXPLOSION, Color.WHITE, eventPlayer, 1)
        playEffect(getAllPlayers(), DynamicEffect.ASHE_DYNAMITE_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    elif eventPlayer.Part == "Generator":
        playEffect(getAllPlayers(), DynamicEffect.SOMBRA_EMP_EXPLOSION_EFFECT, Color.WHITE, eventPlayer, 1)
        playEffect(getAllPlayers(), DynamicEffect.SOMBRA_EMP_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
        getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 4)
        damage(getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()), attacker, 1500)
        playEffect(getAllPlayers(), DynamicEffect.JUNKRAT_RIP_TIRE_EXPLOSION, Color.WHITE, eventPlayer, 1)
        playEffect(getAllPlayers(), DynamicEffect.JUNKRAT_RIP_TIRE_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)


rule "270 Making cannons shoot":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition getPlayersOnHero(Hero.ORISA, Team.2).isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.Part == "Cannon"
    @Disabled
    
    eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    wait(0.1)
    eventPlayer.cancelPrimaryAction()
    wait(0.1)
    wait(3)
    if ruleCondition:
        loop()


rule "271 Making rockets shoot":
    @Event eachPlayer
    @Team 2
    @Hero wreckingBall
    @Condition getPlayersOnHero(Hero.ORISA, Team.2).isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.Part == "Rocket launcher"
    @Disabled
    
    playEffect(getAllPlayers(), DynamicEffect.DVA_MICRO_MISSILES_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    playEffect(getAllPlayers(), DynamicEffect.DVA_MICRO_MISSILES_EXPLOSION, Color.WHITE, eventPlayer, 1)
    createHomingProjectile(Projectile.PHARAH_ROCKET, eventPlayer, null, null, Relativity.TO_WORLD, ModifyHealth.DAMAGE, getOppositeTeam(eventPlayer.getTeam()), 100, 1, 3, DynamicEffect.ASHE_DYNAMITE_EXPLOSION, DynamicEffect.ASHE_DYNAMITE_EXPLOSION_SOUND, 0, 50, 5, 0, raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 100, getAllPlayers(), eventPlayer, true).getPlayerHit(), 0.25)
    wait(0.5)
    wait(3)
    if ruleCondition:
        loop()


rule "272 Unleash fire breath shoot":
    @Event eachPlayer
    @Team 2
    @Hero orisa
    @Condition eventPlayer.isUsingAbility2() == true
    @Disabled
    
    createProjectile(Projectile.REINHARDT_FIRE_STRIKE, eventPlayer, null, null, Relativity.TO_WORLD, ModifyHealth.DAMAGE, getOppositeTeam(eventPlayer.getTeam()), 50, 1, 0, DynamicEffect.REINHARDT_FIRE_STRIKE_TARGET_IMPACT, DynamicEffect.REINHARDT_FIRE_STRIKE_TARGET_IMPACT_SOUND, 0.1, 50, 5)
    wait(0.05)
    if ruleCondition:
        loop()


