def perkbuyanimation():
    @Name "buy perk subroutine"
    
    wait(0.25)
    eventPlayer.communicate(Comms.EMOTE_UP)
    wait(0.05)
    eventPlayer.setMoveSpeed(0)
    wait(2)
    eventPlayer.setMoveSpeed(100)


rule "229 buy perks and power activate":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition any([[distance(player, eventPlayer) < heroradius[0]] for player, i in buyperks]) == true
    @Condition any([distance(player, eventPlayer) < heroradius[i] for player, i in buyperks]) == true
    @Condition any([[distance(player, eventPlayer) < heroradius[0]] for player, i in buyperks]) == true


    if getServerLoad() < 245:
        for i in range(len(buyperks)):
            if distance(eventPlayer, buyperks[i]) < 2 and i != 6:
                if poweron == 1:
                    if eventPlayer.points >= round(perkcosts[i] * costmultiplier- eventPlayer.creditcardlimit):
                        if eventPlayer.perk[i] < 3:
                            eventPlayer.points -= round(perkcosts[i] * costmultiplier * eventPlayer.cashback)
                    if eventPlayer.points >= perkcosts[i] - eventPlayer.creditcardlimit:
                        if eventPlayer.perk[i] < 3:
                            eventPlayer.points -= perkcosts[i] * eventPlayer.cashback
                    if eventPlayer.points >= round(perkcosts[i] * costmultiplier- eventPlayer.creditcardlimit):
                        if eventPlayer.perk[i] < 3:
                            eventPlayer.points -= round(perkcosts[i] * costmultiplier * eventPlayer.cashback)
                            wait(0.25)
                            eventPlayer.perk[i] += 1
                            smallMessage(eventPlayer, "  {0} {1}".format(heroIcon(Hero.RAMATTRA), perkmessages[i]))
                            perkbuyanimation()
                            break
                        else:
                            smallMessage(eventPlayer, "  {0} You already have the max tier!".format(heroIcon(Hero.RAMATTRA)))
                            break
                    elif eventPlayer.points < perkcosts[i]:
                        smallMessage(eventPlayer, "  {0} No points? NO perks!".format(heroIcon(Hero.RAMATTRA)))
                        break
                else:
                    smallMessage(eventPlayer, "  {0} The power is not ON!".format(heroIcon(Hero.RAMATTRA)))
                    break  # Stop after the first match
                    #pack a punch (make this not a perk, and have its own hud element outside the perk area)

rule "boss buy (consolidate later)":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition any([distance(player, eventPlayer) < 2 for player, i in bossbuypositions]) == true

    for i in range(len(bossbuypositions)):
        if distance(bossbuypositions[i], eventPlayer) < 2:

rule "connect power":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(eventPlayer, buyperks[6]) < 2
    @Condition poweron == 0

    playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
    destroyEffect(powerconnected[0])
    destroyInWorldText(powerconnected[1])
    poweron = 1
    getPlayers(Team.2).setUltCharge(100)
    smallMessage(getAllPlayers(), "  The power is now ON!")


