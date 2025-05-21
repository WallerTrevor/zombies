rule "all the door effects loop (need to figure out how to manage which doors were bought and unload zones not currently in)":
    @Condition dooreffectsequencer < 436
    @Disabled
    
    #needs to have 3 zones with the map.
    if impulseDoorArray[appenddoorsequencer] == false:
        #create effect starting at 0 - 1
        createBeam(getPlayers(Team.1), Beam.JUNKRAT_TRAP_CHAIN, Beameffectdoors[evalOnce(dooreffectsequencer)], Beameffectdoors[evalOnce(1 + dooreffectsequencer)], Color.RED, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        wait()
        #append to allow the game to delete for later
        doors[appenddoorsequencer].append(getLastCreatedEntity())
        wait()
        #the index to create the door at
        dooreffectsequencer += 2
        #the doors index itself, counted by 1 whole, while the door contains 2 effects. need to optimize so door is compatible with 1 and 2 effects with a toggle.
        appenddoorsequencer += 1
        if ruleCondition:
            loop()
    elif impulseDoorArray[appenddoorsequencer] == 1:
        wait()
        dooreffectsequencer += 2
        appenddoorsequencer += 1
        if ruleCondition:
            loop()


rule "all the effects (needs to be simplified and looped)":
    #@Condition start == 1
    #set all these to be some form of loop
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
