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


#Subroutine names

subroutine herobuy1250 0
subroutine herobuy1750 2
subroutine doorimpulse 3
subroutine wavespawn 4
subroutine followerattack1 5
subroutine followerattack2 6
subroutine perkbuyanimation 7
subroutine followerbuy 8


rule "507 april first quotes":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition aprilrng == 100
    
    #might be an easier way to set this up
    if eventPlayer.getHero() == Hero.DVA:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(0, 2)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.DOOMFIST:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(3, 4)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.JUNKER_QUEEN:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(5, 6)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.ANA:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(7, 8)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.ORISA:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(9, 10)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.RAMATTRA:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(11, 13)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.REINHARDT:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(14, 15)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.ROADHOG:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(16, 18)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.SIGMA:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(19, 20)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.WINSTON:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(21, 21)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.WRECKING_BALL:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(22, 23)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.ZARYA:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(24, 26)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.ASHE:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(27, 28)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.BASTION:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(29, 31)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.CASSIDY:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(32, 37)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.ECHO:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(38, 38)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.GENJI:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(39, 40)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.HANZO:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(41, 43)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.JUNKRAT:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(44, 45)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.MEI:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(46, 47)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.PHARAH:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(48, 51)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.REAPER:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(52, 53)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.SOJOURN:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(54, 55)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.SOLDIER:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(56, 58)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.SOMBRA:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(59, 61)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.SYMMETRA:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(62, 64)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.TORBJORN:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(65, 66)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.TRACER:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(67, 68)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.WIDOWMAKER:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(69, 71)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.BAPTISTE:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(72, 75)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.BRIGITTE:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(76, 77)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.KIRIKO:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(78, 79)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.LUCIO:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(80, 81)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.MERCY:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(82, 84)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.MOIRA:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(85, 87)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())
    elif eventPlayer.getHero() == Hero.ZENYATTA:
        createInWorldText(getAllPlayers(), aprilquotes.index(random.randint(88, 90)), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        wait(5)
        destroyInWorldText(getLastCreatedText())


rule "508 april quotes strings":
    aprilquotes[0] = "Peep this POTG"
    aprilquotes[1] = "Pressing Q!"
    aprilquotes[2] = "Sorry, Dae-hyun!"
    aprilquotes[3] = "You can’t get me!"
    aprilquotes[4] = "Wheeeeeee!"
    aprilquotes[5] = "Cut cut cut cut cut cut cut!"
    aprilquotes[6] = "Everybody, look at my axe!"
    aprilquotes[7] = "Go get them, tiger."
    aprilquotes[8] = "Hope this helps!"
    aprilquotes[9] = "Check yourself or wreck yourself!"
    aprilquotes[10] = "Yee-haw rodeo!"
    aprilquotes[11] = "Agony is grape-flavoured!"
    aprilquotes[12] = "You will suffer as I, Ramattra have suffered! Your torment will outlast the stars…"
    aprilquotes[13] = "Who wants a purple hug?"
    aprilquotes[14] = "Have a seat!"
    aprilquotes[15] = "Here comes the bonk!"
    aprilquotes[16] = "You get scrap. You get scrap."
    aprilquotes[17] = "Everybody gets scrap!"
    aprilquotes[18] = "This little piggy will run you over."
    aprilquotes[19] = " The universe sings to me!"
    aprilquotes[20] = "What are those?"
    aprilquotes[21] = "Winston!"
    aprilquotes[22] = "Collect the little balls to win a prize."
    aprilquotes[23] = " Behold the children of Wrecking Ball."
    aprilquotes[24] = "Group hug!"
    aprilquotes[25] = "Not a supernova – a Zaryanova."
    aprilquotes[26] = "Crush Crush Crush."
    aprilquotes[27] = "Fred! I mean Bob! Do something!"
    aprilquotes[28] = "Get in there, Fred! I mean Bob!"
    aprilquotes[29] = "(fog horn beeps)"
    aprilquotes[30] = "(air horn beeps)"
    aprilquotes[31] = "(musical beeps)"
    aprilquotes[32] = "It’s two in the mornin’"
    aprilquotes[33] = "It’s past your bedtime."
    aprilquotes[34] = "It’s half past six."
    aprilquotes[35] = "It’s 3:24."
    aprilquotes[36] = "It’s 4:57."
    aprilquotes[37] = "It’s a country minute shy of the devil’s lunchbreak."
    aprilquotes[38] = "I’m better than you at…"
    aprilquotes[39] = "(Sword noises)"
    aprilquotes[40] = "Tatakae!"
    aprilquotes[41] = "Sic ‘em, boys!"
    aprilquotes[42] = "Nomnomnomnomnomnom!"
    aprilquotes[43] = "Who’s a good dragon? Who’s a good dragon?"
    aprilquotes[44] = "Everyone stand very still!"
    aprilquotes[45] = "Who’s using a tire? Not me! heheh Don’t worry!"
    aprilquotes[46] = "(Sigh) I’m turning on the AC!"
    aprilquotes[47] = "Activating ceiling fan!"
    aprilquotes[48] = "Justice rains from the ground!"
    aprilquotes[49] = "Try and shoot me! You won’t!"
    aprilquotes[50] = "Rain justices form above!"
    aprilquotes[51] = "Hope you like rockets!"
    aprilquotes[52] = "Happy, happy birthday…"
    aprilquotes[53] = "WheeEEeeeeEEEeeeeEEEeeee…"
    aprilquotes[54] = "Bye-bye, bad guys!"
    aprilquotes[55] = "That starts then! (Pause) What?"
    aprilquotes[56] = "Who took my dentures?"
    aprilquotes[57] = "Turn that damn music down!"
    aprilquotes[58] = "War is a game, and I’m using cheats!"
    aprilquotes[59] = "Get DDOSed!"
    aprilquotes[60] = "Propaganda is useless!"
    aprilquotes[61] = "I’m in!"
    aprilquotes[62] = "I am blocking you!"
    aprilquotes[63] = "Superior to RGB!"
    aprilquotes[64] = "This wall is incredibly lit!"
    aprilquotes[65] = "Ahem. La-va!"
    aprilquotes[66] = "The floor is lava."
    aprilquotes[67] = "Wuh wuh wuh whoa!"
    aprilquotes[68] = "Tag, you’re it!"
    aprilquotes[69] = "Hello! I can see you!"
    aprilquotes[70] = "Wallhacks initialized."
    aprilquotes[71] = "I’m making popcorn."
    aprilquotes[72] = "This won’t hurt. Too much."
    aprilquotes[73] = "Say cheese!"
    aprilquotes[74] = "Everybody shoot through the box! Through the box!"
    aprilquotes[75] = "Shoot through the big glowy thing."
    aprilquotes[76] = "Face my mace. Mace to the face!"
    aprilquotes[77] = "Mace to the mace to the mace to the mace to the face!"
    aprilquotes[78] = "Believe it!"
    aprilquotes[79] = "Just aim for the head!"
    aprilquotes[80] = "Let’s get a noise violation!"
    aprilquotes[81] = "Who wants a billion hit points?"
    aprilquotes[82] = "Moth formation, go!"
    aprilquotes[83] = "Time to connect the dots!"
    aprilquotes[84] = "Do I have to?"
    aprilquotes[85] = "Kamehameha!"
    aprilquotes[86] = "Here’s the craic!"
    aprilquotes[87] = "I’ll show you meta!"
    aprilquotes[88] = "Deal with it."
    aprilquotes[89] = "You’re invincible. Now… shoot them!"
    aprilquotes[90] = "Become unkillable. Some conditions may apply"


rule "509 bot name singleplayer":
    @Condition getNumberOfPlayers(Team.1) == 1
    @Condition roundnumber > 0
    @Condition aprilrng == 50
    
    getPlayersInSlot(0, Team.2).startForcingName("01000111 01100101")
    getPlayersInSlot(1, Team.2).startForcingName("01110100 00100000")
    getPlayersInSlot(2, Team.2).startForcingName("01101111 01110101")
    getPlayersInSlot(3, Team.2).startForcingName("01110100 00100000")
    getPlayersInSlot(4, Team.2).startForcingName("01101111 01100110")
    getPlayersInSlot(5, Team.2).startForcingName("00100000 01101000")
    getPlayersInSlot(6, Team.2).startForcingName("01100101 01110010")
    getPlayersInSlot(7, Team.2).startForcingName("01100101 00101110")


rule "510 bot name coop":
    @Condition getNumberOfPlayers(Team.1) > 1
    @Condition aprilrng == 50
    @Condition roundnumber > 0
    
    getPlayersInSlot(0, Team.2).startForcingName("77 6F 72 6B 69")
    getPlayersInSlot(1, Team.2).startForcingName("6E 67 20 74 6F")
    getPlayersInSlot(2, Team.2).startForcingName("67 65 74 68 65")
    getPlayersInSlot(3, Team.2).startForcingName("72 20 69 73")
    getPlayersInSlot(4, Team.2).startForcingName("20 66 75 74")
    getPlayersInSlot(5, Team.2).startForcingName("69 6C 65 21")


rule "glitch in the system":
    @Condition roundnumber < 10
    
    wait(random.randint(120, 600), Wait.ABORT_WHEN_FALSE)
    romanNcounter += 12
    wait(0.1)
    romanNcounter -= 12
    wait(0.1)
    romanNcounter += 12
    wait(0.1)
    romanNcounter -= 12
    wait(0.1)
    if ruleCondition:
        loop()


