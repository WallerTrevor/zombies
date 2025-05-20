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
    @Condition __assignTo__(eventPlayer.doorresponse, false)
    
    #some heros need double mag
    if eventPlayer.getHero() == Hero.MOIRA:
        if eventPlayer.isFiringSecondaryFire() == true:
            if __assignTo__(eventPlayer.doublemag, false):
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
            if __assignTo__(eventPlayer.doublemag, false):
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
            if __assignTo__(eventPlayer.doublemag, false):
                eventPlayer.magazines -= 0.25
                wait(0.25)
                if ruleCondition:
                    loop()
    elif eventPlayer.getHero() == Hero.HANZO:
        if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true:
            if __assignTo__(eventPlayer.doublemag, false):
                eventPlayer.magazines -= 0.25
            elif eventPlayer.doublemag == 1:
                eventPlayer.magazines -= 0.125
    elif eventPlayer.getHero() == Hero.SIGMA:
        if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true:
            if __assignTo__(eventPlayer.doublemag, false):
                eventPlayer.magazines -= 0.2
            elif eventPlayer.doublemag == 1:
                eventPlayer.magazines -= 0.1
    elif eventPlayer.getHero() == Hero.REINHARDT:
        if eventPlayer.isUsingAbility2() == true:
            if __assignTo__(eventPlayer.doublemag, false):
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