rule "202 Purchase hero actions":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition any([distance(eventPlayer, buyheros[i]) < heroradius[0]])  == true

    if getServerLoad() < 245:
        for eventPlayer.idx in range(len(buyheros)):
            if distance(eventPlayer, buyheros[eventPlayer.idx]) < 2:
                if eventPlayer.getHero() == hero[eventPlayer.idx]:
                    if eventPlayer.points >= round((herobuycosts[eventPlayer.idx] / 2) * costmultiplier - eventPlayer.creditcardlimit) and eventPlayer.currentmagazines < 10:
                        eventPlayer.points -= round((herobuycosts[eventPlayer.idx] / 2) * costmultiplier * eventPlayer.cashback)
                    if eventPlayer.points >= (herobuycosts[eventPlayer.idx] / 2) - eventPlayer.creditcardlimit and eventPlayer.currentmagazines < 10:
                        eventPlayer.points -= (herobuycosts[eventPlayer.idx] / 2) * eventPlayer.cashback
                    if eventPlayer.points >= round((herobuycosts[eventPlayer.idx] / 2) * costmultiplier - eventPlayer.creditcardlimit) and eventPlayer.currentmagazines < 10:
                        eventPlayer.points -= round((herobuycosts[eventPlayer.idx] / 2) * costmultiplier * eventPlayer.cashback)
                        wait(0.25)
                        chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, herobuycosts[eventPlayer.idx])
                        eventPlayer.currentmagazines = 10
                        smallMessage(eventPlayer, "  {0} Magazines refilled!".format(heroIcon(hero[eventPlayer.idx])))
                        break  # Stop after the first match
                    else: 
                        if eventPlayer.currentmagazines >= 10:
                            smallMessage(eventPlayer, "  You already have full magazines!")
                        elif eventPlayer.points < herobuycosts[eventPlayer.idx] / 2:
                            smallMessage(eventPlayer, "  {0} No points? NO magazines!".format(heroIcon(Hero.RAMATTRA)))
                else:
                    if eventPlayer.points >= round(herobuycosts[eventPlayer.idx] * costmultiplier - eventPlayer.creditcardlimit):       
                    if eventPlayer.points >= herobuycosts[eventPlayer.idx] - eventPlayer.creditcardlimit:       
                    if eventPlayer.points >= round(herobuycosts[eventPlayer.idx] * costmultiplier - eventPlayer.creditcardlimit):       
                        eventPlayer.startForcingHero(hero[eventPlayer.idx])
                        eventPlayer.heroswap[eventPlayer.currentswap] = hero[eventPlayer.idx]
                        eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[eventPlayer.idx])
                        playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
                        eventPlayer.points -= round(herobuycosts[eventPlayer.idx] * costmultiplier * eventPlayer.cashback)
                        eventPlayer.points -= herobuycosts[eventPlayer.idx] * eventPlayer.cashback
                        eventPlayer.points -= round(herobuycosts[eventPlayer.idx] * costmultiplier * eventPlayer.cashback)
                        wait(0.25)
                        chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, herobuycosts[eventPlayer.idx])
                        playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_DISAPPEAR, Color.WHITE, eventPlayer, 1)
                        (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
                        if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                            eventPlayer.allowedheroes.append(eventPlayer.getHero())
                        eventPlayer.currentmagazines = 10
                        if eventPlayer.getHero() == hero[eventPlayer.idx]:
                            goto lbl_0
                        if experiencesystem == false:
                            goto lbl_1
                        eventPlayer.XPlevel = false
                        eventPlayer.xp = false
                        lbl_0:
                        lbl_1:
                    else:
                        smallMessage(eventPlayer, "{0}".format(herobuymessages[eventPlayer.idx])) #the message to say that you can't buy it
                    break  # Stop after the first match
            #buy ending
            if distance(eventPlayer, vect(-101.303, -150.36, -17.831)) < 2:
                if eventPlayer.points >= 50000:
                    setSlowMotion(40)
                    wait(2)
                    setSlowMotion(100)
                    eventPlayer.points -= 50000 * eventPlayer.cashback
                    chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 50000)
                    smallMessage(eventPlayer, "  {0} You really thought this was going to end?".format(heroIcon(Hero.RAMATTRA)))
                    kill(getAllPlayers())
                    wait(0.1)
                    #sudo code: give player tier 3 pack a punch on hero for all runs from then on. and then soft restart
                elif eventPlayer.points < 50000:
                    smallMessage(eventPlayer, "  {0} HA, good luck escaping...".format(heroIcon(Hero.RAMATTRA)))
    else:
        smallMessage(eventPlayer, "{0} Error: {1} No Heroes for you! (--ANTICRASHSYS--)".format(heroIcon(Hero.RAMATTRA), random.randint(10, 1000)))


rule "78 buy revive multiplayer":# maybe change this perk
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, vect(-83.583, -155.045, 120.352)) < 4
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.points >= round(1000 * costmultiplier - eventPlayer.creditcardlimit)
    @Condition eventPlayer.points >= 1000
    @Condition eventPlayer.points >= round(1000 * costmultiplier - eventPlayer.creditcardlimit)
    @Condition powerconnected == 1
    #@Condition __assignTo__(eventPlayer.revivebought, false)
    @Condition getNumberOfPlayers(Team.1) > 1
    
    eventPlayer.points -= round(1000 * costmultiplier * eventPlayer.cashback)
    eventPlayer.points -= 1000 * eventPlayer.cashback
    eventPlayer.points -= round(1000 * costmultiplier * eventPlayer.cashback)
    chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
    playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
    wait(0.1)

    eventPlayer.revived = 1
    wait(0.1)
    eventPlayer.communicate(Comms.EMOTE_UP)
    #eventPlayer.revivebought = 1
    wait(0.05)
    eventPlayer.setMoveSpeed(0)
    wait(2)
    eventPlayer.setMoveSpeed(100)


rule "173 Purchase winston Omnic bomb":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, buyperks[9]) < 4
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.points >= 2500
    @Condition powerconnected == 1
    @Condition eventPlayer.Movement == false
    
    eventPlayer.points -= 2500 * eventPlayer.cashback
    @Condition eventPlayer.points >= round(2500 * costmultiplier - eventPlayer.creditcardlimit)
    @Condition powerconnected == 1
    @Condition eventPlayer.Movement == false
    
    eventPlayer.points -= round(2500 * costmultiplier * eventPlayer.cashback)
    chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 2500)
    eventPlayer.Movement = 1
    playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
    wait(0.1)
    eventPlayer.communicate(Comms.EMOTE_UP)
    eventPlayer.Head_HP = 3
    wait(0.05)
    eventPlayer.setMoveSpeed(0)
    wait(2)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.Part2 = false