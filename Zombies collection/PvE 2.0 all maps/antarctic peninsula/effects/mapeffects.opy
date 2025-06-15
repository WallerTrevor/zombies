rule "all the effects (needs to be simplified and looped)":
    #@Condition start == 1
    #set all these to be some form of loop
    #set all this to be array elements for each perk name, so it can easily be swapped with each map file
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, Vectordoorpositions[extraVar[12]], 3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    for forindex in range(len(3)):
        createEffect(getAllPlayers(), Effect.GOOD_AURA, teleportercolor, Vectordoorpositions[extraVar[12]], teleradiusef, EffectReeval.VISIBILITY)
        createEffect(getAllPlayers(), Effect.SPARKLES, teleportercolor, Vectordoorpositions[extraVar[12]], teleradiusef, EffectReeval.VISIBILITY)
    wait(2)
    #this can be created on the spot instead of always present
    for forindex in range(len(Died)):
        createEffect(getAllPlayers(), Effect.RING, Color.RED, Died[forindex], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Died[forindex], getPlayersInSlot(0, Team.1).C, EffectReeval.VISIBILITY)
    wait(3)
    for forindex in range(len(Died)):
        createInWorldText(getAllPlayers(), "__playerVar__", Died[forindex], 3, Clip.SURFACES, WorldTextReeval.VISIBILITY)
    wait(3)
    #mystery box
    createEffect(getAllPlayers(), Effect.RING, Color.PURPLE, rngbox, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "{0} Mystery box: 950 points".format(l"Buy"), rngbox, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(getAllPlayers(), Effect.SPARKLES, Color.YELLOW, rngbox, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.PURPLE, rngbox, 0.75, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.TURQUOISE, perkbuyrandomized[0], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    powerconnected[0] = getLastCreatedEntity()
    createIcon(getLivingPlayers(Team.1), perkbuyrandomized[0], Icon.BOLT, IconReeval.VISIBILITY_AND_POSITION, Color.YELLOW)
    powerconnected[1] = getLastCreatedText()
    createEffect(getAllPlayers(), Effect.RING, Color.RED, perkbuyrandomized[1], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "Juggernaut 100 {0}".format(l"{0}: {1}".format("", 2500)), perkbuyrandomized[1], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, perkbuyrandomized[2], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "Pack-a-Punch 100 {0}".format(l"{0}: {1}".format("", 5000)), perkbuyrandomized[2], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.RED)
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, perkbuyrandomized[3], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "passive & healing dealt buff: 6000 points", perkbuyrandomized[3], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.BLUE)
    createEffect(getAllPlayers(), Effect.RING, Color.ORANGE, perkbuyrandomized[4], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "Headshot maniac 50% to 400% {0}".format(l"{0}: {1}".format("", 4000)), perkbuyrandomized[4], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, perkbuyrandomized[5], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "Revive self (coop only): 4000 points", perkbuyrandomized[5], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.BLUE)
    createInWorldText(getAllPlayers(), "Double-mag {0}".format("{0} {1}".format(null, l"{0}: {1}".format("", 2000))), perkbuyrandomized[6], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, perkbuyrandomized[6], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "Sprint burst {0}".format("{0} {1}".format(null, l"{0}: {1}".format("", 2000))), perkbuyrandomized[7], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, perkbuyrandomized[9], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "Omnic bomb {0}".format("{0} {1}".format(null, l"{0}: {1}".format("", 2500))), perkbuyrandomized[9], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    #needs values correct for each hero
    for forindex in range(len(buyheros)):
        createEffect(getAllPlayers(), Effect.RING, Color.PURPLE, buyheros[forindex], 2, EffectReeval.VISIBILITY)
        createInWorldText(getAllPlayers(), heroIcon(hero[forindex]), vect(0, 1, 0) + buyheros[forindex], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY, Color.BLUE)
    wait(3)
    createInWorldText(getAllPlayers(), "Bastion Trap: press {0} {1}".format(inputBindingString(Button.INTERACT), l"{0}: {1}".format(heroIcon(Hero.BASTION), 1000)), vect(-83.763, -158.95, 64.107), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(getAllPlayers(), Effect.RING, Color.PURPLE, rngbox2, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "{0} Fairy mystery box: 950 points".format(l"Buy"), rngbox2, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(getAllPlayers(), Effect.SPARKLES, Color.YELLOW, rngbox2, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.PURPLE, rngbox2, 0.25, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, vect(-101.303, -150.36, -17.831), 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "The end : 50,000 points", vect(-101.303, -150.36, -17.831), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, bossbuypositions[0], 1, EffectReeval.POSITION_AND_RADIUS)
    for forindex in range(3):
        createInWorldText(getAllPlayers(), "Spawn boss: {0} : 15000 points".format(inputBindingString(Button.INTERACT)), bossbuypositions[indexofbosseffect], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY)
        createEffect(getAllPlayers(), Effect.RING, Color.WHITE, bossbuypositions[indexofbosseffect], 1, EffectReeval.VISIBILITY)


rule "488 button heald 1 teleporter (needs to be one rule)":
    @Event eachPlayer
    @Team 1
    #need to fix this as the index for teleporter has changed
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition getPlayersInRadius(Vectordoorpositions[101], 3, Team.1) == true
    #@Condition any([distance(i, eventPlayer) < doorradius.slice(101, 103)[idx] for i, idx in Vectordoorpositions.slice(101, 103)]) == true
    
    if getLivingPlayers(Team.1) == getPlayersInRadius(Vectordoorpositions[101], 3, Team.1):
        if teleporterwait == false:
            #might need to not use destroy effect last created, and append every single one to array then delete all
            createEffect(eventPlayer, Effect.ANA_NANO_BOOSTED, eventPlayer.getTeam(), eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            zzz.append(getLastCreatedEntity())
            #need a for loop needs 4 loops
            createEffect(getAllPlayers(), Effect.WINSTON_TESLA_CANNON_TARGET, Color.BLACK, eventPlayer, 80, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            wait(0.25)
            getPlayersInRadius(Vectordoorpositions[101], 5, Team.2).setStatusEffect([0], Status.STUNNED, 0.25)
            destroyEffect(getLastCreatedEntity())
            playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 80)
            wait(0.25)
            kill(getPlayersInRadius(Vectordoorpositions[101], 5, Team.2), getLivingPlayers(Team.1)[0])
            destroyEffect(getLastCreatedEntity())
            getPlayers(Team.1).teleport(Vectordoorpositions[102])
            botspawnzone = 1
            teleporterwait = 1
            teleportercolor = Color.RED
            #needs to be set to current telespot
            telespot = 102
        elif teleporterwait > 0:
            smallMessage(eventPlayer, "  {0} That machine is not a toy!".format(heroIcon(Hero.RAMATTRA)))
            wait(4)
    elif getLivingPlayers(Team.1) != getPlayersInRadius(Vectordoorpositions[101], 3, Team.1):
        smallMessage(eventPlayer, "  You can't leave your friends behind!")
        wait(4)
