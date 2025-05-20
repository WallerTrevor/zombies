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


