rule "283 Imperial warmech setup ================================================":
    @Event eachPlayer
    @Team 2
    @Hero dva
    @Condition Bosssequencer == 3
    @Disabled
    
    createDummy(Hero.DVA, Team.2, 0, vect(-80.776, -159.164, 59.549))
    omnicspawn[0] = getPlayersInSlot(0, Team.2).getSlot()
    #Imperial warmech
    eventPlayer.setKnockbackReceived(0)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(200)
    eventPlayer.startScalingSize(3)
    eventPlayer.startForcingName("Imperial warmech ")
    wait(3)
    #Cannon 1
    createDummy(Hero.WRECKING_BALL, Team.2, -1, eventPlayer)
    wait(1)
    getLastCreatedEntity().attachTo(getPlayersOnHero(Hero.DVA, Team.2), vect(0, 6.1, 1))
    getLastCreatedEntity().Part = "Cannon"
    getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection(), 1000)
    wait()
    #Cannon 2
    createDummy(Hero.WRECKING_BALL, Team.2, -1, eventPlayer)
    wait(1)
    getLastCreatedEntity().attachTo(getPlayersOnHero(Hero.DVA, Team.2), vect(2.15, 5.4, 1))
    getLastCreatedEntity().Part = "Cannon"
    getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection(), 1000)
    wait()
    #Cannon 3
    createDummy(Hero.WRECKING_BALL, Team.2, -1, eventPlayer)
    wait(1)
    getLastCreatedEntity().attachTo(getPlayersOnHero(Hero.DVA, Team.2), vect(-2.15, 5.4, 1))
    getLastCreatedEntity().Part = "Cannon"
    getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection(), 1000)
    wait()
    #Machine gun 1
    createDummy(Hero.BASTION, Team.2, -1, eventPlayer)
    wait(1)
    getLastCreatedEntity().attachTo(getPlayersOnHero(Hero.DVA, Team.2), vect(2, 3, 1))
    getLastCreatedEntity().Part = "Machine gun"
    getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection(), 1000)
    wait()
    #Machine gun 2
    createDummy(Hero.BASTION, Team.2, -1, eventPlayer)
    wait(1)
    getLastCreatedEntity().attachTo(getPlayersOnHero(Hero.DVA, Team.2), vect(-2, 3, 1))
    getLastCreatedEntity().Part = "Machine gun"
    eventPlayer.addHealthPool(Health.ARMOR, 9999, true)
    getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection(), 1000)
    waitUntil(eventPlayer.isDead() == true, 99999)
    eventPlayer.removeAllHealthPools()


rule "284 Cannon stats":
    @Event eachPlayer
    @Team 2
    @Hero wreckingBall
    @Condition eventPlayer.Part == "Cannon"
    @Disabled
    
    eventPlayer.setHealingReceived(0)
    eventPlayer.setMaxHealth(500)
    eventPlayer.startForcingName("Homing Cannon")
    wait(0.35)
    waitUntil(eventPlayer.isDead() == true, 99999)
    getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 2)


rule "285 Cannon shoot":
    @Event eachPlayer
    @Team 2
    @Hero wreckingBall
    @Condition getPlayersOnHero(Hero.DVA, Team.2).isHoldingButton(Button.PRIMARY_FIRE) == true
    @Disabled
    
    createHomingProjectile(Projectile.SIGMA_HYPERSPHERE, eventPlayer, null, null, Relativity.TO_WORLD, ModifyHealth.DAMAGE, getOppositeTeam(eventPlayer.getTeam()), 75, 0, 5, DynamicEffect.BASTION_TANK_CANNON_EXPLOSION, DynamicEffect.BASTION_TANK_CANNON_EXPLOSION_SOUND, 0.1, 30, 5, 5, eventPlayer.getPlayerClosestToReticle(getOppositeTeam(eventPlayer.getTeam())), 0.5)
    playEffect(getAllPlayers(), DynamicEffect.CASSIDY_FLASHBANG_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 100)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.GRAY, eventPlayer, 2)
    wait(1)
    if ruleCondition:
        loop()


rule "286 Machine gun stats":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.Part == "Machine gun"
    @Disabled
    
    eventPlayer.setDamageDealt(100)
    eventPlayer.startScalingSize(1.25)
    eventPlayer.setMaxHealth(1000)
    eventPlayer.startForcingName("Machine gun")
    eventPlayer.startForcingThrottle(1, 1, 0, 1, 0, 1)
    wait(0.35)
    waitUntil(eventPlayer.isDead() == true, 99999)
    getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 2)


rule "287 Machine gun keep form":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition eventPlayer.isUsingAbility1() != true
    @Condition eventPlayer.isDummy() == true
    @Disabled
    
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.25)
    if ruleCondition:
        loop()


