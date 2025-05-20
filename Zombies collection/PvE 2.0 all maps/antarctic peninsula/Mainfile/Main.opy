#Global variables
#!define roundnumber extraVar[0]
#!define numberOfZombies extraVar[1]
#!define Difficulty extraVar[2]
#!define start extraVar[3]
#!define g extraVar[4]
#!define teleporterwait extraVar[5]
#!define startlines extraVar[6]
#!define walljumpers extraVar[7]
#!define zombjump extraVar[8]
#!define zombstrafe extraVar[9]
#!define zombspeed extraVar[10]
#!define dispencerposition extraVar[11]
#!define telespot extraVar[12]
#!define lesszomb extraVar[13]
#!define experiencesystem extraVar[14]
#!define idlebots extraVar[15]
#!define dispencerplaced extraVar[16]
#!define trapeffect extraVar[17]
#!define boxcounter extraVar[18]
#!define boxcounter2 extraVar[19]
#!define challengewave extraVar[20]
#!define chwaveinterval extraVar[21]
#!define aprilrng extraVar[22]
#!define spawntype extraVar[23]
#!define botspawnzone extraVar[24]
#!define Bosssequencer extraVar[25]
#!define outofpsawn extraVar[26]
#!define romanNcounter extraVar[27]
#!define appenddoorsequencer extraVar[28]
#!define dooreffectsequencer extraVar[29]

globalvar powerconnected 13
globalvar Died 18
globalvar Vectordoorpositions 21
globalvar doors 26
globalvar impulseDoorArray 27
globalvar hero 36
globalvar buyheros 43
globalvar buyperks 44
globalvar doorradius 46
globalvar mysterylocations 47
globalvar rngbox 48
globalvar rngbox2 50
globalvar Mysterylocations2 52
globalvar omnicspawn 53
globalvar bossSpawn 54
globalvar bot1spawn 55
globalvar bot2spawn 56
globalvar setspawn 60
globalvar aprilquotes 61
globalvar Beameffectdoors 65
globalvar heroradius 71
globalvar diedradius 72
globalvar tipstrings 73
globalvar bossbuypositions 74
globalvar herobuyrandomized 75
globalvar perkbuyrandomized 76
globalvar romanN 78
globalvar teleportercolor 80
globalvar forindex 82
globalvar forindex2 83
globalvar zzz 84
globalvar diedphrase 85
globalvar diedtext 86
globalvar firstpos 87
globalvar secondpos 88
globalvar firstpoint2 89
globalvar AllPos 90
globalvar AllDir 91
globalvar secondpoint2 92
globalvar decompressed 93
globalvar compressedData 94
globalvar i 95
globalvar scratch 96
globalvar param0 97
globalvar param1 98
globalvar param2 99
globalvar colors 100
globalvar numbers 101
globalvar param3 102
globalvar param4 103
globalvar charIndex 104
globalvar doorscompresser 105
globalvar second 106
globalvar z 107
globalvar Wall_ID 108
globalvar g_beamType 109
globalvar is_Grounded 110
globalvar teleradiusef 111
globalvar heroiconstring 112
globalvar indexofbosseffect 113
globalvar extraVar 115

#Player variables
#!define doublemag extraPlayerVar[1]
#!define sprintburstperk extraPlayerVar[2]
#!define healthmax extraPlayerVar[3]
#!define damagevariable extraPlayerVar[4]
#!define healvariable extraPlayerVar[5]
#!define InfoCooldown extraPlayerVar[6]
#!define botTarget extraPlayerVar[7]
#!define HideHints extraPlayerVar[8]
#!define XPlevel extraPlayerVar[9]
#!define Jugg extraPlayerVar[10]
#!define singlelives extraPlayerVar[11]
#!define Packapunch extraPlayerVar[12]
#!define Maniac extraPlayerVar[13]
#!define revived extraPlayerVar[14]
#!define revivebought extraPlayerVar[15]

playervar points 0
playervar magazines 3
playervar InfoUI 13
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
playervar swapvar 69
playervar filterpos 70
playervar lastsavedpos 71
playervar closestbodypos 72
playervar fullbodypos 73
playervar prevpos_intersection 74
playervar active_wall 75
playervar closestwall 76
playervar x_ 77
playervar intersection_length 78
playervar thickness 79
playervar emotebox 80
playervar swap 81
playervar heropoints 82
playervar extraPlayerVar 83
playervar points2 84
#Subroutine names

subroutine herobuy1250 0
subroutine herobuy1750 2
subroutine doorimpulse 3
subroutine wavespawn 4
subroutine followerattack1 5
subroutine followerattack2 6
subroutine perkbuyanimation 7
subroutine followerbuy 8
subroutine heroswap 9
subroutine PaPsound 10
subroutine ParseNumber 11
subroutine DecompressString 12
#Activated extensions

#!extension beamEffects
#!extension buffStatusEffects
#!extension debuffStatusEffects
#!extension energyExplosionEffects
#!extension kineticExplosionEffects
#!extension explosionSounds
#!extension playMoreEffects
#!extension spawnMoreDummyBots
#!extension projectiles

#!include "../../== corelogic all maps/"
#!include "../../== effects all maps/"
#!include "../bosses/"
#!include "../core logic antarctic P/"
#!include "../effects/"
#!include "../story/"