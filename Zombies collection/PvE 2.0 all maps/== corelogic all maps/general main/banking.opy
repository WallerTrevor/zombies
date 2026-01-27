rule "56  points loss for high roller":
    @Event playerDied
    @Team 1
    
    bankPoints += eventPlayer.points * 0.20
    eventPlayer.points -= eventPlayer.points * 0.3
    eventPlayer.points = ceil(eventPlayer.points)




rule "global bank system":
    createEffect(getAllPlayers(), Effect.RING, Color.YELLOW, vect(270.637, 38.147, 176.339), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "Property damage: ${0}".format(extraVar[36]), vect(270.637, 38.147, 176.339), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.YELLOW)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, vect(275.586, 38.147, 177.222), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "Bank: {0} Points".format(extraVar[38]), vect(275.586, 38.147, 177.222), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, vect(273.277, 38.147, 176.182), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), iconString(Icon.ARROW_UP), vect(273.277, 38.147, 176.182), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, vect(277.261, 38.147, 178.713), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), iconString(Icon.ARROW_DOWN), vect(277.261, 38.147, 178.713), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, vect(299.653, -14.545, -222.024), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), abilityIconString(Hero.KIRIKO, Button.PRIMARY_FIRE), vect(299.653, -14.545, -222.024), 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)

rule "global bank interest gain every round":
    @Condition numberOfZombies <= 0
    @Condition bankPoints > 0
    @Condition start == 1

    wait(0.16)
    for i in range(0, len(bankRates)):
        if bankTier == i:
            bankPoints += bankPoints * bankRates[i]
        break

rule "global bank tier upgrade":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition distance(eventPlayer, vect(275.586, 38.147, 177.222)) < 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition bankTier < 3

    for i in range(0, len(bankCosts)):
        if bankTier == i:
            if bankPoints >= bankCosts[i]:
                bankPoints -= bankCosts[i]
                bankTier = i + 1
                smallMessage(getAllPlayers(), "  You have permanently upgraded your bank to tier {0}".format(i + 1))
                playEffect(getAllPlayers(), DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 70)
            else:
                smallMessage(getAllPlayers(), "  You need {0} points in the bank to upgrade!".format(bankCosts[i]))
            break

rule "global bank withdraw button":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition distance(eventPlayer, vect(273.277, 38.147, 176.182)) < 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if getServerLoad() < 245:
        if bankPoints >= 250:
            bankPoints -= 250
            eventPlayer.points += 250
            wait(getAverageServerLoad() / 255 * (0.34 - 0.16) - 90.032)
            if eventPlayer.withdrawNotif == 0:
                eventPlayer.withdrawNotif = 1
            if ruleCondition:
                loop()
        else:
            smallMessage(eventPlayer, "  The bank is out of funds!")
    else:
        smallMessage(eventPlayer, "{0} Error: {1} Bank closed! (--ANTICRASHSYS--)".format(heroIcon(Hero.RAMATTRA), random.randint(10, 1000)))

rule "global bank deposit button":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition distance(eventPlayer, vect(277.261, 38.147, 178.713)) < 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if getServerLoad() < 245:
        if eventPlayer.points >= 200:
            bankPoints += 200
            eventPlayer.points -= 200
            if eventPlayer.depNotif == 0:
                eventPlayer.depNotif = 1
            wait(getAverageServerLoad() / 255 * (0.34 - 0.16) - 90.032)
            if ruleCondition:
                loop()
        else:
            smallMessage(eventPlayer, "  You don't have enough points to deposit!")
    else:
        smallMessage(eventPlayer, "{0} Error: {1} Bank closed! (--ANTICRASHSYS--)".format(heroIcon(Hero.RAMATTRA), random.randint(10, 1000)))


rule "property damage easter egg":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition distance(eventPlayer, vect(270.637, 38.147, 176.339)) < 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    smallMessage(eventPlayer, "  {0} You have caused ${1} damage to my army!".format(heroIcon(Hero.RAMATTRA), (ramPoints)))


rule "credit card system":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition distance(eventPlayer, vect(299.653, -14.545, -222.024)) < 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.creditTier < 3


    if getServerLoad() < 245:
        for i in range(0, len(creditCosts)):
            if eventPlayer.creditTier == i:
            if eventPlayer.points >= creditCosts[i]:
                eventPlayer.points -= creditCosts[i]
                chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points)), 1000)
                eventPlayer.creditTier = i + 1
                eventPlayer.creditcardlimit = creditLimits[i]
                eventPlayer.cashback = cashbackRates[i]
                smallMessage(eventPlayer, "  Your credit card is now tier {0}".format(i + 1))
                wait(4)
                smallMessage(eventPlayer, "  Hold spacebar to see credit card details")
            else:
                if i == 0:
                    smallMessage(eventPlayer, "  You need {0} points buy a credit card!".format(creditCosts[i]))
                else:
                    smallMessage(eventPlayer, "  You need {0} points to upgrade!".format(creditCosts[i]))
                break
    else:
        smallMessage(eventPlayer, "{0} Error: {1} Credit card office closed! (--ANTICRASHSYS--)".format(heroIcon(Hero.RAMATTRA), random.randint(10, 1000)))


rule "credit card interest":
    @Event eachPlayer
    @Condition eventPlayer.points < 0
    @Condition numberOfZombies < 1
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.creditTier > 0

    for i in range(1, len(ccRates)):
        if eventPlayer.creditTier == i:
            ccCurrentRate = ccRates[i]
            ccInterest = eventPlayer.points * ccCurrentRate
            eventPlayer.points += ccInterest
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points)), 1000)
            smallMessage(eventPlayer, "  You have incurred {0} interest on your credit card.".format(ccInterest))
        break

#needs hud element to show current credit card tier in a color, and the rest when player holds spacebar: current debt, current APR, current fee per round, and one time fee for next upgrade


rule "Reset deposit notif":
    @Event eachPlayer
    @Condition eventPlayer.depNotif == 1

    smallMessage(eventPlayer, "  Hold {0} to deposit 200 Points".format(inputBindingString(Button.INTERACT)))
    wait(4)
    eventPlayer.depNotif = 0
    wait(0.5)
    if ruleCondition:
        loop()

rule "Reset withdraw notif":
    @Event eachPlayer
    @Condition eventPlayer.withdrawNotif == 1

    smallMessage(eventPlayer, "  Hold {0} to withdraw 250 Points".format(inputBindingString(Button.INTERACT)))
    wait(4)
    eventPlayer.withdrawNotif = 0
    wait(0.5)
    if ruleCondition:
        loop()