rule "105 specific hero ammo and double mag":
    @Event eachPlayer
    @Team 1
    @Condition (eventPlayer.isHoldingButton(Button.ABILITY_1) or eventPlayer.isHoldingButton(Button.ABILITY_2) or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) or eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)) == true
    
    if eventPlayer.isHoldingButton(Button.SECONDARY_FIRE):
        if eventPlayer.getHero() == Hero.MOIRA:
            if eventPlayer.extraPlayerVar[1] == false:
                eventPlayer.currentmagazines -= 0.05
                wait(0.25)
                if ruleCondition:
                    loop()
            elif eventPlayer.extraPlayerVar[1] == 1:
                eventPlayer.currentmagazines -= 0.025
                wait(0.25)
                if ruleCondition:
                    loop()
    if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
        if eventPlayer.getHero() == Hero.DOOMFIST:
            if eventPlayer.extraPlayerVar[1] == false:
                eventPlayer.currentmagazines -= 0.25
                wait(0.25)
                if ruleCondition:
                    loop()
        elif eventPlayer.getHero() == Hero.DVA:
            if eventPlayer.isInAlternateForm() == false:
                if eventPlayer.extraPlayerVar[1] == false:
                    eventPlayer.currentmagazines -= 0.05
                    wait(0.15)
                    if ruleCondition:
                        loop()
                elif eventPlayer.extraPlayerVar[1] == 1:
                    eventPlayer.currentmagazines -= 0.025
                    wait(0.125)
                    if ruleCondition:
                        loop()
        elif eventPlayer.getHero() == Hero.HANZO:
            if eventPlayer.extraPlayerVar[1] == false:
                eventPlayer.currentmagazines -= 0.25
            elif eventPlayer.extraPlayerVar[1] == 1:
                    eventPlayer.currentmagazines -= 0.125
        elif eventPlayer.getHero() == Hero.SIGMA:
            if eventPlayer.extraPlayerVar[1] == false:
                eventPlayer.currentmagazines -= 0.050
                wait(0.1)
                eventPlayer.currentmagazines -= 0.050
                wait(1.5)
                if ruleCondition:
                    loop()
            elif eventPlayer.extraPlayerVar[1] == 1:
                eventPlayer.currentmagazines -= 0.025
                wait(0.1)
                eventPlayer.currentmagazines -= 0.025
                wait(1.5)
                if ruleCondition:
                    loop()
    elif eventPlayer.getHero() == Hero.REAPER:
        if eventPlayer.isUsingAbility1():
            eventPlayer.currentmagazines -= 0.5
    elif eventPlayer.getHero() == Hero.CASSIDY:
        if eventPlayer.isUsingAbility1():
            if eventPlayer.getAmmo() == 6:
                goto lbl_0
            eventPlayer.currentmagazines -= 0.5
            lbl_0:



        if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):


        if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):

    elif eventPlayer.getHero() == Hero.REINHARDT:
        if eventPlayer.isUsingAbility2():
            if eventPlayer.extraPlayerVar[1] == false:
                eventPlayer.currentmagazines -= 0.25
            elif eventPlayer.extraPlayerVar[1] == 1:
                eventPlayer.currentmagazines -= 0.125


rule "136  dva ammo double mag":
    @Event eachPlayer
    @Team 1
    @Hero dva
    @Condition eventPlayer.doublemag == 1
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true

    if eventPlayer.isInAlternateForm() == false:
        eventPlayer.currentmagazines -= 0.025
        wait(0.15)
        if ruleCondition:
            loop()
    

