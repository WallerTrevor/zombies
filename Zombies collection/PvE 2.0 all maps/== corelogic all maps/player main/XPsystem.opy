rule "516 rounds add points and XP":
    @Event eachPlayer
    @Team 1
    @Condition roundnumber >= 1
    @Condition createWorkshopSettingBool("difficulty", "Each round adds XP and points in co-op", true) == true
    @Disabled
    
    #modify these to scale based off difficulty
    eventPlayer.xp += 30
    #if getNumberOfPlayers(Team.1) > 2: set starting points
    eventPlayer.points2 += 500


rule "517 set xp to hero":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isAlive() == true


    for i in range(0, 35):
        if eventPlayer.getHero() == hero[i]:
            eventPlayer.currentheroxp = eventPlayer.xp[i]


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
    

    if eventPlayer.XPlevel[eventPlayer.currentheroxp] == 5:
        eventPlayer.setSecondaryFireEnabled(true)
    elif eventPlayer.XPlevel[eventPlayer.currentheroxp] == 10:
        eventPlayer.setAbility1Enabled(true)
    elif eventPlayer.XPlevel[eventPlayer.currentheroxp] == 15:
        eventPlayer.setAbility2Enabled(true)
    elif eventPlayer.XPlevel[eventPlayer.currentheroxp] == 20:
        eventPlayer.setUltEnabled(true)


