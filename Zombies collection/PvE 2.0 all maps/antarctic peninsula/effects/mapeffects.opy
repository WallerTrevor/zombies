rule "all the effects":
    @Condition start == 1
    #@Condition outofpsawn == 1

    #set all this to be array elements for each perk name, so it can easily be swapped with each map file
    for forindex in range(3):
        createEffect(localPlayer, Effect.GOOD_AURA, teleportercolor, teleporterpositions[telespot], evalOnce(teleradiusef[forindex]))
        createEffect(localPlayer, Effect.SPARKLES, teleportercolor, teleporterpositions[telespot], evalOnce(teleradiusef[forindex]))
        createEffect(localPlayer, Effect.RING, Color.WHITE, teleporterpositions[telespot], evalOnce(teleradiusef[forindex]))
    wait(2)
    #this can be created on the spot instead of always present
    for forindex in range(0, 3, 1):
        createEffect(localPlayer, Effect.RING, Color.RED, Died[evalOnce(forindex)], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createEffect(localPlayer, Effect.SPHERE, Color.WHITE, Died[evalOnce(forindex)], getPlayersInSlot(evalOnce(forindex), Team.1).C, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createInWorldText(localPlayer, "{0}".format(random.choice(diedtext)), Died[evalOnce(forindex)], 3, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    wait(3)
    #mystery box
    createEffect(localPlayer, Effect.RING, Color.PURPLE, rngbox, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, iconString(Icon.QUESTION_MARK), Vector.UP + rngbox, 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(localPlayer, Effect.SPARKLES, Color.YELLOW, rngbox, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(localPlayer, Effect.SPHERE, Color.PURPLE, rngbox, 0.75, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(localPlayer, Effect.RING, Color.TURQUOISE, buyperks[6], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    powerconnected[0] = getLastCreatedEntity()
    createIcon(getLivingPlayers(Team.1), buyperks[6], Icon.BOLT, IconReeval.VISIBILITY_AND_POSITION, Color.YELLOW)
    powerconnected[1] = getLastCreatedText()
    createEffect(localPlayer, Effect.RING, Color.RED, buyperks[1], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, iconString(Icon.HEART), Vector.UP + buyperks[1], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(localPlayer, Effect.RING, Color.RED, buyperks[2], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, iconString(Icon.FIRE), Vector.UP + buyperks[2], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.RED)
    createEffect(localPlayer, Effect.RING, Color.BLUE, buyperks[3], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, iconString(Icon.DIAMOND), Vector.UP + buyperks[3], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.BLUE)
    createEffect(localPlayer, Effect.RING, Color.ORANGE, buyperks[4], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, iconString(Icon.EYE), Vector.UP + buyperks[4], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(localPlayer, Effect.RING, Color.BLUE, buyperks[5], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, iconString(Icon.HALO), Vector.UP + buyperks[5], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.BLUE)
    createInWorldText(localPlayer, abilityIconString(Hero.CASSIDY, Button.ABILITY_1), Vector.UP + buyperks[0], 3.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(localPlayer, Effect.RING, Color.BLUE, buyperks[0], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, abilityIconString(Hero.SOLDIER, Button.ABILITY_1), Vector.UP + buyperks[7], 3.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(localPlayer, Effect.RING, Color.BLUE, buyperks[9], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, abilityIconString(Hero.ASHE, Button.ABILITY_2), Vector.UP + buyperks[9], 3.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    for forindex in range(len(buyheros)):
        createEffect(localPlayer, Effect.RING, Color.YELLOW, buyheros[forindex], 2, EffectReeval.VISIBILITY)
        createInWorldText(localPlayer, heroIcon(hero[forindex]), Vector.UP + buyheros[forindex], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY, Color.BLUE)
    wait(3)
    createInWorldText(localPlayer, "Bastion Trap: press {0} {1}".format(inputBindingString(Button.INTERACT), l"{0}: {1}".format(heroIcon(Hero.BASTION), 1000)), vect(-83.763, -158.95, 64.107), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(localPlayer, Effect.RING, Color.PURPLE, rngbox2, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, "{0} Fairy mystery box: 950 points".format(l"Buy"), rngbox2, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(localPlayer, Effect.SPARKLES, Color.YELLOW, rngbox2, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(localPlayer, Effect.SPHERE, Color.PURPLE, rngbox2, 0.25, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(localPlayer, Effect.RING, Color.WHITE, vect(-101.303, -150.36, -17.831), 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, "The end : 50,000 points", vect(-101.303, -150.36, -17.831), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(localPlayer, Effect.RING, Color.WHITE, bossbuypositions[0], 1, EffectReeval.POSITION_AND_RADIUS)
    for forindex in range(3):
        createInWorldText(localPlayer, "Spawn boss: {0} : 15000 points".format(inputBindingString(Button.INTERACT)), bossbuypositions[indexofbosseffect], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY)
        createEffect(localPlayer, Effect.RING, Color.WHITE, bossbuypositions[indexofbosseffect], 1, EffectReeval.VISIBILITY)





rule "488 button held teleporter":
    @Event eachPlayer
    @Team 1
    #need to fix this as the index for teleporter has changed
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition getPlayersInRadius(teleporterpositions[telespot], 3, Team.1) == true
    #@Condition any([distance(i, eventPlayer) < doorradius.slice(101, 103)[idx] for i, idx in Vectordoorpositions.slice(101, 103)]) == true

    if getLivingPlayers(Team.1) == getPlayersInRadius(teleporterpositions[telespot], 3, Team.1):
        if teleporterwait == false:
            #might need to not use destroy effect last created, and append every single one to array then delete all
            createEffect(eventPlayer, Effect.ANA_NANO_BOOSTED, eventPlayer.getTeam(), eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            zzz.append(getLastCreatedEntity())
            #need a for loop needs 4 loops
            createEffect(localPlayer, Effect.WINSTON_TESLA_CANNON_TARGET, Color.BLACK, eventPlayer, 80, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            zzz.append(getLastCreatedEntity())
            wait(0.25)
            getPlayersInRadius(teleporterpositions[telespot], 5, Team.2).setStatusEffect([0], Status.STUNNED, 0.25)
            destroyEffect(zzz[0])
            playEffect(localPlayer, DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 80)
            wait(0.25)
            kill(getPlayersInRadius(teleporterpositions[101], 5, Team.2), getLivingPlayers(Team.1)[0])
            destroyEffect(zzz[1])
            teleporterwait = 1
            teleportercolor = Color.RED
            #needs to be set to current telespot
            if len(teleporterpositions) > 0:
                telespot = (telespot + 1) % len(teleporterpositions)
                wait()
                teleporterused = 1
                eventPlayer.lastsavedpos = null
                wait()
                getPlayers(Team.1).teleport(teleporterpositions[telespot])
            wait(0.5)
            teleporterused = 0
            makedoors()
        elif teleporterwait > 0:
            smallMessage(eventPlayer, "  {0} That machine is not a toy!".format(heroIcon(Hero.RAMATTRA)))
            wait(4)
    elif getLivingPlayers(Team.1) != getPlayersInRadius(teleporterpositions[telespot], 3, Team.1):
        smallMessage(eventPlayer, "  You can't leave your friends behind!")
        wait(4)
