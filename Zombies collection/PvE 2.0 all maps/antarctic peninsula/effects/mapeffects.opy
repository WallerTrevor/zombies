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
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, Vectordoorpositions[telespot], 3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    for forindex in range(len(3)):
        createEffect(getAllPlayers(), Effect.GOOD_AURA, teleportercolor, Vectordoorpositions[telespot], teleradiusef)
        createEffect(getAllPlayers(), Effect.SPARKLES, teleportercolor, Vectordoorpositions[telespot], teleradiusef)
    #this can be created on the spot instead of always present
    for forindex in range(len(4)):
        createEffect(getAllPlayers(), Effect.RING, Color.RED, Died[forindex], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Died[forindex], getPlayersInSlot(0, Team.1).C, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    for forindex in range(len(4)):
        createInWorldText(getAllPlayers(), "__playerVar__", Died[forindex], 3, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    #mystery box
    createEffect(getAllPlayers(), Effect.RING, Color.PURPLE, rngbox, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), l"{0} {1}".format(l"Buy", "Mystery box: 950 points"), rngbox, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(getAllPlayers(), Effect.SPARKLES, Color.YELLOW, rngbox, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.PURPLE, rngbox, 0.75, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.TURQUOISE, perkbuyrandomized[0], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    powerconnected[0] = getLastCreatedEntity()
    createIcon(getLivingPlayers(Team.1), perkbuyrandomized[0], Icon.BOLT, IconReeval.VISIBILITY_AND_POSITION, Color.YELLOW)
    powerconnected[1] = getLastCreatedText()
    createEffect(getAllPlayers(), Effect.RING, Color.RED, perkbuyrandomized[1], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), l"{0} {1}".format("Juggernaut", l"{0} {1}".format(100, l"{0}: {1}".format(l"", 2500))), perkbuyrandomized[1], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, perkbuyrandomized[2], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), l"{0} {1}".format("Pack-a-Punch", l"{0} {1}".format(100, l"{0}: {1}".format(l"", 5000))), perkbuyrandomized[2], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.RED)
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, perkbuyrandomized[3], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "passive & healing dealt buff: 6000 points", perkbuyrandomized[3], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.BLUE)
    createEffect(getAllPlayers(), Effect.RING, Color.ORANGE, perkbuyrandomized[4], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), l"{0} {1}".format("Headshot maniac", l"{0} {1}".format("50% to 400%", l"{0}: {1}".format(l"", 4000))), perkbuyrandomized[4], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, perkbuyrandomized[5], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "Revive self (coop only): 4000 points", perkbuyrandomized[5], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.BLUE)
    createInWorldText(getAllPlayers(), l"{0} {1}".format("Double-mag", l"{0} {1}".format(null, l"{0}: {1}".format(l"", 2000))), perkbuyrandomized[6], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, perkbuyrandomized[6], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), l"{0} {1}".format("Sprint burst", l"{0} {1}".format(null, l"{0}: {1}".format(l"", 2000))), perkbuyrandomized[7], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, perkbuyrandomized[9], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), l"{0} {1}".format("Omnic bomb", l"{0} {1}".format(null, l"{0}: {1}".format(l"", 2500))), perkbuyrandomized[9], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    #needs values correct for each hero
    for forindex in range(len(24)):
        createEffect(getAllPlayers(), Effect.RING, Color.PURPLE, herobuyrandomized[4], 2, EffectReeval.VISIBILITY)
        createInWorldText(getAllPlayers(), l"{0} {1}".format("Press {0}".format(inputBindingString(Button.INTERACT)), l"{0}: {1}".format(heroIcon(heroiconstring), 1000)), herobuyrandomized[4], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(getAllPlayers(), Effect.RING, Color.PURPLE, vect(-83.799, -160.001, 64.224), 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), l"{0} {1}".format("Bastion Trap: press {0}".format(inputBindingString(Button.INTERACT)), l"{0}: {1}".format(heroIcon(Hero.BASTION), 1000)), vect(-83.763, -158.95, 64.107), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(getAllPlayers(), Effect.RING, Color.PURPLE, rngbox2, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), l"{0} {1}".format(l"Buy", "Fairy mystery box: 950 points"), rngbox2, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(getAllPlayers(), Effect.SPARKLES, Color.YELLOW, rngbox2, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.PURPLE, rngbox2, 0.25, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, vect(-101.303, -150.36, -17.831), 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(getAllPlayers(), "The end : 50,000 points", vect(-101.303, -150.36, -17.831), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, bossbuypositions[0], 1, EffectReeval.POSITION_AND_RADIUS)
    for forindex in range(len(3)):
        createInWorldText(getAllPlayers(), "Spawn boss: {0} : 15000 points".format(inputBindingString(Button.INTERACT)), bossbuypositions[indexofbosseffect], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        createEffect(getAllPlayers(), Effect.RING, Color.WHITE, bossbuypositions[indexofbosseffect], 1, EffectReeval.POSITION_AND_RADIUS)