rule "350 hanzo ammo cancel (wip)":
    @Event eachPlayer
    @Hero hanzo
    @Condition (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)) == true
    @Disabled
    
    wait(0.1, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.doublemag == false:
        eventPlayer.magazines += 0.25
    elif eventPlayer.doublemag == 1:
        eventPlayer.magazines += 0.125


rule "132  rien out of ammo":
    @Event eachPlayer
    @Team 1
    @Hero reinhardt
    @Condition eventPlayer.currentmagazines <= 0
    @Condition eventPlayer.isUsingAbility2() == true
    
    eventPlayer.disallowButton(Button.ABILITY_2)


rule "112  hanzo ammo":
    @Event eachPlayer
    @Team 1
    @Hero hanzo
    @Condition eventPlayer.isFiringPrimaryFire() == true
    @Condition eventPlayer.doublemag == false
    
    eventPlayer.currentmagazines -= 0.25


rule "84 reloading all heros without doublemag":
    @Event eachPlayer
    @Team 1
    #can be made into one rule with or without perk
    @Condition eventPlayer.isReloading() == true
    @Condition eventPlayer.doublemag == false
    
    eventPlayer.currentmagazines -= 1


rule "89 out of ammo":
    @Event eachPlayer
    #can just have an if else statement for specific heros
    @Condition eventPlayer.getHero() != Hero.MOIRA
    @Condition eventPlayer.getHero() != Hero.MERCY
    @Condition eventPlayer.getHero() != Hero.REINHARDT
    @Condition eventPlayer.getHero() != Hero.BRIGITTE
    @Condition eventPlayer.getHero() != Hero.TORBJORN
    @Condition eventPlayer.getHero() != Hero.MEI
    @Condition eventPlayer.isDummy() != true
    @Condition eventPlayer.currentmagazines <= 0
    
        eventPlayer.setPrimaryFireEnabled(false)
        eventPlayer.setSecondaryFireEnabled(false)


rule "90 initialize ammo amount":
    @Event eachPlayer
    
    eventPlayer.magazines[0] = 5
    eventPlayer.magazines[1] = 5
    eventPlayer.currentmagazines = eventPlayer.magazines[0]
    eventPlayer.currentswap = false
    eventPlayer.disallowButton(Button.CROUCH)
    eventPlayer.ultcharge[0] = false
    eventPlayer.ultcharge[1] = false
    wait()
    eventPlayer.currentultcharge = eventPlayer.ultcharge[0]
    wait()
    eventPlayer.setUltCharge(eventPlayer.ultcharge[0])


rule "91 enable guns when they have ammo":
    @Event eachPlayer
    @Condition eventPlayer.currentmagazines > 0
    @Condition eventPlayer.getHero() != Hero.MEI
    
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.setSecondaryFireEnabled(true)


rule "94 out of ammo moira":
    @Event eachPlayer
    @Hero moira
    @Condition eventPlayer.currentmagazines <= 0
    
    eventPlayer.setSecondaryFireEnabled(false)


rule "96 mercy disable gun if no ammo":
    @Event eachPlayer
    @Team 1
    @Hero mercy
    @Condition eventPlayer.getCurrentWeapon() == 2
    @Condition eventPlayer.magazines <= 0
    
    eventPlayer.setWeapon(1)


rule "97 torb disable gun if no ammo":
    @Event eachPlayer
    @Team 1
    @Hero torbjorn
    @Condition eventPlayer.getCurrentWeapon() == 1
    @Condition eventPlayer.magazines <= 0
    
    eventPlayer.setWeapon(2)


rule "98  reloading with doublemag":
    @Event eachPlayer
    @Condition eventPlayer.isReloading() == true
    @Condition eventPlayer.doublemag == 1
    
    eventPlayer.currentmagazines -= 0.5

rule "103  remove less than zero issue on ammo":
    @Event eachPlayer
    @Condition eventPlayer.currentmagazines < 0
    
    eventPlayer.currentmagazines = false


rule "104 fix reload disabled":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.getHero() != Hero.ASHE
    
    eventPlayer.allowButton(Button.RELOAD)

rule "113  ashe reload fix":
    @Event eachPlayer
    @Team 1
    @Hero ashe
    @Condition eventPlayer.isReloading() == true
    
    wait(0.45)
    eventPlayer.setAmmo(0, 12)


rule "115  ammo message force melee when out of ammo":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.currentmagazines == false
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    
    smallMessage(eventPlayer, "  NO AMMO")
    bigMessage(eventPlayer, "  USE MELEE")
    wait(5)
    smallMessage(eventPlayer, "  MELEE BONUS DAMAGE")
    wait(5)
    smallMessage(eventPlayer, "  buy any hero for more ammo")

rule "161 life weiver no ammo":
    @Event eachPlayer
    @Team 1
    @Hero lifeweaver
    @Condition eventPlayer.currentmagazines == false
    
    #this doesnt seem to work, need to measure time instead of reloads
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)


rule "160 life weaver ammo":
    @Event eachPlayer
    @Team 1
    @Hero lifeweaver
    @Condition eventPlayer.isReloading() == false
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    
    eventPlayer.currentmagazines -= 0.025
    wait(0.1)
    if ruleCondition:
        loop()


rule "171 no ammo force melee":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.currentmagazines <= 0
    @Condition (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)) == true
    
    eventPlayer.forceButtonPress(Button.MELEE)


rule "160 orisa ammo":
    @Event eachPlayer
    @Team 1
    @Hero orisa
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    
    eventPlayer.currentmagazines -= 0.05
    wait(0.2)
    if ruleCondition:
        loop()