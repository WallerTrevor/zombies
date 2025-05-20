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


rule "105 specific hero ammo and double mag":
    @Event eachPlayer
    @Team 1
    #works with this for some reason?
    @Condition eventPlayer.doorresponse == false
    
    #some heros need double mag
    if eventPlayer.getHero() == Hero.MOIRA:
        if eventPlayer.isFiringSecondaryFire() == true:
            if eventPlayer.doublemag == false:
                eventPlayer.magazines -= 0.05
                wait(0.25)
                if ruleCondition:
                    loop()
            elif eventPlayer.doublemag == 1:
                eventPlayer.magazines -= 0.025
                wait(0.25)
                if ruleCondition:
                    loop()
    elif eventPlayer.getHero() == Hero.DVA:
        if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true:
            if eventPlayer.doublemag == false:
                eventPlayer.magazines -= 0.05
                wait(0.15)
                if ruleCondition:
                    loop()
            elif eventPlayer.doublemag == 1:
                eventPlayer.magazines -= 0.025
                wait(0.125)
                if ruleCondition:
                    loop()
    elif eventPlayer.getHero() == Hero.REAPER:
        if eventPlayer.isUsingAbility1() == true:
            eventPlayer.magazines -= 0.5
    elif eventPlayer.getHero() == Hero.CASSIDY:
        if eventPlayer.isUsingAbility1() == true:
            if eventPlayer.getAmmo() == 6:
                goto lbl_0
            eventPlayer.magazines -= 0.5
            lbl_0:
    elif eventPlayer.getHero() == Hero.DOOMFIST:
        if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true:
            if eventPlayer.doublemag == false:
                eventPlayer.magazines -= 0.25
                wait(0.25)
                if ruleCondition:
                    loop()
    elif eventPlayer.getHero() == Hero.HANZO:
        if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true:
            if eventPlayer.doublemag == false:
                eventPlayer.magazines -= 0.25
            elif eventPlayer.doublemag == 1:
                eventPlayer.magazines -= 0.125
    elif eventPlayer.getHero() == Hero.SIGMA:
        if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true:
            if eventPlayer.doublemag == false:
                eventPlayer.magazines -= 0.2
            elif eventPlayer.doublemag == 1:
                eventPlayer.magazines -= 0.1
    elif eventPlayer.getHero() == Hero.REINHARDT:
        if eventPlayer.isUsingAbility2() == true:
            if eventPlayer.doublemag == false:
                eventPlayer.magazines -= 0.25
            elif eventPlayer.doublemag == 1:
                eventPlayer.magazines -= 0.125


rule "136  dva ammo double mag":
    @Event eachPlayer
    @Team 1
    @Hero dva
    @Condition eventPlayer.doublemag == 1
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    
    eventPlayer.currentmagazines -= 0.025
    wait(0.15)
    if ruleCondition:
        loop()


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


