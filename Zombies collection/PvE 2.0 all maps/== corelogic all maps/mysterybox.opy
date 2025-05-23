rule "53  mystery box":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(eventPlayer, rngbox) <= 2
    @Condition eventPlayer.points >= 950
    
    if eventPlayer.points > 950:
        playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
        eventPlayer.startForcingHero(random.choice(random.shuffle(getAllHeroes()))[0])
        wait(0.1)
        eventPlayer.resurrect()
        eventPlayer.points -= 950
        eventPlayer.heroswap[eventPlayer.currentswap] = eventPlayer.getHero()
        eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(eventPlayer.getHero())
        if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
            eventPlayer.allowedheroes.append(eventPlayer.getHero())
        #if ruleCondition:
        #            loop()
        eventPlayer.currentmagazines = 10
        #if experiencesystem == false:
        #            goto lbl_0
        #eventPlayer.XPlevel = false
        #eventPlayer.xp = false
        lbl_0:
        boxcounter += 1
        wait(1)
        if boxcounter < random.randint(6, 10):
            goto lbl_1
        rngbox = random.choice(mysterylocations)
        boxcounter = false
        lbl_1:
    elif eventPlayer.points < 950:
        bigMessage(eventPlayer, "Come back when you've got some money buddy!")


