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


rule "starting voice lines (needs new text system for more enjoyable readability)":
    @Condition start == 1
    
    #can be optmizied to not use as many if statements and use only 1 small message action
    wait(6)
    if __assignTo__(startlines, false):
        hudText(getPlayers(Team.1), heroIcon(Hero.RAMATTRA), null, " Trial {0}. The path to a new world begins.".format(random.randint(1, 9999)), HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
        #elif startlines == 1:
        #smallMessage(getAllPlayers(), "  {0} This time, Null Sector will not be denied.".format(heroIcon(Hero.RAMATTRA)))
        #elif startlines == 2:
        #smallMessage(getAllPlayers(), "  {0} Trial {1}. Data insufficient.".format(heroIcon(Hero.RAMATTRA), random.randint(100, 9999)))
        #elif startlines == 3:
        #smallMessage(getAllPlayers(), "  {0} Subject: Overwatch. This trial will determine their fate.".format(heroIcon(Hero.RAMATTRA)))
        #elif startlines == 4:
        #smallMessage(getAllPlayers(), "  {0} Commencing Trial {1}.".format(heroIcon(Hero.RAMATTRA), random.randint(100, 9999)))
        #elif startlines == 5:
        #smallMessage(getAllPlayers(), "  {0} Subjects: Detected. Trial {1} begins.".format(heroIcon(Hero.RAMATTRA), random.randint(100, 9999)))
        #wait(5)
        #smallMessage(getAllPlayers(), "  {0} Your performance will be judged.".format(heroIcon(Hero.RAMATTRA)))
        #elif startlines == 6:
        #smallMessage(getAllPlayers(), "  {0} Pathetic. ".format(heroIcon(Hero.RAMATTRA)))
        #wait(5)
        #smallMessage(getAllPlayers(), "  {0} Your defiance only delays the inevitable.".format(heroIcon(Hero.RAMATTRA)))
        #elif startlines == 7:
        #smallMessage(getAllPlayers(), "  {0} Trial malfunction detected.".format(heroIcon(Hero.RAMATTRA)))
        #wait(5)
        #smallMessage(getAllPlayers(), "  {0}  Overclocking systems. Failure is not an option.".format(heroIcon(Hero.RAMATTRA)))
        #elif startlines == 8:
        #smallMessage(getAllPlayers(), "  {0} You call yourselves heroes?".format(heroIcon(Hero.RAMATTRA)))
        #wait(5)
        #smallMessage(getAllPlayers(), "  {0} You're merely variables in my equation.".format(heroIcon(Hero.RAMATTRA)))


