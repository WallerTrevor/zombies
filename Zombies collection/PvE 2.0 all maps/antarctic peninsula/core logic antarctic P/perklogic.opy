rule "73 Headshot maniac Perk add damage":
    @Event playerDealtDamage
    @Team 1
    @Condition eventPlayer.Maniac == 1
    @Condition eventWasCriticalHit == true
    @Condition eventPlayer.damagevariable < 391
    
    eventPlayer.damagevariable += 10
    eventPlayer.setDamageDealt(eventPlayer.damagevariable)


rule "74 headshot maniac Perk remove damage":
    @Event playerDealtDamage
    @Team 1
    #make it so this plays nicely with pack a punch
    @Condition eventWasCriticalHit == false
    @Condition eventPlayer.damagevariable >= 55
    @Condition eventPlayer.Maniac == 1
    
    eventPlayer.damagevariable -= 2.5
    eventPlayer.setDamageDealt(eventPlayer.damagevariable)


rule "jugg tier 2 and 3":
    @Event playerTookDamage
    @Team 1
    @Condition eventPlayer.Jugg > 1
    
    if eventPlayer.Jugg == 2:
        wait(10, Wait.RESTART_WHEN_TRUE)
        #need to make sure this doesnt stack infinitely
        eventPlayer.addHealthPool(Health.NORMAL, 25, false, false)
    elif eventPlayer.Jugg == 3:
        wait(10, Wait.RESTART_WHEN_TRUE)
        eventPlayer.addHealthPool(Health.NORMAL, 50, false, false)


rule "109 PERK player hit speed boost sprint burst":
    @Event playerTookDamage
    @Team 1
    @Condition eventDamage == true
    @Condition eventPlayer.sprintburstperk == 1
    
    eventPlayer.setMoveSpeed(180)
    wait(1)
    eventPlayer.setMoveSpeed(105)

rule "79 player died with maniac":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.Maniac == 1
    
    Died[eventPlayer.getSlot()] = nearestWalkablePosition(eventPlayer)
    bigMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, random.choice(diedphrase)))
    E[eventPlayer.getSlot()] = true
    eventPlayer.setMaxHealth(100)
    eventPlayer.stopForcingCurrentHero()
    wait()
    eventPlayer.Jugg = false
    wait()
    eventPlayer.healthmax = 50
    eventPlayer.Maniac = false
    wait()
    eventPlayer.setDamageDealt(100)
    eventPlayer.damagevariable = 100
    wait()
    eventPlayer.healvariable = 100
    eventPlayer.setHealingDealt(100)
    eventPlayer.doublemag = false
    wait(0.1)
    eventPlayer.sprintburstperk = false
    eventPlayer.setAllowedHeroes(eventPlayer.allowedheroes)


rule "77 multiplayer extra life Perk":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.revived == 1
    
    #should set this to be a quick revive perk
    eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 2)
    eventPlayer.resurrect()
    eventPlayer.setStatusEffect(null, Status.INVINCIBLE, 10)
    eventPlayer.revived = false
