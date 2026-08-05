#Really got to fix the "magic numbers" but really i want to get OSTW language installed and have the project in OOP paradigms

/*
perk[0] = pack a punch
perk[1] = juggernaut
perk[2] = speed boost
perk[3] = headshot maniac
perk[4] = extra life
perk[5] = double mag
buyperks[6] = power switch "technically not a perk, but it is in the perk area"

*/

rule "73 Headshot maniac Perk add damage":
    @Event playerDealtDamage
    @Team 1
    @Condition eventPlayer.perk[3] == 1
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
    @Condition eventPlayer.perk[3] == 1
    
    eventPlayer.damagevariable -= 2.5
    eventPlayer.setDamageDealt(eventPlayer.damagevariable)


rule "jugg tier 2 and 3":
    @Event playerTookDamage
    @Team 1
    @Condition eventPlayer.perk[1] > 0
    

    if eventPlayer.perk[1] == 2:
        wait(10, Wait.RESTART_WHEN_TRUE)
        #need to make sure this doesnt stack infinitely
        eventPlayer.addHealthPool(Health.NORMAL, 25, false, false)
    elif eventPlayer.perk[1] == 3:
        wait(10, Wait.RESTART_WHEN_TRUE)
        eventPlayer.addHealthPool(Health.NORMAL, 50, false, false)

rule "give juggernaut tier 1":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.perk[1] == 1

    eventPlayer.setMaxHealth(200)

rule "109 PERK player hit speed boost sprint burst": # I would combine this with the normal system, but i want to keep it seperate for organization
    @Event playerTookDamage
    @Team 1
    @Condition eventDamage == true
    @Condition eventPlayer.perk[2] == 1
    if eventPlayer.perk[2] == 1:
        eventPlayer.setMoveSpeed(180)
        wait(1)
        eventPlayer.setMoveSpeed(105)
    elif eventPlayer.perk[2] == 2:
        eventPlayer.setMoveSpeed(200)
        wait(1)
        eventPlayer.setMoveSpeed(107)
    elif eventPlayer.perk[2] == 3:
        eventPlayer.setMoveSpeed(220)
        wait(1)
        eventPlayer.setMoveSpeed(110)


rule "79 player died with maniac": #dont need 2 rules for maniac
    @Event playerDied
    @Team 1
    @Condition eventPlayer.perk[3] == 1
    
    Died[eventPlayer.getSlot()] = nearestWalkablePosition(eventPlayer)
    bigMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, random.choice(diedphrase)))
    E[eventPlayer.getSlot()] = true
    eventPlayer.setMaxHealth(100)
    eventPlayer.stopForcingCurrentHero()
    wait()
    eventPlayer.perk[3] = false
    wait()
    eventPlayer.healthmax = 50
    eventPlayer.perk[3] = false
    wait()
    eventPlayer.setDamageDealt(100)
    eventPlayer.damagevariable = 100
    wait()
    eventPlayer.healvariable = 100
    eventPlayer.setHealingDealt(100)
    eventPlayer.perk[5] = false
    wait(0.1)
    eventPlayer.perk[2] = false
    eventPlayer.setAllowedHeroes(eventPlayer.allowedheroes)


rule "77 multiplayer extra life Perk":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.perk[4] == 1
    
    #should set this to be a quick revive perk
    eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 2)
    eventPlayer.resurrect()
    eventPlayer.setStatusEffect(null, Status.INVINCIBLE, 10)
    eventPlayer.perk[4] = 0

rule "pack a punch ability":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.perk[0] > 0

    if eventPlayer.perk[0] == 1:
        eventPlayer.setDamageDealt(250)
        eventPlayer.damagevariable = 250
    elif eventPlayer.perk[0] == 2:
        eventPlayer.setDamageDealt(500)
        eventPlayer.damagevariable = 500
    elif eventPlayer.perk[0] == 3:
        eventPlayer.setDamageDealt(1000)
        eventPlayer.damagevariable = 1000


#rule Double mag perk is baked into the ammo system under ammosystem.opy perk[5]