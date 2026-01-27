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


