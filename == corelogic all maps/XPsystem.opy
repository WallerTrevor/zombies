rule "516 rounds add points and XP":
    @Event eachPlayer
    @Team 1
    @Condition roundnumber >= 1
    @Condition createWorkshopSettingBool("difficulty", "Each round adds XP and points in co-op", true) == true
    
    #modify these to scale based off difficulty
    eventPlayer.xp += 30
    #if getNumberOfPlayers(Team.1) > 2: set starting points
    eventPlayer.points2 += 500


rule "517 set xp to hero":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isAlive() == true
    
    #not working currently
    if eventPlayer.getHero() == Hero.DVA:
        eventPlayer.currentheroxp = false
    elif eventPlayer.getHero() == Hero.DOOMFIST:
        eventPlayer.currentheroxp = 1
    elif eventPlayer.getHero() == Hero.JUNKER_QUEEN:
        eventPlayer.currentheroxp = 2
    elif eventPlayer.getHero() == Hero.ANA:
        eventPlayer.currentheroxp = 3
    elif eventPlayer.getHero() == Hero.ORISA:
        eventPlayer.currentheroxp = 4
    elif eventPlayer.getHero() == Hero.RAMATTRA:
        eventPlayer.currentheroxp = 5
    elif eventPlayer.getHero() == Hero.REINHARDT:
        eventPlayer.currentheroxp = 6
    elif eventPlayer.getHero() == Hero.ROADHOG:
        eventPlayer.currentheroxp = 7
    elif eventPlayer.getHero() == Hero.SIGMA:
        eventPlayer.currentheroxp = 8
    elif eventPlayer.getHero() == Hero.WINSTON:
        eventPlayer.currentheroxp = 9
    elif eventPlayer.getHero() == Hero.WRECKING_BALL:
        eventPlayer.currentheroxp = 10
    elif eventPlayer.getHero() == Hero.ZARYA:
        eventPlayer.currentheroxp = 11
    elif eventPlayer.getHero() == Hero.ASHE:
        eventPlayer.currentheroxp = 12
    elif eventPlayer.getHero() == Hero.BASTION:
        eventPlayer.currentheroxp = 13
    elif eventPlayer.getHero() == Hero.CASSIDY:
        eventPlayer.currentheroxp = 14
    elif eventPlayer.getHero() == Hero.ECHO:
        eventPlayer.currentheroxp = 15
    elif eventPlayer.getHero() == Hero.GENJI:
        eventPlayer.currentheroxp = 16
    elif eventPlayer.getHero() == Hero.HANZO:
        eventPlayer.currentheroxp = 17
    elif eventPlayer.getHero() == Hero.JUNKRAT:
        eventPlayer.currentheroxp = 18
    elif eventPlayer.getHero() == Hero.MEI:
        eventPlayer.currentheroxp = 19
    elif eventPlayer.getHero() == Hero.PHARAH:
        eventPlayer.currentheroxp = 20
    elif eventPlayer.getHero() == Hero.REAPER:
        eventPlayer.currentheroxp = 21
    elif eventPlayer.getHero() == Hero.SOJOURN:
        eventPlayer.currentheroxp = 22
    elif eventPlayer.getHero() == Hero.SOLDIER:
        eventPlayer.currentheroxp = 23
    elif eventPlayer.getHero() == Hero.SOMBRA:
        eventPlayer.currentheroxp = 24
    elif eventPlayer.getHero() == Hero.SYMMETRA:
        eventPlayer.currentheroxp = 25
    elif eventPlayer.getHero() == Hero.TORBJORN:
        eventPlayer.currentheroxp = 26
    elif eventPlayer.getHero() == Hero.WIDOWMAKER:
        eventPlayer.currentheroxp = 27
    elif eventPlayer.getHero() == Hero.BAPTISTE:
        eventPlayer.currentheroxp = 28
    elif eventPlayer.getHero() == Hero.BRIGITTE:
        eventPlayer.currentheroxp = 29
    elif eventPlayer.getHero() == Hero.KIRIKO:
        eventPlayer.currentheroxp = 30
    elif eventPlayer.getHero() == Hero.LUCIO:
        eventPlayer.currentheroxp = 31
    elif eventPlayer.getHero() == Hero.MERCY:
        eventPlayer.currentheroxp = 32
    elif eventPlayer.getHero() == Hero.MOIRA:
        eventPlayer.currentheroxp = 33
    elif eventPlayer.getHero() == Hero.ZENYATTA:
        eventPlayer.currentheroxp = 34


rule "512 gain level":
    @Event eachPlayer
    @Condition eventPlayer.xp[eventPlayer.currentheroxp] >= 100
    @Condition experiencesystem == true
    
    eventPlayer.XPlevel[eventPlayer.currentheroxp] += 1
    eventPlayer.xp[eventPlayer.currentheroxp] = false
    #eventPlayer.damagevariable += random.randint(1, 10)
    #eventPlayer.healvariable += random.randint(3, 13)
    #eventPlayer.healthmax += random.randint(1, 5)


rule "513 Rule 321 lvl gain stat changes":
    @Event eachPlayer
    @Team 1
    @Condition experiencesystem == true
    
    if eventPlayer.XPlevel == 5:
        eventPlayer.setAbility1Enabled(true)
    elif eventPlayer.XPlevel == 10:
        eventPlayer.setAbility2Enabled(true)
    elif eventPlayer.XPlevel == 15:
        eventPlayer.setUltEnabled(true)


