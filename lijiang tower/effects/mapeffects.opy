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
globalvar teleradiusef 84
globalvar heroiconstring 85
globalvar indexofbosseffect 86


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
playervar teleradiusef 69
playervar diedtext 70
playervar forindex 82
playervar indexofbosseffect 83


#Subroutine names

subroutine herobuy1250 0
subroutine herobuy1750 2
subroutine doorimpulse 3
subroutine wavespawn 4
subroutine followerattack1 5
subroutine followerattack2 6
subroutine perkbuyanimation 7
subroutine followerbuy 8


#Activated extensions

#!extension beamEffects


rule "all the door effects loop (need to figure out how to manage which doors were bought and unload zones not currently in)":
    @Condition dooreffectsequencer < 436
    @Disabled
    
    #needs to have 3 zones with the map.
    if __assignTo__(impulseDoorArray[appenddoorsequencer], false):
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
        createEffect(getAllPlayers(), Effect.GOOD_AURA, teleportercolor, Vectordoorpositions[telespot], __global__.teleradiusef)
        createEffect(getAllPlayers(), Effect.SPARKLES, teleportercolor, Vectordoorpositions[telespot], __global__.teleradiusef)
    #this can be created on the spot instead of always present
    for forindex in range(len(4)):
        createEffect(getAllPlayers(), Effect.RING, Color.RED, Died[forindex], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, Died[forindex], getPlayersInSlot(0, Team.1).C, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    for forindex in range(len(4)):
        createInWorldText(getAllPlayers(), "__playerVar__", Died[__global__.forindex], 3, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
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
        createInWorldText(getAllPlayers(), "Spawn boss: {0} : 15000 points".format(inputBindingString(Button.INTERACT)), bossbuypositions[__global__.indexofbosseffect], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        createEffect(getAllPlayers(), Effect.RING, Color.WHITE, bossbuypositions[__global__.indexofbosseffect], 1, EffectReeval.POSITION_AND_RADIUS)