rule "288 Machine gun shoot":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition getPlayersOnHero(Hero.DVA, Team.2).isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.isDummy() == true
    @Disabled
    
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(2)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    wait(1, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "289 Imperial warmech set attacks":
    @Event eachPlayer
    @Team 2
    @Hero dva
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.isAlive() == true
    @Disabled
    
    eventPlayer.Major_Attacks = random.randint(2, 6)
    wait(0.25)
    if eventPlayer.Major_Attacks == 2:
        playEffect(getAllPlayers(), DynamicEffect.WRECKING_BALL_PILEDRIVER_IMPACT_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
        playEffect(getAllPlayers(), DynamicEffect.WRECKING_BALL_PILEDRIVER_IMPACT, Color.WHITE, eventPlayer.getPosition(), 1)
        wait(0.75)
        createDummy(Hero.PHARAH, Team.2, -1, eventPlayer)
        wait()
        getLastCreatedEntity().setStatusEffect(null, Status.PHASED_OUT, 9999)
        getLastCreatedEntity().attachTo(eventPlayer, vect(0, 5, 0))
        getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection(), 1000)
        wait(7)
        if ruleCondition:
            loop()
    elif eventPlayer.Major_Attacks == 3:
        createDummy(Hero.ZARYA, Team.2, -1, eventPlayer)
        wait()
        getLastCreatedEntity().setStatusEffect(null, Status.PHASED_OUT, 9999)
        getLastCreatedEntity().attachTo(eventPlayer, vect(0, 2, 0))
        getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection() + vect(random.randint(-1, 1), 0, 0), 1000, Relativity.TO_PLAYER)
        wait(7)
        if ruleCondition:
            loop()
    elif eventPlayer.Major_Attacks == 4:
        createDummy(Hero.SOJOURN, Team.2, -1, eventPlayer)
        wait()
        getLastCreatedEntity().setStatusEffect(null, Status.PHASED_OUT, 9999)
        getLastCreatedEntity().attachTo(eventPlayer, vect(0, 5, 0))
        getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection(), 1000)
        wait(7)
        if ruleCondition:
            loop()
    elif eventPlayer.Major_Attacks == 5:
        createDummy(Hero.MOIRA, Team.2, -1, eventPlayer)
        wait()
        getLastCreatedEntity().setStatusEffect(null, Status.PHASED_OUT, 9999)
        getLastCreatedEntity().attachTo(eventPlayer, vect(0, 4, 0))
        getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection(), 1000)
        wait(7)
        if ruleCondition:
            loop()
    elif eventPlayer.Major_Attacks == 6:
        createDummy(Hero.JUNKRAT, Team.2, -1, eventPlayer)
        wait()
        getLastCreatedEntity().setStatusEffect(null, Status.PHASED_OUT, 9999)
        getLastCreatedEntity().attachTo(eventPlayer, vect(0, 4, -1))
        getLastCreatedEntity().startFacing(eventPlayer.getFacingDirection(), 1000)
        wait(7)
        if ruleCondition:
            loop()


rule "290 Rockets function":
    @Event eachPlayer
    @Team 2
    @Hero pharah
    @Condition eventPlayer.isDummy() == true
    @Disabled
    
    eventPlayer.setDamageDealt(100)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.startForcingName("Rockets")
    wait(0.25)
    eventPlayer.setUltCharge(100)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(2.5)
    eventPlayer.setUltCharge(100)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(3.5)
    destroyDummy(eventPlayer.getTeam(), eventPlayer.getSlot())


rule "291 Artillery setup":
    @Event eachPlayer
    @Team 2
    @Hero zarya
    @Condition eventPlayer.isDummy() == true
    @Disabled
    
    eventPlayer.setDamageDealt(100)
    eventPlayer.startForcingName("Artillery")
    eventPlayer.setAmmo(0, 1)
    eventPlayer.setMaxAmmo(0, 1)
    eventPlayer.setInvisibility(Invis.ALL)
    wait(6)
    destroyDummy(eventPlayer.getTeam(), eventPlayer.getSlot())


rule "292 Artillery function":
    @Event eachPlayer
    @Team 2
    @Hero zarya
    @Condition eventPlayer.isDummy() == true
    @Disabled
    
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    wait(0.05)
    eventPlayer.setAmmo(0, 1)
    if ruleCondition:
        loop()


rule "293 Imperial warmech destroyed":
    @Event eachPlayer
    @Team 2
    @Hero dva
    @Condition eventPlayer.isInAlternateForm() == true
    @Disabled
    
    wait(0.1, Wait.ABORT_WHEN_FALSE)
    kill(getPlayersInRadius(eventPlayer, 7, eventPlayer.getTeam()))
    playEffect(getAllPlayers(), DynamicEffect.BASTION_TANK_CANNON_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    playEffect(getAllPlayers(), DynamicEffect.BASTION_TANK_CANNON_EXPLOSION, Color.WHITE, eventPlayer + vect(random.randint(-4, 4), random.randint(-3, 3), random.randint(-3, 3)), 1)
    wait(0.25)
    waitUntil(__assignTo__(eventPlayer.isAlive(), false), 99999)
    destroyAllEffects()
    eventPlayer.clearStatusEffect(Status.BURNING)


rule "294 Electric field bombs function":
    @Event eachPlayer
    @Team 2
    @Hero sojourn
    @Condition eventPlayer.isDummy() == true
    @Disabled
    
    eventPlayer.setDamageDealt(100)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.startForcingName("Electric field bombs")
    wait(0.5)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(0.5)
    eventPlayer.cancelPrimaryAction()
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(4)
    destroyDummy(eventPlayer.getTeam(), eventPlayer.getSlot())


rule "295 Laser function":
    @Event eachPlayer
    @Team 2
    @Hero moira
    @Condition eventPlayer.isDummy() == true
    @Condition roundnumber == 30
    @Disabled
    
    eventPlayer.setHealingDealt(0)
    eventPlayer.setDamageDealt(200)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.startForcingName("Laser")
    wait(0.25)
    eventPlayer.setUltCharge(100)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(6.25)
    destroyDummy(eventPlayer.getTeam(), eventPlayer.getSlot())


rule "296 Seeking Mega mine function":
    @Event eachPlayer
    @Team 2
    @Hero junkrat
    @Condition eventPlayer.isDummy() == true
    @Disabled
    
    eventPlayer.setMaxHealth(300)
    eventPlayer.setDamageDealt(100)
    eventPlayer.startForcingName("Seeking Mega mine")
    wait(0.25)
    eventPlayer.setUltCharge(100)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(3)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(2.25)
    destroyDummy(eventPlayer.getTeam(), eventPlayer.getSlot())


