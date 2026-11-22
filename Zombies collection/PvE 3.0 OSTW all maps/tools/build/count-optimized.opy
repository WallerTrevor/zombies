#!debugElementCount
#!optimizeForSize
#!optimizeForSizeAggressive
#Global variables

globalvar roundnumber 0
globalvar botRemoveSlot 1
globalvar botspawnindex 2
globalvar teamPlayers 3
globalvar allDoors_Corner 4
globalvar allDoors_OppositeCorner 5
globalvar allDoors_Center 6
globalvar allDoors_Facing 7
globalvar allDoors_Side 8
globalvar allDoors_Width 9
globalvar allDoors_State 10
globalvar allDoors_Zone 11
globalvar allDoors_BeamSpan 12
globalvar allDoors_BeamA 13
globalvar allDoors_BeamB 14
globalvar z 15
globalvar _extendedGlobalCollection 16
globalvar costmultiplier 17
globalvar i 18
globalvar doorsNeedDrawing 19
globalvar doorBuildIndex 20
globalvar looping 21
globalvar pfLoadedMap_nodes 22
globalvar M 23
globalvar spawntype 24
globalvar zoneLoading 25
globalvar waveSlot 26
globalvar counterHeroType 27
globalvar roundRespawns 28
globalvar bossBody 29
globalvar bossBots 30
globalvar bot1spawn 31
globalvar idx 32
globalvar pfDecompress 33
globalvar pfI1 34
globalvar pfI2 35
globalvar pfcompressionTable 36
globalvar pfcurrentNeighbors 37
globalvar pfnext 38
globalvar pfLoadedMap_neighbors 39
globalvar pfNodeComponent 40
globalvar pfMapReady 41
globalvar zombieLoadLimit 42
globalvar zombieExtrasAllowed 43
globalvar decodeTable 44
globalvar decodeIn 45
globalvar decodeOut 46
globalvar decodeString 47
globalvar decodePosition 48
globalvar bankPoints 49
globalvar bankTier 50
globalvar bankTiers_Cost 51
globalvar bankTiers_InterestRate 52
globalvar creditCardTiers_Cost 53
globalvar creditCardTiers_Limit 54
globalvar creditCardTiers_Cashback 55
globalvar creditCardTiers_InterestRate 56
globalvar bankButtons 57
globalvar Died 58
globalvar forindex 59
globalvar omnicspawn 60
globalvar romanNcounter 61
globalvar numberOfZombies 62
globalvar Difficulty 63
globalvar difficultyStats 64
globalvar start 65
globalvar g 66
globalvar teleporterwait 67
globalvar startlines 68
globalvar telespot 69
globalvar experiencesystem 70
globalvar rngbox 71
globalvar poweron 72
globalvar slowmoCutscene 73
globalvar herobuycosts 74
globalvar decodeIndex 75
globalvar textToken 76
globalvar textItem 77
globalvar textGroup 78
globalvar mapDataLoaded 79
globalvar textListsLoaded 80
globalvar infoText 81
globalvar bossbuypositions 82
globalvar mysterylocations 83
globalvar buyheros 84
globalvar buyperks 85
globalvar buyperksHome 86
globalvar doorVectors 87
globalvar teleporterpositions 88
globalvar doorParams 89
globalvar perkcosts 90
globalvar hero 91
globalvar averagePosition 92
globalvar color 93
globalvar candidates 94
globalvar globalActiveBreaches 95
globalvar globalActiveBreachHealth 96
globalvar smActions 97
globalvar heroFallDamageTable 98
globalvar powerconnected 99
globalvar botamount 100
globalvar dialogueLines 101
globalvar Character_Nr 102
globalvar Bosssequencer 103
globalvar bossSpot 104
globalvar bossPartList 105
globalvar bossEffects 106
globalvar bossIndex 107
globalvar zoneEffects 108
globalvar zoneTexts 109
globalvar zoneMarkerIndex 110
globalvar fireSale 111
globalvar fireSaleBoxes 112
globalvar fireSaleIndex 113
globalvar zoneRefillSlot 114
globalvar settingsCamera 115
globalvar settingsViewers 116
globalvar settingsRow 117
globalvar dooreffectsequencer 118
globalvar botNames 119
globalvar _arrayConstructor 120
globalvar pricePerUse 121
globalvar index 122
globalvar doorIndex 123

#Player variables

playervar cashback 0
playervar creditcardlimit 1
playervar H 2
playervar _extendedPlayerCollection 3
playervar p_T 4
playervar pfDestination 5
playervar pfSavedTarget 6
playervar pfIsPathfinding 7
playervar pfCurrentNodeIndex 8
playervar pfGoalNode 9
playervar pfPreviousNode 10
playervar pfWalkingToPosition 11
playervar pfWalkingFromPosition 12
playervar pfIsStuck 13
playervar pfSlowSince 14
playervar pfHopPosition 15
playervar pfHopChar 16
playervar zombieTarget 17
playervar zombieMode 18
playervar zombieModeSince 19
playervar zombieStuckChecks 20
playervar zombieAboveChecks 21
playervar zombieFlatDistance 22
playervar zombieHeightDifference 23
playervar zombieSpeedBoost 24
playervar zombieAppliedSpeed 25
playervar zombieBusy 26
playervar withdrawNotif 27
playervar depNotif 28
playervar creditTier 29
playervar currentmagazines 30
playervar points2 31
playervar points 32
playervar closestbodypos 33
playervar fullbodypos 34
playervar prevpos_intersection 35
playervar active_wall 36
playervar closestwall 37
playervar outofpsawn 38
playervar doorNotif 39
playervar filterpos 40
playervar lastsavedpos 41
playervar bankHoldStart 42
playervar bankStep 43
playervar reviveTarget 44
playervar doorSkipCheck 45
playervar lastOutsideSpawn 46
playervar arcadeCodeStep 47
playervar buySpot 48
playervar messageSpot 49
playervar ramattraCoins 50
playervar coinUses 51
playervar coinNameIndex 52
playervar coinPrice 53
playervar killKind 54
playervar killPoints 55
playervar counterSlot 56
playervar counterMods 57
playervar papShotDamage 58
playervar papShotDelay 59
playervar enablefalldamage 60
playervar fall_Damage_Speed 61
playervar fallDamageOffsetTable 62
playervar perkBuyMessTimer 63
playervar followerTarget 64
playervar followerFiring 65
playervar firstFollowerShown 66
playervar monkeyBombOwned 67
playervar monkeyBombsLeft 68
playervar monkeyBombActive 69
playervar monkeyBombSlot 70
playervar monkeyBomb 71
playervar monkeyBombTargets 72
playervar isMonkeyBomb 73
playervar endingHeroes 74
playervar papAppliedTier 75
playervar breachPick 76
playervar smRow 77
playervar smEntry 78
playervar smCode 79
playervar smHolding 80
playervar smSpecial 81
playervar sea 82
playervar magazines 83
playervar G 84
playervar InfoUI 85
playervar aprilQuoteIndex 86
playervar infoUIIndex 87
playervar playerRingCreated 88
playervar teleporterEffects 89
playervar S 90
playervar warmachAttackIndex 91
playervar warmachAttackParts 92
playervar xp 93
playervar Head_HP 94
playervar Part 95
playervar dispencereffect 96
playervar currentheroxp 97
playervar Major_Attacks 98
playervar menuPick 99
playervar heroswap 100
playervar currentswap 101
playervar perkinfo 102
playervar ultcharge 103
playervar heroiconswap 104
playervar abilitycooldown 105
playervar swapvar 106
playervar swap 107
playervar heropoints 108
playervar allowedheroes 109
playervar cameravar1 110
playervar cameravar2 111
playervar perk 112
playervar perkHudIndex 113
playervar cameratoggle 114
playervar Packapunch 115
playervar singlelives 116
playervar XPlevel 117
playervar healvariable 118
playervar damagevariable 119
playervar healthmax 120
playervar doublemag 121
playervar index 122
playervar index_0 123

#Subroutine names

subroutine decompressTextSub 0
subroutine LoadingPause 1
subroutine StartCounterMods 2
subroutine Subfollowerbuy 3
subroutine PapRocket 4
subroutine PapStickyBomb 5
subroutine PaPsound 6
subroutine Subheroswap 7
subroutine getoutofspawn 8
subroutine zone1 9
subroutine zone2 10
subroutine zone3 11
subroutine SpendRamattraCoins 12
subroutine SaveRamattraCoins 13
subroutine PurchaseFreezeAfterEmote 14
subroutine RebuildBreachEffects 15
subroutine totalrandomspawn 16
subroutine wavevoicecall 17
subroutine setbotamount 18
subroutine wavespawn 19
subroutine pfLookAtDestination 20
subroutine pfUpdateNodeMeta 21
subroutine pfWalkToDestination 22
subroutine pfProgressEventPlayer 23
subroutine pfLookupNextHop 24
subroutine pfReadNextHopChar 25
subroutine pfRecalibrate 26
subroutine DestroyDoorEffects 27
subroutine makedoors 28
subroutine LoadCoreData 29
subroutine decompressNSub 30
subroutine decompressVSub 31
subroutine SmDispatch 32
subroutine BuildZoneDoors 33
subroutine LoadZoneDoorData 34
subroutine ClearZoneMarkers 35
subroutine DrawZoneMarkers 36
subroutine SpawnDevastator 37
subroutine SpawnBossParts 38
subroutine SpawnColossalCharger 39
subroutine SpawnImperialWarmech 40
subroutine EndBossFight 41
subroutine followerattack1 42
subroutine followerattack2 43

#Activated extensions

#!extension kineticExplosionEffects
#!extension explosionSounds
#!extension energyExplosionEffects
#!extension beamEffects
#!extension buffStatusEffects
#!extension debuffStatusEffects


#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, A or "", "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict

def LoadingPause():
    @Name "loading pause"
    
    wait()
    if start == false:
        waitUntil(getServerLoad() < 180 and getAverageServerLoad() < 180, 10)
    else:
        waitUntil(getServerLoad() < 200, 2)


def decompressTextSub():
    @Name "decode text list"
    
    decodeOut = []
    textGroup = []
    textItem = ""
    decodeString = 0
    while decodeString < len(decodeIn):
        decodePosition = 0
        while decodePosition < strLen(decodeIn[decodeString]):
            textToken = decodeTable.strIndex(decodeIn[decodeString].substring(decodePosition, 1))
            if textToken == 0:
                textGroup[len(textGroup)] = null if textItem == "" else textItem.substring(0, strLen(textItem))
                textItem = ""
                if _extendedGlobalCollection[53] == true:
                    infoText[len(textGroup) - 1] = textGroup.last()
                    wait(0.15)
            elif textToken == 1:
                decodeOut[len(decodeOut)] = textGroup
                textGroup = []
            else:
                _extendedGlobalCollection[51] = _extendedGlobalCollection[49][floor(textToken / 62)]
                textItem = "{0}{1}".format(textItem, _extendedGlobalCollection[51].substring(textToken % 62 * 2, 1 if _extendedGlobalCollection[51].substring(textToken % 62 * 2 + 1, 1) == _extendedGlobalCollection[50] else 2))
                if _extendedGlobalCollection[53] == true:
                    infoText[len(textGroup)] = textItem
            if not decodePosition % 12:
                LoadingPause()
            decodePosition++
        decodeString++
    if len(decodeOut) == 0:
        decodeOut = textGroup


rule "load text and hero lists":
    wait(3)
    hero = [Hero.LUCIO, Hero.HANZO, Hero.ZENYATTA, Hero.SOLDIER, Hero.MERCY, Hero.PHARAH, Hero.JUNKRAT, Hero.SYMMETRA, Hero.DOOMFIST, Hero.BAPTISTE, Hero.BASTION, Hero.REAPER, Hero.GENJI, Hero.ASHE, Hero.ZARYA, Hero.ROADHOG, Hero.DVA, Hero.BRIGITTE, Hero.REINHARDT, Hero.TORBJORN, Hero.SIGMA, Hero.ORISA, Hero.MOIRA, Hero.MEI, Hero.ANRAN, Hero.MAUGA, Hero.SOJOURN, Hero.SOMBRA, Hero.TRACER, Hero.WIDOWMAKER, Hero.WINSTON, Hero.WRECKING_BALL, Hero.ECHO, Hero.FREJA, Hero.HAZARD, Hero.ILLARI, Hero.JUNKER_QUEEN, Hero.LIFEWEAVER, Hero.JUNO, Hero.KIRIKO, Hero.ANA, Hero.VENTURE, Hero.CASSIDY, Hero.RAMATTRA, Hero.DOMINA, Hero.EMRE, Hero.JETPACK_CAT, Hero.MIZUKI, Hero.VENDETTA, Hero.WUYANG]
    wait(0.25)
    _extendedGlobalCollection[66] = [Hero.ANA, Hero.ANRAN, Hero.ASHE, Hero.BAPTISTE, Hero.BASTION, Hero.BRIGITTE, Hero.CASSIDY, Hero.DVA, Hero.DOMINA, Hero.DOOMFIST, Hero.ECHO, Hero.EMRE, Hero.FREJA, Hero.GENJI, Hero.HANZO, Hero.HAZARD, Hero.ILLARI, Hero.JETPACK_CAT, Hero.JUNKER_QUEEN, Hero.JUNKRAT, Hero.JUNO, Hero.KIRIKO, Hero.LIFEWEAVER, Hero.LUCIO, Hero.MAUGA, Hero.MEI, Hero.MERCY, Hero.MIZUKI, Hero.MOIRA, Hero.ORISA, Hero.PHARAH, Hero.RAMATTRA, Hero.REAPER, Hero.REINHARDT, Hero.ROADHOG, Hero.SIGMA, Hero.SOJOURN, Hero.SOLDIER, Hero.SOMBRA, Hero.SYMMETRA, Hero.TORBJORN, Hero.TRACER, Hero.VENDETTA, Hero.VENTURE, Hero.WIDOWMAKER, Hero.WINSTON, Hero.WRECKING_BALL, Hero.WUYANG, Hero.ZARYA, Hero.ZENYATTA]
    wait(0.25)
    _extendedGlobalCollection[67] = [Hero.ANRAN, Hero.ASHE, Hero.BASTION, Hero.CASSIDY, Hero.ECHO, Hero.EMRE, Hero.FREJA, Hero.GENJI, Hero.HANZO, Hero.JUNKRAT, Hero.MEI, Hero.PHARAH, Hero.REAPER, Hero.SOJOURN, Hero.SOLDIER, Hero.SOMBRA, Hero.SYMMETRA, Hero.TORBJORN, Hero.TRACER, Hero.VENDETTA, Hero.VENTURE, Hero.WIDOWMAKER]
    wait(0.25)
    _extendedGlobalCollection[68] = [Hero.DOMINA, Hero.DVA, Hero.DOOMFIST, Hero.HAZARD, Hero.JUNKER_QUEEN, Hero.MAUGA, Hero.ORISA, Hero.RAMATTRA, Hero.REINHARDT, Hero.ROADHOG, Hero.SIGMA, Hero.WINSTON, Hero.WRECKING_BALL, Hero.ZARYA]
    wait(0.25)
    _extendedGlobalCollection[69] = [Hero.ANA, Hero.BAPTISTE, Hero.BRIGITTE, Hero.ILLARI, Hero.JETPACK_CAT, Hero.JUNO, Hero.KIRIKO, Hero.LIFEWEAVER, Hero.LUCIO, Hero.MERCY, Hero.MIZUKI, Hero.MOIRA, Hero.WUYANG, Hero.ZENYATTA]
    wait(0.25)
    waitUntil(mapDataLoaded == true and pfMapReady == true and zoneLoading == false, 90)
    waitUntil(mapDataLoaded == true, 60)
    _extendedGlobalCollection[53] = true
    decodeIn = ["ؗ\u05f9\u0380˰˵ֹ˗֧\u05cc؟!̜́˶͢˭˦˛̲˧̧̑݁֡͋׆˼̩̔˲͡ࡶ˹͍ۚ̓˶͢˭˶̡̺̑˽˺̡̏˱̮¶!֔˹̈˪̗\u05ff˭˘˲˿֑٘\u03a2˗۾˯̀܄̉˷̕˟\u0530̼̦́̀˷̕˟\u0530̇˴̛՟̷̇·۟˸͐̋΅˵̒͜˳˧˼˩̷͚̇·ֵ!˚˙˥˵͝˙˥˛˸˘̤\u05f8́˟˹;ੈ˯", "ͨ˟̆˪˟ׁ̢̼֛˞̢̇͋˞̪\u0530˗˝̼͆֯\u05f7܂˚̠؋͍˦˪̸̨!࣑˯ͥ˴֊՜̼̙̭̮˜߷̬˽׆̳ͨ̕˟˸˫̢͈֕˞˺˲̔ͨ\u03a2˗̸̖̃˝˟!ִؗ˯\u058b̵\u0601˨̚˨̓\u05cc˸࠲࠭˦̞̱ͮ˺̗ؓ̊̈˯̀܄̊˥̗̹!̭͊̀̏̃־˹̮˜̙̝ͮ׳\u0382̘˗˩̵˪˟˶̱۟ͮ͢", "˸˜̱̀\u038b%!؊ּ͌˜˝˗̐͟´!\u05c9˱̢˞˺˩̟͞˙˥˪̳˟˵֙˗֑˛̲˴݁֡͋˘̦˗̦˞̞˦˘˝\u0a4a˶̧̺̑֩̀̋!؊ּ͌̀˷˙˥˪̳˟˦̳̏˘̙̭̈˼ٚ˪˟ׁ˦̞˪̈́\u0383ْ̤͕ٝ!ؗ\u05f9̐˚̄˶˧ੋ!݉˧˗˚˙˥˼̻͖̅̈ͬ̽˪̵̽˘ָ֨ͩ܅˿˚̷̯̾", "˪˛՟˸˻˟̈́˜̈˼ٚ!ͫͤ̀˷˙˥˯̷˗݁֡͋˸˫͈֕̾\u03a2˭˼˩͚˪̥˻¶!̡̭͊˽̪\u0382˾̓˦֢ͪ࠭͜۩֨˷˙،̳˘ٟ՜̢˞˨ͥ˿̧؉\u074c̟!࣓\u05ccͫ֕\u058c࠲˧̧̀˩~!\u05c8֡͋˘͈̏͌̀˩ੌ˧̴੍ׁ͈̿ؔ\u0a4fੑ\u074c\u05ee!̭͊ͧ˫̞͗˙˥̪̘˭˜˽֎͇˫˩\u07bc˧ׁ", "̴͈̿ؔ˘̴̧˼˹҄֕˝̘͙̘!\u0a54̶ُ̦˜˝˗̴̜˙˴̴̉˙˥˸͐\u0557ؓ̀˩˘̶˃!"]
    decompressTextSub()
    infoText = decodeOut
    _extendedGlobalCollection[53] = false
    decodeIn = ["̛̌˗̈˺˩֑̪̌˭˘̷̜%!˛͒΅̃־˹\u05f5˱̢˞˨\u05f7߶˸˘֦͆˹̈˺˩̱٘˗̷̜!̢̙̭̱͒˞˨˥̗˸͓̂˜˛΄˽˿̘̞͓̎̃˝˗̨̗£!۪̋˨̤֊՜˝̗́ࡲ̢˞ّ̒՝̆̑˝˗˥̗˭̢˞˼˞̻·!͙̘˚̠˝˗;՟ܾ˰˶֧̑֜̊͜˝˗̐˚̄˸͓̙̭̦", "˗\u05ee˙˴˝˗̸̛̆˷¤!˾˘̸̖̓˨̱̈ͮ˙˥˵\u05cb̋͏˼ٙ˙̡˫։ँ˷˦̲ܿ̕˟¯!̳̏̚˟˘́՜˶˾̢̙̭̊̀̏˞ࡴ˗ؑ̓͡!׀̌˺͚̈ͬ˾͆˘ͧ˫͙̱ͮ˿۾˺̫\u05fa՛ͧ̀˷ंऺ̟̖̬̓̕˷˕!˝˟˗˰ٜ݀˩˭˙˴֊՜˸ࡵ̎̈́̊̀˝˸̄̃ؑ˼\u0530¶!̓", "\u05cc˘˲˿˥ׂ̗̪̘͇̘͐̔̅˗͉̞̫\u038b̎̈́̊֊՜˝̗́̊˩\u0605̣˟˲˦̞̎߸˛̌!̐˚̄̇\u0378˱˿˩˶̣̿̾˘˝˗ͩ́̕˾%!\u05fb˟˹̷̋˺˲˼˱ͭ˾˳ֹ̛̗̤̖ͬ֓̕´!߹͂܀˸˘\u05cd\u05ce׃̛˳˧˙˥̝̇ͅ׃̺˾˹̈˙˥˙̖\z!\u058b͍˦˪̸̨̾\u03a2˭̲ܿ˦̬̀͠", "˭%!"]
    decompressTextSub()
    _extendedGlobalCollection[59] = decodeOut
    decodeIn = ["߽˜˛़!̌˜˝\u05f6˨˱£!݂̈˦̇ͅ˜֫ࡷ!֓˜̳̟£!؆̛̔ͭࡸ˘͟˛̪̈́\u05fd˷!؆ࡹࡹְ˜݃ि˯\u05fd̏˘͟˛˸͐ؒ͗\u0590˱·!؆˺\u05ce܄ी˪˟̚՚˲̵˶϶ࡼ̴̨݄̍˥ु˚¦!؆˯\u05fd̏˸՟ׅ˶϶˙ְ͉ͧ̏˹ͨٞ˱·!؆̪ؓ\u0383̱͆̓˙˴̡˽̨̩̔̃!̴̜͐\u0557", "̘̓˦˪̨̗̚˿ָ͍͓̘ͩ̃\u038dٟ̦̑˱˭̹!֯̓̽˱̵˿̤̱˽˛˺϶˗͘˙̦̮˜͗ू̀˩!"]
    decompressTextSub()
    _extendedGlobalCollection[60] = decodeOut
    decodeIn = ["߽˜˞ࡾͩ܅£!ृ̓˘̤܆¦!̰˜׀݅ॅ!ॆͬेॉो्!"]
    decompressTextSub()
    _extendedGlobalCollection[61] = decodeOut
    decodeIn = ["ֿׁ֔̈́̎\u0379̰֞˵˧˗͙̘˘̗̈̇ؔ!̰˦̳ؕ˘˛̧˚̍֟\u05fá˶͵͖!ֱ̦̜̕܈˸˘ָ˱͖\u058c˵͚˜˛́˧˗˾;!߿͝˩̇͏܉̅̉˷̪ͭ֒!̴̦ࠗॎ˘֦͆ͯ܊̈́\u0383̖̬̈̕˷;!ׂ̰̔ͦ̄̍؋ॏ۩˿̡͚֯̋֏!߿̏˙̡؇˘̤\u07fcࢁ̂˯̪̿̄ͭ֒!ֱ˶̖̐˫", "˰˯̓˻֣̍֊˱˰̉˷̴̲̒֏!߿͝˩˘҄ࠖ͗́˘̀̏̕͢˗֭̈̇!॒߶ֿͣ̎\u0379̰̍˝˚̛̠҉%!֤͉॓́̋˿͙\u0378˘˲˿\u05f5॔ͅ!̰˯˥̏˘̛҉̍ࠛ͐˦˛̇͏;!ֱ˼̴ͩ˘̦˗̂˜˝˗̛݈֝ؖ݅˹̷̜˸̹!ֲֳ̤։̣̹֥̏̉˘˰˦˪̗֚͆;!ࢂּ˩̇͏", "̍ॕֺ̡̯́̔͌!ࠛ\u0381˘֦͆ͯ҃̅̉˷̪ͭ˜̈˳̯ͅ!̰˦ͪ˴̛҉֞ॖ́͆˘҄ͯ!ִؗ̃˫ॗͬ˞˜͘˺ֺ̡˭%!̷ֱ̌̕˨̟˽˨֤͐̇͏܌̩˵˹ּͧ˩̇\u0604̹!͉݉࠘˘̟֓̍\u05fe˽̲̾̅̅̉˷̪͖ͭ!ֱ˶̖̐˫˰̩̃܉˴˱˟٫̔͆͵͐;!٬\u05fa՛̀˩̇\u0378̛", "̋֏҃̅̉˷̪ͭ˜͉̈̇ࠜ!ֱ˯̈˛˘̦˗҄͵̟֏\u058c܍̟̑̓˵˧̯!ॣ̨̳̩̰ͣ̔̃֞˝˚̛̠҉%!ֲ˜͘˦ֽͪ!ࢃ˹̆˛΅॥ؘٰ॰\u0382˗̣̈̾˪˟׀֫ࢆ!\u074b̺݃\u0381˘҄ͯ҃˴̸̦̮̔͆͵՛˷;!ংַ̪͖֥ͭ̅̆\u038bֿ̎\u0379%!ࠛ͐˦˛̩̰̃֞˝˚̛̠҉%!", "\u070f؉\u074cֿ̟̎\u0379̷̍֟̇͏;!̰ަ̵̪҆ͭ݊̂˝˚̠̈̾\u03a2̯!ঃ˷͏˯ׁ̖҅\u098d݃͐˺ֿ̬͍̎\u0379\u009e!֣̱٘˭̇\u0378̛̋֏҃̅̉˷̔͆͵͐;!ֲ˜͘˯̋͜܌̴ͩ˘\u05fá˶͵͖!۔\u0992͐̎ࢀ̰ۨ́̓̍˝˚̛̠҉˙˴։֘;!ֱ˶̖̐\u0381˘ָ˱ֺؙ͖̟̏̎˹˰̾˩̯!܋", "\u09b1̩ࠞ͂̔˞̞ࢊ֓˜̂˝˚\u09b3̛҉%!ֱ˪̣̆˘̦˗ָ˱݊̂˝˚̠˛̧˚̹!\u070f\u09b4˘֦͆ͯ҃̅̉˷̪ͭ˜˚̴͛;!\u09b5܂\u09ba˘̟̰֓̍˝˚̠̜˛˙˴ְ˽;!\u09bbּ˚̠͒ࢌ়҃\u05feͬ˞͖!ࢃ̺܃̇͏̍ি͟ী˘̟֓;!ֲֳ̛̤΅ۗ̂˝˚̛̠҉˼ّ̛̩͍̹ۘ!ֱ˶͉˝", "˸˘˱ৃ˭׆̎˽˫̀˝˞˜̷\u05fa՛̀˩;!ֲ˜͘˦ֽͪ!ֲ˜͘˦ֽͪ!ֲ˜͘˦ֽͪ!ֲ˜͘˦ֽͪ!ֲ˜͘˦ֽͪ!ֲ˜͘˦ֽͪ!"]
    decompressTextSub()
    _extendedGlobalCollection[63] = decodeOut
    decodeIn = ["\u0380˗͙̘̗̇\u05ca̼։˜˝˗͔̣̏̇\u0604ۙࢍ;!̭͊˛҅ͅ˗̜˛˪̥˻˘̈˳ׅ̑˝˗҄·˩؆˳̝ͯ!ֿ̝̟͊̎̀՟̕˚̴֎̝̃˪̘̊̈̎־՞ֶ˱̌˻;!̝͊˵˰͛˩̔֗҆˛˘΅֗\u07fb̋˳̨֨˷̼׀ִ͋҇!̝͊̔˭˟˽˘̦˗̴֊̣̼̓˲̮ࠢ!֣֖͜˙˥ަ̣\u058b͍", "˶˾̜̊˛˪̥˻׆˺̧̫̞˟;!̝͊̎٪͒͛˽˪ͩ͐̔֗҆˛˵˧˗̐˚̄;!ࢉ͒ͧ̋˵˧˗̐˚̄˳˧˙˥̖̬̔࢏̀˩͓̃˝˰\u0605˰͇\u05cf!ֲ˨\u058b˝˙˴͡\u0558͕֫˗˰˼͍͒̓˼˹˚֑҂͑͋˻˳̨҈;!۔̖̑̕˲˿֝̅͌\u0890˶˗˛҅ͅ˗֑́˱˲̵;!ި֕˼̒՝;", "֕\u0081!\u0891̓˙̉˘ַ\u05cc̟՟˶˾̜̊˛˪̥˻̹!̝͊˯ۚ̽˜˰˯\u0557˩ࠡ˼̢̩˞˨\u0601͕ͩ˗˰˶̖\u0892؈̒\u0383̐˚̄;!\u0380˰̕\u05f6́̔֗҆˛˘̜˛˺͝˾̼̆\u058b̟֜҇!ࠦ҅ͅ˗̜˛˪̥˻˘̈˳ׅ̙̝̑˪̳˟;!̰˯֪͝˵̣̆˶˾̩̿˪̥˻׆̢˞ّ̂ࢌ!ࠧ˛˪̥˻׆̃", "˨˾؆̷̾˗ۛ˟%!ࠩ˝˟˶˞ִ˼˗ܑ֨ު̥˻̓;!ޫ˟%!ֱ˳˧̨̮̔˘ִ͈˶˾̩̿˳ׅ¬!ֲ˨\u05ff͢˾̘͇֫̑֯̓̽̌˻˘˛҅ͅ˗΅֨̀˩ֺ̟̆̎ͯ!̝͊˯\u05cb̋ٛ̔֗҆˛ͮ\u09c9̴͉̹!ࠦ҅ͅ˗̜˛˪̥˻˘̚˨\u05ec͋˻֛͑˦\u09ca˲̵̌˻;!ֱ̎٪˟\u0382˱̄̔", "֗҆˛˵˧˗֪̙̮՛ެ˱˟٫;!̰˜˱˞̻˪̥˻˘̚˨˝˰˳ͥ͒҇͟!\u070f̤́͡\u0381˜̻͗˜̚˨\u05fc̒܌̽˷˵˧˗̐˚̄;!\u06dd͌˰͇˫͗˛̐͟˨̴̧̞˘̜˛˙̡˫͍̣̐˺̡˷̯!ؚ֪̣˘͈́˵˧˗˝˲˙̉ࢊ̮˜̐˚̄;!\u0895˚\u0383˚̈˦҂˧ַ̬͠\u0379˳́ͅ;!؋", "̀˱̵ׅ̍֔˪˛\u0590͛˩˸˘֯̓͐\u03a2̯!\u05fb˱˦˯\u0590˱̀́˺˲֍˳̨˿˝˰˪ͩ˫̀˝˞˜̐˚̄;!ࠧ̌˻ࡰ̇˱͋ࢁ˚֑҂͑͋˻˳̨֨˷;!\u05fb̩͇ͥ˫˛҅ͅ˭̾˛̘˟˸۽˭\u0896˱͖!ࠫৌ̤̟̓˘̜˛˯\u0557˱ޮ\u09cf˦̞˵˧˗̐˚̄;!ܱ࢏ׇ̔֗҆˛˘̜˛̔˭˞ޯ˭", "˙˴̨̛϶̸̊\u09d0̹!ް־՞ֶ˼̫͒˘˩\u038b˶˾̜̊˛̃҂˟˚۞;!߫̒͐̇˩֍˳՞ֶ˳˧˳˛ޭ̳ͫ̔˭̓͞˶˾̊̐˚̄;!\u09d2ֻ̇͆˲҈̾˛̘˟˯̵̈́̽͗˙̡˫˝˰;!ۤ̂˶͵̄˳˧˙̱̿˶̿˸۽˭˜̜˛;!\u05fb˱˙˥˺̛˽˨̟߯̓̚˘̜˛̃҂˟˚۞;!\u09d3", "͛˩̔֗҆˛˘֖̞˚ࠡ˯̡ࢗͫͤ̋҇!࢘˻̝˗̴\u0378˟̃־˹\u05f5˱̢˞˺˲˦҂˧˿˾;!߹;̨\u0379̨̋̕˨̟̓˘̤ۧ͠˟˯͂ͦ;!ֱ˯\u0557́\u07b2˗͈˻˚ׅ׆˼̩̲̅˶˾̩̿˪̥˻̹!̰˜˱˞̻˪̥˻˘̚˨˝˰˳ͥ͒҇͟!̰˜˱˞̻˪̥˻˘̚˨˝˰˳ͥ͒҇͟!̰", "˜˱˞̻˪̥˻˘̚˨˝˰˳ͥ͒҇͟!̰˜˱˞̻˪̥˻˘̚˨˝˰˳ͥ͒҇͟!̰˜˱˞̻˪̥˻˘̚˨˝˰˳ͥ͒҇͟!̰˜˱˞̻˪̥˻˘̚˨˝˰˳ͥ͒҇͟!"]
    decompressTextSub()
    _extendedGlobalCollection[65] = decodeOut
    decodeIn = ["ࢂࠠ˜҄֕˙˥˼̖˜̀˝˞˜˝˗̐˚̄%!\u061c\u05ec߶̬̟˺̫˭˦˜̤̻̉˟˪̵̽;!܋͕ͩ˗ּͧ̅˼˗;ֶ́˯˴̸̖֊ͯ!̰˜˱˞̻˳ͅ\u0378̳˟˸˫̙̝˪ׂ͖ͦ!\u05eb̆˚̠͡˭\u0381˜͈̌̃˫̤։\u09d4̣;!͊؝̲̏̒˿̜˛̪֛˜̈˳\u038b˶˾̊̌;!࢙;̫˘͡\u0381˜͈̌", "˳˛۟˵ֵ̘!࢚ࡻ͌̀˩̔֗҆˛˘\u05ff̖̋˨˚˽́̌˻;!\u0380˰˳˰˜͔˘ֺ̓̚˶˾̜̊˛˙̡˫͍̣̐˺̡˷̯!̰˙͍̽˘˝˰˙\u0382ޭ̙؝˛˯̿֜̃˫̐˚̄;!\u0380˗ׇ͠˯˚۞̃־˹̚˨˝\u0530˗\u05f5˴\u058bͯ!\u07b4̘̊͡˭\u0381˜͈̌˺˥ۗ͝˲˿̟˾˥˨͡\u058c;!͊؝̲̏̒", "˿̜˛˙̡˫ָ̦˗̸˲̮˙˴࢛˚˵̯!࢜˩̠ͅ˩̼\u058b̟̙֜࢝؝˛˙ͤ˼̗ͦ;!ُ˛˷˝͓̃̀̏˸ۙ֍̎̂́ࢅ؛˚̠̐˚̄;!͉݉࠘˘͒ࠜ֠˞˺˲֍˦҂˧˿̌;!ܱ̭֞͊˝˞̻˜˝˰˶϶˳˛˗̴̜\u0081!ৗ̜˨̬ͦ˙̉˘͡˭\u0381˜͈̌˳˧˳˛̯!\u09d8˹̌˦˪˚", "˜͗֎݊\u09da̼˲˿̜˛˪̥˻̹!؊̝·˗̆˩˗֧\u0381˜։˹̌;!\u0380˗ֿۜ̿܈͓͈̃˚˘˰˵˰͛˷˦̲̯̅!\u06dd̅͌̀˩̇͆˲҈˵˧˗˝˲̢˞̯̕͢!͕݉͋˗͔˾˘̚˨̟̂̃ৢ࢞\u0378˜̙̝˶̛͖̆!ৣ̌\u09e5\u074c˷˺\u0530̄̎߸͉̍\u07b7˜̜˛˪̥˻ׄ!̰˜˱˞̻˪̥˻˘̚", "˨˝˰̕˟֭!߹̌ޯ˱̦৳˘ֻ̬̇˩֍˺̫˗̸̖ؔ!ؗ̂˨˰\u0381˜̸̖৺؛˚̠̜˛˙˴֝ۛ˗˾;!̰˜˱˞̻˳̨҈˙˴\u05cd՛ͫ˸˻˴˝˗ͫ΅̳̹!\u0895˚࢟˘˩˺ִ̳ͤ˫̢̀̏˞˺˲˪՜ͮؔ!\u06dd͌˰͇˫̬ͦ˵˚\u07b5֥ͤ̔͑̊̚˨̙ࢵ!\u05fb˱˦˯\u0590˱̲̀́̒҈˳̨", "֨˷̰̼̲̍֟̅͡˶˲˜̤\u0601֫֫;!৻҅̒\u05fd˷̲̥̱৽̕˗ܑ͎ٞ\u07b7˜̜˛˪̥˻̹!̰˜˱˞̻˪̥˻˘̚˨˝˰̕˟֭!֣׀ࣈ˗̬ͦ˵˚˗͂ͦ˘̜˛˙̡˫˝˰;!̰˜˱˞̻˪̥˻˘̚˨˝˰̕˟֭!\u06dd͌˰͇˫̬ͦ˵˚˗˰˺\u0530\u07b8ͯ!ި̞˘̦˗ֺ̓̚˶˾̜̊˛", "˙̡˫\u05ec͉\u05ca;!ࣉ̳˝̔֗҆˛˘ܑ֪֛͑࣊˦̞˵˧˗̐˚̄;!̰˜˱˞̻˪̥˻˘̚˨˝˰̕˟֭!͊؝̲̏̒˿̤؛͢˟˯ۚ̽࣋˦̞˦̖̕΄˟˪̝̱;!ُ͉̋٫̔֗҆˛˘ֳ͙˟̔˭˞ޯ˭˙̡˫˝˭̯!̰˜˱˞̻˪̥˻˘̚˨˝˰̕˟֭!ਁ̨͍ͣ̔̇͏̼\u058b֜", "̟̙̭࢝͡\u0381˜̡˽˙˥˯͂ͦ;!ُ˛˷˝˯ؓ̊϶˵˚˗˰̦̟̎ࢎ̲̅˼˞̻͖!̰˜˱˞̻˪̥˻˘̚˨˝˰̕˟֭!̰˜˱˞̻˪̥˻˘̚˨˝˰̕˟֭!̰˜˱˞̻˪̥˻˘̚˨˝˰̕˟֭!̰˜˱˞̻˪̥˻˘̚˨˝˰̕˟֭!̰˜˱˞̻˪̥˻˘̚˨˝˰̕˟֭!̰", "˜˱˞̻˪̥˻˘̚˨˝˰̕˟֭!"]
    decompressTextSub()
    _extendedGlobalCollection[64] = decodeOut
    decodeIn = ["֔\u038d̑!̍\u0380˗\u058b˝˙˴̤̟\u05f9֧࠺˿ְ͙͐;!#\u0380˰˙\u0382ؚ۟҃֩̑͞˧˶̺̑̂˜͙̇˱͋֏!!#֔\u038d̑!̍\u0603͂˸͐ؒ͗\u0590˱͖!#ް\u082f͌\u086bࠞ˽̸݄̘̍\u0380˰˙̽̆˶̴̺̑̋՚˚˗˝\u05f6˨؍̋;!!#؊ͪ˱\u0590˷֥̽̆$!;!#ް\u082f͎͌̄\u07b4̋̓̍֔͞\u038d̑!˼۠˚", "̹!#؋˝̣̝͑̍͊̇ͭ\u038d͕˗˩\u038ḃ͜՜˘˝˗˚ͨ˾׃̛;!!#֔\u038ḑ̨ۭ͇̑͞˫̴̋̓̍ࣨ͞˟\u05f7ׂ\u05fd˷˯\u05cb̺̝̋ٛ̍ࠩ˗˰̲̅˦˫֕̀˩;!!#̢̭͊ͧ̏˞֎͜˽˘˥̗˭٭͊ࡳ˛˵˟͜˹\u05cd̽׃̛˘˚˵˹֗\u07fb̀˩;!!#̝͊̔˭˰͕͂˗˰˳̩̺̯҃֩", "ؚ̑͞˧˶̺̑֝ͨ͵ࠢ!!#֔\u038d̑!˸՛̘̭̀̓̍͊́\u0378˶̺̬˷\u038b˸˻˴̙̝̞̥̃ؑͮ˷;!#̝͊̎˽͏̎҂˧˜ֻ̓˘˝˗˚ͨ˾׃̺˾˹͘˵˹̴͛૱;!!#\u0380˗֧࠺˿̀̏˼˗˛;֘˸˫˧̴\u086d˦̢̞˞˶̺͙͙̑̔͆͆˛˿˩\u038b˦˘̤͔֘˚\u0600!!#֔\u038d̑!", "˼۠˚̹\u07bä́̊́\u0378˳˧ׇ͔˼˚҈̢˞˙՞ֶ˟˙˴̙̝˳̘̯!#ּ̭͊ͧ̅̔˭˰˜˝˗̴̀̍\u07bf̏؈͌̈˨̱̽׆˦̢̞˞˦˛˯֦͟˦͔ͯ!!#̱֟ؖ٘˗̙̝̇ͭ\u038d̢͕̣۟\u058ĉّ\u05f9˾˼˱҈˙̳̦˿֑ؕ˱̴҇!!#֔\u038d̑!̞ͮ˟͔֢ͯ˭˰͕͂˗̌϶̝˭˦˜̟", "\u07b2՞̛ܽ˪̗\u0601̬͠\u0379;!#̷֟˙˥˯̡͓̜̳̭̦̓̃̈ؕ̍͊˗˝˗͓̤͌̿̃؍̺̓˦̮;!!#\u0380˰˙̽̆˶̢̺̱̑֯̐˞˨\u05fc·̺˾\u07b9̢˞˨̺\u05ce͛˩˘͘˯\u0557˱ޮْ!!#֔\u038d̑!˪̵̗̹̓֠˞˨̴́˚˹̵̛͉̈́̋˘ׇ͔̈˺˩\u05f7͚͇\u05cf!#\u0380˗֖ܰ˛˺˲̂˜", "ֳ͙̔ܿ̽˱ٍ̍̕϶˦ࢄ̖\u070e˺̱̿˫̌;!!#\u0891͜˙˥˶\u05f6̻˜͘˵˹֑҂˟˚̠\u0558ؕ˧̓ͮ̐˫̙ࢵ!!#֔\u038d̑!ͮ࠲ͥ҈̍\u082e̸̖͙̘֜̕˼̽˷˘̙̭\u05f7\u0530˟˙˴̛͕̯͛!#֟˱\u07fc˛̎̋֘̆\u038b̭̦̍͊˗։˜܁̒̀˷˯̡͡܇˸˫˝˗́˧݈!!#\u0380˰˶˧ִ˸˘", "\u05f7՜̼͔˾˚̠̈˼˗˛̷̝̲ͫ̓̍͊͝˭˶̺̑̂˜͙˺̦˽˿˚̈˸͖!!#֔\u038d̑!̕϶˺̫͕̝̞̌̓̍͊̎˸˘̂˜̸˲̵̼։˜̵֜͵˻ͯ!#\u0380˟˗˰̲˴˭̭̦ͧ̓̍͊˗̀ީ˭͛˷˙˥ٟ̇˫ؚ҃֩̑͘͞˧;!!#\u07b4͗˲̵˸˘։˜˝˗͗֫̑ࣚ˾̸͓̃˝˗", "ؖ׀̛̋;!!#֔\u038d̑!˺˩̀ۘ˭֣̍͛́˲̵̔۠˰̋֎˦˘̤̘́˰̀ͧ̑˟̗҇!#̷֟̎ࠪ\u05cè˩˵΅˗̧՛ֻ̭̦́̍͊˗˲̫̆͋˘̈˼˗ֺٝ̓;!!#"]
    decompressTextSub()
    dialogueLines = decodeOut
    decodeIn = ["߽̣̾˙˥̮ͬ̀҇!ؗ̓˙̉˘˥\u0a56ׄ!##ࠫ̓֞֟̌˲܊ِؖ֞˯̫̣̉˷%!\u07b7˜˚˙˥˛࠰˛ٌ\u058c˵̖˫ިࣗ!#\u0380˰˶˩֍̝͖֥ͤ̕˵ْؓ!\u0a57˹̸̱̒%!\u05fb˟࠳ֹ˹ͫͤ˜˝̗́̊˝˗;֥ࣙ،˞̻˙˥˼ٙ%!\u0a58ͤ˜˝̗́̊˝˗̠͠\u07b2̳˹˝˚\u0600!#\u0a5fܺ̕˧", "˫͙\u0378\u07bd!\u0a60̕ͅ˧˫͙\u0378\u07bd!\u0a61͚͑̆˼̒\u05ca,!#̵ࠩ˵˹̵̧̍\u070f̵˙˴˝˗؍̵%!\u070f̵˙˴˝˗̵̧˙˴˝˗̵̧˙˴˝˗̵̧˙˴˝˗؍̵%!#ٍͣ˙֧˸˫˝˗̜֘˚˓!ٍͣ˪϶˜̙̝˼̓̀̌;!ٍ͓ͣ̆̕\u058b́˯ࡽ;!ٍٜͣ\u0a64ੰ!ٍͣੱ੶\u0a78!ٍͣ˦˺˞˻", "͏˵˚̩˗ͫ˹͘˙˥̸̨̺̪̇ͨͣ؛̖\u0892!#࢚\u0378˙̉˘\u0a7b\u0a7d!\u06dd˭͛˷\u0a7e%!ࣜؕ˹\u0603\u07bęࣛ%!##̭͊ͧ\u0381˜̮˜̌%!\u05c9ֵ̒̒̒!#\u05feֳ͙ͬ˟˙̡˫̙̭̘˖!###ׇ֧̲̥̱ࣟ\u07bd!࣠͂ંֵ!#ࠗެ\u0a84ͬ;\u05cb%!̰ۣ̫ۣ̫ۣ̫̂̂%!\u05c9࠴˘ֹ̤͉֓̇֓\u08e2\u07bc", "̿ͣ˦̾ͤ˿҄·˩\u0081!####\u0a92˜֮˜֮˜֮˜֮˜֮˜֮֒!\u05fb˟࠳ֹ˹݂͒˦˜\u05f8˦ࡸ%!#\u05fb˟̙̟˯̞͂\u0605˟˹̺́ࢆ!\u05c9࠴˘͚˚̠̤̀˛٭̰˜̌֞˥˥ِ̊\u0381˜֧݆ؕ!##ޫ̬ͨ˗˾%!ۤ́˦\u0382˳˧˙˥ٌ̖̕!##\u0aa9؇˘̮˜̤̂˰˗΄َ̘͇ͥ!\u05c9˴͔˻", "˘̤͇̏͠˫̉˜̐˚̄\u0081!##ࣟ՞\u0ab1\u058cۖ˙̝՛˷̃˫˝˗\u0ab4%!ࠦ̀\u05cd̀˷˺\u05f6̬˷˳˲%!#ࠧ˝˳˧̧̀˩ֽ̾!\u085č˙˴ּ͈͌˜˝˗̄͡%!ِ\u058c̕͢˗̈\u0081!##̡̡࢙̌̌%!\u05eb˛ͣ˙˥˺͉͑%!\u05fȅ˯̿\u05f9̙̭̌͂%!#િ͌\u0383̙̝̱ۭ̃˨ࠟ͌\u0383̙̝̱ۭ%", "!ુ\u07be̡\u05f9̴ֽ̗!#ۤ́͑˗͉˚˘\u05fc̫˙˥ٌ̨̗̾!֔˹˲˿ͫͤ˜̭֧̌֞͊\u0381֒!\u074b˚ަ̵͚̀˘̚՚˦;˽%!̢ؗ̓˞̪ܳ˗̗͍̣ׄ!#ૃ˩˹˰͉̾̓ૄ̝ͩࠪ̓%!̭͊̀̏˯ֻؒ˨϶\u058c̷֢̘\u0557̡̤˽˯ֻؒ˛ٌ֠˞˨̈՚˱˜̩̀̏̃ͩ́˙˥˯͂֎˖!\u05c9", "˴͔˻˘̛̤ٝࢗ́̕\u0081!#ܱު˹̡ު˹֜͠ે՜˖!\u05c9ܹܹ̒̒̒࠷̒࠶ܹ̒̒˖!#ܱ˽˦˯̖֒!\u05eb˛˺̫˭˙˥˼˩ૉ!#̭̮͊˜\u05ec͉ؔ֠˞̣̾˯֪͝;!\u05fb˟࠳ֹ˹̮̄˯֪͝%!\u0380˰̪˾\u07b8˗ۚۧ˹̨̢̀̏̔˞̃˽҇!#\u0380˗̨\u03a2˟̱˯˚۞˙˴̌%!\u05c9̘˦˛", "˙̱̿\u0081!#\u0aca\u07be۾˗\u0601˿݃\u05cb%!\u0380̘˯͂֜˘˝˱֞ૌ̱ࣣۨ\u05c9̘\u0081!#\u05c9˴݂̈˵˹̴˻̝˭\u0081!\u0acf֘˙̡˜ַۣ˵َ͚̳͑̇!؞˨˰˦̷̾˗˲˿\u05fe͚ͬ˚̸̠̖̄%!#\u07b7˜\u0ad1\u0ad3̓%!\u06dd֕·˲ַ˸˘͚͜˭ׄ!\u05feͬ˚%!#̷֟˼͍͒˚̠̙ࣥ!ް̓̽˧˙˴\u0ad4\u0ad6!\u0380", "˰˶̆̑˰˸͕˛֚֨˹̬֒!#\u0ad7͆̍\u0ad9\u0adaܲ!\u0380˗܁ͤ˨˰̪͢\u07b6!#\u0adbࣦࣦ̊̊̊\u05f5۩%!̠̙࣠؝˛˸֒!###\u05ebֽ̏\u058c˺˲˯̢̒˞%!؞̡͍̏˘˚˾\u038d̬ࣧ֏!\u05fȩͬ\u05fd˷˪͈֕֘;!#\u0adeَ͐̈!#؊̏͌˜˝˗ֳ̛̬˼̆܃˙˴̀˫̤̯֝ࠥ!ޫִ̿˙˥˺ִ̉", "˛˫͘\u07bc˛͍˚̠܋̏;!##ࣉ˞՝܆ࣘ!̰˜̤֑̤̓֘ۛૢ̤ૣ͏˲ۛ\u07b6!࠹͚̊࠹͚̊࠹ْ͚!#\u07b4̆˶˾̊˾;!͊؝˛˸۽˚\u0590̯̳֚҃ۗͫͤ˜˝͆%!ޫ͈̌ͮ܀̺̯֚ͩ؈̫˗͈̞˾͇͐˵՜˦ު\u038b!#"]
    decompressTextSub()
    _extendedGlobalCollection[124] = decodeOut
    decodeIn = ["ਂ̌˯̣̀˷¶!˲̙̟˺˲˺̡˷˗˝˭˗͙̚˛˙˥̷̾˗̦́̄!܋͍!͵̘ͬ˦˯̣̀˷͎֝\u0382̦˹͗˛˙˴̸˲̮˸\u0890˯͌˩ַ͏˳ͅ˗̈̾˴\u0601͍˦˯̋°!\u061c҂͑֩\u0379͎\u082eۜۡ\u0a0bܵ!\u061c҂͑֩\u0379͎̰՚̆ۡ\u085dܵ!\u061c҂͑֩\u0379ׇ͎ܱۡ\u0a0eܵ!\u061c҂͑֩\u0379͎͉࢘̋˫\u0a12ٕ,", "!\u061c҂͑֩\u0379͎\u0a31\u0557͆˗\u0a34ٕ,!؞˽؟܊ְֳ̽¤!؞˽؟֥˧\u082f˧®!؞˽؟֢˲ͬ͡˥̗˭!؞˽؟ً͌̈ͅ\u0a3b˘֮·!؞˽؟࠰֩\u038b̔˲͡\z!࣌˯\u05cb̋࣎̃҂!࣌˯\u05cb̋࣎̃®!\u0603̧̮˙֙˱״̶ؘ̖̬ؐ˷̶ٜ̫ؐۢ͠˗˛̈́̀˩ܶ\u0a3dܷ¶!\u05c8֡͋˘̓˨͔˽͎ਿ̶֢ͨ", "\u03a2˗͎̪̀̌̂\u0382˾̶ؙܸͪͮ־\u0382˾̓!\u0603̧̮˙֙˱\u0602̶ؘ̖̬ؐ˷\u0602̶̫ؐۢ͠˗˛̈́̀˩࣏ܷܶ¶!\u05c8֡͋˘̓˨͔˽͎ੁ̶֢ͨ\u03a2˗͎̀̌\u086e˯̶ؙܸ̲ͪ˧̧¬!\u0603̧̮˙֙˱߲؏̶ؘ̖̬˷\u0602̶̫ؐۢ͠˗˛̈́̀˩࣏ܶ˯!\u05c8֡͋˘̓˨͔˽͎\u0a44̶֢ͨ\u03a2˗͎̀̌\u0a45˯", "̶ؙܸ̲ͪ˧̧¬!\u0603̧̮˙֙˱״̶߱֬\u05eb̆˚̶̠۬֬\u05c8̖͇֡͋̔͞˫ٗٓ˯!\u05c8֡͋˘̓˨͔˽͎̪̂\u0382˾̶֢ͨ\u03a2˗͎̀̌۬˯̶ؙܸ̲ͪ˧̧¬!\u0603̧̮˙֙˱\u0602̶߱֬\u05eb̆˚̠\u07bb̶֬\u05c8̖͇֡͋̔͞˫ٗ\u07bb˯!\u05c8֡͋˘̓˨͔˽͎̪̂\u0382˾̶֢ͨ\u03a2˗͎̀̌\u07bb˯̶ؙͪ", "ܸ̪̳!"]
    decompressTextSub()
    _extendedGlobalCollection[10] = decodeOut
    textListsLoaded = true


def StartCounterMods():
    @Name "start hero counter damage"
    
    for eventPlayer.counterSlot in range(len(eventPlayer.counterMods)):
        stopDamageModification(eventPlayer.counterMods[eventPlayer.counterSlot])
    eventPlayer.counterMods = []
    if eventPlayer._extendedPlayerCollection[16] == true:
        startDamageModification(getPlayers(Team.2), eventPlayer, 150 if _extendedGlobalCollection[11][(counterHeroType[hero.index((getPlayersInSlot(eventPlayer.getSlot() - 4, Team.1)).getHero())]) * 3 + counterHeroType[hero.index(eventPlayer.getHero())]] > 100 else 100)
        eventPlayer.counterMods.append(getLastDamageModification())
    else:
        for eventPlayer.counterSlot in range(3):
            startDamageModification(getPlayers(Team.2).filter(lambda player: counterHeroType[hero.index(player.getHero())] == evalOnce(eventPlayer.counterSlot)), eventPlayer, _extendedGlobalCollection[11][counterHeroType[hero.index(eventPlayer.getHero())] * 3 + evalOnce(eventPlayer.counterSlot)])
            eventPlayer.counterMods.append(getLastDamageModification())


rule "hero counters: damage players do to zombies":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer._extendedPlayerCollection[16] = false
    StartCounterMods()


rule "hero counters: damage followers do to zombies":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getSlot() >= 4
    @Condition eventPlayer.getSlot() <= 7
    @Condition eventPlayer.isMonkeyBomb != true
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer._extendedPlayerCollection[16] = true
    StartCounterMods()


rule "global bank interest gain every round":
    @Condition numberOfZombies <= 0
    @Condition bankPoints > 0
    @Condition start == 1
    
    wait(0.16)
    bankPoints += bankPoints * bankTiers_InterestRate[bankTier]


rule "global bank tier upgrade":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(eventPlayer, bankButtons[0]) < 1
    @Condition bankTier < len(bankTiers_Cost) - 1
    
    if bankPoints >= bankTiers_Cost[bankTier + 1]:
        bankPoints -= bankTiers_Cost[bankTier + 1]
        bankTier++
        smallMessage(getAllPlayers(), "You have permanently upgraded your bank to tier {0}".format(bankTier))
        playEffect(getAllPlayers(), DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 70)
    else:
        smallMessage(getAllPlayers(), "You need {0} points in the bank to upgrade!".format(bankTiers_Cost[bankTier + 1]))


rule "global bank withdraw button":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(eventPlayer, bankButtons[1]) < 1
    
    waitUntil(getServerLoad() < 230, 3)
    eventPlayer.bankHoldStart = getTotalTimeElapsed()
    while bankPoints > 0:
        eventPlayer.bankStep = min(250 if getTotalTimeElapsed() - eventPlayer.bankHoldStart < 2 else 1000 if getTotalTimeElapsed() - eventPlayer.bankHoldStart < 5 else 10000, bankPoints)
        bankPoints -= eventPlayer.bankStep
        eventPlayer.points += eventPlayer.bankStep
        stopChasing(eventPlayer.points2)
        eventPlayer.points2 = eventPlayer.points
        if eventPlayer.withdrawNotif == 0:
            eventPlayer.withdrawNotif = 1
        wait(0.25, Wait.ABORT_WHEN_FALSE)
    smallMessage(eventPlayer, "The bank is out of funds!")


rule "global bank deposit button":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(eventPlayer, bankButtons[2]) < 1
    
    waitUntil(getServerLoad() < 230, 3)
    eventPlayer.bankHoldStart = getTotalTimeElapsed()
    while eventPlayer.points > 0:
        eventPlayer.bankStep = min(200 if getTotalTimeElapsed() - eventPlayer.bankHoldStart < 2 else 1000 if getTotalTimeElapsed() - eventPlayer.bankHoldStart < 5 else 10000, eventPlayer.points)
        bankPoints += eventPlayer.bankStep
        eventPlayer.points -= eventPlayer.bankStep
        stopChasing(eventPlayer.points2)
        eventPlayer.points2 = eventPlayer.points
        if eventPlayer.depNotif == 0:
            eventPlayer.depNotif = 1
        wait(0.25, Wait.ABORT_WHEN_FALSE)
    smallMessage(eventPlayer, "You don't have enough points to deposit!")


rule "property damage easter egg":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(eventPlayer, bankButtons[3]) < 1
    
    smallMessage(eventPlayer, "{0} You have caused ${1} damage to my army!".format(heroIcon(Hero.RAMATTRA), _extendedGlobalCollection[47]))


rule "credit card system":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(eventPlayer, bankButtons[4]) < 1
    @Condition eventPlayer.creditTier < len(creditCardTiers_Cost) - 1
    
    waitUntil(getServerLoad() < 230, 3)
    if eventPlayer.points >= creditCardTiers_Cost[eventPlayer.creditTier + 1]:
        eventPlayer.points -= creditCardTiers_Cost[eventPlayer.creditTier + 1]
        chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points), 1000)
        eventPlayer.creditTier++
        eventPlayer.creditcardlimit = creditCardTiers_Limit[eventPlayer.creditTier]
        eventPlayer.cashback = creditCardTiers_Cashback[eventPlayer.creditTier]
        smallMessage(eventPlayer, "Your credit card is now tier {0}".format(eventPlayer.creditTier))
        wait(4)
        smallMessage(eventPlayer, "Hold spacebar to see credit card details")
    elif eventPlayer.creditTier == 0:
        smallMessage(eventPlayer, "You need {0} points buy a credit card!".format(creditCardTiers_Cost[1]))
    else:
        smallMessage(eventPlayer, "You need {0} points to upgrade!".format(creditCardTiers_Cost[eventPlayer.creditTier + 1]))


rule "credit card interest":
    @Event eachPlayer
    @Condition eventPlayer.points < 0
    @Condition numberOfZombies < 1
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.creditTier > 0
    
    _extendedGlobalCollection[48] = eventPlayer.points * creditCardTiers_InterestRate[eventPlayer.creditTier]
    eventPlayer.points += _extendedGlobalCollection[48]
    chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points), 1000)
    smallMessage(eventPlayer, "You have incurred {0} interest on your credit card.".format(_extendedGlobalCollection[48]))


rule "Reset deposit notif":
    @Event eachPlayer
    @Condition eventPlayer.depNotif == 1
    
    smallMessage(eventPlayer, "Hold {0} to deposit: 200 at a time, then 1,000, then 10,000".format(inputBindingString(Button.INTERACT)))
    wait(4)
    eventPlayer.depNotif = 0
    wait(0.5)
    if ruleCondition:
        loop()


rule "Reset withdraw notif":
    @Event eachPlayer
    @Condition eventPlayer.withdrawNotif == 1
    
    smallMessage(eventPlayer, "Hold {0} to withdraw: 250 at a time, then 1,000, then 10,000".format(inputBindingString(Button.INTERACT)))
    wait(4)
    eventPlayer.withdrawNotif = 0
    wait(0.5)
    if ruleCondition:
        loop()


rule "56  points loss for high roller":
    @Event playerDied
    @Team 1
    
    bankPoints += eventPlayer.points * 0.2
    eventPlayer.points -= eventPlayer.points * 0.3
    eventPlayer.points = ceil(eventPlayer.points)


rule "1 Setup":
    disableInspector()
    roundnumber = 0
    numberOfZombies = false
    _extendedGlobalCollection[22] = false
    _extendedGlobalCollection[23] = false
    _extendedGlobalCollection[24] = []
    _extendedGlobalCollection[25] = []
    _extendedGlobalCollection[26] = []
    _extendedGlobalCollection[27] = []
    _extendedGlobalCollection[5] = false
    M[0] = vect(500, 25, 500)
    M[1] = vect(500, 25, 500)
    M[2] = vect(500, 25, 500)
    M[3] = vect(500, 25, 500)
    M[4] = vect(500, 25, 500)
    M[5] = vect(500, 25, 500)
    M[6] = vect(500, 25, 500)
    _extendedGlobalCollection[125] = []
    dooreffectsequencer = []
    _extendedGlobalCollection[120] = Color.BLUE
    Difficulty = 2
    spawntype = 3
    experiencesystem = false
    for forindex in range(4):
        Died[forindex] = vect(500, [], 500)
    costmultiplier = 1
    _extendedGlobalCollection[128] = -1


rule "power-up effects and HUDs":
    @Condition start == 1
    
    createEffect(getPlayers(Team.1), Effect.ORB, Color.WHITE, M[0], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.YELLOW, M[1], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.GREEN, M[2], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.VIOLET, M[3], 0.1, EffectReeval.NONE)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.RED, M[4], 1, EffectReeval.POSITION_AND_RADIUS)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.ORANGE, M[5], 1, EffectReeval.POSITION_AND_RADIUS)
    hudText(getPlayers(Team.1).filter(lambda player: player.S[1] == 1), "{0}".format(heroIcon(Hero.RAMATTRA)), null, "Double points!", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudText(getPlayers(Team.1).filter(lambda player: player.S[2] == 1), "{0}".format(heroIcon(Hero.RAMATTRA)), null, "Time Freeze", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudText(getPlayers(Team.1).filter(lambda player: player.S[4] == 1), "{0}".format(heroIcon(Hero.RAMATTRA)), null, "Insta-Kill!", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudText(getPlayers(Team.1).filter(lambda player: player.S[0] == 1), "{0}".format(heroIcon(Hero.RAMATTRA)), null, "Ultimate Mayhem!", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudText(getPlayers(Team.1).filter(lambda player: player.S[5] == 1), "{0}".format(heroIcon(Hero.RAMATTRA)), null, "Max Ammo!", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudText(getPlayers(Team.1).filter(lambda player: player.S[3] == 1), "{0}".format(heroIcon(Hero.RAMATTRA)), null, "Data Reset.", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    createEffect(getPlayers(Team.1), Effect.ORB, Color.PURPLE, M[6], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    hudText(getPlayers(Team.1).filter(lambda player: player.S[6] == 1), "{0}".format(heroIcon(Hero.RAMATTRA)), null, "Fire Sale!", HudPosition.TOP, 1, Color.WHITE, Color.WHITE, Color.PURPLE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)


rule "2 round change":
    @Condition numberOfZombies <= 0
    @Condition start == 1
    @Condition getPlayers(Team.1).any(lambda player: player.outofpsawn == 1) == true
    
    wait(0.16)
    for forindex in range(len(omnicspawn)):
        destroyDummy(Team.2, omnicspawn[forindex])
    roundnumber++
    _extendedGlobalCollection[28] = 1
    bigMessage(getAllPlayers(), l"Round {0}".format(_extendedGlobalCollection[62][romanNcounter]))
    _extendedGlobalCollection[23] = false
    roundRespawns = getDeadPlayers(Team.1).filter(lambda player: not player.isDummy())
    _extendedGlobalCollection[14] = random.choice(getLivingPlayers(Team.1).filter(lambda player: not player.isDummy()))
    roundRespawns.perk[5] = 0
    roundRespawns._extendedPlayerCollection[15] = []
    roundRespawns.resurrect()
    roundRespawns.clearStatusEffect(Status.BURNING)
    if _extendedGlobalCollection[14] != null:
        roundRespawns.teleport(_extendedGlobalCollection[14].getPosition())
        roundRespawns.doorSkipCheck = true
    roundRespawns.startForcingHero(Hero.ASHE)
    getDeadPlayers(Team.1).filter(lambda player: player.isDummy()).resurrect()
    for forindex in range(4):
        Died[forindex] = vect(500, [], 500)
    getPlayers(Team.1)._extendedPlayerCollection[51] = false
    getPlayers(Team.1)._extendedPlayerCollection[34] = false
    getPlayers(Team.1)._extendedPlayerCollection[50] = false
    getPlayers(Team.1)._extendedPlayerCollection[49] = false
    getLivingPlayers(Team.1).setStatusEffect(null, Status.PHASED_OUT, 2)
    getPlayers(Team.1).monkeyBombsLeft = 3
    _extendedGlobalCollection[37]++
    if roundnumber < 12:
        romanNcounter++
    _extendedGlobalCollection[38] = random.randint(1, 5)
    costmultiplier *= random.uniform(1, 1)
    _extendedGlobalCollection[115] = random.uniform(1.01, 1.03)


rule "3 Set Round Kills":
    @Condition _extendedGlobalCollection[28] == 1
    
    numberOfZombies = min(6 + roundnumber * 3, difficultyStats[3])
    wait(1)
    _extendedGlobalCollection[28] = false


rule "5 Time manager":
    @Condition isAssemblingHeroes() == true
    
    setMatchTime(5)


rule "5 Time manager: the objective never unlocks":
    @Condition isGameInProgress() == true
    @Condition start == false
    
    setMatchTime(3599)
    pauseMatchTime()


rule "6 Defeat (needs to be refined for soft restart)":
    @Condition (getPlayers(Team.1).filter(lambda player: not player.isDummy()).all(lambda x: x.isDead())) == true
    @Condition (getPlayers(Team.1).filter(lambda player: not player.isDummy()).all(lambda x: x.hasSpawned())) == true
    
    wait(2, Wait.ABORT_WHEN_FALSE)
    _extendedGlobalCollection[29] = random.randint(0, 5)
    destroyAllDummies()
    getPlayers(Team.1).startCamera(vect(317.328, -25.644, -140.906), vect(320.513, -24.05, -134.612))
    destroyAllHudTexts()
    destroyAllProgressBarHuds()
    destroyAllEffects()
    destroyAllInWorldTexts()
    destroyAllIcons()
    globalActiveBreaches = []
    globalActiveBreachHealth = []
    _extendedGlobalCollection[96] = []
    averagePosition = null
    wait(4)
    for forindex in range(4):
        getPlayersInSlot(forindex, Team.1).allowedheroes = [Hero.ASHE, Hero.DVA].concat(getPlayersInSlot(forindex, Team.1).allowedheroes.exclude([Hero.ASHE, Hero.DVA]))
        getPlayersInSlot(forindex, Team.1).setAllowedHeroes(getPlayersInSlot(forindex, Team.1).allowedheroes)
    goToAssembleHeroes()
    getPlayers(Team.1).resurrect()
    wait(2)
    bankPoints += getPlayers(Team.1).points * 0.75
    getPlayers(Team.1).outofpsawn = false
    _extendedGlobalCollection[45] = false
    roundnumber = 0
    start = false
    romanNcounter = 0
    poweron = 0
    getPlayers(Team.1).points = 0
    g = false
    getPlayers(Team.1).creditcardlimit = 0
    getPlayers(Team.1).creditTier = 0
    costmultiplier = 1
    _extendedGlobalCollection[56] = []
    for forindex in range(len(allDoors_Corner)):
        allDoors_State[forindex] = 1
        allDoors_BeamA[forindex] = null
        allDoors_BeamB[forindex] = null
    numberOfZombies = 0
    _extendedGlobalCollection[28] = 0
    omnicspawn = []
    for forindex in range(7):
        M[forindex] = vect(500, 25, 500)
    _extendedGlobalCollection[130] = []
    _extendedGlobalCollection[131] = []
    fireSaleBoxes = []
    fireSale = false
    _extendedGlobalCollection[42] = false
    slowmoCutscene = 0
    for forindex in range(4):
        Died[forindex] = vect(500, [], 500)
    teleporterwait = false
    _extendedGlobalCollection[46] = 0
    _extendedGlobalCollection[120] = Color.BLUE
    _extendedGlobalCollection[33] = false
    _extendedGlobalCollection[34] = 0
    _extendedGlobalCollection[37] = 0
    _extendedGlobalCollection[36] = 0
    _extendedGlobalCollection[47] = 0
    zoneEffects = []
    zoneTexts = []
    _extendedGlobalCollection[129] = []
    _extendedGlobalCollection[128] = -1
    powerconnected = null
    _extendedGlobalCollection[41]++


rule "soft restart: a hero for players who did not pick one":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition _extendedGlobalCollection[41] > 0
    @Condition isAssemblingHeroes() == false
    @Condition eventPlayer.hasSpawned() == false
    
    wait(0.016, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingHero(random.choice([Hero.ASHE, Hero.DVA].concat(eventPlayer.allowedheroes)))


rule "soft restart: reset each player":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer._extendedPlayerCollection[24] != _extendedGlobalCollection[41]
    
    eventPlayer._extendedPlayerCollection[24] = _extendedGlobalCollection[41]
    eventPlayer.perk = []
    eventPlayer.papAppliedTier = -1
    eventPlayer.Packapunch = 0
    eventPlayer.damagevariable = 100
    eventPlayer.healvariable = 100
    eventPlayer.healthmax = 50
    eventPlayer.setDamageDealt(100)
    eventPlayer.setHealingDealt(100)
    eventPlayer.setMaxHealth(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.doublemag = false
    eventPlayer._extendedPlayerCollection[52] = false
    eventPlayer._extendedPlayerCollection[48] = false
    eventPlayer.magazines = [5, 5]
    eventPlayer.currentmagazines = 5
    eventPlayer.currentswap = 0
    eventPlayer.ultcharge = [0, 0]
    eventPlayer._extendedPlayerCollection[15] = []
    eventPlayer._extendedPlayerCollection[40] = []
    eventPlayer.abilitycooldown = []
    eventPlayer.heroswap = [Hero.ASHE, Hero.DVA]
    eventPlayer.heroiconswap = [heroIcon(Hero.ASHE), heroIcon(Hero.DVA)]
    eventPlayer._extendedPlayerCollection[45] = null
    eventPlayer.firstFollowerShown = false
    eventPlayer.monkeyBombOwned = false
    eventPlayer.monkeyBombsLeft = 0
    eventPlayer.monkeyBombActive = false
    eventPlayer.monkeyBomb = null
    eventPlayer.p_T = 0
    eventPlayer.S = []
    eventPlayer.G = []
    eventPlayer.singlelives = 0
    eventPlayer.perkinfo = 0
    eventPlayer.active_wall = []
    eventPlayer.lastsavedpos = null
    eventPlayer.lastOutsideSpawn = null
    eventPlayer.playerRingCreated = false


rule "7 Disable Bot Respawn":
    @Event playerJoined
    @Team 2
    
    eventPlayer.disableRespawn()


rule "8 respawn bots":
    @Condition numberOfZombies >= 1
    @Condition getNumberOfLivingPlayers(Team.2) < numberOfZombies
    @Condition Bosssequencer == 0
    @Condition getDeadPlayers(Team.2).any(lambda player: player != _extendedGlobalCollection[8]) == true
    
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    random.choice(getDeadPlayers(Team.2).exclude(_extendedGlobalCollection[8])).respawn()
    if ruleCondition:
        loop()


rule "36 Pickup perk drops(should be able to write this as one rule)":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[1]) <= 1.5
    @Condition getPlayers(Team.1).G[1] == false
    @Condition roundnumber >= 1
    @Condition M.any(lambda x: distance(x, eventPlayer) < 4) == true
    
    M[1] = vect(500, 25, 500)
    getPlayers(Team.1).G[1] = true
    getPlayers(Team.1).S[1] = 1
    bigMessage(getAllPlayers(), "Double points!")
    getPlayers(Team.1).H = 2
    wait(60)
    getPlayers(Team.1).H = 1
    getPlayers(Team.1).G[1] = false
    getPlayers(Team.1).S[1] = false


rule "37 Pickup slowmotion":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[2]) <= 1.5
    @Condition getPlayers(Team.1).G[2] == false
    @Condition roundnumber >= 1
    
    M[2] = vect(500, 25, 500)
    getPlayers(Team.1).G[2] = true
    getPlayers(Team.1).S[2] = 1
    bigMessage(getAllPlayers(), "{0} {1} -> {2}".format(l"Slower", l"Time", l"{0} sec".format(10)))
    _extendedGlobalCollection[42] = true
    wait(5)
    _extendedGlobalCollection[42] = false
    getPlayers(Team.1).G[2] = false
    getPlayers(Team.1).S[2] = false


rule "38 Pickup insta kill":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[4]) <= 1.5
    @Condition getPlayers(Team.1).G[4] == false
    @Condition roundnumber >= 1
    
    M[4] = vect(500, 25, 500)
    getPlayers(Team.1).G[4] = true
    getPlayers(Team.1).S[4] = 1
    bigMessage(getAllPlayers(), "Insta-Kill!")
    getPlayers(Team.1).setDamageDealt(999999)
    getPlayers(Team.2).setDamageReceived(1000)
    wait(30)
    for forindex in range(8):
        getPlayersInSlot(forindex, Team.1).setDamageDealt(max(100, getPlayersInSlot(forindex, Team.1).damagevariable))
    getPlayers(Team.2).setDamageReceived(100)
    getPlayers(Team.1).G[4] = false
    getPlayers(Team.1).S[4] = false


rule "39 Pickup InstaUlt":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[0]) <= 1.5
    @Condition getPlayers(Team.1).G[0] == false
    @Condition roundnumber >= 1
    
    M[0] = vect(500, 25, 500)
    getPlayers(Team.1).G[0] = true
    getPlayers(Team.1).S[0] = 1
    bigMessage(getAllPlayers(), "Unlimited Ultimate Ability -> 15 sec")
    wait(15)
    getPlayers(Team.1).G[0] = false
    getPlayers(Team.1).S[0] = false


rule "Pickup fire sale":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[6]) <= 1.5
    @Condition getPlayers(Team.1).G[6] == false
    @Condition roundnumber >= 1
    
    M[6] = vect(500, 25, 500)
    getPlayers(Team.1).G[6] = true
    getPlayers(Team.1).S[6] = 1
    bigMessage(getAllPlayers(), "Fire Sale!")
    fireSale = true
    wait(30)
    fireSale = false
    getPlayers(Team.1).G[6] = false
    getPlayers(Team.1).S[6] = false


rule "40 InstaUlt Active":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.G[0] == true
    
    eventPlayer.setUltCharge(100)
    wait(2, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "no going back into spawn: remember the last spot outside":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.outofpsawn == 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInSpawnRoom() == false
    
    eventPlayer.lastOutsideSpawn = eventPlayer.getPosition()
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "no going back into spawn":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.outofpsawn == 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInSpawnRoom() == true
    @Condition eventPlayer.lastOutsideSpawn != null
    
    eventPlayer.teleport(eventPlayer.lastOutsideSpawn)
    eventPlayer.doorSkipCheck = true
    smallMessage(eventPlayer, "{0} No going back!".format(heroIcon(Hero.RAMATTRA)))
    wait(0.5)
    if ruleCondition:
        loop()


rule "48 WORKSHOP SETTINGS":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    
    wait(3)
    eventPlayer.setGravity(createWorkshopSettingFloat("Cheats", "Gravity", 100, 25, 200, 5))
    getPlayers(Team.1).setProjectileGravity(createWorkshopSettingInt("Cheats", "Projectile gravity team 1", 100, 25, 500, 6))
    getPlayers(Team.1).setProjectileSpeed(createWorkshopSettingInt("Cheats", "Projectile speed team 1", 100, 25, 500, 7))
    getPlayers(Team.2).setProjectileGravity(createWorkshopSettingInt("Cheats", "Projectile gravity team 2", 75, 25, 500, 8))
    getPlayers(Team.2).setProjectileSpeed(createWorkshopSettingInt("Cheats", "Projectile speed team 2", 50, 25, 500, 9))


rule "83 power challenge effects":
    @Condition poweron == 1
    @Condition roundnumber < 15
    
    getPlayersOnHero(Hero.BRIGITTE, Team.2)._extendedPlayerCollection[20] = true


rule "88 disable vanilla features":
    @Event playerJoined
    
    disableMusic()
    getAllPlayers().disableKillFeed()
    disableAnnouncer()
    getLivingPlayers(Team.2).disableNameplatesFor(getPlayers(Team.1))
    disableScoring()
    disableGamemodeCompletion()
    getAllPlayers().disableGamemodeInWorldUi()
    getAllPlayers().disableGamemodeHud()
    getAllPlayers().disableRespawn()
    eventPlayer._extendedPlayerCollection[33] = false
    eventPlayer.H = 1
    wait(10)
    eventPlayer.allowedheroes = [eventPlayer.heroswap[0], eventPlayer.heroswap[1]]


rule "start screen: the hero does nothing":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition start == false
    
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.disallowButton(Button.ULTIMATE)
    eventPlayer.disallowButton(Button.INTERACT)
    eventPlayer.disallowButton(Button.JUMP)
    eventPlayer.disallowButton(Button.CROUCH)
    eventPlayer.disallowButton(Button.MELEE)
    eventPlayer.disallowButton(Button.RELOAD)
    waitUntil(start != false, 99999)
    eventPlayer.clearStatusEffect(Status.ROOTED)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.allowButton(Button.ULTIMATE)
    eventPlayer.allowButton(Button.INTERACT)
    eventPlayer.allowButton(Button.JUMP)
    eventPlayer.allowButton(Button.RELOAD)


rule "start screen: rooted":
    @Event eachPlayer
    @Team 1
    @Condition start == false
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasStatus(Status.ROOTED) == false
    
    eventPlayer.setStatusEffect(null, Status.ROOTED, 9999)


rule "498 Rule 480 start screen":
    @Event eachPlayer
    @Team 1
    @Condition start == false
    @Condition settingsViewers == null
    
    waitUntil(eventPlayer.hasSpawned(), 99999)
    eventPlayer.startCamera(vect(255.366, 9.471, -169.75), vect(261.155, 6.939, -180.808))
    eventPlayer.disableHeroHud()
    wait(15, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(159.409, 82.32, 212.576), vect(267.128, 50, 130.027))
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(343.545, 75.093, 219.552), vect(267.128, 50, 130.027), 0.2)
    wait(15, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(353.189, 30.177, -98.238), vect(284.894, -20, -243.771))
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(272.905, 4.398, -171.199), vect(284.894, -20, -243.771), 0.2)
    wait(15, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(-135.745, 21.786, -75.565), vect(50.301, 14.262, 24.728))
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startCamera(vect(-140.759, 19.998, 77.008), vect(50.301, 14.262, 24.728), 0.2)
    wait(15, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "497 start control":
    @Event eachPlayer
    @Team 1
    @Condition start == false
    @Condition textListsLoaded == true
    @Condition settingsViewers == null
    @Condition (eventPlayer.isHoldingButton(Button.JUMP) or eventPlayer.arcadeCodeStep >= 6) == true
    
    _extendedGlobalCollection[29] = random.randint(0, 5)
    wait(0.25)
    if Difficulty >= 4:
        buyheros = random.shuffle(_extendedGlobalCollection[55])
        buyperks = random.shuffle(buyperksHome.slice(0, 5)).concat(buyperksHome.slice(5, len(buyperksHome)))
    else:
        buyheros = _extendedGlobalCollection[55]
        buyperks = buyperksHome
    if createWorkshopSettingBool("Cheats", "Power on from the start", false, 2) == true:
        poweron = 1
    _extendedGlobalCollection[52] = eventPlayer.arcadeCodeStep >= 6
    if _extendedGlobalCollection[52]:
        Difficulty = 1
        difficultyStats = _extendedGlobalCollection[30].slice(0, 6)
    getPlayers(Team.1).arcadeCodeStep = 0
    roundnumber = createWorkshopSettingInt("Cheats", "Starting wave", 1, 1, 100, 1) - 1
    start = 1
    _extendedGlobalCollection[126] = random.randint(1, 100)
    startlines = random.randint(0, 29)
    eventPlayer.heroswap[0] = eventPlayer.getHero()
    wait(1)
    enableMusic()
    rngbox = random.choice(mysterylocations)
    getAllPlayers().startCamera(vect(283.872, 1.875, 118.717), vect(282.782, 1.329, 109.203))
    createInWorldText(getAllPlayers(), "Good Luck...", vect(282.782, 1.329, 109.203), 5, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    wait(4)
    getAllPlayers().stopCamera()
    wait(0.1)
    getAllPlayers().enableHeroHud()
    _extendedGlobalCollection[9] = createWorkshopSettingInt("Cheats", "Starting points", 500, 500, 1000000)
    getAllPlayers().points = _extendedGlobalCollection[9]
    getAllPlayers().points2 = getAllPlayers().points
    getAllPlayers().cashback = 1


rule "521 start screen message":
    @Event eachPlayer
    @Condition start == false
    @Condition textListsLoaded == true
    
    smallMessage(eventPlayer, "Press {0} to go back".format(inputBindingString(Button.MELEE)) if settingsViewers != null else "Press jump to start, {0} for settings".format(inputBindingString(Button.MELEE)))
    wait(8)
    if ruleCondition:
        loop()


rule "565 door message":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer._extendedPlayerCollection[41] == 1
    
    wait(5)
    eventPlayer._extendedPlayerCollection[41] = false


rule "143 DIFFICULTY damage taken, healing and XP system":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    @Condition start == 1
    
    eventPlayer.setDamageReceived(0 if createWorkshopSettingBool("Cheats", "God mode", false, 3) else difficultyStats[0])
    eventPlayer.healvariable = difficultyStats[1]
    eventPlayer.setHealingDealt(eventPlayer.healvariable)
    eventPlayer.magazines = [3 if Difficulty == 5 else 5, 3 if Difficulty == 5 else 5]
    eventPlayer.currentmagazines = 3 if Difficulty == 5 else 5
    eventPlayer._extendedPlayerCollection[37] = -1


rule "159 workshop setting explosive rounds(could add a cheats menu somewhere)":
    @Event playerDealtDamage
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition createWorkshopSettingBool("Cheats", "Explosive rounds", false, 4) == true
    
    damage(getPlayersInRadius(victim, 3, Team.2), null, 300)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.RED, victim, 3)
    wait(0.45)


rule "191 Trap logic":
    @Condition _extendedGlobalCollection[33] == true
    
    createDummy(Hero.BASTION, Team.1, 12, vect(-86.342, -150.729, 39.793), Vector.LEFT - Vector.LEFT)
    omnicspawn[18] = getPlayersInSlot(12, Team.1).getSlot()
    createDummy(Hero.BASTION, Team.1, 13, vect(-82.277, -150.687, 80.335), Vector.LEFT - Vector.LEFT)
    omnicspawn[19] = getPlayersInSlot(13, Team.1).getSlot()
    getPlayersInSlot(12, Team.1).startForcingButton(Button.PRIMARY_FIRE)
    wait(0.25)
    getPlayersInSlot(12, Team.1).p_T = 1
    getPlayersInSlot(13, Team.1).p_T = 1
    getPlayersInSlot(12, Team.1).forceButtonPress(Button.ABILITY_1)
    getPlayersInSlot(13, Team.1).forceButtonPress(Button.ABILITY_1)
    getPlayersInSlot(13, Team.1).startForcingButton(Button.PRIMARY_FIRE)
    wait(20)
    destroyDummy(Team.1, omnicspawn[18])
    destroyDummy(Team.1, omnicspawn[19])


rule "299 out of bounce boundry":
    @Event eachPlayer
    @Team 1
    @Condition getPlayersInRadius(vect(-109.55, -151.893, -6.832), 2.5, Team.1) == true
    @Condition start == 1
    
    eventPlayer.teleport(vect(-104.638, -150.413, -15.437))


rule "403 Challenge waves":
    @Event eachPlayer
    @Team 2
    @Condition _extendedGlobalCollection[36] == 1
    @Condition eventPlayer.isAlive() == true
    
    eventPlayer.setUltCharge(100)
    if numberOfZombies < 4:
        _extendedGlobalCollection[36] = false


rule "404 set challenge wave every few rounds":
    @Condition _extendedGlobalCollection[37] >= 4
    
    _extendedGlobalCollection[36] = random.randint(0, 1)
    if _extendedGlobalCollection[36] == 1:
        _extendedGlobalCollection[37] = false


rule "235 the match timer in a game":
    @Condition isGameInProgress() == true
    @Condition start == 1
    
    setMatchTime(3599)
    unpauseMatchTime()
    wait(5, Wait.ABORT_WHEN_FALSE)
    smallMessage(getPlayers(Team.1).filter(lambda player: player.outofpsawn == 0), "Leave the spawn room to start!")
    while true:
        wait(3000, Wait.ABORT_WHEN_FALSE)
        setMatchTime(3599)


rule "teleporter timer":
    @Condition teleporterwait == true
    
    wait(60)
    teleporterwait = false


rule "104 fix reload disabled":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.getHero() != Hero.ASHE
    
    eventPlayer.allowButton(Button.RELOAD)


rule "113  ashe reload fix":
    @Event eachPlayer
    @Team 1
    @Hero ashe
    @Condition eventPlayer.isReloading() == true
    
    wait(0.45)
    eventPlayer.setAmmo(0, 12)


rule "Easy: magazines never run out":
    @Event eachPlayer
    @Team 1
    @Condition Difficulty == 1
    @Condition eventPlayer.currentmagazines < (6 if Difficulty == 5 else 10)
    
    eventPlayer.currentmagazines = 6 if Difficulty == 5 else 10


rule "115  ammo message force melee when out of ammo":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.currentmagazines == false
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    
    wait(0.1)
    smallMessage(eventPlayer, "{0} {1}".format(heroIcon(eventPlayer.getHero()), _extendedGlobalCollection[63][hero.index(eventPlayer.getHero())]))
    bigMessage(eventPlayer, "USE MELEE")
    wait(5)
    smallMessage(eventPlayer, "MELEE BONUS DAMAGE")
    wait(5)
    smallMessage(eventPlayer, "buy any hero for more ammo")


rule "161 life weiver no ammo":
    @Event eachPlayer
    @Team 1
    @Hero lifeweaver
    @Condition eventPlayer.currentmagazines == false
    
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)


rule "160 life weaver ammo":
    @Event eachPlayer
    @Team 1
    @Hero lifeweaver
    @Condition eventPlayer.isReloading() == false
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    
    eventPlayer.currentmagazines -= 0.025
    wait(0.1)
    if ruleCondition:
        loop()


rule "171 no ammo force melee":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.currentmagazines <= 0
    @Condition (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)) == true
    
    eventPlayer.forceButtonPress(Button.MELEE)


rule "160 orisa ammo":
    @Event eachPlayer
    @Team 1
    @Hero orisa
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    
    eventPlayer.currentmagazines -= 0.05
    wait(0.2)
    if ruleCondition:
        loop()


rule "105 specific hero ammo and double mag":
    @Event eachPlayer
    @Team 1
    @Condition (eventPlayer.isHoldingButton(Button.ABILITY_1) or eventPlayer.isHoldingButton(Button.ABILITY_2) or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) or eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)) == true
    
    if eventPlayer.isHoldingButton(Button.SECONDARY_FIRE):
        goto loc+[3, 0][[Hero.MOIRA].index(eventPlayer.getHero()) + 1]
        eventPlayer.currentmagazines -= 0.05 * [1, 0.5, 0.35, 0.25][eventPlayer.perk[4]]
        wait(0.25)
        __loopIfConditionIsTrue__()
    if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
        goto loc+[19, 0, 6, 12, 14][[Hero.DOOMFIST, Hero.DVA, Hero.HANZO, Hero.SIGMA].index(eventPlayer.getHero()) + 1]
        if eventPlayer.perk[4] == false:
            eventPlayer.currentmagazines -= 0.25
            wait(0.25)
            __loopIfConditionIsTrue__()
        goto lbl_0
        if not eventPlayer.isInAlternateForm():
            eventPlayer.currentmagazines -= 0.05 * [1, 0.5, 0.35, 0.25][eventPlayer.perk[4]]
            wait(0.15)
            __loopIfConditionIsTrue__()
        goto lbl_1
        eventPlayer.currentmagazines -= 0.25 * [1, 0.5, 0.35, 0.25][eventPlayer.perk[4]]
        goto lbl_2
        eventPlayer.currentmagazines -= 0.05 * [1, 0.5, 0.35, 0.25][eventPlayer.perk[4]]
        wait(0.1)
        eventPlayer.currentmagazines -= 0.05 * [1, 0.5, 0.35, 0.25][eventPlayer.perk[4]]
        wait(1.5)
        __loopIfConditionIsTrue__()
        lbl_0:
        lbl_1:
        lbl_2:
    else:
        goto loc+[12, 0, 4, 9][[Hero.REAPER, Hero.CASSIDY, Hero.REINHARDT].index(eventPlayer.getHero()) + 1]
        if eventPlayer.isUsingAbility1():
            eventPlayer.currentmagazines -= 0.5
        goto lbl_3
        if eventPlayer.isUsingAbility1():
            __skipIf__(eventPlayer.getAmmo() == 6, 1)
            eventPlayer.currentmagazines -= 0.5
        goto lbl_4
        if eventPlayer.isUsingAbility2():
            eventPlayer.currentmagazines -= 0.25 * [1, 0.5, 0.35, 0.25][eventPlayer.perk[4]]
        lbl_3:
        lbl_4:


rule "136  dva ammo double mag":
    @Event eachPlayer
    @Team 1
    @Hero dva
    @Condition eventPlayer.doublemag == 1
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    
    if not eventPlayer.isInAlternateForm():
        eventPlayer.currentmagazines -= 0.025
        wait(0.15)
        if ruleCondition:
            loop()


rule "132  rien out of ammo":
    @Event eachPlayer
    @Team 1
    @Hero reinhardt
    @Condition eventPlayer.currentmagazines <= 0
    @Condition eventPlayer.isUsingAbility2() == true
    
    eventPlayer.disallowButton(Button.ABILITY_2)


rule "112  hanzo ammo":
    @Event eachPlayer
    @Team 1
    @Hero hanzo
    @Condition eventPlayer.isFiringPrimaryFire() == true
    @Condition eventPlayer.doublemag == false
    
    eventPlayer.currentmagazines -= 0.25


rule "84 reloading all heros without doublemag":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isReloading() == true
    @Condition eventPlayer.doublemag == false
    
    eventPlayer.currentmagazines--


rule "89 out of ammo":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.MOIRA
    @Condition eventPlayer.getHero() != Hero.MERCY
    @Condition eventPlayer.getHero() != Hero.REINHARDT
    @Condition eventPlayer.getHero() != Hero.BRIGITTE
    @Condition eventPlayer.getHero() != Hero.TORBJORN
    @Condition eventPlayer.getHero() != Hero.MEI
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.currentmagazines <= 0
    
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)


rule "90 initialize ammo amount":
    @Event eachPlayer
    
    eventPlayer.magazines[0] = 5
    eventPlayer.magazines[1] = 5
    eventPlayer.currentmagazines = eventPlayer.magazines[0]
    eventPlayer.currentswap = false
    eventPlayer.disallowButton(Button.CROUCH)
    eventPlayer.ultcharge[0] = false
    eventPlayer.ultcharge[1] = false
    wait()
    eventPlayer._extendedPlayerCollection[44] = eventPlayer.ultcharge[0]
    wait()
    eventPlayer.setUltCharge(eventPlayer.ultcharge[0])


rule "91 enable guns when they have ammo":
    @Event eachPlayer
    @Condition eventPlayer.currentmagazines > 0
    @Condition start == 1
    @Condition eventPlayer.getHero() != Hero.MEI
    
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.setSecondaryFireEnabled(experiencesystem == false or eventPlayer.XPlevel[eventPlayer.currentheroxp] >= 5)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)


rule "94 out of ammo moira":
    @Event eachPlayer
    @Hero moira
    @Condition eventPlayer.currentmagazines <= 0
    
    eventPlayer.setSecondaryFireEnabled(false)


rule "96 mercy disable gun if no ammo":
    @Event eachPlayer
    @Team 1
    @Hero mercy
    @Condition eventPlayer.getCurrentWeapon() == 2
    @Condition eventPlayer.magazines <= 0
    
    eventPlayer.setWeapon(1)


rule "97 torb disable gun if no ammo":
    @Event eachPlayer
    @Team 1
    @Hero torbjorn
    @Condition eventPlayer.getCurrentWeapon() == 1
    @Condition eventPlayer.magazines <= 0
    
    eventPlayer.setWeapon(2)


rule "98  reloading with doublemag":
    @Event eachPlayer
    @Condition eventPlayer.isReloading() == true
    @Condition eventPlayer.doublemag == 1
    
    eventPlayer.currentmagazines -= 0.5


rule "103  remove less than zero issue on ammo":
    @Event eachPlayer
    @Condition eventPlayer.currentmagazines < 0
    
    eventPlayer.currentmagazines = false


rule "351 followers ult":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.followerTarget != null
    @Condition distance(eventPlayer, eventPlayer.followerTarget) < 8
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.isMonkeyBomb != true
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.getHero() != Hero.REINHARDT
    @Condition eventPlayer.getHero() != Hero.BASTION
    
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(0.25)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(6)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)


def Subfollowerbuy():
    @Name "follower subroutine"
    
    destroyDummy(Team.1, eventPlayer.getSlot() + 4)
    wait(0.25)
    createDummy(eventPlayer._extendedPlayerCollection[45], Team.1, eventPlayer.getSlot() + 4, Vector.LEFT - Vector.LEFT, Vector.LEFT - Vector.LEFT)
    wait(0.03)
    (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
    wait(0.1)
    (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).startScalingSize(0.2)
    (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).startModifyingVoicelinePitch(1.3)
    (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).isMonkeyBomb = false


rule "172 FOLLOWERS  winston Omnic bomb":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isCommunicating(Comms.ULTIMATE_STATUS) == true
    @Condition eventPlayer.monkeyBombOwned == true
    @Condition eventPlayer.monkeyBombsLeft > 0
    @Condition eventPlayer.monkeyBombActive != true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    
    eventPlayer.monkeyBombsLeft--
    eventPlayer.monkeyBombActive = true
    eventPlayer.monkeyBombSlot = eventPlayer.getSlot() + 4
    eventPlayer._extendedPlayerCollection[21] = entityExists(getPlayersInSlot(eventPlayer.monkeyBombSlot, Team.1))
    destroyDummy(Team.1, eventPlayer.monkeyBombSlot)
    wait(0.1)
    createDummy(Hero.WINSTON, Team.1, eventPlayer.monkeyBombSlot, eventPlayer.getEyePosition(), Vector.LEFT - Vector.LEFT)
    wait(0.03)
    eventPlayer.monkeyBomb = getPlayersInSlot(eventPlayer.monkeyBombSlot, Team.1)
    eventPlayer.monkeyBomb.isMonkeyBomb = true
    eventPlayer.p_T = 1
    eventPlayer.monkeyBomb.attachTo(eventPlayer, vect([], [], 2))
    eventPlayer.monkeyBomb.startScalingSize(0.2)
    eventPlayer.monkeyBomb.startModifyingVoicelinePitch(1.3)
    wait(1)
    eventPlayer.monkeyBomb.detach()
    wait(0.2)
    eventPlayer.monkeyBomb.forceButtonPress(Button.JUMP)
    eventPlayer.monkeyBomb.applyImpulse(vectorTowards(eventPlayer, eventPlayer.monkeyBomb), 25, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer.monkeyBomb, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer._extendedPlayerCollection[23] = getLastCreatedEntity()
    wait(2)
    eventPlayer.monkeyBomb.communicate(Comms.COUNTDOWN)
    wait(4)
    if entityExists(eventPlayer.monkeyBomb):
        playEffect(getAllPlayers(), DynamicEffect.DOOMFIST_METEOR_STRIKE_IMPACT, Color.WHITE, eventPlayer.monkeyBomb.getPosition(), 1)
        eventPlayer.monkeyBombTargets = getPlayersInRadius(eventPlayer.monkeyBomb.getPosition(), 4, Team.2, LosCheck.SURFACES_AND_ALL_BARRIERS)
        eventPlayer._extendedPlayerCollection[22] = 0
        while eventPlayer._extendedPlayerCollection[22] < len(eventPlayer.monkeyBombTargets):
            damage(eventPlayer.monkeyBombTargets[eventPlayer._extendedPlayerCollection[22]], null, 150 if distance(eventPlayer.monkeyBombTargets[eventPlayer._extendedPlayerCollection[22]], eventPlayer.monkeyBomb.getPosition()) <= 2 else 50)
            wait()
            eventPlayer._extendedPlayerCollection[22]++
        wait(0.5)
        eventPlayer.monkeyBomb.communicate(Comms.GOODBYE)
    destroyEffect(eventPlayer._extendedPlayerCollection[23])
    eventPlayer._extendedPlayerCollection[23] = null
    eventPlayer.p_T = false
    wait(0.5)
    if getPlayersInSlot(eventPlayer.monkeyBombSlot, Team.1) == eventPlayer.monkeyBomb:
        destroyDummy(Team.1, eventPlayer.monkeyBombSlot)
    eventPlayer.monkeyBomb = null
    if eventPlayer._extendedPlayerCollection[21] and eventPlayer.isAlive():
        wait(0.1)
        Subfollowerbuy()
    eventPlayer.monkeyBombActive = false


rule "352 FOLLOWERS attack nearest zombie":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getSlot() >= 4
    @Condition eventPlayer.getSlot() <= 7
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isMonkeyBomb != true
    
    eventPlayer.followerFiring = false
    while true:
        eventPlayer.followerTarget = (sorted(getLivingPlayers(Team.2).filter(lambda player: player.hasSpawned() and distance(eventPlayer, player) < 15 and isInLoS(eventPlayer.getEyePosition(), player.getEyePosition())), lambda x: distance(eventPlayer, x)))[0]
        if eventPlayer.followerTarget != null:
            if not eventPlayer.followerFiring:
                eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), eventPlayer.followerTarget.getEyePosition()), 720)
                eventPlayer.followerFiring = true
            eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
        elif eventPlayer.followerFiring:
            eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
            eventPlayer.stopFacing()
            eventPlayer.followerFiring = false
        wait(0.25, Wait.ABORT_WHEN_FALSE)


def PapRocket():
    @Name "pack a punch rocket"
    
    createHomingProjectile(Projectile.PHARAH_ROCKET, eventPlayer, eventPlayer.getEyePosition() + eventPlayer.getFacingDirection(), eventPlayer.getFacingDirection(), Relativity.TO_WORLD, ModifyHealth.DAMAGE, Team.2, eventPlayer.papShotDamage, 1, 15, DynamicEffect.ASHE_DYNAMITE_EXPLOSION, DynamicEffect.EXPLOSION_SOUND, eventPlayer.papShotDelay, 25, 5, 0, getLivingPlayers(Team.2)[0], 0.5)


def PapStickyBomb():
    @Name "pack a punch sticky bomb"
    
    createHomingProjectile(Projectile.ECHO_STICKY_BOMB, eventPlayer, eventPlayer.getEyePosition() + eventPlayer.getFacingDirection(), eventPlayer.getFacingDirection(), Relativity.TO_WORLD, ModifyHealth.DAMAGE, Team.2, eventPlayer.papShotDamage, 1, 15, DynamicEffect.ASHE_DYNAMITE_EXPLOSION, DynamicEffect.EXPLOSION_SOUND, eventPlayer.papShotDelay, 25, 5, 0, getLivingPlayers(Team.2)[0], 0.5)


rule "Pack a punch Ongoing - player":
    @Event eachPlayer
    @Condition eventPlayer.Packapunch >= 1
    @Condition (eventPlayer.isUsingAbility1() or eventPlayer.isUsingAbility2() or eventPlayer.isUsingUltimate() or eventPlayer.isFiringPrimaryFire() or eventPlayer.isFiringSecondaryFire()) == true
    
    if eventPlayer.getHero() == Hero.BAPTISTE:
        if eventPlayer.isUsingAbility1():
            eventPlayer.removeAllHealthPools()
            wait()
            eventPlayer.addHealthPool(Health.NORMAL, 100, false, false)
    elif eventPlayer.isFiringPrimaryFire():
        if eventPlayer.getHero() == Hero.BASTION:
            if eventPlayer.isInAlternateForm():
                wait(0.5, Wait.ABORT_WHEN_FALSE)
                eventPlayer.papShotDamage = 500
                eventPlayer.papShotDelay = 0.2
                PapRocket()
                wait(1.5, Wait.ABORT_WHEN_FALSE)
                if ruleCondition:
                    loop()
    elif eventPlayer.getHero() == Hero.TORBJORN:
        if _extendedGlobalCollection[32] == false:
            if eventPlayer.isCommunicating(Comms.NEED_HEALING):
                eventPlayer.dispencereffect = []
                wait()
                createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, eventPlayer.getPosition(), 0.8, EffectReeval.VISIBILITY)
                eventPlayer.dispencereffect.append(getLastCreatedEntity())
                wait()
                createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, vect([], 1.3, []) + eventPlayer.getPosition(), 0.8, EffectReeval.VISIBILITY)
                eventPlayer.dispencereffect.append(getLastCreatedEntity())
                wait()
                createEffect(getAllPlayers(), Effect.RING, Color.GREEN, eventPlayer.getPosition(), 3.5, EffectReeval.VISIBILITY)
                eventPlayer.dispencereffect.append(getLastCreatedEntity())
                _extendedGlobalCollection[31] = evalOnce(eventPlayer.getPosition())
                _extendedGlobalCollection[32] = 1
                wait(30)
                _extendedGlobalCollection[32] = 2
                playEffect(eventPlayer, DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 60)
                wait(0.1)
                destroyEffect(eventPlayer.dispencereffect[0])
                destroyEffect(eventPlayer.dispencereffect[1])
                destroyEffect(eventPlayer.dispencereffect[2])
                wait(0.1)
                del eventPlayer.dispencereffect[0][0]
                del eventPlayer.dispencereffect[1][0]
                del eventPlayer.dispencereffect[2][0]
                wait(60)
                _extendedGlobalCollection[32] = false
    elif eventPlayer.isFiringSecondaryFire():
        if eventPlayer.getHero() == Hero.ROADHOG:
            if eventPlayer.getAbilityResource(Button.SECONDARY_FIRE) > 0:
                getPlayersInRadius(eventPlayer, 5, Team.1, LosCheck.SURFACES_AND_ENEMY_BARRIERS).startHealingOverTime(eventPlayer, 2, 20)
                createEffect(getPlayers(Team.1), Effect.RING, Color.ORANGE, eventPlayer, 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
                waitUntil(false, 5)
                destroyEffect(getLastCreatedEntity())
        elif eventPlayer.getHero() == Hero.SOLDIER:
            eventPlayer.papShotDamage = 500
            eventPlayer.papShotDelay = 0.2
            PapRocket()
        elif eventPlayer.getHero() == Hero.ECHO:
            eventPlayer.papShotDamage = 500
            eventPlayer.papShotDelay = 0.2
            PapStickyBomb()
            wait(0.2, Wait.ABORT_WHEN_FALSE)
            if ruleCondition:
                loop()
        elif eventPlayer.getHero() == Hero.JUNO:
            eventPlayer.papShotDamage = 500
            eventPlayer.papShotDelay = 0
            PapStickyBomb()
            wait(0.15, Wait.ABORT_WHEN_FALSE)
            if ruleCondition:
                loop()
    elif eventPlayer.isUsingUltimate():
        if eventPlayer.getHero() == Hero.WINSTON:
            eventPlayer.setStatusEffect(eventPlayer, Status.UNKILLABLE, 10)
        elif eventPlayer.getHero() == Hero.SYMMETRA:
            eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 10)
        elif eventPlayer.getHero() == Hero.REINHARDT:
            getLivingPlayers(Team.1).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 8)
        elif eventPlayer.getHero() == Hero.BRIGITTE:
            eventPlayer.startScalingSize(1.5)
            eventPlayer.addHealthPool(Health.NORMAL, 1000, false, false)
            wait(8)
            eventPlayer.stopScalingSize()
            eventPlayer.removeAllHealthPools()
        elif eventPlayer.getHero() == Hero.ZENYATTA:
            damage(getPlayersInRadius(eventPlayer, 10.5, Team.2, LosCheck.SURFACES_AND_ENEMY_BARRIERS), eventPlayer, 300)
            wait(1, Wait.ABORT_WHEN_FALSE)
            if ruleCondition:
                loop()
        elif eventPlayer.getHero() == Hero.ZARYA:
            if eventPlayer.isUsingAbility1():
                eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
            elif eventPlayer.isUsingAbility2():
                eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
        elif eventPlayer.getHero() == Hero.WIDOWMAKER:
            eventPlayer.p_T = 1
            if (len(getPlayers(Team.1).filter(lambda player: not player.isDummy()))) < 2:
                waitUntil(false, 4)
                eventPlayer.p_T = false
            elif (len(getPlayers(Team.1).filter(lambda player: not player.isDummy()))) >= 2:
                waitUntil(false, 16)
                eventPlayer.p_T = false
        elif eventPlayer.getHero() == Hero.LUCIO:
            getPlayersInRadius(eventPlayer, 3, Team.2, LosCheck.SURFACES_AND_ENEMY_BARRIERS).setStatusEffect(eventPlayer, Status.ROOTED, 3)
        elif eventPlayer.getHero() == Hero.RAMATTRA:
            getLivingPlayers(Team.1).points += 1000
            getLivingPlayers(Team.1).magazines += 5
        elif eventPlayer.getHero() == Hero.GENJI:
            if eventPlayer.isFiringPrimaryFire():
                createProjectile(Projectile.REINHARDT_FIRE_STRIKE, eventPlayer, eventPlayer.getEyePosition(), eventPlayer.getFacingDirection(), Relativity.TO_WORLD, ModifyHealth.DAMAGE, Team.2, 300, 1, 0, DynamicEffect.BAD_EXPLOSION, DynamicEffect.EXPLOSION_SOUND, 0, 10, 5)
        elif eventPlayer.getHero() == Hero.ORISA:
            eventPlayer.startScalingSize(2)
            eventPlayer.setDamageDealt(1000)
            waitUntil(false, 8)
            eventPlayer.startScalingSize(1)
            eventPlayer.setDamageDealt(eventPlayer.damagevariable)
        elif eventPlayer.getHero() == Hero.KIRIKO:
            getPlayersInRadius(eventPlayer, 15, Team.2).setMoveSpeed(50)
            wait(8)
            if roundnumber <= 6:
                getPlayers(Team.2).setMoveSpeed(52 + 8 * roundnumber)
            elif roundnumber > 6:
                getPlayers(Team.2).setMoveSpeed(100)
    elif eventPlayer.isUsingAbility1():
        if eventPlayer.getHero() == Hero.SOJOURN:
            getPlayersInRadius(eventPlayer, 3, Team.2).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 4)
    elif eventPlayer.isUsingAbility2():
        if eventPlayer.getHero() == Hero.TRACER:
            getPlayersInRadius(evalOnce(eventPlayer.getPosition()), 5, Team.2).setStatusEffect(eventPlayer, Status.STUNNED, 4)
        elif eventPlayer.getHero() == Hero.SOMBRA:
            wait(1)
            eventPlayer.p_T = 1
            wait(4)
            eventPlayer.p_T = false
        elif eventPlayer.getHero() == Hero.DVA:
            wait(0.2, Wait.ABORT_WHEN_FALSE)
            eventPlayer.papShotDamage = 400
            eventPlayer.papShotDelay = 0
            PapRocket()
        elif eventPlayer.getHero() == Hero.LIFEWEAVER:
            eventPlayer.getPlayersInViewAngle(Team.1, 5).addHealthPool(Health.NORMAL, 100, false, false)
        elif eventPlayer.getHero() == Hero.PHARAH:
            eventPlayer.papShotDamage = 500
            eventPlayer.papShotDelay = 0.2
            PapRocket()
            wait(0.2, Wait.ABORT_WHEN_FALSE)
            if ruleCondition:
                loop()


rule "Pack a Punch - Damage dealt":
    @Event playerDealtDamage
    @Team 1
    @Condition eventPlayer.getHero() in [Hero.SOLDIER, Hero.CASSIDY, Hero.SIGMA, Hero.JUNKRAT, Hero.MOIRA, Hero.BRIGITTE, Hero.DOOMFIST] == true
    @Condition eventPlayer.Packapunch >= 1
    @Condition (eventPlayer.isUsingAbility1() or eventPlayer.isUsingAbility2() or eventPlayer.isUsingUltimate() or eventPlayer.isFiringPrimaryFire() or eventPlayer.isFiringSecondaryFire()) == true
    
    if attacker.getHero() == Hero.CASSIDY:
        if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
            damage(getPlayersInRadius(victim, 3, Team.2), null, 420)
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, victim, 3)
            wait(0.45)
    elif attacker.getHero() == Hero.SIGMA:
        damage(getPlayersInRadius(victim, 5, Team.2), null, 200)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, victim, 5)
    elif attacker.getHero() == Hero.JUNKRAT:
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, victim, 8)
        damage(getPlayersInRadius(victim, 8, Team.2), null, 300)
    elif eventPlayer.isUsingUltimate():
        if attacker.getHero() == Hero.MOIRA:
            victim.setStatusEffect(eventPlayer, Status.ROOTED, 4)
            wait(0.25)
        elif attacker.getHero() == Hero.MOIRA:
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, victim, 5)
            damage(getPlayersInRadius(victim, 5, Team.2), attacker, 400)
        elif attacker.getHero() == Hero.BRIGITTE:
            if victim.hasStatus(Status.STUNNED):
                victim.setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 4)
        elif eventPlayer.isUsingAbility1():
            if attacker.getHero() == Hero.DOOMFIST:
                victim.setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 4)


rule "Torbjorn pack a punch Dispencer active":
    @Event eachPlayer
    @Team 1
    @Condition getPlayersInRadius(_extendedGlobalCollection[31], 3.5, Team.1, LosCheck.SURFACES_AND_ENEMY_BARRIERS) == true
    @Condition _extendedGlobalCollection[32] == 1
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    heal(eventPlayer, null, 20)
    eventPlayer.currentmagazines += 0.2
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


def PaPsound():
    @Name "PaP Sound subroutine"
    
    playEffect(getAllPlayers(), DynamicEffect.BAPTISTE_BIOTIC_LAUNCHER_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 80)
    wait(0.2)
    if ruleCondition:
        loop()


rule "give pack a punch a sound":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.Packapunch >= 1
    @Condition getServerLoad() < 220
    @Condition (eventPlayer.isFiringPrimaryFire() or eventPlayer.isFiringSecondaryFire()) == true
    
    if eventPlayer.isFiringPrimaryFire():
        if eventPlayer.getHero() in [Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY]:
            PaPsound()
    elif eventPlayer.isFiringSecondaryFire():
        if eventPlayer.getHero() in [Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY]:
            PaPsound()


rule "Pack a Punch - final blow bonuses (Venture, Mauga, Sigma)":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition eventPlayer.getHero() in [Hero.VENTURE, Hero.MAUGA, Hero.SIGMA] == true
    @Condition eventPlayer.Packapunch >= 1
    @Condition (eventPlayer.isUsingAbility1() or eventPlayer.isUsingAbility2() or eventPlayer.isUsingUltimate() or eventPlayer.isFiringPrimaryFire() or eventPlayer.isFiringSecondaryFire() or eventPlayer.isMeleeing()) == true
    
    if attacker.getHero() == Hero.VENTURE:
        if eventPlayer.isMeleeing() == true:
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, victim, 5)
            damage(getPlayersInRadius(victim, 5, Team.2), null, 800)
    elif attacker.getHero() == Hero.MAUGA:
        eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
        eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    elif attacker.getHero() == Hero.SIGMA:
        eventPlayer.points += 50


rule "pack a punch ability":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition (3 if eventPlayer.getHero() in eventPlayer.endingHeroes else eventPlayer.perk[5]) != eventPlayer.papAppliedTier
    
    eventPlayer.papAppliedTier = 3 if eventPlayer.getHero() in eventPlayer.endingHeroes else eventPlayer.perk[5]
    eventPlayer.damagevariable = [100, 250, 500, 1000][eventPlayer.papAppliedTier]
    eventPlayer.setDamageDealt(eventPlayer.damagevariable)
    eventPlayer.Packapunch = eventPlayer.papAppliedTier


rule "pack a punch: followers":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getSlot() >= 4
    @Condition eventPlayer.getSlot() <= 7
    @Condition eventPlayer.isMonkeyBomb != true
    @Condition eventPlayer.damagevariable != [100, 250, 500, 1000][max(0, (getPlayersInSlot(eventPlayer.getSlot() - 4, Team.1)).papAppliedTier)]
    
    eventPlayer.Packapunch = max(0, (getPlayersInSlot(eventPlayer.getSlot() - 4, Team.1)).papAppliedTier)
    eventPlayer.damagevariable = [100, 250, 500, 1000][eventPlayer.Packapunch]
    eventPlayer.setDamageDealt(eventPlayer.damagevariable)


rule "new game: first hero slot":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition start == 1
    
    eventPlayer.heroswap[0] = eventPlayer.getHero()
    eventPlayer.heroiconswap[0] = heroIcon(eventPlayer.getHero())


rule "stop jetpack cat from flying too long":
    @Event eachPlayer
    @Hero jetpackCat
    @Condition eventPlayer.getAltitude() >= 1.5
    @Condition eventPlayer.getAltitude() < 100
    
    wait(3, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startAcceleration(Vector.DOWN, 100, 20, Relativity.TO_WORLD)
    waitUntil(eventPlayer.getAltitude() <= 1.5, 5)
    eventPlayer.disallowButton(Button.JUMP)
    eventPlayer.stopAcceleration()
    wait(3)
    eventPlayer.allowButton(Button.JUMP)


rule "apply fall damage":
    @Event eachPlayer
    @Condition eventPlayer.enablefalldamage == 1
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.fall_Damage_Speed < -15
    
    damage(eventPlayer, null, abs(eventPlayer.fall_Damage_Speed) * eventPlayer.getMaxHealth() / 200 * abs(eventPlayer.fall_Damage_Speed) / 8 * 3)


rule "Find fall speed for fall damage":
    @Event eachPlayer
    @Condition eventPlayer.enablefalldamage == 1
    @Condition eventPlayer.getAltitude() < 1
    @Condition eventPlayer.isInAir() == true
    
    eventPlayer.fall_Damage_Speed = eventPlayer.getVerticalSpeed()


rule "enable/toggle fall damage regular":
    @Event eachPlayer
    @Condition eventPlayer.isInAir() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isUsingUltimate() == false
    
    if heroFallDamageTable[0] + eventPlayer.fallDamageOffsetTable == 1:
        eventPlayer.enablefalldamage = 1
    else:
        eventPlayer.enablefalldamage = false


rule "enable fall damage ability 1":
    @Event eachPlayer
    @Condition eventPlayer.isInAir() == true
    @Condition eventPlayer.isUsingAbility1() == true
    
    if heroFallDamageTable[1] + eventPlayer.fallDamageOffsetTable == 1:
        eventPlayer.enablefalldamage = 1
    else:
        eventPlayer.enablefalldamage = false


rule "enable fall damage ability 2":
    @Event eachPlayer
    @Condition eventPlayer.isInAir() == true
    @Condition eventPlayer.isUsingAbility2() == true
    
    if heroFallDamageTable[2] + eventPlayer.fallDamageOffsetTable == 1:
        eventPlayer.enablefalldamage = 1
    else:
        eventPlayer.enablefalldamage = false


rule "enable fall damage ultimate":
    @Event eachPlayer
    @Condition eventPlayer.isInAir() == true
    @Condition eventPlayer.isUsingUltimate() == true
    
    if heroFallDamageTable[3] + eventPlayer.fallDamageOffsetTable == 1:
        eventPlayer.enablefalldamage = 1
    else:
        eventPlayer.enablefalldamage = false


rule "hero fall damage Table":
    @Event eachPlayer
    @Hero soldier
    
    heroFallDamageTable = []


rule "99  hero ultimate adjustments":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isUsingUltimate() == true
    
    goto loc+[25, 0, 4, 8, 12, 14, 16, 18, 22][[Hero.ASHE, Hero.WIDOWMAKER, Hero.SYMMETRA, Hero.JUNKRAT, Hero.MERCY, Hero.ZENYATTA, Hero.CASSIDY, Hero.LUCIO].index(eventPlayer.getHero()) + 1]
    eventPlayer.setDamageDealt(300)
    wait(10)
    eventPlayer.setDamageDealt(100)
    goto lbl_0
    getPlayers(Team.1).setDamageDealt(300)
    wait(12.5)
    getPlayers(Team.1).setDamageDealt(100)
    goto lbl_1
    getLivingPlayers(Team.1).addHealthPool(Health.NORMAL, 200, false)
    wait(12.5)
    removeHealthPool(getLastCreatedHealthPool())
    goto lbl_2
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 10)
    goto lbl_3
    getDeadPlayers(Team.1).resurrect()
    goto lbl_4
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 6)
    goto lbl_5
    eventPlayer.setGravity(0)
    waitUntil(false, 7)
    eventPlayer.setGravity(100)
    goto lbl_6
    getLivingPlayers(Team.1).addHealthPool(Health.NORMAL, 500, false, false)
    wait(10)
    getLivingPlayers(Team.1).removeAllHealthPools()
    lbl_0:
    lbl_1:
    lbl_2:
    lbl_3:
    lbl_4:
    lbl_5:
    lbl_6:


rule "110 player hit speed boost default":
    @Event playerTookDamage
    @Team 1
    @Condition eventDamage == true
    @Condition eventPlayer._extendedPlayerCollection[52] == false
    @Condition Difficulty < 5 == true
    
    eventPlayer.setMoveSpeed(150)
    wait(1)
    eventPlayer.setMoveSpeed(100)


rule "126 healing dealt points":
    @Event playerReceivedHealing
    @Team 1
    @Condition healee != healer
    
    healer.points += 20
    healer.points2 += 20
    wait(0.25)


rule "158 melee stun":
    @Event playerTookDamage
    @Team 2
    @Condition Difficulty == 1 == true
    @Condition attacker.isMeleeing() == true
    @Condition distance(attacker, victim) <= 3
    
    eventPlayer.setStatusEffect(null, Status.STUNNED, 1)


rule "163 heal over time effect solo":
    @Event playerTookDamage
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition getLivingPlayers(Team.1) == true
    @Condition (len(getPlayers(Team.1).filter(lambda player: not player.isDummy()))) == 1
    
    stopHealingOverTime(eventPlayer._extendedPlayerCollection[36])
    wait(5, Wait.RESTART_WHEN_TRUE)
    eventPlayer.startHealingOverTime(eventPlayer, 3, 4 * eventPlayer.healvariable)
    eventPlayer._extendedPlayerCollection[36] = getLastHealingOverTimeId()


rule "245 Rule 388 tank sheild":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    @Condition eventPlayer.isAlive() == true
    
    goto loc+[3, 0, 0, 0, 0][[Hero.SIGMA, Hero.REINHARDT, Hero.DVA, Hero.RAMATTRA].index(eventPlayer.getHero()) + 1]
    eventPlayer.addHealthPool(Health.NORMAL, 100, false, false)
    wait(10)
    eventPlayer.removeAllHealthPools()


rule "393 POINTS Omnic kill (final hit)":
    @Event playerDealtFinalBlow
    @Team 1
    
    eventPlayer.killKind = 2 if eventPlayer.isMeleeing() else 1 if eventWasCriticalHit else 0
    eventPlayer.killPoints = ([50, 100, 60][eventPlayer.killKind] + eventPlayer.heropoints * eventPlayer.H) * (_extendedGlobalCollection[115] ** (roundnumber - 1))
    eventPlayer.points += eventPlayer.killPoints
    _extendedGlobalCollection[47] += eventPlayer.killPoints
    chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, [1000, 1000, 250][eventPlayer.killKind])
    if eventPlayer.H != 1:
        _extendedGlobalCollection[118] += [100, 200, 120][eventPlayer.killKind] * eventPlayer.H
    eventPlayer.xp[eventPlayer.currentheroxp] += [5, 10, 6][eventPlayer.killKind]
    eventPlayer.setUltCharge(eventPlayer.getUltCharge() + ((difficultyStats[5] * (1.5 if eventPlayer.getHero() in getSupportHeroes() else 1.25 if eventPlayer.getHero() in getTankHeroes() else 1)) / 2))


rule "396 POINTS Omnic kill (elimination)":
    @Event playerEarnedElimination
    @Team 1
    
    eventPlayer.killKind = 2 if eventPlayer.isMeleeing() else 1 if eventWasCriticalHit else 0
    if eventPlayer.getHero() in getDamageHeroes():
        eventPlayer.heropoints = 15 * (eventPlayer.killKind + 1)
    elif eventPlayer.getHero() in getSupportHeroes():
        eventPlayer.heropoints = 5 * (eventPlayer.killKind + 1)
    elif eventPlayer.getHero() in getTankHeroes():
        eventPlayer.heropoints = 10 * (eventPlayer.killKind + 1)
    eventPlayer.killPoints = ([40, 80, 70][eventPlayer.killKind] + eventPlayer.heropoints * eventPlayer.H) * (_extendedGlobalCollection[115] ** (roundnumber - 1))
    eventPlayer.points += eventPlayer.killPoints
    _extendedGlobalCollection[47] += eventPlayer.killPoints
    if eventPlayer.killKind == 2:
        chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, 250)
    if eventPlayer.H != 1:
        _extendedGlobalCollection[118] += [80, 160, 70][eventPlayer.killKind] * eventPlayer.H
    eventPlayer.xp[eventPlayer.currentheroxp] += [5, 10, 7][eventPlayer.killKind]
    eventPlayer.setUltCharge(eventPlayer.getUltCharge() + ((difficultyStats[5] * (1.5 if eventPlayer.getHero() in getSupportHeroes() else 1.25 if eventPlayer.getHero() in getTankHeroes() else 1)) / 2))


rule "Set starting heros (hero needs to be a variable, and also need to set up a way to go through hero selection twice)":
    @Event eachPlayer
    @Team 1
    
    eventPlayer.heroswap[0] = Hero.ASHE
    eventPlayer.heroswap[1] = Hero.DVA
    eventPlayer.heroiconswap[0] = heroIcon(Hero.ASHE)
    eventPlayer.heroiconswap[1] = heroIcon(Hero.DVA)


rule "245  tank sheild 2":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2) == true
    
    if eventPlayer.getHero() == Hero.WINSTON:
        eventPlayer.addHealthPool(Health.NORMAL, 100, false, false)
        wait(10)
        eventPlayer.removeAllHealthPools()
    elif eventPlayer.getHero() == Hero.DOOMFIST:
        eventPlayer.addHealthPool(Health.NORMAL, 100, false, false)
        wait(10)
        eventPlayer.removeAllHealthPools()


rule "ultimate use check":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isUsingUltimate() == true
    
    eventPlayer._extendedPlayerCollection[44] = false


rule "soldier explosive rounds (could make this one rule)":
    @Event eachPlayer
    @Team 1
    @Hero soldier
    @Condition eventPlayer.isFiringPrimaryFire() == true
    @Condition eventPlayer.isUsingUltimate() == true
    
    wait(0.22)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, raycastHitPosition(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 100, getPlayers(Team.2), eventPlayer, true), 5)
    if ruleCondition:
        loop()


rule "third person camera accurate":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.cameratoggle == 1
    
    eventPlayer.cameravar1 = Vector.LEFT - Vector.LEFT
    eventPlayer.startCamera(raycastHitPosition(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + worldVector(eventPlayer.cameravar1, eventPlayer, Transform.ROTATION) + eventPlayer.getFacingDirection() * eventPlayer.cameravar2, getPlayers(Team.2), eventPlayer, false), raycastHitPosition(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * eventPlayer.sea, getPlayers(Team.2), eventPlayer, false), 40)


rule "Camera 3rd person static":
    @Event eachPlayer
    @Condition eventPlayer.cameratoggle == 2
    
    eventPlayer.startCamera(raycastHitPosition(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + worldVector(vect(-1, 0.55, -3), eventPlayer, Transform.ROTATION) + eventPlayer.getFacingDirection() * -4 * _extendedGlobalCollection[122], null, eventPlayer, false), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 1000, 300)


rule "third person accurate initialize":
    @Event eachPlayer
    @Condition eventPlayer.cameratoggle == 1
    
    eventPlayer.sea = 200
    chaseOverTime(eventPlayer.cameravar1, vect([], 0.5, []), 0.05, ChaseTimeReeval.NONE)
    chaseOverTime(eventPlayer.cameravar2, -1.25, 0.1, ChaseTimeReeval.NONE)


rule "toggle camera toggle":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    
    if eventPlayer.cameratoggle == 2:
        wait(1, Wait.ABORT_WHEN_FALSE)
        eventPlayer.cameratoggle = false
        eventPlayer.stopCamera()
    elif eventPlayer.cameratoggle == false:
        wait(1, Wait.ABORT_WHEN_FALSE)
        eventPlayer.cameratoggle = 1
    elif eventPlayer.cameratoggle == 1:
        wait(1, Wait.ABORT_WHEN_FALSE)
        eventPlayer.cameratoggle = 2


rule "Camera 3rd person static crosshair":
    @Condition start == 1
    
    createInWorldText(localPlayer if localPlayer._extendedPlayerCollection[0][17] == 2 else null, "+", raycastHitPosition(localPlayer.getEyePosition(), localPlayer.getEyePosition() + localPlayer.getFacingDirection() * 999, getAllPlayers(), localPlayer, true), 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)


rule "Fix dva health":
    @Event eachPlayer
    @Condition eventPlayer.getHero() == Hero.DVA
    @Condition eventPlayer.isAlive() == true
    
    if eventPlayer.isInAlternateForm():
        eventPlayer.setMaxHealth(220)
    elif not eventPlayer.isInAlternateForm():
        eventPlayer.setMaxHealth(eventPlayer.healthmax)
    waitUntil(eventPlayer.getHero() != Hero.DVA, 99999)
    eventPlayer.setMaxHealth(100)
    heal(eventPlayer, null, 1000)


rule "mercy overheal mechanic":
    @Event playerReceivedHealing
    @Condition healer.getHero() == Hero.MERCY
    @Condition healee != healer
    
    waitUntil(healee.getHealth() == healee.getMaxHealth(), 99999)
    healee.addHealthPool(Health.NORMAL, healee.getMaxHealth() * 0.5, false, false)
    healer.points += 50


rule "slowmo camera final bÂ\zlow":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition numberOfZombies <= 1
    @Condition len(getLivingPlayers(Team.2)) == 0
    @Condition _extendedGlobalCollection[38] == 1
    
    getAllPlayers().startCamera(vect(evalOnce(random.randint(-3, 4)), [], evalOnce(random.randint(-3, 4))) + victim.getEyePosition(), victim.getEyePosition())
    slowmoCutscene = 25
    wait(1.5)
    slowmoCutscene = 0
    getAllPlayers().stopCamera()


rule "26 Revive Player system":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition Died.any(lambda x: distance(x, eventPlayer) < 4) == true
    
    eventPlayer.reviveTarget = getPlayersInSlot(Died.index(sorted(Died, lambda x: distance(x, eventPlayer))[0]), Team.1)
    chaseOverTime(eventPlayer.reviveTarget.sea, 4, 2 + _extendedGlobalCollection[23] * 2)
    wait(2 + _extendedGlobalCollection[23] * 2, Wait.ABORT_WHEN_FALSE)
    eventPlayer.reviveTarget.resurrect()
    eventPlayer.reviveTarget.teleport(eventPlayer)
    eventPlayer.reviveTarget.doorSkipCheck = true
    _extendedGlobalCollection[23]++
    Died[eventPlayer.reviveTarget.getSlot()] = vect(500, [], 500)
    eventPlayer.points += 100 * eventPlayer.H
    chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, 1000)
    if eventPlayer.H != 1:
        goto lbl_0
    if eventPlayer.H == 1:
        goto lbl_1
    lbl_0:
    getPlayers(Team.1)._extendedPlayerCollection[51] = false
    lbl_1:
    _extendedGlobalCollection[118] += 100 * eventPlayer.H
    eventPlayer.reviveTarget.setStatusEffect(null, Status.PHASED_OUT, 5)
    eventPlayer.reviveTarget.setMaxHealth(100)
    stopChasing(eventPlayer.reviveTarget.sea)
    eventPlayer.reviveTarget.sea = 0
    eventPlayer.reviveTarget = null


rule "26b revive marker runs out":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition difficultyStats[4] > 0
    @Condition eventPlayer.isDead() == true
    
    wait(difficultyStats[4], Wait.ABORT_WHEN_FALSE)
    Died[eventPlayer.getSlot()] = vect(500, [], 500)
    smallMessage(getPlayers(Team.1), "{0} can no longer be revived".format(eventPlayer))


rule "27 Cancel Revive all players":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.reviveTarget != null
    @Condition (distance(eventPlayer, Died[eventPlayer.reviveTarget.getSlot()]) >= 4 or eventPlayer.isDead()) == true
    
    stopChasing(eventPlayer.reviveTarget.sea)
    eventPlayer.reviveTarget.sea = 0
    eventPlayer.reviveTarget = null


rule "35 Player Respawn, Move Revive Effect":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isAlive() == true
    
    Died[eventPlayer.getSlot()] = vect(500, [], 500)


rule "died Camera":
    @Event playerDied
    @Team 1
    
    eventPlayer.startCamera(vect(evalOnce(random.randint(-3, 4)), [], evalOnce(random.randint(-3, 4))) + eventPlayer.getEyePosition(), eventPlayer.getEyePosition())
    wait(1.5)
    eventPlayer.stopCamera()


rule "80 player died without maniac":
    @Event playerDied
    @Team 1
    @Condition eventPlayer._extendedPlayerCollection[47] == false
    
    Died[eventPlayer.getSlot()] = nearestWalkablePosition(eventPlayer)
    bigMessage(getAllPlayers(), "{0}{1}".format(eventPlayer, random.choice(_extendedGlobalCollection[60])))
    _arrayConstructor = _extendedGlobalCollection[116]
    _arrayConstructor[eventPlayer.getSlot()] = true
    _extendedGlobalCollection[116] = _arrayConstructor
    wait(0.1)
    eventPlayer._extendedPlayerCollection[48] = false
    wait(0.1)
    eventPlayer.healthmax = 50
    wait(0.1)
    eventPlayer.healvariable = 100
    wait(0.1)
    eventPlayer.setHealingDealt(100)
    eventPlayer.doublemag = false
    wait(0.1)
    eventPlayer._extendedPlayerCollection[52] = false
    destroyDummy(Team.1, eventPlayer.getSlot() + 4)
    eventPlayer.setAllowedHeroes(eventPlayer.allowedheroes)


rule "81 Died Low points Bonus":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.points < 1500
    @Condition roundnumber > 5
    
    eventPlayer.points = 1500
    eventPlayer.points2 = 1500


rule "23 Initiate Health, Damage, and Healing Variables":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.healthmax == false
    
    eventPlayer.healthmax = 50
    eventPlayer.damagevariable = 100
    eventPlayer.healvariable = 100


rule "55  starting hero set":
    @Event playerJoined
    
    eventPlayer.startForcingHero(Hero.ASHE)


rule "58  Single player lives mechanic":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition (len(getPlayers(Team.1).filter(lambda player: not player.isDummy()))) == 1
    @Condition eventPlayer.singlelives < 3
    
    eventPlayer.resurrect()
    wait(0.05)
    eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 2)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 10)
    eventPlayer.singlelives++


rule "DAMAGE Melee does more damage":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == true
    @Condition start == 1
    
    wait(0.05)
    eventPlayer.setDamageDealt(350)
    eventPlayer.allowButton(Button.MELEE)
    eventPlayer.forceButtonPress(Button.MELEE)
    wait(0.5)
    eventPlayer.setDamageDealt(eventPlayer.damagevariable)
    eventPlayer.disallowButton(Button.MELEE)


rule "67 solo play mode effect":
    @Condition (len(getPlayers(Team.1).filter(lambda player: not player.isDummy()))) < 2
    @Condition start == 1
    
    wait(15)
    if not ruleCondition:
        return
    bigMessage(getAllPlayers(), "SOLO MODE: YOU NOW HAVE 3 LIVES TOTAL")


def Subheroswap():
    @Name "hero swap subroutine"
    
    eventPlayer.preloadHero(eventPlayer.heroswap[eventPlayer.swapvar[0]])
    _arrayConstructor = eventPlayer._extendedPlayerCollection[40]
    _arrayConstructor[eventPlayer.swapvar[1]] = eventPlayer.getHealth()
    eventPlayer._extendedPlayerCollection[40] = _arrayConstructor
    eventPlayer.ultcharge[eventPlayer.swapvar[1]] = eventPlayer.getUltCharge()
    _arrayConstructor = eventPlayer._extendedPlayerCollection[15]
    _arrayConstructor[eventPlayer.swapvar[1]] = eventPlayer.perk[5]
    eventPlayer._extendedPlayerCollection[15] = _arrayConstructor
    eventPlayer.abilitycooldown[eventPlayer.swapvar[2]] = eventPlayer.getAbilityCooldown(Button.ABILITY_1)
    eventPlayer.abilitycooldown[eventPlayer.swapvar[3]] = eventPlayer.getAbilityCooldown(Button.ABILITY_2)
    eventPlayer.abilitycooldown[eventPlayer.swapvar[4]] = eventPlayer.getAbilityCooldown(Button.SECONDARY_FIRE)
    eventPlayer.forceButtonPress(Button.RELOAD)
    wait()
    eventPlayer.magazines[eventPlayer.swapvar[1]] = eventPlayer.currentmagazines
    eventPlayer.currentswap = eventPlayer.swapvar[0]
    wait()
    eventPlayer.currentmagazines = eventPlayer.magazines[eventPlayer.swapvar[0]]
    eventPlayer._extendedPlayerCollection[44] = eventPlayer.ultcharge[eventPlayer.swapvar[0]]
    eventPlayer.perk[5] = eventPlayer._extendedPlayerCollection[15][eventPlayer.swapvar[0]]


rule "switch between 2 heros (needs ultimates, followers, ammo, systems working)":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition eventPlayer.isAlive() == true
    
    waitUntil(getServerLoad() < 230, 3)
    playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_DISAPPEAR_SOUND, Color.WHITE, eventPlayer, 200)
    eventPlayer.removeAllHealthPools()
    if eventPlayer.currentswap == false:
        eventPlayer.swapvar = [1, 0, 0, 1, 2]
        wait()
        Subheroswap()
    elif eventPlayer.currentswap == 1:
        eventPlayer.swapvar = [0, 1, 3, 4, 5]
        wait()
        Subheroswap()
    eventPlayer.startForcingHero(eventPlayer.heroswap[eventPlayer.currentswap])
    wait()
    eventPlayer.setHealth(eventPlayer._extendedPlayerCollection[40][eventPlayer.swap[0]])
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, eventPlayer.abilitycooldown[eventPlayer.swap[2]])
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, eventPlayer.abilitycooldown[eventPlayer.swap[3]])
    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, eventPlayer.abilitycooldown[eventPlayer.swap[4]])
    eventPlayer.setUltCharge(eventPlayer._extendedPlayerCollection[44])
    wait()
    (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
    wait(0.1)
    playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_DISAPPEAR, Color.WHITE, eventPlayer, 1)
    wait(1)


rule "leave spawn by walking out":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition start == 1
    @Condition eventPlayer.outofpsawn == 0
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isInSpawnRoom() == false
    
    getPlayers(Team.1).outofpsawn = 1


def zone1():
    @Name "zone 1 subroutine"
    
    startForcingSpawn(Team.ALL, 1)
    telespot = 0
    _extendedGlobalCollection[3] = _extendedGlobalCollection[71]
    _extendedGlobalCollection[4] = _extendedGlobalCollection[72]


def zone2():
    @Name "zone 2 subroutine"
    
    startForcingSpawn(Team.ALL, 0)
    telespot = 1
    _extendedGlobalCollection[3] = _extendedGlobalCollection[73]
    _extendedGlobalCollection[4] = _extendedGlobalCollection[74]


def zone3():
    @Name "zone 3 subroutine"
    
    startForcingSpawn(Team.ALL, 2)
    telespot = 2
    _extendedGlobalCollection[3] = _extendedGlobalCollection[75]
    _extendedGlobalCollection[4] = _extendedGlobalCollection[76]


def getoutofspawn():
    @Name "out of spawn subroutine"
    
    goto loc+[23, 0, 4, 8, 12, 16, 20][[false, 1, 2, 3, 4, 5].index(_extendedGlobalCollection[29]) + 1]
    eventPlayer.teleport(vect(-98.883, 8.939, 72.511))
    zone1()
    doorsNeedDrawing = true
    goto lbl_0
    eventPlayer.teleport(vect(-80.097, 9.076, -73.528))
    zone1()
    doorsNeedDrawing = true
    goto lbl_1
    eventPlayer.teleport(vect(185.785, 45.059, 176.924))
    zone2()
    doorsNeedDrawing = true
    goto lbl_2
    eventPlayer.teleport(vect(349.006, 45.721, 180.954))
    zone2()
    doorsNeedDrawing = true
    goto lbl_3
    eventPlayer.teleport(vect(211.903, -9.592, -237.573))
    zone3()
    doorsNeedDrawing = true
    goto lbl_4
    eventPlayer.teleport(vect(354.448, -9.548, -232.832))
    zone3()
    doorsNeedDrawing = true
    lbl_0:
    lbl_1:
    lbl_2:
    lbl_3:
    lbl_4:


rule "18 Get out of Spawn":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.outofpsawn == 1
    
    wait(1)
    eventPlayer._extendedPlayerCollection[13] = (getLivingPlayers(Team.1).filter(lambda player: not player.isDummy() and player != eventPlayer and player.outofpsawn == 1 and not player.isInSpawnRoom()))[0] if _extendedGlobalCollection[45] else null
    if eventPlayer._extendedPlayerCollection[13] != null:
        eventPlayer.teleport(eventPlayer._extendedPlayerCollection[13].getPosition())
        eventPlayer.doorSkipCheck = true
    else:
        getoutofspawn()
        _extendedGlobalCollection[45] = true


rule "late joiner: catch up with the team":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.outofpsawn == 0
    @Condition getPlayers(Team.1).any(lambda player: player.outofpsawn == 1) == true
    
    wait(3, Wait.ABORT_WHEN_FALSE)
    if start == 1:
        eventPlayer.points = _extendedGlobalCollection[9]
        eventPlayer.points2 = eventPlayer.points
        eventPlayer.cashback = 1
    eventPlayer.outofpsawn = 1


rule "jugg tier 2 and 3":
    @Event playerTookDamage
    @Team 1
    @Condition eventPlayer.perk[0] > 0
    
    if [0, 0, 25, 50][eventPlayer.perk[0]] > 0:
        wait(10)
        heal(eventPlayer, null, [0, 0, 25, 50][eventPlayer.perk[0]])


rule "give juggernaut perk max health":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.perk[0] == 1
    
    eventPlayer.setMaxHealth(200)


rule "109 PERK player hit speed boost sprint burst":
    @Event playerTookDamage
    @Team 1
    @Condition eventDamage > 0
    @Condition eventPlayer.perk[1] >= 1
    
    eventPlayer.setMoveSpeed([100, 180, 200, 220][eventPlayer.perk[1]])
    wait(1)
    eventPlayer.setMoveSpeed([100, 105, 107, 110][eventPlayer.perk[1]])


rule "79 player died with maniac":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.perk[3] >= 1
    
    Died[eventPlayer.getSlot()] = nearestWalkablePosition(eventPlayer)
    bigMessage(getAllPlayers(), "{0} {1}".format(eventPlayer, random.choice(_extendedGlobalCollection[60])))
    _arrayConstructor = _extendedGlobalCollection[116]
    _arrayConstructor[eventPlayer.getSlot()] = true
    _extendedGlobalCollection[116] = _arrayConstructor
    eventPlayer.setMaxHealth(100)
    eventPlayer.stopForcingCurrentHero()
    wait()
    eventPlayer.perk[0] = false
    wait()
    eventPlayer.healthmax = 50
    eventPlayer.perk[3] = false
    wait()
    eventPlayer.setDamageDealt(100)
    eventPlayer.damagevariable = 100
    wait()
    eventPlayer.healvariable = 100
    eventPlayer.setHealingDealt(100)
    eventPlayer.perk[4] = false
    wait(0.1)
    eventPlayer.perk[1] = false
    eventPlayer.setAllowedHeroes(eventPlayer.allowedheroes)


rule "77 multiplayer extra life Perk":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.perk[2] >= 1
    
    eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 2)
    eventPlayer.resurrect()
    eventPlayer.setStatusEffect(null, Status.INVINCIBLE, 10)
    eventPlayer.perk[2]--


def SaveRamattraCoins():
    @Name "save ramattra coins"
    
    eventPlayer.coinNameIndex = _extendedGlobalCollection[12].index("{0}".format(eventPlayer))
    if eventPlayer.coinNameIndex < 0:
        eventPlayer.coinNameIndex = len(_extendedGlobalCollection[12])
        _arrayConstructor = _extendedGlobalCollection[12]
        _arrayConstructor[eventPlayer.coinNameIndex] = "{0}".format(eventPlayer)
        _extendedGlobalCollection[12] = _arrayConstructor
    _arrayConstructor = _extendedGlobalCollection[13]
    _arrayConstructor[eventPlayer.coinNameIndex] = eventPlayer.ramattraCoins
    _extendedGlobalCollection[13] = _arrayConstructor


def SpendRamattraCoins():
    @Name "spend ramattra coins"
    
    if eventPlayer.coinUses > 0:
        eventPlayer.ramattraCoins -= eventPlayer.coinUses * pricePerUse
        eventPlayer.coinUses = 0
        SaveRamattraCoins()


def PurchaseFreezeAfterEmote():
    @Name "finish purchase feedback"
    
    wait(0.05)
    eventPlayer.setMoveSpeed(0)
    wait(2)
    eventPlayer.setMoveSpeed(100)


rule "202 Purchase Follower action":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.monkeyBombActive != true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition buyheros.any(lambda x: distance(eventPlayer, x) < 2) == true
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    waitUntil(getServerLoad() < 230, 3)
    for i in range(len(hero)):
        if distance(eventPlayer, buyheros[i]) < 2 and hero[i] != null:
            if eventPlayer.points >= round(herobuycosts[i] / 3 * 0.5 ** eventPlayer.coinUses * costmultiplier - eventPlayer.creditcardlimit):
                eventPlayer._extendedPlayerCollection[45] = hero[i]
                eventPlayer.points -= round(herobuycosts[i] / 3 * 0.5 ** eventPlayer.coinUses * costmultiplier)
                eventPlayer.points2 -= round(herobuycosts[i] / 3 * 0.5 ** eventPlayer.coinUses * costmultiplier)
                pricePerUse = 1
                SpendRamattraCoins()
                wait()
                Subfollowerbuy()
                if not eventPlayer.firstFollowerShown:
                    eventPlayer.firstFollowerShown = true
                    wait(0.25)
                    eventPlayer.communicate(Comms.EMOTE_UP)
                    PurchaseFreezeAfterEmote()
            else:
                eventPlayer.messageSpot = i
                smallMessage(eventPlayer, "{0} {1}".format(heroIcon(hero[eventPlayer.messageSpot]), _extendedGlobalCollection[65][eventPlayer.messageSpot]))
            break


rule "Purchase Mystery Follower action":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.monkeyBombActive != true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition (start == 1 and rngbox != null and (distance(eventPlayer, rngbox) <= 2 or fireSale == true and fireSaleBoxes.any(lambda x: distance(eventPlayer, x) <= 2))) == true
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.points >= round(herobuycosts[0] / 3 * 0.5 ** eventPlayer.coinUses * costmultiplier - eventPlayer.creditcardlimit):
        eventPlayer._extendedPlayerCollection[45] = random.choice(hero)
        eventPlayer.points -= round(herobuycosts[0] / 3 * 0.5 ** eventPlayer.coinUses * costmultiplier)
        eventPlayer.points2 -= round(herobuycosts[0] / 3 * 0.5 ** eventPlayer.coinUses * costmultiplier)
        pricePerUse = 1
        SpendRamattraCoins()
        wait()
        Subfollowerbuy()
        if not eventPlayer.firstFollowerShown:
            eventPlayer.firstFollowerShown = true
            wait(0.25)
            eventPlayer.communicate(Comms.EMOTE_UP)
            PurchaseFreezeAfterEmote()
    else:
        smallMessage(eventPlayer, "{0} {1}".format(heroIcon(hero[0]), _extendedGlobalCollection[65][0]))


rule "229 buy perks and power activate":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition buyperks.any(lambda x: distance(eventPlayer, x) < 2) == true
    
    waitUntil(getServerLoad() < 230, 3)
    for i in range(6):
        if distance(eventPlayer, buyperks[i]) < 2:
            if poweron == 1:
                if eventPlayer.points >= round(perkcosts[i] * 0.5 ** eventPlayer.coinUses * costmultiplier - eventPlayer.creditcardlimit):
                    if eventPlayer.perk[i] < 3:
                        eventPlayer.points -= round(perkcosts[i] * 0.5 ** eventPlayer.coinUses * costmultiplier * eventPlayer.cashback)
                        eventPlayer.perk[i]++
                        eventPlayer.messageSpot = i
                        pricePerUse = 5 if i == 5 else 3
                        SpendRamattraCoins()
                        smallMessage(eventPlayer, "{0} {1}".format(heroIcon(Hero.RAMATTRA), _extendedGlobalCollection[121][eventPlayer.messageSpot]))
                        wait(0.25)
                        playEffect(getPlayers(Team.1), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 70)
                        wait(0.25)
                        eventPlayer.communicate(Comms.EMOTE_UP)
                        PurchaseFreezeAfterEmote()
                        break
                    else:
                        smallMessage(eventPlayer, "{0} You already have the max tier!".format(heroIcon(Hero.RAMATTRA)))
                        break
                elif eventPlayer.points < perkcosts[i]:
                    smallMessage(eventPlayer, "{0} No points? NO perks!".format(heroIcon(Hero.RAMATTRA)))
                    break
            else:
                smallMessage(eventPlayer, "{0} The power is not ON!".format(heroIcon(Hero.RAMATTRA)))
                break


rule "connect power":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(eventPlayer, buyperks[6]) < 2
    @Condition poweron == 0
    
    playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
    destroyIcon(powerconnected)
    _extendedGlobalCollection[129].remove(powerconnected)
    powerconnected = null
    poweron = 1
    smallMessage(getAllPlayers(), "The power is now ON!")
    if len(getLivingPlayers(Team.2)) > 0:
        smallMessage(getAllPlayers(), "{0} Prepare for death!".format(heroIcon(Hero.RAMATTRA)))
    else:
        smallMessage(getAllPlayers(), "{0} Nice timing".format(heroIcon(Hero.RAMATTRA)))
    getPlayers(Team.2)._extendedPlayerCollection[20] = true


rule "202 Purchase hero actions":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition buyheros.any(lambda x: distance(eventPlayer, x) < 2) == true
    
    waitUntil(getServerLoad() < 230, 3)
    for idx in range(len(buyheros)):
        if distance(eventPlayer, buyheros[idx]) < 2 and hero[idx] != null:
            eventPlayer.buySpot = idx
            if eventPlayer.getHero() == hero[eventPlayer.buySpot]:
                if eventPlayer.points >= round(herobuycosts[eventPlayer.buySpot] / 2 * costmultiplier - eventPlayer.creditcardlimit) and (eventPlayer.currentmagazines < (6 if Difficulty == 5 else 10)):
                    eventPlayer.points -= round(herobuycosts[eventPlayer.buySpot] / 2 * costmultiplier * eventPlayer.cashback)
                    wait(0.25)
                    chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, herobuycosts[eventPlayer.buySpot])
                    eventPlayer.currentmagazines = 6 if Difficulty == 5 else 10
                    smallMessage(eventPlayer, "{0} Magazines refilled!".format(heroIcon(hero[eventPlayer.buySpot])))
                    break
                else:
                    if eventPlayer.currentmagazines >= (6 if Difficulty == 5 else 10):
                        smallMessage(eventPlayer, "You already have full magazines!")
                    elif eventPlayer.points < herobuycosts[eventPlayer.buySpot] / 2:
                        smallMessage(eventPlayer, "{0} No points? NO magazines!".format(heroIcon(Hero.RAMATTRA)))
            else:
                if eventPlayer.points >= round(herobuycosts[eventPlayer.buySpot] * 0.5 ** eventPlayer.coinUses * costmultiplier - eventPlayer.creditcardlimit):
                    eventPlayer.startForcingHero(hero[eventPlayer.buySpot])
                    eventPlayer.perk[5] = 0
                    wait()
                    eventPlayer.heroswap[eventPlayer.currentswap] = hero[eventPlayer.buySpot]
                    wait()
                    eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[eventPlayer.buySpot])
                    if getServerLoad() < 235:
                        playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
                        playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_DISAPPEAR, Color.WHITE, eventPlayer, 1)
                    eventPlayer.points -= round(herobuycosts[eventPlayer.buySpot] * 0.5 ** eventPlayer.coinUses * costmultiplier * eventPlayer.cashback)
                    pricePerUse = 1
                    SpendRamattraCoins()
                    wait(0.25)
                    chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, herobuycosts[eventPlayer.buySpot])
                    (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
                    if not eventPlayer.getHero() in eventPlayer.allowedheroes:
                        eventPlayer.allowedheroes.append(eventPlayer.getHero())
                    eventPlayer.currentmagazines = 6 if Difficulty == 5 else 10
                else:
                    smallMessage(eventPlayer, "{0} {1}".format(heroIcon(hero[eventPlayer.buySpot]), _extendedGlobalCollection[64][eventPlayer.buySpot]))
                break


rule "buy the ending":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition distance(eventPlayer, vect(-101.303, -150.36, -17.831)) < 2
    @Condition eventPlayer.isAlive() == true
    
    if eventPlayer.points >= 50000:
        eventPlayer.points -= 50000 * eventPlayer.cashback
        chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, 50000)
        (getPlayers(Team.1).filter(lambda player: not player.isDummy()))._extendedPlayerCollection[25] = true
        slowmoCutscene = 40
        wait(2)
        slowmoCutscene = 0
        smallMessage(getPlayers(Team.1), "{0} You really thought this was going to end?".format(heroIcon(Hero.RAMATTRA)))
        wait(2)
        getPlayers(Team.1).singlelives = 3
        getPlayers(Team.1).perk[2] = 0
        kill(getAllPlayers())
    else:
        smallMessage(eventPlayer, "{0} HA, good luck escaping...".format(heroIcon(Hero.RAMATTRA)))


rule "ending reward for each player":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer._extendedPlayerCollection[25] == true
    
    eventPlayer._extendedPlayerCollection[25] = false
    if not eventPlayer.getHero() in eventPlayer.endingHeroes:
        eventPlayer.endingHeroes.append(eventPlayer.getHero())
    smallMessage(eventPlayer, "{0} now has tier 3 Pack-a-Punch in every playthrough.".format(heroIcon(eventPlayer.getHero())))


rule "78 buy revive multiplayer":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, vect(-83.583, -155.045, 120.352)) < 4
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.points >= round(1000 * costmultiplier - eventPlayer.creditcardlimit)
    @Condition powerconnected == 1
    @Condition (len(getPlayers(Team.1).filter(lambda player: not player.isDummy()))) > 1
    
    waitUntil(getServerLoad() < 230, 3)
    eventPlayer.points -= round(1000 * costmultiplier * eventPlayer.cashback)
    chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, 1000)
    playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
    wait(0.1)
    eventPlayer._extendedPlayerCollection[46] = 1
    wait(0.1)
    eventPlayer.communicate(Comms.EMOTE_UP)
    PurchaseFreezeAfterEmote()


rule "173 Purchase winston Omnic bomb":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, buyperks[8]) < 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.monkeyBombOwned != true
    
    if poweron != 1:
        smallMessage(eventPlayer, "{0} The power is not ON!".format(heroIcon(Hero.RAMATTRA)))
        return
    if eventPlayer.points < round(2500 * costmultiplier - eventPlayer.creditcardlimit):
        smallMessage(eventPlayer, "{0} No points? NO monkey bombs!".format(heroIcon(Hero.RAMATTRA)))
        return
    waitUntil(getServerLoad() < 230, 3)
    eventPlayer.points -= round(2500 * costmultiplier * eventPlayer.cashback)
    chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, 2500)
    eventPlayer.monkeyBombOwned = true
    playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
    wait(0.1)
    eventPlayer.communicate(Comms.EMOTE_UP)
    eventPlayer.monkeyBombsLeft = 3
    smallMessage(eventPlayer, "{0} 3 monkey bombs a round: use the Ultimate Status voice line to throw one".format(heroIcon(Hero.RAMATTRA)))
    PurchaseFreezeAfterEmote()
    eventPlayer._extendedPlayerCollection[38] = false


rule "53  mystery box":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition (start == 1 and rngbox != null and (distance(eventPlayer, rngbox) <= 2 or fireSale == true and fireSaleBoxes.any(lambda x: distance(eventPlayer, x) <= 2))) == true
    
    if eventPlayer.points > (((10 if fireSale == true else 950) * 0.5 ** eventPlayer.coinUses) - eventPlayer.creditcardlimit):
        if getServerLoad() < 235:
            waitUntil(getServerLoad() < 230, 1.5)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
        waitUntil(getServerLoad() < 230, 1.5)
        eventPlayer.startForcingHero(random.choice(random.shuffle(getAllHeroes()))[0])
        eventPlayer.perk[5] = 0
        wait(0.1)
        eventPlayer.resurrect()
        eventPlayer.points -= ((10 if fireSale == true else 950) * 0.5 ** eventPlayer.coinUses) * eventPlayer.cashback
        pricePerUse = 1
        SpendRamattraCoins()
        chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, 10 if fireSale == true else 950)
        if getServerLoad() < 235:
            playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_DISAPPEAR, Color.WHITE, eventPlayer, 1)
            playEffect(getAllPlayers(), DynamicEffect.BUFF_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 70)
        eventPlayer.heroswap[eventPlayer.currentswap] = eventPlayer.getHero()
        eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(eventPlayer.getHero())
        if not eventPlayer.getHero() in eventPlayer.allowedheroes:
            eventPlayer.allowedheroes.append(eventPlayer.getHero())
        eventPlayer.currentmagazines = 6 if Difficulty == 5 else 10
        _extendedGlobalCollection[34]++
        wait(1)
        if _extendedGlobalCollection[34] < random.randint(6, 15):
            goto lbl_0
        rngbox = random.choice(mysterylocations)
        _extendedGlobalCollection[34] = false
        lbl_0:
    elif eventPlayer.points < (((10 if fireSale == true else 950) * 0.5 ** eventPlayer.coinUses) - eventPlayer.creditcardlimit):
        bigMessage(eventPlayer, "Come back when you've got some money buddy!")


rule "192 Purchase trap":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, vect(-83.799, -160.001, 64.224)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition _extendedGlobalCollection[33] == false
    
    if eventPlayer.points >= 1000:
        waitUntil(getServerLoad() < 230, 3)
        _extendedGlobalCollection[33] = 1
        playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
        eventPlayer.points -= 2000
        wait(22)
        _extendedGlobalCollection[33] = false
    elif eventPlayer.points < 1000:
        smallMessage(eventPlayer, "{0}  A Trap? No! Omnics need purpose!".format(heroIcon(Hero.RAMATTRA)))
        wait(4)


rule "517 set xp to hero":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.currentheroxp != hero.index(eventPlayer.getHero())
    
    eventPlayer.currentheroxp = hero.index(eventPlayer.getHero())


rule "512 gain level":
    @Event eachPlayer
    @Team 1
    @Condition experiencesystem == true
    @Condition eventPlayer.xp[eventPlayer.currentheroxp] >= 100
    
    eventPlayer.xp[eventPlayer.currentheroxp] -= 100
    eventPlayer.XPlevel[eventPlayer.currentheroxp]++
    smallMessage(eventPlayer, "{0} level {1}! {2}".format(heroIcon(eventPlayer.getHero()), eventPlayer.XPlevel[eventPlayer.currentheroxp], "Secondary fire unlocked!" if eventPlayer.XPlevel[eventPlayer.currentheroxp] == 5 else "{0} unlocked!".format(abilityIconString(eventPlayer.getHero(), Button.ABILITY_1)) if eventPlayer.XPlevel[eventPlayer.currentheroxp] == 10 else "{0} unlocked!".format(abilityIconString(eventPlayer.getHero(), Button.ABILITY_2)) if eventPlayer.XPlevel[eventPlayer.currentheroxp] == 15 else "{0} unlocked!".format(abilityIconString(eventPlayer.getHero(), Button.ULTIMATE)) if eventPlayer.XPlevel[eventPlayer.currentheroxp] == 20 else ""))
    wait()
    if ruleCondition:
        loop()


rule "513 Rule 321 lvl gain stat changes":
    @Event eachPlayer
    @Team 1
    @Condition experiencesystem == true
    @Condition start == 1
    @Condition eventPlayer._extendedPlayerCollection[37] != eventPlayer.currentheroxp * 1000 + eventPlayer.XPlevel[eventPlayer.currentheroxp]
    
    eventPlayer._extendedPlayerCollection[37] = eventPlayer.currentheroxp * 1000 + eventPlayer.XPlevel[eventPlayer.currentheroxp]
    eventPlayer.setSecondaryFireEnabled((experiencesystem == false or eventPlayer.XPlevel[eventPlayer.currentheroxp] >= 5) and eventPlayer.currentmagazines > 0)
    eventPlayer.setAbility1Enabled(experiencesystem == false or eventPlayer.XPlevel[eventPlayer.currentheroxp] >= 10)
    eventPlayer.setAbility2Enabled(experiencesystem == false or eventPlayer.XPlevel[eventPlayer.currentheroxp] >= 15)
    eventPlayer.setUltEnabled(experiencesystem == false or eventPlayer.XPlevel[eventPlayer.currentheroxp] >= 20)


rule "Ramattra coins: bring back a returning player's coins":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer.coinNameIndex = _extendedGlobalCollection[12].index("{0}".format(eventPlayer))
    if eventPlayer.coinNameIndex >= 0:
        eventPlayer.ramattraCoins = _extendedGlobalCollection[13][eventPlayer.coinNameIndex]


rule "Ramattra coins: say I need healing to use one":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition start == 1
    @Condition eventPlayer.isCommunicating(Comms.NEED_HEALING) == true
    
    eventPlayer.coinPrice = 1 if buyheros.any(lambda x: distance(eventPlayer, x) < 2) or bossbuypositions.any(lambda x: distance(eventPlayer, x) < 2) or (start == 1 and rngbox != null and (distance(eventPlayer, rngbox) <= 2 or fireSale == true and fireSaleBoxes.any(lambda x: distance(eventPlayer, x) <= 2))) else 5 if distance(eventPlayer, buyperks[5]) < 2 else 3 if buyperks.slice(0, 5).any(lambda x: distance(eventPlayer, x) < 2) else 0
    if eventPlayer.coinPrice == 0:
    elif eventPlayer.coinUses >= 3:
        smallMessage(eventPlayer, "Already using 3 Ramattra coins here (an eighth of the price)")
    elif eventPlayer.ramattraCoins >= (eventPlayer.coinUses + 1) * eventPlayer.coinPrice:
        eventPlayer.coinUses++
        smallMessage(eventPlayer, "{0} Ramattra coins used: {1}. Price x {2}. Buy as usual".format(heroIcon(Hero.RAMATTRA), eventPlayer.coinUses, 0.5 ** eventPlayer.coinUses))
    else:
        smallMessage(eventPlayer, "Not enough Ramattra coins: this costs {0} a use (you have {1})".format(eventPlayer.coinPrice, eventPlayer.ramattraCoins))


rule "Ramattra coins: reminder at buy spots":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.ramattraCoins > 0
    @Condition eventPlayer.coinUses == 0
    @Condition start == 1
    @Condition eventPlayer.isDummy() == false
    @Condition (1 if buyheros.any(lambda x: distance(eventPlayer, x) < 2) or bossbuypositions.any(lambda x: distance(eventPlayer, x) < 2) or (start == 1 and rngbox != null and (distance(eventPlayer, rngbox) <= 2 or fireSale == true and fireSaleBoxes.any(lambda x: distance(eventPlayer, x) <= 2))) else 5 if distance(eventPlayer, buyperks[5]) < 2 else 3 if buyperks.slice(0, 5).any(lambda x: distance(eventPlayer, x) < 2) else 0) > 0
    
    smallMessage(eventPlayer, "{0} You have {1} Ramattra coin(s): say I need healing here to halve the price".format(heroIcon(Hero.RAMATTRA), eventPlayer.ramattraCoins))


rule "Ramattra coins: walking away cancels the uses":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.coinUses > 0
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.coinPrice = 1 if buyheros.any(lambda x: distance(eventPlayer, x) < 2) or bossbuypositions.any(lambda x: distance(eventPlayer, x) < 2) or (start == 1 and rngbox != null and (distance(eventPlayer, rngbox) <= 2 or fireSale == true and fireSaleBoxes.any(lambda x: distance(eventPlayer, x) <= 2))) else 5 if distance(eventPlayer, buyperks[5]) < 2 else 3 if buyperks.slice(0, 5).any(lambda x: distance(eventPlayer, x) < 2) else 0
    if eventPlayer.coinPrice == 0:
        eventPlayer.coinUses = 0
    if ruleCondition:
        loop()


rule "Ramattra coins: HUD":
    @Condition start == 1
    
    hudSubtext(getPlayers(Team.1).filter(lambda player: player.ramattraCoins > 0 or player.coinUses > 0), "{0} Ramattra coins: {1}{2}".format(heroIcon(Hero.RAMATTRA), localPlayer.ramattraCoins, "   (using {0}: price x {1})".format(localPlayer.coinUses, 0.5 ** localPlayer.coinUses) if localPlayer.coinUses > 0 else ""), HudPosition.LEFT, 4, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)


rule "arcade: the secret code":
    @Event eachPlayer
    @Team 1
    @Condition start == false
    @Condition textListsLoaded == true
    @Condition settingsViewers == null
    @Condition eventPlayer.isDummy() == false
    @Condition (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)) == true
    
    if getTotalTimeElapsed() - eventPlayer._extendedPlayerCollection[14] > 1:
        eventPlayer.arcadeCodeStep = 0
    eventPlayer._extendedPlayerCollection[14] = getTotalTimeElapsed()
    if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == (eventPlayer.arcadeCodeStep % 2 == 0):
        eventPlayer.arcadeCodeStep++
    else:
        eventPlayer.arcadeCodeStep = 1 if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) else 0


rule "arcade: Soldier, aimbot and overhead camera":
    @Event eachPlayer
    @Team 1
    @Condition _extendedGlobalCollection[52] == true
    @Condition start == 1
    @Condition eventPlayer.outofpsawn == 1
    @Condition eventPlayer.isDummy() == false
    
    eventPlayer.startForcingHero(Hero.SOLDIER)
    eventPlayer.heroswap[0] = Hero.SOLDIER
    eventPlayer.heroiconswap[0] = heroIcon(Hero.SOLDIER)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), ((sorted(getLivingPlayers(Team.2).filter(lambda player: not player.isInSpawnRoom()), lambda x: distance(eventPlayer, x)))[0]).getEyePosition()), 800)
    eventPlayer.startTransformingThrottle(1, 1, vect(-0.109, [], 0.994))
    while start == 1:
        if eventPlayer.isAlive():
            eventPlayer.startCamera(raycastHitPosition(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + vect(0.778, 14.866, -7.117), null, eventPlayer, false) - vect(0.024, 0.451, -0.216), eventPlayer.getEyePosition(), 20)
            if eventPlayer.getHero() != Hero.SOLDIER:
                eventPlayer.setUltCharge(eventPlayer.getUltCharge() + 40)
        wait(2)
    eventPlayer.stopFacing()
    eventPlayer.stopTransformingThrottle()


rule "arcade: Soldier's ultimate changes your hero":
    @Event eachPlayer
    @Team 1
    @Condition _extendedGlobalCollection[52] == true
    @Condition eventPlayer.getHero() == Hero.SOLDIER
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition eventPlayer.isDummy() == false
    
    wait(0.25)
    eventPlayer.startForcingHero(random.choice(hero))
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 2)
    wait(30)
    waitUntil(eventPlayer.isAlive(), 99999)
    if start == 1:
        eventPlayer.startForcingHero(Hero.SOLDIER)


rule "bastion re enter turret mode (need to add cooldown reduction to seemlessly re-enter turret mode)":
    @Event eachPlayer
    @Team 1
    @Hero bastion
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    wait(0.25)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(6.5)
    loop()


rule "bastion bot re enter turret mode (need to add cooldown reduction to seemlessly re-enter turret mode)":
    @Event eachPlayer
    @Team 1
    @Hero bastion
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    wait(0.25)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(6.5)
    loop()


rule "38 Pickup vaporized":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[3]) <= 1.5
    @Condition getPlayers(Team.1).G[3] == false
    @Condition roundnumber >= 1
    
    M[3] = vect(500, 25, 500)
    getPlayers(Team.1).G[3] = true
    getPlayers(Team.1).S[3] = 1
    bigMessage(getAllPlayers(), "Vaporized")
    kill(getLivingPlayers(Team.2), getLivingPlayers(Team.1)[0])
    wait(3)
    getPlayers(Team.1).G[3] = false
    getPlayers(Team.1).S[3] = false


rule "39 Pickup max ammo":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, M[5]) <= 1.5
    @Condition getPlayers(Team.1).G[5] == false
    @Condition roundnumber >= 1
    
    M[5] = vect(500, 25, 500)
    getPlayers(Team.1).G[5] = true
    getPlayers(Team.1).S[5] = 1
    getLivingPlayers(Team.1).magazines += 10
    bigMessage(getAllPlayers(), "Max ammo!")
    wait(3)
    getPlayers(Team.1).G[5] = false
    getPlayers(Team.1).S[5] = false


rule "137  get out of spawn bots":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInSpawnRoom() == true
    @Condition len(globalActiveBreaches) > 0
    
    eventPlayer.setStatusEffect(null, Status.ROOTED, 9999)
    wait(0.25 + eventPlayer.getSlot() * 0.05, Wait.ABORT_WHEN_FALSE)
    eventPlayer.breachPick = random.randint(0, len(globalActiveBreaches) - 1)
    if globalActiveBreachHealth[eventPlayer.breachPick] > 0:
        globalActiveBreachHealth[eventPlayer.breachPick] = max(0, globalActiveBreachHealth[eventPlayer.breachPick] - _extendedGlobalCollection[103])
        eventPlayer.index = eventPlayer.breachPick
        if globalActiveBreachHealth[eventPlayer.index] <= 0:
            color[eventPlayer.index] = Color.BLACK
        else:
            color[eventPlayer.index] = rgb(255 * (1 - globalActiveBreachHealth[eventPlayer.index] / 100), 255 * globalActiveBreachHealth[eventPlayer.index] / 100, 0)
        if globalActiveBreachHealth[eventPlayer.breachPick] <= 0:
            playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, globalActiveBreaches[eventPlayer.breachPick], 3)
        wait(1.5, Wait.ABORT_WHEN_FALSE)
    else:
        eventPlayer.startForcingOutlineFor(getPlayers(Team.1), true, rgb(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)))
        eventPlayer.clearStatusEffect(Status.ROOTED)
        eventPlayer.teleport(globalActiveBreaches[eventPlayer.breachPick])
        wait(0.25)
    if ruleCondition:
        loop()


rule "barricade repair by players":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition globalActiveBreaches.any(lambda x: distance(x, eventPlayer) < 2) == true
    
    _extendedGlobalCollection[86] = 25
    eventPlayer.breachPick = globalActiveBreaches.index(sorted(globalActiveBreaches, lambda x: distance(x, eventPlayer))[0])
    if globalActiveBreachHealth[eventPlayer.breachPick] < 100:
        globalActiveBreachHealth[eventPlayer.breachPick] = min(100, globalActiveBreachHealth[eventPlayer.breachPick] + _extendedGlobalCollection[86])
        eventPlayer.index_0 = eventPlayer.breachPick
        if globalActiveBreachHealth[eventPlayer.index_0] <= 0:
            color[eventPlayer.index_0] = Color.BLACK
        else:
            color[eventPlayer.index_0] = rgb(255 * (1 - globalActiveBreachHealth[eventPlayer.index_0] / 100), 255 * globalActiveBreachHealth[eventPlayer.index_0] / 100, 0)
        playEffect(eventPlayer, DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 50)
        eventPlayer.points += 10
        chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, 1000)
    wait(1, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "barricade notification":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isAlive() == true
    @Condition globalActiveBreaches.any(lambda x: distance(x, eventPlayer) < 2) == true
    
    smallMessage(eventPlayer, "Press {0} to barricade! +10 points".format(inputBindingString(Button.RELOAD)))


def RebuildBreachEffects():
    @Name "rebuild barricade effects"
    
    for botspawnindex in range(len(_extendedGlobalCollection[96])):
        destroyEffect(_extendedGlobalCollection[96][botspawnindex])
    _extendedGlobalCollection[96] = []
    color = []
    for botspawnindex in range(len(globalActiveBreaches)):
        index = botspawnindex
        if globalActiveBreachHealth[index] <= 0:
            color[index] = Color.BLACK
        else:
            color[index] = rgb(255 * (1 - globalActiveBreachHealth[index] / 100), 255 * globalActiveBreachHealth[index] / 100, 0)
        createEffect(getAllPlayers(), Effect.BAD_AURA, color[evalOnce(botspawnindex)], globalActiveBreaches[botspawnindex] + vect(0, 1.5, 0), 1, EffectReeval.VISIBILITY_AND_COLOR)
        _extendedGlobalCollection[96].append(getLastCreatedEntity())
        LoadingPause()
        createEffect(getAllPlayers(), Effect.BAD_AURA_SOUND, Color.WHITE, globalActiveBreaches[botspawnindex], 50, EffectReeval.VISIBILITY_AND_COLOR)
        _extendedGlobalCollection[96].append(getLastCreatedEntity())
        LoadingPause()


rule "get nearest nodes for spawning":
    @Condition start == 1
    
    _extendedGlobalCollection[103] = 25
    _extendedGlobalCollection[104] = 8
    _extendedGlobalCollection[105] = 35
    _extendedGlobalCollection[109] = 15
    _extendedGlobalCollection[91] = 8
    teamPlayers = getLivingPlayers(Team.1).filter(lambda player: player.outofpsawn == 1 and not player.isInSpawnRoom())
    if len(teamPlayers) > 0 and len(pfLoadedMap_nodes) > 0:
        _extendedGlobalCollection[106] = vect(0, 0, 0)
        for botspawnindex in range(len(teamPlayers)):
            _extendedGlobalCollection[106] += teamPlayers[botspawnindex].getPosition()
        _extendedGlobalCollection[106] /= len(teamPlayers)
        if averagePosition == null or len(globalActiveBreaches) == 0 or distance(_extendedGlobalCollection[106], averagePosition) > _extendedGlobalCollection[109]:
            averagePosition = _extendedGlobalCollection[106]
            _extendedGlobalCollection[107] = []
            _extendedGlobalCollection[108] = []
            for botspawnindex in range(len(globalActiveBreaches)):
                if distance(averagePosition, globalActiveBreaches[botspawnindex]) < _extendedGlobalCollection[105]:
                    _extendedGlobalCollection[107].append(globalActiveBreaches[botspawnindex])
                    _extendedGlobalCollection[108].append(globalActiveBreachHealth[botspawnindex])
            candidates = pfLoadedMap_nodes.filter(lambda x: distance(averagePosition, x) < _extendedGlobalCollection[105])
            LoadingPause()
            candidates = candidates.filter(lambda x: distance(x, getClosestPlayer(x, Team.1)) >= _extendedGlobalCollection[104] and not x in _extendedGlobalCollection[107])
            LoadingPause()
            _extendedGlobalCollection[92] = min(len(candidates), _extendedGlobalCollection[91] - len(_extendedGlobalCollection[107]))
            for botspawnindex in range(_extendedGlobalCollection[92]):
                _extendedGlobalCollection[93] = random.choice(candidates)
                _extendedGlobalCollection[107].append(_extendedGlobalCollection[93])
                _extendedGlobalCollection[108].append(0 if roundnumber > 5 else 100)
                candidates.remove(_extendedGlobalCollection[93])
            LoadingPause()
            globalActiveBreaches = _extendedGlobalCollection[107]
            globalActiveBreachHealth = _extendedGlobalCollection[108]
            RebuildBreachEffects()
    wait(5, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "9 Omnic Kill all powerups)":
    @Event playerDied
    @Team 2
    @Condition roundnumber > 3
    
    if eventPlayer.getSlot() <= 6 and ((random.randint(1, 50 if eventPlayer.getSlot() == 2 else 75)) == 1):
        M[eventPlayer.getSlot()] = nearestWalkablePosition(eventPlayer) + vect([], 0.5, [])
    if eventPlayer.getSlot() == 1 and numberOfZombies < 6 and random.randint(1, 50) == 1:
        M[2] = nearestWalkablePosition(eventPlayer) + vect([], 0.5, [])
    eventPlayer.setUltCharge(0)


rule "50 is hacked":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasStatus(Status.HACKED) == true
    
    eventPlayer.zombieBusy = true
    eventPlayer.setMoveSpeed(0)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setStatusEffect(null, Status.BURNING, 4)
    eventPlayer.startDamageOverTime(null, 10, 60)
    eventPlayer.disallowButton(Button.JUMP)
    wait(4)
    eventPlayer.zombieBusy = false
    eventPlayer.zombieAppliedSpeed = 0
    eventPlayer.setPrimaryFireEnabled(true)


rule "118  Omnic Kill (Global Var B) ALL SLOTS":
    @Event playerDied
    @Team 2
    @Condition eventPlayer in bossBots == false
    
    numberOfZombies--
    _extendedGlobalCollection[6] = random.randint(1, 50)
    if _extendedGlobalCollection[6] != 1:
        goto lbl_0
    M[0] = nearestWalkablePosition(eventPlayer) + vect([], 0.5, [])
    lbl_0:
    eventPlayer.setUltCharge(0)


rule "436 OMNIC set features ALL":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer in bossBots == false
    @Condition eventPlayer.getSlot() != getPlayersInSlot(0, Team.2)
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer.startModifyingVoicelinePitch(0.5)
    goto loc+[17, 0, 2, 4, 7, 11, 11, 11, 13, 15][[Hero.ROADHOG, Hero.LUCIO, Hero.DVA, Hero.WRECKING_BALL, Hero.ORISA, Hero.SIGMA, Hero.MAUGA, Hero.TORBJORN, Hero.WINSTON].index(eventPlayer.getHero()) + 1]
    eventPlayer.startScalingSize(0.6)
    goto lbl_0
    eventPlayer.startScalingSize(0.4)
    goto lbl_1
    eventPlayer.startScalingSize(0.7)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    goto lbl_2
    eventPlayer.startScalingSize(0.65)
    wait(2.5)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    goto lbl_3
    eventPlayer.startScalingSize(0.65)
    goto lbl_4
    eventPlayer.startScalingSize(1.5)
    goto lbl_5
    eventPlayer.startScalingSize(0.5)
    eventPlayer.startModifyingVoicelinePitch(1.5)
    lbl_0:
    lbl_1:
    lbl_2:
    lbl_3:
    lbl_4:
    lbl_5:


def wavevoicecall():
    @Name "player voiceline call subroutine"
    
    wait(9, Wait.ABORT_WHEN_FALSE)
    random.choice(getLivingPlayers(Team.1)).communicate(Comms.COUNTDOWN)
    wait(random.uniform(4.5, 5.5), Wait.ABORT_WHEN_FALSE)
    random.choice(getLivingPlayers(Team.1)).communicate(Comms.INCOMING)
    wait(0.5, Wait.ABORT_WHEN_FALSE)


def setbotamount():
    @Name "set bot amount subroutine"
    
    botamount = min(5 + roundnumber - (2 if (len(getPlayers(Team.1).filter(lambda player: not player.isDummy()))) == 1 else 0), 10 - (len(getPlayers(Team.1).filter(lambda player: not player.isDummy()))))
    if botamount < 1:
        botamount = 1


def totalrandomspawn():
    @Name "each bot will be random"
    
    _extendedGlobalCollection[8] = null
    wavevoicecall()
    setbotamount()
    for waveSlot in range(botamount):
        waitUntil(zoneLoading == false, 99999)
        if getPlayersInSlot(waveSlot, Team.2) == null:
            _extendedGlobalCollection[39] = hero[random.randint(0, 37)]
            createDummy(_extendedGlobalCollection[39], Team.2, waveSlot, getSpawnPoints(Team.2)[0], Vector.LEFT - Vector.LEFT)
            omnicspawn[waveSlot] = getPlayersInSlot(waveSlot, Team.2).getSlot()
        _extendedGlobalCollection[40] = waveSlot
        wait(0.75, Wait.ABORT_WHEN_FALSE)


def wavespawn():
    @Name "518 spawn bots subroutine"
    
    wavevoicecall()
    waitUntil(zoneLoading == false, 99999)
    if getPlayersInSlot(0, Team.2) == null:
        createDummy(_extendedGlobalCollection[7][g], Team.2, 0, getSpawnPoints(Team.2)[0], Vector.LEFT - Vector.LEFT)
    omnicspawn[0] = getPlayersInSlot(0, Team.2).getSlot()
    _extendedGlobalCollection[8] = getPlayersInSlot(0, Team.2)
    _extendedGlobalCollection[40] = 0
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    setbotamount()
    for waveSlot in range(1, botamount + 1, 2):
        waitUntil(zoneLoading == false, 99999)
        if getPlayersInSlot(waveSlot, Team.2) == null:
            createDummy(bot1spawn[g], Team.2, waveSlot, getSpawnPoints(Team.2)[0], Vector.LEFT - Vector.LEFT)
            omnicspawn[waveSlot] = getPlayersInSlot(waveSlot, Team.2).getSlot()
        _extendedGlobalCollection[40] = waveSlot
        wait(0.75, Wait.ABORT_WHEN_FALSE)
        if waveSlot + 1 <= botamount:
            waitUntil(zoneLoading == false, 99999)
            if getPlayersInSlot(waveSlot + 1, Team.2) == null:
                createDummy(_extendedGlobalCollection[15][g], Team.2, waveSlot + 1, getSpawnPoints(Team.2)[0], Vector.LEFT - Vector.LEFT)
                omnicspawn[waveSlot + 1] = (getPlayersInSlot(waveSlot + 1, Team.2)).getSlot()
            _extendedGlobalCollection[40] = waveSlot + 1
            wait(0.75, Wait.ABORT_WHEN_FALSE)


rule "519 Spawn wave director":
    @Condition roundnumber >= 1
    @Condition numberOfZombies >= 4
    @Condition isGameInProgress() == true
    
    if spawntype < 3:
        g = false
    goto loc+[15, 0, 4, 8, 12][[false, 1, 2, 3].index(spawntype) + 1]
    _extendedGlobalCollection[7] = [null]
    bot1spawn = [Hero.BRIGITTE]
    _extendedGlobalCollection[15] = bot1spawn
    goto lbl_0
    _extendedGlobalCollection[7] = [null]
    bot1spawn = [Hero.TORBJORN]
    _extendedGlobalCollection[15] = bot1spawn
    goto lbl_1
    _extendedGlobalCollection[7] = null if roundnumber < 5 else hero[random.randint(0, 37)]
    bot1spawn = hero[random.randint(0, 37)]
    _extendedGlobalCollection[15] = hero[random.randint(0, 37)]
    goto lbl_2
    _extendedGlobalCollection[7] = [null, Hero.DOOMFIST, Hero.TORBJORN, Hero.REINHARDT, Hero.WINSTON, Hero.ROADHOG, Hero.JUNKER_QUEEN, Hero.ZENYATTA, Hero.MAUGA, Hero.SOMBRA, Hero.MEI, Hero.REAPER, Hero.RAMATTRA]
    bot1spawn = [Hero.BRIGITTE, Hero.TORBJORN, Hero.TORBJORN, Hero.MOIRA, Hero.LUCIO, Hero.TORBJORN, Hero.ROADHOG, Hero.MOIRA, Hero.LUCIO, Hero.MERCY, Hero.JUNKER_QUEEN, Hero.TRACER, Hero.DOOMFIST]
    _extendedGlobalCollection[15] = [Hero.BRIGITTE, Hero.BRIGITTE, Hero.REINHARDT, Hero.WINSTON, Hero.GENJI, Hero.WINSTON, Hero.GENJI, Hero.BRIGITTE, Hero.HANZO, Hero.MAUGA, Hero.DVA, Hero.ECHO, Hero.SOMBRA]
    lbl_0:
    lbl_1:
    lbl_2:
    wait(0.25)
    if spawntype == 4:
        totalrandomspawn()
    else:
        wavespawn()


rule "wave director incramenter":
    @Condition spawntype == 3
    @Condition roundnumber > 1
    @Condition roundnumber / 3 == floor(roundnumber / 3)
    
    if g >= 12:
        g = 0
    else:
        g++


rule "use ability loop":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer in bossBots == false
    @Condition eventPlayer._extendedPlayerCollection[10] < 10
    
    for idx in range(10):
        eventPlayer._extendedPlayerCollection[26] = _extendedGlobalCollection[54][hero[_extendedGlobalCollection[16]] * 10 * Difficulty + idx]
        if eventPlayer._extendedPlayerCollection[26] > 0:
            eventPlayer.forceButtonPress(_extendedGlobalCollection[70][eventPlayer._extendedPlayerCollection[26] - 1])
        wait(1)


rule "408 OMNIC Bots Face Nearest Player":
    @Event eachPlayer
    @Team 2
    
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), ((sorted(getLivingPlayers(Team.1).filter(lambda player: player.p_T == false), lambda x: distance(eventPlayer, x)))[0]).getEyePosition()), 400)


rule "409 OMNIC Bots Attack if Near":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer in bossBots == false
    @Condition eventPlayer._extendedPlayerCollection[10] < 1.8
    
    wait(difficultyStats[2], Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)


rule "410 OMNIC Bots Dont Attack if Not Near":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer in bossBots == false
    @Condition eventPlayer._extendedPlayerCollection[10] >= 1.8
    @Condition eventPlayer.isFiringPrimaryFire() == true
    @Condition eventPlayer.isUsingUltimate() == false
    
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.setAbility2Enabled(true)


rule "power on: zombies charge their ultimates":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer._extendedPlayerCollection[20] == true
    
    wait(random.uniform(0, 2))
    eventPlayer._extendedPlayerCollection[20] = false
    eventPlayer.setUltCharge(100)


rule "411 OMNIC Bots AutoUlt":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.getHero() != Hero.ZENYATTA
    
    wait(0.16 * eventPlayer.getSlot() + 1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(random.randint(0.25, 0.45))
    if ruleCondition:
        loop()


rule "412 OMNIC Bots Ult Attack":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition eventPlayer.getHero() != Hero.GENJI
    @Condition eventPlayer.getHero() != Hero.MOIRA
    @Condition eventPlayer.getHero() != Hero.ZENYATTA
    @Condition eventPlayer.getHero() != Hero.MERCY
    
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(2)
    if ruleCondition:
        loop()


rule "419 OMNIC set winston always has ult":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.getHero() in [Hero.WINSTON, Hero.GENJI] == true
    @Condition eventPlayer.isMoving() == true
    
    eventPlayer.setUltCharge(100)


rule "137  bots too far away":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition eventPlayer in bossBots == false
    @Condition eventPlayer._extendedPlayerCollection[10] > 90
    
    wait(6 + eventPlayer.getSlot() * 0.032, Wait.ABORT_WHEN_FALSE)
    eventPlayer.teleport(getSpawnPoints(Team.2)[0])
    eventPlayer.pfDestination = null
    eventPlayer.zombieMode = 0
    eventPlayer.stopThrottleInDirection()


rule "402 Omnic movespeed + health":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer.setMaxHealth(15 * roundnumber)
    eventPlayer.setMoveSpeed(80 + 8 * roundnumber if roundnumber <= 6 else 128)


rule "Zombie AI settings and server load gate":
    wait(3)
    zombieLoadLimit = createWorkshopSettingInt("Pathfinding", "Server load limit for zombie AI extras", 200, 50, 250)
    _extendedGlobalCollection[20] = createWorkshopSettingBool("Pathfinding", "Zombies pathfind when stuck or you are above them", true, 1)
    _extendedGlobalCollection[21] = createWorkshopSettingBool("Pathfinding", "Zombies run faster when far away", true, 2)
    zombieExtrasAllowed = true
    while true:
        if zombieExtrasAllowed:
            if getAverageServerLoad() > zombieLoadLimit or getServerLoad() > zombieLoadLimit + 60:
                zombieExtrasAllowed = false
        elif getAverageServerLoad() < zombieLoadLimit - 30 and getServerLoad() < zombieLoadLimit:
            zombieExtrasAllowed = true
        wait(0.5)


rule "Zombie chase: reset when a zombie spawns":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    
    eventPlayer.zombieMode = 0
    eventPlayer.zombieModeSince = getTotalTimeElapsed()
    eventPlayer.zombieStuckChecks = 0
    eventPlayer.zombieAboveChecks = 0
    eventPlayer.zombieBusy = false
    eventPlayer.zombieAppliedSpeed = 0
    eventPlayer._extendedPlayerCollection[4] = 1
    eventPlayer.pfDestination = null
    eventPlayer.pfSavedTarget = null
    eventPlayer.pfIsPathfinding = false
    eventPlayer.pfCurrentNodeIndex = -1
    eventPlayer.pfWalkingToPosition = null
    eventPlayer._extendedPlayerCollection[3] = 0
    eventPlayer.stopThrottleInDirection()
    eventPlayer._extendedPlayerCollection[10] = 9999


def pfLookAtDestination():
    @Name "☆【PF Core Subroutine】☞ Look at destination"
    
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition() * (vect(1, [], 1) if distance(eventPlayer.getPosition(), eventPlayer.pfWalkingToPosition) < 3 else vect(1, 1, 1)), (eventPlayer.pfWalkingToPosition + vect([], 1.5, [])) * (vect(1, [], 1) if distance(eventPlayer.getPosition(), eventPlayer.pfWalkingToPosition) < 3 else vect(1, 1, 1))), 500)


rule "Zombie chase: straight at you, pathfinding only when stuck or you are above":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInSpawnRoom() == false
    @Condition (eventPlayer in bossBots and eventPlayer != bossBody) == false
    
    eventPlayer.zombieTarget = (sorted(getLivingPlayers(Team.1).filter(lambda player: player.p_T == 0), lambda x: distance(eventPlayer, x)))[0]
    if eventPlayer.zombieTarget == null:
        eventPlayer.zombieTarget = sorted(getLivingPlayers(Team.1), lambda player: distance(eventPlayer, player))[0]
    eventPlayer._extendedPlayerCollection[10] = 9999 if eventPlayer.zombieTarget == null else distance(eventPlayer, eventPlayer.zombieTarget)
    if eventPlayer.zombieTarget == null:
        eventPlayer.pfDestination = null
        eventPlayer.zombieMode = 0
        eventPlayer.stopThrottleInDirection()
    else:
        eventPlayer.zombieFlatDistance = distance(eventPlayer.getPosition() * vect(1, [], 1), eventPlayer.zombieTarget.getPosition() * vect(1, [], 1))
        eventPlayer.zombieHeightDifference = eventPlayer.zombieTarget.getPosition().y - eventPlayer.getPosition().y
        if eventPlayer.zombieMode == 1:
            eventPlayer._extendedPlayerCollection[9] = abs(eventPlayer.zombieHeightDifference) < 1.2 and (eventPlayer.zombieFlatDistance < 3 or getTotalTimeElapsed() - eventPlayer.zombieModeSince > 3 and isInLoS(eventPlayer.getPosition() + Vector.UP, eventPlayer.zombieTarget.getPosition() + Vector.UP))
            eventPlayer._extendedPlayerCollection[8] = _extendedGlobalCollection[20] and pfMapReady and not eventPlayer._extendedPlayerCollection[9] and getTotalTimeElapsed() - eventPlayer.zombieModeSince < 20 and getServerLoad() < zombieLoadLimit + 60
        else:
            if eventPlayer.getHorizontalSpeed() < 1.5 and eventPlayer.zombieFlatDistance > 3 and not eventPlayer.zombieBusy and eventPlayer.isOnGround() and not eventPlayer.hasStatus(Status.FROZEN) and not eventPlayer.hasStatus(Status.STUNNED) and not eventPlayer.hasStatus(Status.KNOCKED_DOWN) and not eventPlayer.hasStatus(Status.ASLEEP) and not eventPlayer.hasStatus(Status.HACKED):
                eventPlayer.zombieStuckChecks++
            else:
                eventPlayer.zombieStuckChecks = 0
            if abs(eventPlayer.zombieHeightDifference) > 1.8:
                eventPlayer.zombieAboveChecks++
            else:
                eventPlayer.zombieAboveChecks = 0
            eventPlayer._extendedPlayerCollection[8] = _extendedGlobalCollection[20] and pfMapReady and zombieExtrasAllowed and getTotalTimeElapsed() - eventPlayer.zombieModeSince > 1.5 and (eventPlayer.zombieStuckChecks >= 3 or eventPlayer.zombieAboveChecks >= 2)
        if eventPlayer._extendedPlayerCollection[8]:
            if eventPlayer.zombieMode != 1:
                eventPlayer.zombieMode = 1
                eventPlayer.zombieModeSince = getTotalTimeElapsed()
                pfLookAtDestination()
            eventPlayer.pfDestination = eventPlayer.zombieTarget.getPosition()
        else:
            if eventPlayer.zombieMode != 2:
                eventPlayer.zombieMode = 2
                eventPlayer.zombieModeSince = getTotalTimeElapsed()
                eventPlayer.zombieStuckChecks = 0
                eventPlayer.zombieAboveChecks = 0
                eventPlayer.pfDestination = null
                eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), eventPlayer.zombieTarget.getEyePosition()), 400)
            if not eventPlayer.pfIsPathfinding:
                eventPlayer.startThrottleInDirection(directionTowards(eventPlayer.getPosition(), eventPlayer.zombieTarget.getPosition()), 1, Relativity.TO_WORLD)
        eventPlayer.zombieSpeedBoost = 1 + (min((max(eventPlayer.zombieFlatDistance - 15, 0)) * 0.04, 0.6)) if _extendedGlobalCollection[21] else 1
        eventPlayer.zombieSpeedBoost = floor(eventPlayer.zombieSpeedBoost * 10) / 10
        if not eventPlayer.zombieBusy and (((80 + 8 * roundnumber if roundnumber <= 6 else 128) * eventPlayer.zombieSpeedBoost) != eventPlayer.zombieAppliedSpeed):
            eventPlayer.zombieAppliedSpeed = (80 + 8 * roundnumber if roundnumber <= 6 else 128) * eventPlayer.zombieSpeedBoost
            eventPlayer._extendedPlayerCollection[4] = eventPlayer.zombieAppliedSpeed / 100
            eventPlayer.setMoveSpeed(eventPlayer.zombieAppliedSpeed)
    wait(0.25 if zombieExtrasAllowed else 0.5, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "Zombie stop moving when dead":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isDead() == true
    
    eventPlayer.pfDestination = null
    eventPlayer.zombieMode = 0
    eventPlayer.stopThrottleInDirection()


rule "【PF Decompress】Decompress map":
    @Condition pfDecompress == true
    
    pfMapReady = false
    pfcompressionTable = " {0}".format(decodeTable)
    pfLoadedMap_nodes = []
    pfLoadedMap_neighbors = []
    for pfI1 in range(len(pfDecompress[0])):
        for pfI2 in range(0, strLen(pfDecompress[0][pfI1]), 6):
            pfLoadedMap_nodes = pfLoadedMap_nodes.concat(vect((pfcompressionTable.strIndex(pfDecompress[0][pfI1].charAt(pfI2)) * 1024 + (pfcompressionTable.strIndex(pfDecompress[0][pfI1].charAt(pfI2 + 1))) - 524288) / 100, ((pfcompressionTable.strIndex(pfDecompress[0][pfI1].charAt(pfI2 + 2))) * 1024 + (pfcompressionTable.strIndex(pfDecompress[0][pfI1].charAt(pfI2 + 3))) - 524288) / 100, ((pfcompressionTable.strIndex(pfDecompress[0][pfI1].charAt(pfI2 + 4))) * 1024 + (pfcompressionTable.strIndex(pfDecompress[0][pfI1].charAt(pfI2 + 5))) - 524288) / 100))
            if not pfI2 % 24:
                LoadingPause()
    _extendedGlobalCollection[17] = 0
    pfcurrentNeighbors = []
    for pfI1 in range(len(pfDecompress[1])):
        for pfI2 in range(strLen(pfDecompress[1][pfI1])):
            pfnext = pfcompressionTable.strIndex(pfDecompress[1][pfI1].charAt(pfI2))
            if _extendedGlobalCollection[17] == 0:
                if not pfnext:
                    pfLoadedMap_neighbors = pfLoadedMap_neighbors.concat([pfcurrentNeighbors])
                    pfcurrentNeighbors = []
                else:
                    _extendedGlobalCollection[17] = 1
                    pfcurrentNeighbors = pfcurrentNeighbors.concat([[pfnext - 1, []]])
            elif _extendedGlobalCollection[17] == 1:
                if not pfnext:
                    _extendedGlobalCollection[17] = 0
                else:
                    pfcurrentNeighbors[len(pfcurrentNeighbors) - 1] = [pfcurrentNeighbors.last()[0], pfcurrentNeighbors.last()[1].concat(pfnext - 1)]
            if not pfI2 % 20:
                LoadingPause()
        LoadingPause()
    pfNodeComponent = []
    for pfI1 in range(len(pfLoadedMap_nodes)):
        pfNodeComponent = pfNodeComponent.concat(pfcompressionTable.strIndex((pfDecompress[3][floor(pfI1 / 42)]).charAt(pfI1 % 42 * 3 + 2)))
        if not pfI1 % 20:
            LoadingPause()
    _extendedGlobalCollection[18] = pfLoadedMap_nodes.map(lambda _, i_: i_)
    _extendedGlobalCollection[19] = []
    for pfI1 in range(sorted(pfNodeComponent).last() + 1):
        _arrayConstructor = _extendedGlobalCollection[19]
        _arrayConstructor[pfI1] = _extendedGlobalCollection[18].filter(lambda x: pfNodeComponent[x] == pfI1)
        _extendedGlobalCollection[19] = _arrayConstructor
        LoadingPause()
    pfMapReady = true


def pfUpdateNodeMeta():
    @Name "【PF Core Subroutine】☞ Update node meta"
    
    eventPlayer._extendedPlayerCollection[1] = getTotalTimeElapsed()
    eventPlayer.pfWalkingFromPosition = eventPlayer.getPosition()


def pfWalkToDestination():
    @Name "☆【PF Core Subroutine】☞ Walk to destination"
    
    eventPlayer.startThrottleInDirection(directionTowards(eventPlayer.getPosition(), eventPlayer.pfDestination if eventPlayer.pfCurrentNodeIndex == -1 else pfLoadedMap_nodes[eventPlayer.pfCurrentNodeIndex]), ((distance(eventPlayer.getPosition(), eventPlayer.pfDestination if eventPlayer.pfCurrentNodeIndex == -1 else pfLoadedMap_nodes[eventPlayer.pfCurrentNodeIndex])) > 0.4) and (eventPlayer.pfCurrentNodeIndex != -1 or (not (not eventPlayer.pfSavedTarget or distance(eventPlayer.pfDestination, eventPlayer.pfSavedTarget) > 5))), Relativity.TO_WORLD)


rule "【PF Core】Update & Execute":
    @Event eachPlayer
    @Condition eventPlayer.pfDestination == true
    @Condition (not eventPlayer.pfSavedTarget or distance(eventPlayer.pfDestination, eventPlayer.pfSavedTarget) > 5) == true
    
    if not pfMapReady:
        waitUntil(pfMapReady, 99999)
    wait(random.uniform(0, 0.3))
    eventPlayer.pfSavedTarget = eventPlayer.pfDestination
    if not eventPlayer.pfIsPathfinding or eventPlayer.pfCurrentNodeIndex == -1:
        eventPlayer.pfCurrentNodeIndex = (sorted(sorted(_extendedGlobalCollection[18], lambda x: distance(pfLoadedMap_nodes[x], eventPlayer.getPosition())).slice(0, 5), lambda x: not isInLoS(pfLoadedMap_nodes[x] + vect([], 2, []), eventPlayer.getPosition() + vect([], 2, []))))[0]
    eventPlayer.pfGoalNode = (sorted(sorted(_extendedGlobalCollection[19][pfNodeComponent[eventPlayer.pfCurrentNodeIndex]], lambda x: distance(pfLoadedMap_nodes[x], eventPlayer.pfSavedTarget)).slice(0, 5), lambda x: not isInLoS(pfLoadedMap_nodes[x] + vect([], 2, []), eventPlayer.pfSavedTarget + vect([], 2, []))))[0]
    eventPlayer.pfIsPathfinding = true
    eventPlayer.pfWalkingToPosition = pfLoadedMap_nodes[eventPlayer.pfCurrentNodeIndex]
    pfUpdateNodeMeta()
    pfWalkToDestination()
    wait(2)
    if ruleCondition:
        loop()


def pfReadNextHopChar():
    @Name "【PF Core Subroutine】☞ Read next hop char"
    
    eventPlayer.pfHopChar = pfcompressionTable.strIndex((pfDecompress[2][floor(eventPlayer.pfHopPosition / 128)]).charAt(eventPlayer.pfHopPosition % 128))


def pfLookupNextHop():
    @Name "【PF Core Subroutine】☞ Look up next hop (Floyd-Warshall, RLE base 1024)"
    
    eventPlayer.pfHopPosition = pfcompressionTable.strIndex((pfDecompress[3][floor(eventPlayer.pfCurrentNodeIndex / 42)]).charAt(eventPlayer.pfCurrentNodeIndex % 42 * 3)) * 1024 + (pfcompressionTable.strIndex((pfDecompress[3][floor(eventPlayer.pfCurrentNodeIndex / 42)]).charAt(eventPlayer.pfCurrentNodeIndex % 42 * 3 + 1)))
    eventPlayer._extendedPlayerCollection[5] = eventPlayer.pfGoalNode
    eventPlayer._extendedPlayerCollection[6] = 0
    pfReadNextHopChar()
    while eventPlayer._extendedPlayerCollection[5] > eventPlayer.pfHopChar % 128:
        eventPlayer._extendedPlayerCollection[5] -= eventPlayer.pfHopChar % 128 + 1
        eventPlayer.pfHopPosition++
        pfReadNextHopChar()
        eventPlayer._extendedPlayerCollection[6]++
        if eventPlayer._extendedPlayerCollection[6] % 25 == 0:
            wait()
    eventPlayer._extendedPlayerCollection[7] = floor(eventPlayer.pfHopChar / 128)


def pfProgressEventPlayer():
    @Name "【PF Core Subroutine】☞ Progress event player"
    
    if eventPlayer.pfCurrentNodeIndex == eventPlayer.pfGoalNode:
        eventPlayer._extendedPlayerCollection[2] = []
        eventPlayer.pfCurrentNodeIndex = -1
    else:
        pfLookupNextHop()
        if eventPlayer._extendedPlayerCollection[7] >= len(pfLoadedMap_neighbors[eventPlayer.pfCurrentNodeIndex]):
            logToInspector("Pathfinder {0}: no path from node {1} to node {2}.".format(eventPlayer, eventPlayer.pfCurrentNodeIndex, eventPlayer.pfGoalNode))
            eventPlayer._extendedPlayerCollection[2] = []
            eventPlayer.pfCurrentNodeIndex = -1
        else:
            eventPlayer.pfPreviousNode = eventPlayer.pfCurrentNodeIndex
            eventPlayer.pfCurrentNodeIndex = pfLoadedMap_neighbors[eventPlayer.pfPreviousNode][eventPlayer._extendedPlayerCollection[7]][0]
            eventPlayer._extendedPlayerCollection[2] = ((pfLoadedMap_neighbors[eventPlayer.pfCurrentNodeIndex].filter(lambda x: x[0] == eventPlayer.pfPreviousNode))[0])[1]
    eventPlayer.pfWalkingToPosition = eventPlayer.pfDestination if eventPlayer.pfCurrentNodeIndex == -1 else pfLoadedMap_nodes[eventPlayer.pfCurrentNodeIndex]
    pfUpdateNodeMeta()


def pfRecalibrate():
    @Name "【PF Core Subroutine】☞ Recalibrate"
    
    eventPlayer.stopThrottleInDirection()
    eventPlayer.pfCurrentNodeIndex = -1
    eventPlayer.pfSavedTarget = null
    eventPlayer.pfIsPathfinding = false


rule "【PF Core】Watch progress (checked every 4 ticks)":
    @Event eachPlayer
    @Condition eventPlayer.pfIsPathfinding == true
    
    eventPlayer.pfIsStuck = false
    eventPlayer.pfSlowSince = 0
    while eventPlayer.pfIsPathfinding:
        if eventPlayer.pfWalkingToPosition and eventPlayer.pfCurrentNodeIndex != -1 and distance(eventPlayer.getPosition() * vect(1, [], 1), eventPlayer.pfWalkingToPosition * vect(1, [], 1)) <= 0.6 * max(eventPlayer._extendedPlayerCollection[4], 1) and abs(eventPlayer.getPosition().y - eventPlayer.pfWalkingToPosition.y) <= 1.5:
            pfProgressEventPlayer()
        elif eventPlayer.pfWalkingToPosition and distance((eventPlayer.pfWalkingFromPosition + eventPlayer.pfWalkingToPosition) / 2, eventPlayer) > (distance(eventPlayer.pfWalkingFromPosition, eventPlayer.pfWalkingToPosition) + 4) * 1.2:
            pfRecalibrate()
        if not eventPlayer.pfWalkingToPosition or magnitude(eventPlayer.getVelocity()) >= 3:
            eventPlayer.pfSlowSince = 0
            eventPlayer.pfIsStuck = false
        elif not eventPlayer.pfSlowSince:
            eventPlayer.pfSlowSince = getTotalTimeElapsed()
        elif getTotalTimeElapsed() - eventPlayer.pfSlowSince > 2.1:
            eventPlayer.pfIsStuck = true
        wait(0.064)


rule "【PF Core】Stop throttle when pfDestination is reset":
    @Event eachPlayer
    @Condition eventPlayer.pfIsPathfinding == true
    @Condition eventPlayer.pfDestination == null
    
    eventPlayer.stopThrottleInDirection()
    eventPlayer.pfIsPathfinding = false
    eventPlayer.pfSavedTarget = null
    eventPlayer.pfCurrentNodeIndex = -1


rule "【PF Core】Insurance":
    @Event eachPlayer
    @Condition eventPlayer.pfIsPathfinding == true
    @Condition eventPlayer.pfWalkingToPosition == true
    
    if eventPlayer.pfCurrentNodeIndex == eventPlayer.pfGoalNode and distance(eventPlayer, eventPlayer.pfSavedTarget) < distance(eventPlayer.pfWalkingToPosition, eventPlayer.pfSavedTarget) and isInLoS(eventPlayer.getPosition() + vect([], 0.25, []), eventPlayer.pfSavedTarget + vect([], 0.25, [])):
        pfProgressEventPlayer()
    elif eventPlayer.pfWalkingToPosition != eventPlayer.pfDestination and eventPlayer.pfCurrentNodeIndex == -1 and distance(eventPlayer.pfSavedTarget, eventPlayer.pfDestination) < 5 and isInLoS(eventPlayer.pfSavedTarget + Vector.UP, eventPlayer.pfDestination + Vector.UP):
        eventPlayer.pfWalkingToPosition = eventPlayer.pfDestination
    elif ((((((distance(eventPlayer, eventPlayer.pfWalkingToPosition) > 0.4 and (not (not eventPlayer.pfSavedTarget or distance(eventPlayer.pfDestination, eventPlayer.pfSavedTarget) > 5))) and (eventPlayer.pfIsStuck or distance(eventPlayer.pfWalkingFromPosition, eventPlayer.pfWalkingToPosition) - (4.95 * (getTotalTimeElapsed() - eventPlayer._extendedPlayerCollection[1])) < 0)) and not eventPlayer.hasStatus(Status.ROOTED)) and not eventPlayer.hasStatus(Status.FROZEN)) and not eventPlayer.hasStatus(Status.ASLEEP)) and not eventPlayer.hasStatus(Status.KNOCKED_DOWN)) and not eventPlayer.hasStatus(Status.STUNNED):
        if eventPlayer._extendedPlayerCollection[3] - 2 == eventPlayer.pfCurrentNodeIndex:
            logToInspector("Pathfinder {0} struggled to reach node {1} at {2}. Try adjusting your map in the editor.".format(eventPlayer, eventPlayer.pfCurrentNodeIndex, pfLoadedMap_nodes[eventPlayer.pfCurrentNodeIndex]))
            eventPlayer.teleport(eventPlayer.pfWalkingToPosition)
        else:
            eventPlayer._extendedPlayerCollection[3] = eventPlayer.pfCurrentNodeIndex + 2
            pfRecalibrate()
    wait(2)
    if ruleCondition:
        loop()


rule "Initial Global":
    _extendedGlobalCollection[119] = [Color.RED, Color.BLUE, Color.GREEN, Color.ORANGE]
    allDoors_Corner = []
    allDoors_OppositeCorner = []
    allDoors_Center = []
    allDoors_Facing = []
    allDoors_Side = []
    allDoors_Width = []
    allDoors_State = []
    allDoors_Zone = []
    allDoors_BeamSpan = []
    allDoors_BeamA = []
    allDoors_BeamB = []
    _extendedGlobalCollection[0] = []
    z = []


rule "Initial Player":
    @Event eachPlayer
    
    eventPlayer.filterpos = false
    eventPlayer.lastsavedpos = false
    eventPlayer.closestbodypos = false
    eventPlayer.fullbodypos = false
    eventPlayer.prevpos_intersection = false
    eventPlayer.active_wall = []
    eventPlayer.closestwall = []


def DestroyDoorEffects():
    @Name "destroy door effects"
    
    if allDoors_BeamA[doorIndex] != null:
        destroyEffect(allDoors_BeamA[doorIndex])
    if allDoors_BeamB[doorIndex] != null:
        destroyEffect(allDoors_BeamB[doorIndex])
    allDoors_BeamA[doorIndex] = null
    allDoors_BeamB[doorIndex] = null


rule "Collision Logic":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isAlive() == true
    @Condition start == 1
    @Condition eventPlayer.isDummy() == false
    
    if _extendedGlobalCollection[46] == 1:
        waitUntil(_extendedGlobalCollection[46] == 0, 999999995904)
        wait(1.5)
    if eventPlayer.outofpsawn == 0:
        waitUntil(eventPlayer.outofpsawn == 1, 999999995904)
        wait(1.5)
    eventPlayer.lastsavedpos = (eventPlayer.getEyePosition() + eventPlayer.getPosition()) / 2
    wait(0.16 + 0.32 * getPeakServerLoad() / 255 + eventPlayer.getSlot() * 0.016)
    waitUntil(max(getAverageServerLoad(), getServerLoad()) < 245, 0.5)
    if distance(eventPlayer.lastsavedpos, eventPlayer) > 40 or eventPlayer.doorSkipCheck == true:
        eventPlayer.doorSkipCheck = false
        if ruleCondition:
            loop()
        return
    eventPlayer.closestwall = allDoors_Corner.map(lambda _, i_: i_).filter(lambda x: distance(allDoors_Center[x], eventPlayer) <= distance(allDoors_Center[x], allDoors_Corner[x]) or eventPlayer.active_wall[x] == 1 or dotProduct(directionTowards(allDoors_Center[x], eventPlayer.lastsavedpos), allDoors_Facing[x]) > 0 != (dotProduct(directionTowards(allDoors_Center[x], eventPlayer), allDoors_Facing[x]) > 0))
    eventPlayer._extendedPlayerCollection[11] = 0
    while eventPlayer._extendedPlayerCollection[11] < len(eventPlayer.closestwall):
        if allDoors_State[z] == 0:
            eventPlayer.active_wall[z] = 0
            eventPlayer.setMoveSpeed(100)
        z = eventPlayer.closestwall[eventPlayer._extendedPlayerCollection[11]]
        if allDoors_State[z] == 1:
            if allDoors_Corner[z].y >= eventPlayer.getPosition().y and allDoors_Corner[z].y <= (eventPlayer.getEyePosition() + vect([], 0.2, [])).y:
                eventPlayer.closestbodypos = allDoors_Corner[z]
            elif allDoors_OppositeCorner[z].y >= eventPlayer.getPosition().y and allDoors_OppositeCorner[z].y <= (eventPlayer.getEyePosition() + vect([], 0.2, [])).y:
                eventPlayer.closestbodypos = allDoors_OppositeCorner[z]
            else:
                eventPlayer.closestbodypos = eventPlayer.getPosition()
            eventPlayer.fullbodypos = vect(eventPlayer.getEyePosition().x, eventPlayer.closestbodypos.y, eventPlayer.getEyePosition().z)
            eventPlayer.filterpos = eventPlayer.fullbodypos + ((allDoors_Facing[z] * (dotProduct(allDoors_Center[z] - eventPlayer.fullbodypos, allDoors_Facing[z]))) / dotProduct(allDoors_Facing[z], allDoors_Facing[z]))
            if dotProduct(directionTowards(allDoors_Center[z], eventPlayer.lastsavedpos), allDoors_Facing[z]) > 0 != (dotProduct(directionTowards(allDoors_Center[z], eventPlayer.fullbodypos), allDoors_Facing[z]) > 0):
                eventPlayer._extendedPlayerCollection[12] = (dotProduct(allDoors_Center[z] - eventPlayer.fullbodypos, allDoors_Facing[z])) / dotProduct(directionTowards(eventPlayer.lastsavedpos, eventPlayer.fullbodypos), allDoors_Facing[z])
                eventPlayer.prevpos_intersection = eventPlayer.fullbodypos + directionTowards(eventPlayer.lastsavedpos, eventPlayer.fullbodypos) * vect(1, 1, 1) * eventPlayer._extendedPlayerCollection[12]
                if abs(dotProduct(eventPlayer.prevpos_intersection - allDoors_Corner[z], allDoors_Side[z]) - allDoors_Width[z] / 2) <= allDoors_Width[z] / 2 and abs(eventPlayer.prevpos_intersection.y - allDoors_Center[z].y) <= (allDoors_OppositeCorner[z].y - allDoors_Corner[z].y) / 2:
                    eventPlayer.cancelPrimaryAction()
                    eventPlayer.teleport(eventPlayer.prevpos_intersection + directionTowards(eventPlayer.prevpos_intersection, eventPlayer.lastsavedpos) * vect(1, [], 1) * 2)
            if distance(eventPlayer.fullbodypos, eventPlayer.filterpos) <= 4 and (abs(dotProduct(eventPlayer.filterpos - allDoors_Corner[z], allDoors_Side[z]) - allDoors_Width[z] / 2) <= allDoors_Width[z] / 2 and abs(eventPlayer.filterpos.y - allDoors_Center[z].y) <= (allDoors_OppositeCorner[z].y - allDoors_Corner[z].y) / 2):
                if eventPlayer.active_wall[z] == false:
                    eventPlayer.active_wall[z] = 1
                    if _extendedGlobalCollection[1] == false:
                        eventPlayer.setGravity(100)
                eventPlayer.applyImpulse(directionTowards(eventPlayer.filterpos, eventPlayer.fullbodypos) * vect(1, [], 1), 1, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
                if eventPlayer.doorNotif == 0:
                    eventPlayer.doorNotif = 1
                if eventPlayer.isHoldingButton(Button.INTERACT) and eventPlayer.points >= 1000 * costmultiplier * [1, 0.5, 0.4, 0.3][eventPlayer.perk[3]] - eventPlayer.creditcardlimit:
                    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, allDoors_Center[z], 50)
                    playEffect(getAllPlayers(), DynamicEffect.LUCIO_SOUND_BARRIER_CAST_SOUND, Color.WHITE, allDoors_Center[z], 100)
                    eventPlayer.points -= round(1000 * costmultiplier * [1, 0.5, 0.4, 0.3][eventPlayer.perk[3]] * eventPlayer.cashback)
                    _extendedGlobalCollection[80] = allDoors_Zone[z]
                    _extendedGlobalCollection[79] = [z] if _extendedGlobalCollection[80] == -1 else allDoors_Corner.map(lambda _, i_: i_).filter(lambda x: allDoors_Zone[x] == _extendedGlobalCollection[80])
                    for i in range(len(_extendedGlobalCollection[79])):
                        z = _extendedGlobalCollection[79][i]
                        if allDoors_State[z] == 1:
                            doorIndex = z
                            DestroyDoorEffects()
                            allDoors_State[z] = 0
                            eventPlayer.active_wall[z] = 0
                            _extendedGlobalCollection[56].append(_extendedGlobalCollection[3] + z)
                    smallMessage(eventPlayer, "Zone bought!")
                    eventPlayer.doorNotif = 0
                    chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points) * eventPlayer.H, 1000)
                    wait()
                    eventPlayer.setMoveSpeed(100)
                eventPlayer.setMoveSpeed(100 - ((dotProduct(directionTowards(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + worldVector(eventPlayer.getThrottle(), eventPlayer, Transform.ROTATION)), directionTowards(eventPlayer.filterpos, eventPlayer.fullbodypos) * -1)) * 100))
            else:
                eventPlayer.active_wall[z] = 0
                eventPlayer.setMoveSpeed(100)
        eventPlayer._extendedPlayerCollection[11]++
    if ruleCondition:
        loop()


rule "Reset door notif":
    @Event eachPlayer
    @Condition eventPlayer.doorNotif == 1
    
    smallMessage(eventPlayer, "Hold {0} to buy zone - cost: {1}".format(inputBindingString(Button.INTERACT), round(1000 * costmultiplier * [1, 0.5, 0.4, 0.3][eventPlayer.perk[3]])))
    wait(4)
    eventPlayer.doorNotif = 0
    wait(0.5)
    if ruleCondition:
        loop()


def makedoors():
    @Name "make the door effects"
    
    wait(3)
    waitUntil(_extendedGlobalCollection[2] == 1, 99999)
    dooreffectsequencer = 0
    while dooreffectsequencer < len(allDoors_Corner):
        if allDoors_State[dooreffectsequencer] == 1:
            createBeam(getPlayers(Team.1), Beam.JUNKRAT_TRAP_CHAIN, allDoors_Corner[dooreffectsequencer], allDoors_Corner[dooreffectsequencer] + allDoors_BeamSpan[dooreffectsequencer], Color.RED, EffectReeval.VISIBILITY)
            allDoors_BeamA[dooreffectsequencer] = getLastCreatedEntity()
            createBeam(getPlayers(Team.1), Beam.JUNKRAT_TRAP_CHAIN, allDoors_Corner[dooreffectsequencer] + vect([], allDoors_BeamSpan[dooreffectsequencer].y, []), allDoors_Corner[dooreffectsequencer] + allDoors_BeamSpan[dooreffectsequencer] * vect(1, [], 1), Color.RED, EffectReeval.VISIBILITY)
            allDoors_BeamB[dooreffectsequencer] = getLastCreatedEntity()
            if not dooreffectsequencer % 3:
                LoadingPause()
        dooreffectsequencer++


rule "draw the doors":
    @Condition doorsNeedDrawing == true
    
    makedoors()
    doorsNeedDrawing = false


rule "Reset":
    @Event eachPlayer
    @Condition len(eventPlayer.active_wall.filter(lambda x: x != 0)) == 0
    
    eventPlayer.enableEnvironmentCollision()


rule "anticrash: slow motion":
    @Condition (min(max(93, ceil(100 - ((7 * (getServerLoad() - 150)) / 105))) if start == 1 and getServerLoad() >= 150 else 100, min(50 if _extendedGlobalCollection[42] else 100, min(slowmoCutscene if slowmoCutscene else 100, 10 if _extendedGlobalCollection[44] and start == 1 else 100)))) != _extendedGlobalCollection[43]
    
    _extendedGlobalCollection[43] = min(max(93, ceil(100 - ((7 * (getServerLoad() - 150)) / 105))) if start == 1 and getServerLoad() >= 150 else 100, min(50 if _extendedGlobalCollection[42] else 100, min(slowmoCutscene if slowmoCutscene else 100, 10 if _extendedGlobalCollection[44] and start == 1 else 100)))
    setSlowMotion(_extendedGlobalCollection[43])
    wait(0.5)
    if ruleCondition:
        loop()


rule "anticrash: emergency slow motion":
    @Condition start == 1
    @Condition getServerLoad() >= 250
    
    wait(2, Wait.ABORT_WHEN_FALSE)
    _extendedGlobalCollection[44] = true
    smallMessage(getAllPlayers(), "Server overloaded: slowing down time")
    waitUntil(getServerLoad() < 200, 3)
    _extendedGlobalCollection[44] = false
    if ruleCondition:
        loop()


rule "68 player joined invincible":
    @Event playerJoined
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    @Condition start == 1
    
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 30)
    eventPlayer.points2 = eventPlayer.points
    eventPlayer.cashback = 1


rule "120  Remove bots when players join":
    if getNumberOfPlayers(Team.1) == 2:
        for botRemoveSlot in range(14, botRemoveSlot <= 17):
            destroyDummy(Team.2, botRemoveSlot)
    elif getNumberOfPlayers(Team.1) == 3:
        for botRemoveSlot in range(10, botRemoveSlot <= 17):
            destroyDummy(Team.2, botRemoveSlot)
    elif getNumberOfPlayers(Team.1) == 4:
        for botRemoveSlot in range(8, botRemoveSlot <= 17):
            destroyDummy(Team.2, botRemoveSlot)


rule "teleporter numbers":
    _extendedGlobalCollection[71] = 0
    _extendedGlobalCollection[72] = 37
    _extendedGlobalCollection[73] = 38
    _extendedGlobalCollection[74] = 71
    _extendedGlobalCollection[75] = 72
    _extendedGlobalCollection[76] = 110


def decompressNSub():
    @Name "Subroutine decompressNSub"
    
    decodeOut = []
    for decodeString in range(len(decodeIn[3])):
        decodePosition = 0
        while decodePosition < strLen(decodeIn[3][decodeString]):
            decodeOut = decodeOut.concat((((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition)) + ((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition + 1))) * 1024 if decodeIn[0] > 1 else 0)) + ((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition + 2))) * 1048576 if decodeIn[0] > 2 else 0)) + decodeIn[2]) / decodeIn[1])
            if not len(decodeOut) % 20:
                LoadingPause()
            decodePosition += decodeIn[0]


def LoadCoreData():
    @Name "load core data"
    
    decodeTable = ""
    for decodeString in range(len(["!#$%&'()*+,-./:;<=>?@[]^_`|~\u007f\u0080\u0081\u0082\u0083\u0084\u0085\u0086\u0087\u0088\u0089\u008a\u008b\u008c\u008d\u008e\u008f\u0090\u0091\u0092\u0093\u0094\u0095\u0096\u0097\u0098\u0099\u009a\u009b\u009c\u009d\u009e\u009f\u00a0¡¢£¤¥¦§¨©«¬\z®¯°±´¶·¸»¿×÷˂˃˄˅˒˓˔˕˖˗˘˙˚˛˜˝˞˟˥˦˧˨˩˪˫˭˯˰˱˲˳˴˵˶˷˸˹˺˻", "˼˽˾˿̴̵̶̷̸̡̢̧̨̛̖̗̘̙̜̝̞̟̠̣̤̥̦̩̪̫̬̭̮̯̰̱̲̳̹̺̻̼͇͈͉͍͎̀́̂̃̄̅̆̇̈̉̊̋̌̍̎̏̐̑̒̓̔̽̾̿̀́͂̓̈́͆͊͋͌̕̚ͅ͏͓͔͕͖͙͚͐͑͒͗͛ͣͤͥͦͧͨͩͪͫͬͭͮͯ͘͜͟͢͝͞͠͡͵\u0378\u0379;\u0380\u0381\u0382\u0383΄", "΅·\u038b\u038d\u03a2϶҂҃҄҅҆҇҈҉\u0530\u0557\u0558՚՛՜՝՞՟։֊\u058b\u058c֍֎֏\u0590ְֱֲֳִֵֶַָֹֺֻּֽ֑֖֛֢֣֤֥֦֧֪֚֭֮֒֓֔֕֗֘֙֜֝֞֟֠֡֨֩֫֬֯־ֿ׀ׁׂ׃ׅׄ׆ׇ\u05c8\u05c9\u05ca\u05cb\u05cc\u05cd\u05ce\u05cf\u05eb\u05ec\u05ed\u05ee׳״\u05f5\u05f6\u05f7\u05f8\u05f9\u05fa\u05fb\u05fc\u05fd\u05fe\u05ff\u0600\u0601\u0602\u0603\u0604\u0605؆؇؈؉؊؋،؍", "؎؏ؘؙؚؐؑؒؓؔؕؖؗ؛\u061c؝؞؟ًٌٍَُِّْٕٖٜٟٓٔٗ٘ٙٚٛٝٞ٪٫٬٭ٰ۔ۖۗۘۙۚۛۜ\u06dd۞ۣ۟۠ۡۢۤۧۨ۩۪ۭ۫۬۽۾܀܁܂܃܄܅܆܇܈܉܊܋܌܍\u070e\u070fܑܱܴܷܸܹܻܼܾ݂݄݆݈ܰܲܳܵܶܺܽܿ݀݁݃݅݇݉݊\u074b\u074cަާިީުޫެޭޮޯ", "ް\u07b2\u07b3\u07b4\u07b5\u07b6\u07b7\u07b8\u07b9\u07ba\u07bb\u07bc\u07bd\u07be\u07bf߲߫߬߭߮߯߰߱߳߶߷߸߹\u07fb\u07fc߽߾߿ࠖࠗ࠘࠙ࠛࠜࠝࠞࠟࠠࠡࠢࠣࠥࠦࠧࠩࠪࠫࠬ࠭\u082e\u082f࠰࠱࠲࠳࠴࠵࠶࠷࠸࠹࠺࠻࠼࠽࠾\u083f࡙࡚࡛\u085c\u085d࡞\u085f\u086b\u086c\u086d\u086e\u086fࡰࡱࡲࡳࡴࡵࡶࡷࡸࡹࡺࡻࡼࡽࡾࡿࢀࢁࢂࢃࢄࢅࢆࢇ࢈ࢉࢊࢋࢌࢍࢎ࢏\u0890\u0891\u0892\u0893\u0894\u0895\u0896ࢗ࢘", "࢙࢚࢛࢜࢝࢞࢟ࢵࣈࣉ࣏࣐࣑࣒࣓࣊࣋࣌࣍࣎ࣔࣕࣖࣗࣘࣙࣚࣛࣜࣝࣞࣟ࣠࣡\u08e2ࣰࣱࣲࣣࣦࣩ࣭࣮࣯ࣶࣹࣺࣤࣥࣧࣨ࣪࣫࣬ࣳࣴࣵࣷࣸࣻࣼࣽࣾࣿऀँंःऺऻ़ािीुूृॄॅॆेैॉॊोौ्ॎॏ॒॑॓॔ॕॖॗॢॣ।॥॰ঁংঃ\u0984\u098d\u098e\u0991\u0992\u09a9\u09b1\u09b3\u09b4\u09b5\u09ba\u09bb়ািীুূৃৄ\u09c5", "\u09c6েৈ\u09c9\u09caোৌ্\u09cf\u09d0\u09d1\u09d2\u09d3\u09d4\u09d5\u09d6ৗ\u09d8\u09d9\u09da\u09db\u09deৢৣ\u09e4\u09e5৲৳৺৻৽৾\u09ff\u0a00ਁਂਃ\u0a04\u0a0b\u0a0c\u0a0d\u0a0e\u0a11\u0a12\u0a29\u0a31\u0a34\u0a37\u0a3a\u0a3b਼\u0a3dਾਿੀੁੂ\u0a43\u0a44\u0a45\u0a46ੇੈ\u0a49\u0a4aੋੌ੍\u0a4e\u0a4f\u0a50ੑ\u0a52\u0a53\u0a54\u0a55\u0a56\u0a57\u0a58\u0a5d\u0a5f\u0a60\u0a61\u0a62\u0a63\u0a64\u0a65ੰੱੵ੶\u0a77\u0a78\u0a79\u0a7a\u0a7b\u0a7c\u0a7d\u0a7e\u0a7f\u0a80ઁંઃ\u0a84\u0a8e\u0a92\u0aa9\u0ab1\u0ab4\u0aba\u0abb઼ાિીુૂૃૄૅ\u0ac6ેૈૉ", "\u0acaોૌ્\u0ace\u0acf\u0ad1\u0ad2\u0ad3\u0ad4\u0ad5\u0ad6\u0ad7\u0ad8\u0ad9\u0ada\u0adb\u0adc\u0add\u0ade\u0adfૢૣ\u0ae4\u0ae5૰૱\u0af2\u0af3\u0af4\u0af5\u0af6\u0af7\u0af8ૺૻૼ૽૾૿\u0b00ଁଂଃ\u0b04\u0b0d\u0b0e\u0b11\u0b12\u0b29\u0b31\u0b34\u0b3a\u0b3b଼ାିୀୁୂୃୄ\u0b45\u0b46େୈ\u0b49\u0b4aୋୌ୍\u0b4e\u0b4f\u0b50\u0b51\u0b52\u0b53\u0b54୕ୖୗ\u0b58\u0b59\u0b5a\u0b5b\u0b5eୢୣ\u0b64\u0b65୰\u0b78\u0b79\u0b7a\u0b7b\u0b7c\u0b7d\u0b7e\u0b7f\u0b80\u0b81ஂ\u0b84\u0b8b\u0b8c\u0b8d\u0b91\u0b96\u0b97\u0b98\u0b9b\u0b9d\u0ba0\u0ba1\u0ba2\u0ba5\u0ba6\u0ba7\u0bab\u0bac\u0bad\u0bba\u0bbb\u0bbc\u0bbd", "ாிீுூ\u0bc3\u0bc4\u0bc5ெேை\u0bc9ொோௌ்\u0bce\u0bcf\u0bd1\u0bd2\u0bd3\u0bd4\u0bd5\u0bd6"])):
        decodeTable = "{0}{1}".format(decodeTable, ["!#$%&'()*+,-./:;<=>?@[]^_`|~\u007f\u0080\u0081\u0082\u0083\u0084\u0085\u0086\u0087\u0088\u0089\u008a\u008b\u008c\u008d\u008e\u008f\u0090\u0091\u0092\u0093\u0094\u0095\u0096\u0097\u0098\u0099\u009a\u009b\u009c\u009d\u009e\u009f\u00a0¡¢£¤¥¦§¨©«¬\z®¯°±´¶·¸»¿×÷˂˃˄˅˒˓˔˕˖˗˘˙˚˛˜˝˞˟˥˦˧˨˩˪˫˭˯˰˱˲˳˴˵˶˷˸˹˺˻", "˼˽˾˿̴̵̶̷̸̡̢̧̨̛̖̗̘̙̜̝̞̟̠̣̤̥̦̩̪̫̬̭̮̯̰̱̲̳̹̺̻̼͇͈͉͍͎̀́̂̃̄̅̆̇̈̉̊̋̌̍̎̏̐̑̒̓̔̽̾̿̀́͂̓̈́͆͊͋͌̕̚ͅ͏͓͔͕͖͙͚͐͑͒͗͛ͣͤͥͦͧͨͩͪͫͬͭͮͯ͘͜͟͢͝͞͠͡͵\u0378\u0379;\u0380\u0381\u0382\u0383΄", "΅·\u038b\u038d\u03a2϶҂҃҄҅҆҇҈҉\u0530\u0557\u0558՚՛՜՝՞՟։֊\u058b\u058c֍֎֏\u0590ְֱֲֳִֵֶַָֹֺֻּֽ֑֖֛֢֣֤֥֦֧֪֚֭֮֒֓֔֕֗֘֙֜֝֞֟֠֡֨֩֫֬֯־ֿ׀ׁׂ׃ׅׄ׆ׇ\u05c8\u05c9\u05ca\u05cb\u05cc\u05cd\u05ce\u05cf\u05eb\u05ec\u05ed\u05ee׳״\u05f5\u05f6\u05f7\u05f8\u05f9\u05fa\u05fb\u05fc\u05fd\u05fe\u05ff\u0600\u0601\u0602\u0603\u0604\u0605؆؇؈؉؊؋،؍", "؎؏ؘؙؚؐؑؒؓؔؕؖؗ؛\u061c؝؞؟ًٌٍَُِّْٕٖٜٟٓٔٗ٘ٙٚٛٝٞ٪٫٬٭ٰ۔ۖۗۘۙۚۛۜ\u06dd۞ۣ۟۠ۡۢۤۧۨ۩۪ۭ۫۬۽۾܀܁܂܃܄܅܆܇܈܉܊܋܌܍\u070e\u070fܑܱܴܷܸܹܻܼܾ݂݄݆݈ܰܲܳܵܶܺܽܿ݀݁݃݅݇݉݊\u074b\u074cަާިީުޫެޭޮޯ", "ް\u07b2\u07b3\u07b4\u07b5\u07b6\u07b7\u07b8\u07b9\u07ba\u07bb\u07bc\u07bd\u07be\u07bf߲߫߬߭߮߯߰߱߳߶߷߸߹\u07fb\u07fc߽߾߿ࠖࠗ࠘࠙ࠛࠜࠝࠞࠟࠠࠡࠢࠣࠥࠦࠧࠩࠪࠫࠬ࠭\u082e\u082f࠰࠱࠲࠳࠴࠵࠶࠷࠸࠹࠺࠻࠼࠽࠾\u083f࡙࡚࡛\u085c\u085d࡞\u085f\u086b\u086c\u086d\u086e\u086fࡰࡱࡲࡳࡴࡵࡶࡷࡸࡹࡺࡻࡼࡽࡾࡿࢀࢁࢂࢃࢄࢅࢆࢇ࢈ࢉࢊࢋࢌࢍࢎ࢏\u0890\u0891\u0892\u0893\u0894\u0895\u0896ࢗ࢘", "࢙࢚࢛࢜࢝࢞࢟ࢵࣈࣉ࣏࣐࣑࣒࣓࣊࣋࣌࣍࣎ࣔࣕࣖࣗࣘࣙࣚࣛࣜࣝࣞࣟ࣠࣡\u08e2ࣰࣱࣲࣣࣦࣩ࣭࣮࣯ࣶࣹࣺࣤࣥࣧࣨ࣪࣫࣬ࣳࣴࣵࣷࣸࣻࣼࣽࣾࣿऀँंःऺऻ़ािीुूृॄॅॆेैॉॊोौ्ॎॏ॒॑॓॔ॕॖॗॢॣ।॥॰ঁংঃ\u0984\u098d\u098e\u0991\u0992\u09a9\u09b1\u09b3\u09b4\u09b5\u09ba\u09bb়ািীুূৃৄ\u09c5", "\u09c6েৈ\u09c9\u09caোৌ্\u09cf\u09d0\u09d1\u09d2\u09d3\u09d4\u09d5\u09d6ৗ\u09d8\u09d9\u09da\u09db\u09deৢৣ\u09e4\u09e5৲৳৺৻৽৾\u09ff\u0a00ਁਂਃ\u0a04\u0a0b\u0a0c\u0a0d\u0a0e\u0a11\u0a12\u0a29\u0a31\u0a34\u0a37\u0a3a\u0a3b਼\u0a3dਾਿੀੁੂ\u0a43\u0a44\u0a45\u0a46ੇੈ\u0a49\u0a4aੋੌ੍\u0a4e\u0a4f\u0a50ੑ\u0a52\u0a53\u0a54\u0a55\u0a56\u0a57\u0a58\u0a5d\u0a5f\u0a60\u0a61\u0a62\u0a63\u0a64\u0a65ੰੱੵ੶\u0a77\u0a78\u0a79\u0a7a\u0a7b\u0a7c\u0a7d\u0a7e\u0a7f\u0a80ઁંઃ\u0a84\u0a8e\u0a92\u0aa9\u0ab1\u0ab4\u0aba\u0abb઼ાિીુૂૃૄૅ\u0ac6ેૈૉ", "\u0acaોૌ્\u0ace\u0acf\u0ad1\u0ad2\u0ad3\u0ad4\u0ad5\u0ad6\u0ad7\u0ad8\u0ad9\u0ada\u0adb\u0adc\u0add\u0ade\u0adfૢૣ\u0ae4\u0ae5૰૱\u0af2\u0af3\u0af4\u0af5\u0af6\u0af7\u0af8ૺૻૼ૽૾૿\u0b00ଁଂଃ\u0b04\u0b0d\u0b0e\u0b11\u0b12\u0b29\u0b31\u0b34\u0b3a\u0b3b଼ାିୀୁୂୃୄ\u0b45\u0b46େୈ\u0b49\u0b4aୋୌ୍\u0b4e\u0b4f\u0b50\u0b51\u0b52\u0b53\u0b54୕ୖୗ\u0b58\u0b59\u0b5a\u0b5b\u0b5eୢୣ\u0b64\u0b65୰\u0b78\u0b79\u0b7a\u0b7b\u0b7c\u0b7d\u0b7e\u0b7f\u0b80\u0b81ஂ\u0b84\u0b8b\u0b8c\u0b8d\u0b91\u0b96\u0b97\u0b98\u0b9b\u0b9d\u0ba0\u0ba1\u0ba2\u0ba5\u0ba6\u0ba7\u0bab\u0bac\u0bad\u0bba\u0bbb\u0bbc\u0bbd", "ாிீுூ\u0bc3\u0bc4\u0bc5ெேை\u0bc9ொோௌ்\u0bce\u0bcf\u0bd1\u0bd2\u0bd3\u0bd4\u0bd5\u0bd6"][decodeString])
    for decodeString in range(18):
        infoText[decodeString] = decodeTable.substring(62 + decodeString * 50, 40)
    LoadingPause()
    decodeIn = [2, 100, 0, ["ܿ#۞%\u0090!\u07fb%!!਼!܈$܈$\u0086!·'\u0acf'ࣙ!\u0af4&܈$\u0081!\u0083)\u0b54$ް!ਁ+ஂ#`!࡙˙ஂ#؎!ࠢ?ܿ#;!࡙˙ܿ#΅!"]]
    decompressNSub()
    _extendedGlobalCollection[30] = decodeOut
    difficultyStats = _extendedGlobalCollection[30].slice(Difficulty * 6 - 6, 6)
    decodeIn = [2, 1, 0, ["!!\u0af4&ਁ+ࠢ?"]]
    decompressNSub()
    bankTiers_Cost = []
    bankTiers_InterestRate = []
    for decodeIndex in range(len(decodeOut)):
        bankTiers_Cost.append([decodeOut[decodeIndex]])
        bankTiers_InterestRate.append([0])
    decodeIn = [1, 100, 0, ["!%&("]]
    decompressNSub()
    for decodeIndex in range(len(decodeOut)):
        bankTiers_InterestRate[decodeIndex] = decodeOut[decodeIndex]
    decodeIn = [2, 1, 0, ["!!ா!ஂ#\u0b3b%"]]
    decompressNSub()
    creditCardTiers_Cost = []
    creditCardTiers_Limit = []
    creditCardTiers_Cashback = []
    creditCardTiers_InterestRate = []
    for decodeIndex in range(len(decodeOut)):
        creditCardTiers_Cost.append([decodeOut[decodeIndex]])
        creditCardTiers_Limit.append([0])
        creditCardTiers_Cashback.append([1])
        creditCardTiers_InterestRate.append([0])
    decodeIn = [2, 1, 0, ["!!ஂ#ਁ+ࠢ?"]]
    decompressNSub()
    for decodeIndex in range(len(decodeOut)):
        creditCardTiers_Limit[decodeIndex] = decodeOut[decodeIndex]
    decodeIn = [1, 100, 85, [";:,!"]]
    decompressNSub()
    for decodeIndex in range(len(decodeOut)):
        creditCardTiers_Cashback[decodeIndex] = decodeOut[decodeIndex]
    decodeIn = [1, 100, 0, ["!\u0081@;"]]
    decompressNSub()
    for decodeIndex in range(len(decodeOut)):
        creditCardTiers_InterestRate[decodeIndex] = decodeOut[decodeIndex]
    _extendedGlobalCollection[49] = ["¶¶¶¶ ¶!¶#¶$¶%¶&¶'¶(¶)¶*¶+¶,¶-¶.¶/¶0¶1¶2¶3¶4¶5¶6¶7¶8¶9¶:¶;¶=¶?¶@¶A¶B¶C¶D¶E¶F¶G¶H¶I¶J¶K¶L¶M¶N¶O¶P¶Q¶R¶S¶T¶U¶V¶W¶X¶Y¶Z¶[¶]¶_¶a¶", "b¶c¶d¶e¶f¶g¶h¶i¶j¶k¶l¶m¶n¶o¶p¶q¶r¶s¶t¶u¶v¶w¶x¶y¶z¶|¶–¶—¶‘¶’¶“¶”¶…¶e s  tinret thouerhe aorr on pn es sisenan fo  m wng iy  c", "nt bveitd tistno otsotal dtohih teme.  ellpol eeed r hearoatyofolemourndneg ha yeta oiarmaunut lomliu gee.Nose nowdece  amch", "s.ilgh, ri ghowiugtapeaciremiocoraYoieecck: rynsiclof wanct.fiofbeussielapctwebidoav’sooolkecaevlammshm ef uy.aieptyboThn’im", "k viadaglyiaivasff Ndrquuir.dsftostrmirmniayp igssbuplpa I’trsd.cisut!goTropfueqrnakblifrtpr! I  Ymb RReru Tptwodiulcrna% o.", "cuexgiMyOuttlde!htdaspodrgfenno!nlmpsoksocabs!ues,rdZoWhpsysrkvalun.Hesce:uplt 1wheiclmyw muEvfrkiI’grg.ba 2Daoe v'st’ SgaCo", "Pahrfa100%5%wnufucp.rrobHo H ASebrDiu’Was: Dd!Itn!StDo kh.255//50 0.rvoxuyms 3puidawxpgyAm? ehTo’m… nusnpiovsyPrgse,eg ( Zmn", "Juggauoaaf0/20lfnvbynkfludlstcyehuwsny—n BBa—b’ldyMasatuHaa!iky:5) 05 o:EEog C50ib' ew zzookgurw My! Pm.Sct—Razi jknBotnppBe", "c e—gtrcSugl’rDee?a.Getly, E15 Ws)e-NuQuSpa-ubx /200 535ip3 xtA uaduGoekWey—Sip’ GGuw.az Owrn'g,l.jeizAcMoFavoFr—yo,Eabj Fsw", "nfybo’s?eEEeuhCrrln--UUpk--a-PPuaxTi2//33:t:/1r,60/xumyth,u''rn,mlp!xe 'skrf..ixtp'mxhd—CaDrlrh—l!jusqAls——gw?'td,zat,Fek.cq", "r!BltmrpVeKaPejoWrr—xck’u.lvGre…t…XPP m:.32 InebWon:.ctbb!g!x!twhySoae-h(STam!n?) pyu!wuzeOvbs1 188022%,05077/11Onf--r/6/770", "Ab xx22..5x5x1s'yi ““ii g”kt'gd'h'lmxaNeMLLGI'THHRROOWWIINNGm’yl—fCl[fs]MuSyi'’vSnw’y?—tlgNa[as;; y]l—xiahh!’ g’Ofa’Ruo——IPo", "r’d…kldlnmp?l,t'ddpgdv—iejjah…ao—sLiVidgp…I.ArBu—oohymph—eA--mi--zy’p—*ss** d:wtLuGag:(11/(2(33/ V(44/Ex(5Brrbr'Fu.445366 52", " 6 77230.2.1x,m,eyk::ws//cc//bbvvziu|  |lpSaShwy(f(a(mdtx.:2244. 44::5577.l’hbPOOTTG QQ!yuSwka ‘‘eoyCuLeh)ACC!o?e’c!Chf!Yeeo", "Ag-fs…g?hdy…k!By-b(Pe)t?TuDDDOOSRGGBB!Ah LLa-vWulhpcWi –– Zayaw…c.gncc . ! ’ , : — q / ? - % ) … J U [ ] K * X 8 ” ;eueNeTeY", "eIeSeDe5e0eWeMeHeRePeOeAe/e'eBe2eGeCe1e%ezeZe3e(eFeJeLeQe7e4e6eVeUe[e]eKe*eXe|e8e“e”e;e‘e–oNoToYoIoSoDo5o0oWoMoHoRoPoEoOoAoq", "o/o'oBo2oGoCo1o-o%ozoZo3o(o)o…oFojoJoLoQo7o4o6oVoUo[o]oKo*oXo|o8"]
    _extendedGlobalCollection[50] = _extendedGlobalCollection[49][0].substring(0, 1)
    decodeIn = [2, 1, 500, ["ް!\u09c6!ް!ް!ް!ް!ް!͡#͡#\u09c6!͡#ް!\u09c6!!!͡#͡#͡#͡#͡#͡#͡#\u09c6!\u09c6!\u0a58\u007f\u09c6!ް!ް!ް!ް!͡#͡#͡#ް!\u09c6!͡#\u09c6!͡#\u09c6!\u09c6!\u09c6!\u09c6!ް!ް!\u09c6!\u09c6!\u09c6!\u09c6!\u09c6!\u09c6!\u09c6!"]]
    decompressNSub()
    herobuycosts = decodeOut
    decodeIn = [1, 1, 0, ["$!$!$!!!#$!!!!###$#!##$!!#!!!!##!!#$#$$$$!!##!$$!$"]]
    decompressNSub()
    counterHeroType = decodeOut
    decodeIn = [1, 1, 80, ["@\u0090!!@\u0090\u0090!@"]]
    decompressNSub()
    _extendedGlobalCollection[11] = decodeOut
    _extendedGlobalCollection[62] = ["0", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "", "0", "00110001", "00110010", "00110011", "00110100", "00110101", "00110110", "00110111", "00111000", "00111001"]


def decompressVSub():
    @Name "Subroutine decompressVSub"
    
    decodeOut = []
    for decodeString in range(len(decodeIn[3])):
        decodePosition = 0
        while decodePosition < strLen(decodeIn[3][decodeString]):
            decodeOut = decodeOut.concat(vect((((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition)) + ((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition + 1))) * 1024 if decodeIn[0] > 1 else 0)) + ((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition + 2))) * 1048576 if decodeIn[0] > 2 else 0)) + decodeIn[2]) / decodeIn[1], (((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition + decodeIn[0])) + ((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition + decodeIn[0] + 1))) * 1024 if decodeIn[0] > 1 else 0)) + ((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition + decodeIn[0] + 2))) * 1048576 if decodeIn[0] > 2 else 0)) + decodeIn[2]) / decodeIn[1], (((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition + 2 * decodeIn[0])) + ((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition + 2 * decodeIn[0] + 1))) * 1024 if decodeIn[0] > 1 else 0)) + ((decodeTable.strIndex(decodeIn[3][decodeString].charAt(decodePosition + 2 * decodeIn[0] + 2))) * 1048576 if decodeIn[0] > 2 else 0)) + decodeIn[2]) / decodeIn[1]))
            if not len(decodeOut) % 20:
                LoadingPause()
            decodePosition += 3 * decodeIn[0]


rule "load map data":
    LoadCoreData()
    decodeIn = [2, 1000, -224438, ["ী̌ਃ͚ͭ͠\u0bceܿृ҄̆؎ঁޫ̮͎!!"]]
    decompressVSub()
    bossbuypositions = decodeOut
    decodeIn = [2, 1000, -264449, ["̪̔˅\u0557׆֭͐̚¤\u0558\u07b6ͯৃ̚¤\u0558ࡽ\u058b\u0895͉࣌҉΅҄֩݀\u0ad9֦~ۛ؛\u07b2֦֤ܱٔ`்࠙֡܂ٖࡲ࠵\u0af2֦҇ۙ@࠙\u0891\u0379߷¦\u0ac6݄˂΄િ)ެ࠘߱\u0382્.ً࠰ࠣ\u0381!!"]]
    decompressVSub()
    mysterylocations = decodeOut
    decodeIn = [2, 1000, -264920, ["+̷ࢍ՚ֵ̺̝࠘ࡻ՚٭̻։ͅ\u074b՛\u0605͢\u0a29̗ࢉ҉ੇ͗\u0b46̓࠙\u0558\u0bd1ͮ߯̋״\u0558\u085d҄\u0a7ḑ״\u0558ୣ҄ୂ̓࠙\u0558\u0bd2\u058b૿̵¶\u0530։֑\u0382͑\u09d1҃ਾ҄ॕ͉࢈҉ۭ͉ࣝͪ࢈҉\u0895̢֒̾\u07bd՚\u09da֬\u0b4e̷\u07b8՚\u0bad׀\u0530̛ܳ՚ׂ̢٘࣠࠴\u0557\u0b00֦̟֘ࣞ҄ࢎ҆\u0b34̗ࣘ҄\u0b4a\u0558̷\u070f\u0b7b֥ࢄٜܹ߫\u008e֥֖ۢ", "ͧ݊\u05fd֦\u0ad1ٰۭ֤࡚ͩ߬۬\u05ff\u07fb٭֤\u0558۬ࠫ߫߿֥֟ۡ݁\u07fc߿֟\u0bc3ܱ֢ۡ֝ࠜ\u0af3ٙ҆\u07b8ܱ֢\u0a46ٗ܅\u07fb֢ܰ΅؛\u0b65ࡿ\u09cf֧\u05cd٬ૻࡺ੍֧ۖۤ˷࠰\u05fd֦\u0b34۬˸\u07bb֢ܰ࠹َ\u0ba5֧݉֩҆؞࣮\u07b5\u0bba֢ܰ܈֢ࣟࠜ࣌҄܊ࣱ࠰\u05cd֧\u0b65۔\u0af2݆՝\u038b्_\u0a52݀\u0603΄ࠡ\u008b\u09d3߰˱\u0380ͫ\u008f\u007f߬£;ો`", "΄߯£;͜=˅\u07bf\u0bce\u0381!!̤߷\u0081\u0383࠴'ࣸࠥ\u0ba7\u0382࣫`˔߷\u0ba7\u0382٪`߾ࠥ<\u0381߲\u0094੍߷<\u0381\u0381\u0095ু࠘\u0ba7\u0382˅¨\u0a65ࢇؕ΄֬`ࡾࡴ҅\u038bਾ_\u0b7bࡳࣱ΄̧,̹࠽ࢄ΅ુ~ौ\u07b4߸΅ܽ~֙ް࠳΄\u085f\u009c֩࠱£;֞?"]]
    decompressVSub()
    buyheros = decodeOut
    _extendedGlobalCollection[55] = decodeOut
    decodeIn = [2, 1000, -97777, ["!!ׁ˞\u0a34\u0096҉&ۨ˗\u05f7˔࣯\u0085҃˦\u0b78˽\u0b79/\u0604˝ޫ̗ܻ֣ۢ̍࣬҅ࢄٰ٪̍\u0b96҅>ٌ\u0095̍ৈͣ"]]
    decompressVSub()
    buyperks = decodeOut
    buyperksHome = decodeOut
    decodeIn = [2, 1000, -59, ["̤࣍ٚ\u0095\u0ba7٪ٌ̭\u0600\u0094҉ٙ˽!\u0082#!!"]]
    decompressVSub()
    settingsCamera = decodeOut
    decodeIn = [2, 1000, -258670, ["ऀ̙\u0558҆࠾\u038b\u0a62߫\u05ce݈֝܁\u0bbb\u07fc૰\u0379!!"]]
    decompressVSub()
    teleporterpositions = decodeOut
    decodeIn = [1, 1, 1, ["!#$"]]
    decompressNSub()
    _extendedGlobalCollection[58] = decodeOut
    decodeIn = [2, 1, 2000, ["\u0b54$ް!ް!ஂ#܈$!!"]]
    decompressNSub()
    perkcosts = decodeOut
    decodeIn = [1, 1, 0, ["'!!$##!!,#'!!$#*$!;$'!!$#-!!*%'!!$#$!!,#'!!$#$!!,&!!!!#!!!!#$!,@$#!,@$!!!!#!!!!#!!!!#!!!!#"]]
    decompressNSub()
    smActions = decodeOut
    decodeIn = [1, 10, 0, ["!!!'\u008b!'·\u0081"]]
    decompressNSub()
    _extendedGlobalCollection[112] = decodeOut
    decodeIn = [1, 1, 0, ["!.!"]]
    decompressNSub()
    _extendedGlobalCollection[113] = decodeOut
    decodeIn = [1, 100, 50, ["˜\u0095`,!"]]
    decompressNSub()
    _extendedGlobalCollection[114] = decodeOut
    decodeIn = ["ۤۧ˟̂¦!̷ُ˚࠼°!߫͑\u0383֣΄˽!ِ˧̧®!߬̒˿؊ͩ!؋͍\u083f̸̨࡙!"]
    decompressTextSub()
    _extendedGlobalCollection[142] = decodeOut
    decodeIn = ["ۤۧ˟ّ̩֫̒\u05ca̢˞̃˫̙̝˳͖̒$!̷ُ˚࠼՝ͦ\u0378˘ּ̙̭֤˚\u0600$!߫͑\u0383֣΄˽̣̾˘̙̭\u0601͍˸˫˝˗̻͖͗$!ِ˧̧˫̢̮̄˞˙،˞̻˳˧̪˭̹$!߬̒˿؊ͩ˵֙˭̢˞̔͜۩˿؍́˟̍!؋͍\u083f̸̨࡙˪̳˟˘\u05ee̢˞˨ַ̧̮̍!"]
    decompressTextSub()
    _extendedGlobalCollection[121] = decodeOut
    decodeIn = ["ِ̛߮˵࡛̖̕׳ْ֥͋˨\u085d\u085f̖ٕٖ̑ٓ̕˥̆˝״ٖ̱͈̞˘۪̋˨̤͖̉!߬̒˿։֎˜̚˨̱͈̞࣪˶˥˫̉\u086b״࣮࣬߰߱߰۬˙˥˫؎ٔ؎ࣱࣲ؏˯̓̓;!ࣳ˗̱ۭࣵͨ\u03a2˗̓˨̀˟̼̀˝״ٖ̱͈̞˘͘˸۽˚\u0590̬͠\u0379;!ܼࣶ͓۫ࣸ֬ͨ͘˟˹͡˧;!ࣹ̺˾͋˘͚", "˗ܼ࡞ٔٓ֬͘˙˥̲ͅ˧̷̧̜̑;!\u0603̧̮ࣺࣼٔࣾ\u086f؎;!"]
    decompressTextSub()
    _extendedGlobalCollection[144] = decodeOut
    _extendedGlobalCollection[143] = [abilityIconString(Hero.CASSIDY, Button.ABILITY_1), iconString(Icon.HEART), iconString(Icon.FIRE), iconString(Icon.DIAMOND), iconString(Icon.EYE), iconString(Icon.HALO)]
    decodeIn = [2, 1000, -219392, ["݄֫۟҃\u0b12ؙ\u0ae5݇۟҃\u0605ؚ·َؘ݆۟҃\u0a56̜݀۟҃\u061c\u008a\u07b9\u0086͈!!"]]
    decompressVSub()
    bankButtons = decodeOut
    _extendedGlobalCollection[134] = -1
    mapDataLoaded = true


rule "488 button held teleporter":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition len(getPlayersInRadius(teleporterpositions[telespot], 3, Team.1)) > 0
    
    if (len(getLivingPlayers(Team.1).filter(lambda player: not player.isDummy()))) == (len(getPlayersInRadius(teleporterpositions[telespot], 3, Team.1).filter(lambda player: player.isAlive() and not player.isDummy()))):
        if teleporterwait == false:
            teleporterwait = true
            eventPlayer.teleporterEffects = []
            createEffect(eventPlayer, Effect.ANA_NANO_BOOSTED, eventPlayer.getTeam(), eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.teleporterEffects.append(getLastCreatedEntity())
            createEffect(localPlayer, Effect.WINSTON_TESLA_CANNON_TARGET, Color.BLACK, eventPlayer, 80, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.teleporterEffects.append(getLastCreatedEntity())
            wait(0.25)
            getPlayersInRadius(teleporterpositions[telespot], 5, Team.2).setStatusEffect(eventPlayer, Status.STUNNED, 0.25)
            destroyEffect(eventPlayer.teleporterEffects[0])
            playEffect(localPlayer, DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 80)
            wait(0.25)
            kill(getPlayersInRadius(teleporterpositions[telespot], 5, Team.2), getLivingPlayers(Team.1)[0])
            destroyEffect(eventPlayer.teleporterEffects[1])
            eventPlayer.teleporterEffects = []
            _extendedGlobalCollection[120] = Color.RED
            if len(teleporterpositions) > 0:
                _extendedGlobalCollection[136] = false
                telespot = (telespot + 1) % len(teleporterpositions)
                wait()
                _extendedGlobalCollection[46] = 1
                eventPlayer.lastsavedpos = null
                wait(0.5)
                waitUntil(_extendedGlobalCollection[136] == true, 15)
                getPlayers(Team.1).teleport(teleporterpositions[telespot])
                for forindex in range(4):
                    if getPlayersInSlot(forindex, Team.1).isDead() and distance(Died[forindex], vect(500, [], 500)) > 1:
                        Died[forindex] = nearestWalkablePosition(teleporterpositions[telespot] + (vect(forindex * 1.5 - 2.25, [], 2)))
                goto loc+[5, 0, 2, 4][[0, 1, 2].index(telespot) + 1]
                zone1()
                goto lbl_0
                zone2()
                goto lbl_1
                zone3()
                lbl_0:
                lbl_1:
            wait(0.5)
            _extendedGlobalCollection[46] = 0
            doorsNeedDrawing = true


rule "wave boss tables":
    _extendedGlobalCollection[110] = [Hero.DOOMFIST, Hero.ZENYATTA, Hero.ROADHOG]
    _extendedGlobalCollection[111] = [Button.ABILITY_1, Button.ABILITY_2, Button.SECONDARY_FIRE, Button.ULTIMATE, Button.MELEE]


def SmDispatch():
    @Name "wave boss dispatch"
    
    if eventPlayer.smCode >= 11:
        eventPlayer.smSpecial = eventPlayer.smCode
    elif eventPlayer.smCode >= 6:
        if eventPlayer.smHolding == false:
            eventPlayer._extendedPlayerCollection[31] = _extendedGlobalCollection[111][eventPlayer.smCode - 6]
            eventPlayer._extendedPlayerCollection[32] = eventPlayer._extendedPlayerCollection[30]
            eventPlayer.smHolding = true
    elif eventPlayer.smCode >= 1:
        eventPlayer.forceButtonPress(_extendedGlobalCollection[111][eventPlayer.smCode - 1])


rule "wave boss: find my row":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.hasSpawned() == true
    
    eventPlayer.smRow = 0 if eventPlayer in bossBots else _extendedGlobalCollection[110].index(eventPlayer.getHero()) + 1
    if eventPlayer.smRow > 0:
        eventPlayer.smCode = _extendedGlobalCollection[113][eventPlayer.smRow - 1]
        eventPlayer._extendedPlayerCollection[30] = 0
        SmDispatch()


rule "wave boss: timed sequence":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.smRow > 0
    
    eventPlayer._extendedPlayerCollection[28] = 0
    while eventPlayer._extendedPlayerCollection[28] < 6:
        eventPlayer.smEntry = ((eventPlayer.smRow - 1) * 6 + eventPlayer._extendedPlayerCollection[28]) * 5
        eventPlayer._extendedPlayerCollection[29] = eventPlayer._extendedPlayerCollection[10]
        if Difficulty >= smActions[eventPlayer.smEntry + 4] and eventPlayer._extendedPlayerCollection[29] >= smActions[eventPlayer.smEntry + 2] and eventPlayer._extendedPlayerCollection[29] < smActions[eventPlayer.smEntry + 3]:
            eventPlayer.smCode = smActions[eventPlayer.smEntry]
            eventPlayer._extendedPlayerCollection[30] = smActions[eventPlayer.smEntry + 1]
            SmDispatch()
        wait(_extendedGlobalCollection[114][Difficulty - 1], Wait.ABORT_WHEN_FALSE)
        eventPlayer._extendedPlayerCollection[28]++
    if ruleCondition:
        loop()


rule "wave boss: health trigger":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.smRow > 0
    @Condition _extendedGlobalCollection[112][(eventPlayer.smRow - 1) * 3] > 0
    @Condition eventPlayer.getNormalizedHealth() <= _extendedGlobalCollection[112][(eventPlayer.smRow - 1) * 3]
    
    eventPlayer.smCode = _extendedGlobalCollection[112][(eventPlayer.smRow - 1) * 3 + 1]
    eventPlayer._extendedPlayerCollection[30] = _extendedGlobalCollection[112][(eventPlayer.smRow - 1) * 3 + 2]
    SmDispatch()


rule "wave boss: hold button":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.smHolding == true
    
    eventPlayer.startForcingButton(eventPlayer._extendedPlayerCollection[31])
    wait(eventPlayer._extendedPlayerCollection[32])
    eventPlayer.stopForcingButton(eventPlayer._extendedPlayerCollection[31])
    eventPlayer.smHolding = false


rule "wave boss: special 11 ground slam":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.smSpecial == 11
    
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer, 8)
    damage(getPlayersInRadius(eventPlayer, 8, Team.1), eventPlayer, 40)
    eventPlayer.smSpecial = 0


rule "wave boss: special 12 crouch with full ultimate":
    @Event eachPlayer
    @Team 2
    @Condition eventPlayer.smSpecial == 12
    
    wait(0.25)
    eventPlayer.startForcingButton(Button.CROUCH)
    eventPlayer.setUltCharge(100)
    eventPlayer.smSpecial = 0


def LoadZoneDoorData():
    @Name "load the zone's door data"
    
    decodeIn = ([[2, 100, -11083, ["ͧ&॓-ܽ'ؐ%ܴ-͢(ؒ$\u07b4-\u0a55'®#\u05ce-\u0a45(࠺!߬-˗*\u07b2#֮-\u0093*֝$֮--*\u0ba2#\u07b4-\u05fa(\u0a61&ि-͉(࢏%ܴ-߳(\u086f&֛-\u0b65)૱&֛-ْ+ֿ'֛-͈.\u0a52&؇-׀-\u0ad4&֎-֞.ࠠ&֮-٫/֧'\u0a60,\u0a50-\u0081'\u0a60,\u0a64+ۛ#͛-\u09d6+˶#͡-\u0b3b-", "͍$\u0a60,͚-܈!ࢄ-ੈ+܄!ࢄ-\u0b65-֪$ࣥ-ࢅ,ࣝ$\u0b46,੶+\u0a0c%ே,(.*'֬-ۨ+ޯ%ܾ-ͣ:\u0a64#֥-ࢃ/\u0bbd!֥-ࢁ/!!ܾ-\u0893/ͮ$\u07b2-˄<ॖ#߰-˻;\u0a29$ٖ-ܺ;ॖ!֥-\u08e2;।!؋-̻(\u0b65%ऻ-́<ࠠ&ऻ-۔;"]], [2, 100, 3776, ["\u0a00=ࣚ!̖-ࠞ>\u09ca!ؙ-߯>ੈ!˱/࣭>ा!ۨ:\u008d?̦!\u0a78/\u05ff?\u0a12!\u0b3b-\u0604?\u0b8c!ܷ,\u0ab1?܁!ࡸ,\u0b51@֓!ࣛ+\u0a4e[֓!࠶+֒]؆!̳,࣮^\u0530!\u07b6,࠳^\u0530!\u038b+܇_\u0530!\u0087,˽[࠻!\u0b11.॰[(!·:࣮^!!ং/ࢅ^ܳ!ۭ:ा^֍!܆;ৌ[֭!ٛ;", "\u0b8c[܁!ۧ:ަ?ࣧ!͛;ୌ@֠!˳.͔_֍!\u0a3d.!_ࢆ!؉/૰`ࣴ!\u0b46:ঃ|ࣴ!܁:\u0b3b|ਃ!̩/\z|\u0a4e!ੑ.ࣦ|\u0a4e!˱.\u082e~ࣧ!\u070f-^|ொ!ަ,࣑`܇!©,\u0558|̙!ਁ/"]], [2, 100, -26582, ["҃\u0094ୢ_ࣣ#ૉ\u0094਼_܁%֤\u0094ୢ_ࣩ&̴\u0093\u0092`ੁ&\u05cb\u0096˦`ٓ$ૢ\u0096\u07b5_\u05ca$ْ\u0097࢚_ۚ%\u0b91\u0097ܻ_ी(֦\u0099ܻ_ੰ(\u0b78\u0098ી_ৄ'\u0bd2\u0097ી_ࢉ'\u09c5\u0098ી_૾'े\u0098\u0ad4_ࡿ(੍\u0097\u0ab1_্'ு\u0099\u0ab1_˭(̝\u0096\u0ab1_!!̗\u0096\u0ab1_\u05fb!̣\u0096\u0ab1_˦#\u0b8d\u0097\u0b12_߳#ۚ\u0099\u0b12_\u07bd#", "\u07bc\u0098¶`̟#̽\u009b\u0a43_׃#͇\u009b\u0a43_%#͟\u009b\u0a43_ͣ!»\u009aࡺ_¿&˯\u009aࡴ_\u05cf$॑\u009a˵`؎$\u0ae5\u009c\u0a43_ֵ&\u0a00\u009d\u0af3_ࢌ&ૃ\u009e*`\u0af6&࣭\u009c\u0b91_̊$(\u0099࣮_̻%\u0a46\u0097ि_͏%ٟ\u009d\u0bac_ି!̵\u0094\u0b80_\u0a4e!"]]])[telespot]
    decompressVSub()
    doorVectors = decodeOut
    decodeIn = ([[1, 1, -180, ["̶̶̶̶̶̶̳̹̬̳˶̷̶̴̷̶̷̶̶̶̶̶̴̷̳̺̳̹̳̹̳̹̳̳̳͒̽͜՞̶̶̳՟̸̶̶̶̵̵̳̳̳ͥ̀˕̸̷̶̶̳̳̃՛̶̶̴̶̶̶̶̳̳#̴̶̶̶̶̷̴̶̶̶̶$̴̶̶̷̻˘̴̷̶̷̶̶̸̷̻̹̳̹̳՞̸̳̀,̶̶̶̳̥̳́\u05fd̷̳̽\u058b̷̳̹!", "̷̳̹\u05fe̷̳̺\u05fe̶̶̳\u009e̶̶̶ׁ̳̳̻$̸̴̷̵̴̶̶̳͓̼̽̽̈́ͦ͆#̶̶̳%̳"]], [1, 1, -179, ["̵̵̶̵̵̵̵֢̲̻֣̲֢̲։̵̲̹։̵̶̵̵̵̳̹̲͆~̸̵̲˩̷̵̲՝̵̵̲˒̵̲̻!̵̵̲&̵̵̲։̶̵̲˅̷̵̲\u0558̶̵̲˙̶̶̲՟̷̵̲\u0530̷̶̳̻̺̳͍̺̓֔͜՜̸̶̳͗̈́\u058b̳̽͏̵̶˓̶̶̲̺̲̻֘«̷̵̲˅̵̵̲՝̵̶̲\u0558̵̶̲\u0379̵̵̲΅", "̵̲̺«̵̶̲©̵̵̷̵̲̲̚\u0382̷̵̶̳̻֎̶̳̻"]], [1, 1, -180, ["̷ְ̻̳̻̾\u03a2̷̷̷̶̳̻̲̳̹͕̳\u05fd̷̶̳!̴̷̶̷̺՟̵̷̵̷ֶ̳̳\u0090̶̳̹.̶̳̹\u05ec̸̶̳։̶̳̹՚̴̷̷̵̶͕͇̺̳̺̳ͨ̇՜̷̳̺՞̵̶̳՞̸̳̹֍̸̸̳՟̷̷̳$̵̷̳˄̷̳̺˄̵̷̳˄̷̳̻˗̷̶̳\u05fd̴̷̶̷̶#̷̳̽˪̷̸̷̳̺̳̹̖", "̷̳̼\u0099̷̳̺#̷̳̺\u05fe̸̷̳¿̴̷̶͔͉×̴͔͎"]]])[telespot]
    decompressNSub()
    doorParams = decodeOut
    decodeIn = ([[1, 1, -1, ["###$$%%###&&'(''((%)(,,!((&*))+***+$**"]], [1, 1, -1, ["!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"]], [1, 1, -1, ["!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"]]])[telespot]
    decompressNSub()
    _extendedGlobalCollection[57] = decodeOut


def BuildZoneDoors():
    @Name "build the zone's doors"
    
    _extendedGlobalCollection[2] = 0
    for doorBuildIndex in range(len(allDoors_Corner)):
        doorIndex = doorBuildIndex
        DestroyDoorEffects()
    getPlayers(Team.1).active_wall = []
    _extendedGlobalCollection[3] = [_extendedGlobalCollection[71], _extendedGlobalCollection[73], _extendedGlobalCollection[75]][telespot]
    LoadZoneDoorData()
    doorBuildIndex = 0
    looping = 0
    allDoors_Corner = []
    allDoors_OppositeCorner = []
    allDoors_Center = []
    allDoors_Facing = []
    allDoors_Side = []
    allDoors_Width = []
    allDoors_State = []
    allDoors_Zone = []
    allDoors_BeamSpan = []
    allDoors_BeamA = []
    allDoors_BeamB = []
    while doorBuildIndex < len(doorVectors):
        if not doorBuildIndex % 2:
            LoadingPause()
        allDoors_Corner.append([doorVectors[doorBuildIndex]])
        allDoors_OppositeCorner.append([null])
        allDoors_Center.append([null])
        allDoors_Facing.append([directionFromAngles(doorParams[looping + 2] + 180, 0)])
        allDoors_Side.append([directionFromAngles(doorParams[looping + 2] - 90, 0)])
        allDoors_Width.append([doorParams[looping]])
        allDoors_State.append([0 if _extendedGlobalCollection[3] + doorBuildIndex in _extendedGlobalCollection[56] else 1])
        allDoors_Zone.append([_extendedGlobalCollection[57][doorBuildIndex]])
        allDoors_BeamSpan.append([(directionFromAngles(doorParams[looping + 2] - 90, 0)) * doorParams[looping] + (Vector.UP * (doorParams[looping + 1]))])
        allDoors_BeamA.append([null])
        allDoors_BeamB.append([null])
        if doorParams[looping + 3] == 1:
            allDoors_Width[doorBuildIndex] = doorParams[looping + 4]
            allDoors_OppositeCorner[doorBuildIndex] = doorVectors[doorBuildIndex] + (allDoors_Side[doorBuildIndex] * (doorParams[looping + 4])) + (Vector.UP * (doorParams[looping + 5]))
            looping += 6
        else:
            allDoors_OppositeCorner[doorBuildIndex] = doorVectors[doorBuildIndex] + allDoors_Side[doorBuildIndex] * doorParams[looping] + vect([], 50, [])
            looping += 4
        allDoors_Center[doorBuildIndex] = (allDoors_Corner[doorBuildIndex] + allDoors_OppositeCorner[doorBuildIndex]) / 2
        doorBuildIndex++
    doorVectors = []
    doorParams = []
    _extendedGlobalCollection[57] = []
    _extendedGlobalCollection[2] = 1


rule "zone loading: set up the team's zone":
    @Condition mapDataLoaded == true
    @Condition _extendedGlobalCollection[134] != telespot
    
    zoneLoading = true
    _extendedGlobalCollection[134] = telespot
    _extendedGlobalCollection[138] = _extendedGlobalCollection[8] != null and _extendedGlobalCollection[8].isAlive() == true
    _extendedGlobalCollection[139] = 0
    while _extendedGlobalCollection[139] < 12:
        if getPlayersInSlot(_extendedGlobalCollection[139], Team.2) != null:
            destroyDummy(Team.2, _extendedGlobalCollection[139])
            wait(0.25)
            LoadingPause()
        _extendedGlobalCollection[139]++
    _extendedGlobalCollection[136] = true
    globalActiveBreaches = []
    globalActiveBreachHealth = []
    averagePosition = null
    RebuildBreachEffects()
    BuildZoneDoors()
    wait(1.5)
    waitUntil(_extendedGlobalCollection[135] == false and doorsNeedDrawing == false, 30)
    pfMapReady = false
    pfDecompress = 0
    LoadingPause()
    if _extendedGlobalCollection[134] == 0:
        pfDecompress = [["\u07b4\u0b50\u07bcૼ\u07b5\u05cb\u07b3̶\u07bc\u0af7\u07b4૱ް\u0a5f\u07bcૢ\u07b5˷ްֻ\u07bcࡿ\u07b6ُ\u07b2̕\u07bcࢀ\u07b6ા\u07b3ֵ\u07bcࡿ\u07b6¿\u07b5̊\u07bcଁ\u07b6̔\u07b5\u05cb\u07bc\u0ae5\u07b6ி\u07b5\u0a54\u07bc\u0ae5\u07b7\u008e\u07b5ૈ\u07bc\u0ae5\u07b7࣎\u07b3ெ\u07bcࢁ\u07b6\u0894\u07b2\u0ada\u07bcु\u07b7ͤ\u07b3̃\u07bcु\u07b7ੇްً\u07bc\u07b3\u07b7ؚް\u0084\u07bcޯ\u07b8\u009bް|\u07bcु\u07b8॥ް\u07b6\u07bcु\u07b8\u0a50ް\u0600\u07bc\u0a3a\u07bb҈\u07b2̳\u07bc৽\u07bb\u0bce\u07b2\u09c5\u07bc\u0a12\u07bcࣳ\u07b3\u0089\u07bc৽\u07bbோ", "\u07b2\u09c9\u07bc\u0a12\u07bb؎ް\u05cf\u07bc\u0a3b\u07bc\u0addޯ॥\u07bc\u0a3a\u07bc¤ޯ\u0a45\u07bc\u0a3a\u07bb\u086bް˹\u07bcੇ\u07bbிްী\u07bb\u0bce\u07bc\u0085\u07b4̌\u07bc:\u07bc]\u07b4̨\u07bc:\u07bbؑ\u07b5̘\u07bc:\u07bb؍\u07b5̔\u07bc:\u07bcࠟ\u07b4͢\u07bc:\u07bcࢀ\u07b4͈\u07bc͆\u07baࢎ\u07b5ࠦ\u07bcޯ\u07ba؎\u07b6\u05f5\u07bcޯ\u07baொ\u07b6\u05fd\u07bcޯ\u07ba׆\u07b6\u09b3\u07bcޯ\u07ba\u038b\u07b6\u08e2\u07bcޯ\u07b9ؘ\u07b5ۘ\u07bcޯ\u07b9֎\u07b5\u0604\u07bcޯ\u07b9੍\u07b3֤\u07bcޯ\u07b9\u0a00\u07b3҃\u07bcޯ\u07b8܊", "\u07b2ީ\u07bcޯ\u07b8\u0a3b\u07b2\u086b\u07bcޯ\u07b9੶\u07b2؎\u07bcّ\u07baࢎ\u07b2ۘ\u07bc֣\u07bbׄްؒ\u07bb\u0bce\u07bbִް؋\u07bb\u0bce\u07bb\u0a12ް˕\u07bcੇ\u07bc\u0093ްِ\u07bb\u0bce\u07bc\u0383ް~\u07bc\u0a3a\u07bb\u0b7e\u07b5߾\u07bcࡿ\u07b8͓\u07b6ֹ\u07bcु\u07b8՝\u07b6֓\u07bc\u0bbd\u07b9϶\u07b4֠\u07bcࡿ\u07b7ீ\u07b2\u0558\u07bcޯ\u07b9;\u07b2΅\u07bc\u09d9\u07b9ૉް࠳\u07bc\u0a3b\u07b9ூްި\u07bc\u0a3b\u07be˷\u07b2֣\u07bc\u09d9\u07be̖\u07b2֓\u07bcޯ\u07be\u0a12ް\u07be\u07bcु\u07bf͏\u07b2ַ\u07bcޯ\u07bf\u03a2", "\u07b3\u03a2\u07bcޯ\u07bf֞\u07b3͍\u07bcޯ\u07be͊\u07b2࡚\u07bcޯ\u07be؊\u07b5\u05f6\u07bcޯ\u07be̼\u07b5ޫ\u07bcޯ\u07bdޮ\u07b4֪\u07bc͆\u07bdؚ\u07b3\u009e\u07bcّ\u07bd\u082e\u07b2ٔ\u07bcّ\u07bd߱\u07b2۠\u07bc֣\u07bcंް݈\u07bb்\u07bc\u09c5\u07b3͗\u07bcّ\u07baࡴ\u07b6֨\u07bcࠩ\u07bb\u0bbb\u07b4ࣶ\u07bcࠫ\u07bb\u0bd2\u07b6֙\u07bcޯ\u07bd\u008f\u07b6۟\u07bcޯ\u07bdঁ\u07b6ુ\u07bcޯ\u07be̩\u07b6̷\u07bcޯ\u07be\u09b4\u07b5۠\u07bcޯ\u07beু\u07b5܇\u07bcࡿ\u07bfे\u07b6ֲ\u07bcु\u07bfऺ\u07b6\u05ed\u07bc\u0bbd\u07beૈ", "\u07b4˅\u07bcࡿ߫«\u07b4̔\u07bcࢀ߬\u0a11\u07b2\u0ab1\u07bcु߫ॗ\u07b3˰\u07bcु͔߫\u07b5̡\u07bc૿߬\u0ab1\u07b4\u0ad3\u07bc\u0af7߭ે\u07b3΅\u07bc\u0af5߮̔ް\u0a63\u07bc\u0ade͎߮ްֽ\u07bcࡿ߬ࢅ\u07b2\u0096\u07bcࢁ̢߬ްؐ\u07bcޯؙ߫ް \u07bcޯ\u07bf\u0af3ް\u0095\u07bcु\u07bfͦ\u07b3֠\u07bcࡿ߬ૅ\u07b5֧\u07bc\u0ae5߬±\u07b5\u0a65\u07bc\u0ae5߫ୀ\u07b5\u0ad7\u07bc\u0ae5߫֬\u07b6־\u07bbெ\u07bcࣣ\u07b6ࣿ\u07bb\u0bd5\u07bc \u07b7ͦ\u07bb\u0b29\u07bc#\u07b6\u05f5\u07bbி\u07bbٗ", "\u07b6\u0605\u07bc \u07ba\u0a11\u07b7࠷\u07bc˜\u07baं\u07b7܋\u07bc֣\u07b9\u0abb\u07b6\u09d3\u07bcޯ\u07b9ૈ"], ["# (  ! $ '  # %  $ &  % ' /  & # ( ,  ' ! )  ( *  ) +  *  ' - \u0099  , .  -  & :  / ;  : <  ; \u008d \u009c  > _ \u009c  = ? [ ]  > @  ? [  @ >  > ", "^ \u009d  ] _ `  ^ =  ^ |  ` ~  | \u007f \u0082  ~ \u0080 \u0083  \u007f \u0081 ˥  \u0080 \u0082 ˝  \u0081 ~ §  \u007f \u0084 \z  \u0083 \u0085 \u008a  \u0084 \u0086 ®  \u0085 \u0087  \u0086 ˩  \u0089 ˩  \u0088 \u008a \u0096  \u0089 \u0084 \u008b  \u008a \u008c \u008e \z  \u008b \u008d \u0099  ", "\u008c \u008e < \u009a  \u008d \u008b \u008f  \u008e \u0090 \z  \u008f \u0091  \u0090 \u0092  \u0091 \u0093  \u0092  \u0095 ¬  \u0094  \u0089 \u0097 \u0099  \u0096 \u0098  \u0097  \u0096 , \u008c  \u008d \u009b  \u009a \u009c  \u009b < =  ] \u009e \u00a0  \u009d \u009f  \u009e ¡  \u009d ¡ ˘  \u00a0 \u009f ¢ ¤ ˖  ¡ £ ×", "  ¢ ¤ ¥ ¨  £ ¡ ¨ ©  £ ¦ ·  ¥ § °  ¦ \u0082 ¨  § £ ¤ ©  ¤ ¨ «  © ¬  « \u0094  \u008b \u008f \u0083  \u0085 ¯ °  ®  ® ¦ ±  ° ´  ± ¶  ´ ·  ¶ ¥ ¸  · » ×  ¸ ¿  »  ", "¸ ÷ ¢  × ˂ ˄ ˙  ÷ ˃  ˂  ÷ ˅ ˚  ˄ ˒  ˅ ˓ ˙  ˒ ˔  ˓ ˕  ˔ ˖ ˙  ˕ ˗ ¡  ˖ ˘  ˗ \u00a0  ˒ ˕ ÷  ˄ ˛  ˚ ˜  ˛  \u0081 ˞  ˝ ˟ ˥  ˞  ˞ ˦ \u0080  ˥ ˧  ˦ ˨ ", " ˧ ˩  ˨ \u0088 \u0087  "], ["\u09d8#ͦ!˿҂$\u05f8#˿(̋/̄&̆ ˾<̎($ͦ˿#̅֊̄\u0557́\u0557˿҆̇\u058b́϶˿#ؘ҄.ٞ&ٛ(ً̀$҃˙(˿˙)˾˙˨+˿#\u05ee,˾˖˨.̓#̉$̰#/͛:͚*̀$\u0530̚҈˾϶̏՞̅՟$̈՝˿҇̌϶̞҂=˾҂ؗ ؝:ؗ'ُ ٫!>˿÷̐!͕̐#͔̏%̗҂̄҉˿҄", "̂֍̅̏&˾՜̆!̄(҃$҈>҈̓/̉!̄/˾\u0084_̋_́#̅>̅`̋!̈*̑;̅̎+˿҂̎҂̃!՛˾֔̂՞,˿ ՞!҇/҃^̄϶\u007f˿$҂+˿(̋#̗҇;̈#˾;˿&̍ ̘҃%̚#̎҂̄՜˾֑'˾՞:̄҉!̀҄/϶̂|˿\u058c,̀҇'҇(˿&̎&́%̀\u0084̀+҂'", "՜ ֑̅̊[̀,́\u008f̅̓'˿&̄'̄\u008c̅~˿#́+˿'̌ ̠\u058c˿϶̇$˿҂̨̅҇(-҉˿϶̈$҉˿$҃̌϶̜$̀҂̅՚\u061c(˾҇ؗ#˾ُ҄%ٛ#҃˿҈̋)҃#̄!҄̄~̃)҃!҃(҄؟̆#˿!̅$؝̘؝̅#_̌#҅˿)˾ ̞!̉_\u0557(́҂(֨\u008f̀\u009d\u0090˿\u009d\u0091˾", "\u009d˨̯ ̷˨\u0590/҈#˿҆\u0092\u0096˾\u0098˨̋։'\u0557$\u0557!҆;҆$҄$;̇~̅ ˾<̎(!̀(̋@˿&̆$̀(̑(̇#́\u0557!҂;҂'՜&֍'\u007f҂!҄+҂(˿\u0558 ֔#҂`̋#̄)˾ ̞!̉`̋!̈'̭`̋#̇&̛҈̈*ؘ.ُ ٌ$˿!϶ّ҉߫!\u07bc҃؝˿#̅.̙)̋՚&", "ّ҄̅̆؝ْ҄̄!˾҂؛҇*̃$؛҂҂̀҈̊֍ؗ҄̅$ؘ҃҅,̅#҈̏%̗!̄)˿$̂՛%҄̅՚̑҇̈҄̅!˾!̃҅-̂$̟̂҃$̈҂̄҈#҄˾*՞̃!;҈]ؗ&҆˿϶˾#ؘ&̉҆́(̎)̔҂̂'˿ ̂҂̎(̈\u0092˿?˾\u0085\u0092˿\u009b@҂ \u0558'̂҂'֩;\u0557!҂;҂", "'՜!˾\u0590'˨;̌;˿'̌$̖҃$°̋%́(<̂\u0084̆,̓(-̑'̈$̐&̗#̼϶̊$՚̀҄̅;҉[҂%\u0530#҄)˿՞(¸˾^˨!҃(֊'\u0557$\u0557!҆+̆҃́҅#×˿҂؝҃(÷˾?˨˃̀&҃(˄̅+\u05ce#˿҅#҈̟$̙!̃<̂$̃!͖$̍͋՚#̘̀҄̅՛˿\u0557̂҂˾", "֍*˿$҈͒+˾$̅͒:̅̇҃̋՜˾҆˿҄̅҂˾҄̀՝#̃\u0557˙˿(˚˾(˨\u0083̂,̀\u0091̄՞+҂!՞!҇/҃`˾҅˨֘̂\u0558̀֊˿֏$́̊?̃+́=̂`̀̎:̈'̄(˿&̎&́&˿̓*͂'˾̓҇!҆̄҇̄֡("], ["    $  )  @  ]  \u0086  \u0091  \u0095  \u0098  \u009b  \u009c  \u00a0  £  ¤  ¬  ®  °  ˃  ˙  ˫  ˰  ˳  ˶  ́  ̎  ̖  ̞  ̦  ̲  ̾  ͉  ͕  ͟  ͫ  ΅  ҅  \u0558  \u058b  ֕  ֠  ֮  ־ ", " \u05cd  \u05fc  ؇  ؎  ؑ  ؔ  ؗ  ؘ  ؛  \u061c  َ  ّ  ْ  ٟ  ۘ  ۧ  ܄  ܰ  ܺ  ݀  ݈  \u07b3  \u07be  \u07fc  ࠣ  ࠲  ࡛  ࡳ  ࢃ  \u0890  \u0895  ࢘  ࣈ  ࣔ  ࣕ  ࣟ  ࣤ  ࣫  ࣴ  ࣼ  ि  ू ", " ृ  ॔  ।  ঁ  ং  \u0991  \u09b1  ়  ে  \u09ca  \u09d1  ৢ  ৳  ৽  \u0a37  ਼  ਿ  ੀ  \u0a46  \u0a52  \u0a53  \u0a61  \u0a77  \u0a84  \u0ab4 "]]
    elif _extendedGlobalCollection[134] == 1:
        pfDecompress = [["\u07fcࢂ߫߱߸ী߾߾߫\u05ce߸\u008e߿˼߫\u05cf߷\u09cf߿ֻؓ߫߸\u0097߿\u0a62߫՞߷\u0a44߿ࣵ߫՞߷՟߿ࣗ߫՞߶॓ࠖૌࣰ߫߶΄ࠗ֍࣯߫߷\u05ecࠖ࠽ܻ߫߷਼ܻࣵࠖ߫߸\u0378ࠗ\u07fb߫՜߸\u0087ࠗা߫՟߹\u06dd࠘\u008a߫҃߷ؚ॔࠘߫£߹͑࠘ࠬ߫´߹\u0a49ܱ࠙߫֎߹\u0a57ׇࠛ߫֎\u07fb࢙ࠜު߫֎߹ਁࠝۘ߫\u009f߹ॆࠞ\u05cd\u07bf\u0b9b\u07fb\u09d5", "ࠠ˵͎߫\u07fb\u09c9ࠟ\u0bac̳߫\u07fc\u05c8ࠟ\u008e߫؋\u07fc;ࠞ\u09de߫؋\u07fcৢࠝ\u0a34̰߫\u07fc\u0a54ࠜ੶\u07bf\u0bbc߽\u070eࠛ\u0602߫«߽ۭٜ̫ࠛ߫\u07fc\u09b5࠙\u0ad6̬߫\u07fc\u05f8ࠛ\u0a5f̬߫\u07fc΅࡚࠘\u07bf\u0bbb\u07fc\u0383࠙¢\u07bf\u0bbb߽\u05ceࠗ\u0b97̰߫\u07fc\u0ae4ࠖ\u0a0e߫؋\u07fc\u09b3ࠖࢊ߫؋\u07fcͬ߿̶࣒߫\u07fcֹ߽\u09b3߫՜\u07fcۚ\u07fb\u0b9dܑ߫\u07fcֽ\u07fb୕߫ۘ\u07fb«\u07fc˷߫ޫ߸\u0bce\u07fc\u0ad3ܻ߫߹ۖ", "߽`߫\u05eb߹\u0b9b߽\u0b34߫\u0379߹\u0adb߽ࢎׁ߫߸\u0601߿\u0082߫҄߸\u0b9b߿࠲߫΄߹)ࠖ.ܻ߫\u07fb!ࠖँܾ߫߹৲ࠖૢ߫؋\u07fbৣࠗ\u0380ܻ߫߹ࡳ߿ࢍ߫\u058b߸࢚ࠗ\u09da߫˙߶\u0ae5ࠖ\u0ad3߫˼߶\u0a52࠙͋\u07bf\u0bba߶\u07b2࠙϶\u07bf\u0bba߷ٗ࠙֫\u07bf\u0bba߶\u0095࠙ે\u07bf\u0bba߶̀ࠛٝ߫\u0082߶ুࠜ˻\u07bf\u0bba߶˃ࠜࠡ\u07bf\u0bba߶˦ࠜ࠾\u07bf\u0bba߶࡚ࠝ࢏߫±߶࠽", "ࠞ܌߫˹߷˥ࠞ\u0a61߫˹߶\u0a44ࠠ˿߫՜߷\u0601ࠠ(߫՜߷ୃֵࠠܲ߫߸©ࠟ\u0b8b߫՜߶॰ࠞଁ࣮߫߶ܾ࣯֕ࠞ߫߷\u0601̴ܻࠟ߫߷ࣶࠞ\u0ba1ܻ߫߸͉ࠞ߫͟֊߸˧ࠞ,߫՟߹ׂࠝ॰߫҄߷଼ࠠ\u0bd1߫ٞ߷ֲࣞࠡ߫\u05c9߸«ࠠ\u070e߫΄߸ିܻࠞࠧ߫߹࠷ࠟ˘ܼ߫߹ਾࠞା߫؋\u07fb\u0a63ࠟৗܻ߫\u07fb\u0086ࠠ\u0094߫\u0558߹@", "ࠠॆ߫ͮ߹େࠡ\u0bbd߫՝\u07fc΄ࠢ\u09b4ְ߫\u07fcࠛࠣ\u09d9߫۟\u07fc˪ࠣ\u0a04߫ۗ߹\u0b80ࠡ\u0a77߫\u0380߹\u0b50ׁࠢ̎߫߸\u05fcࠣॊ߫߬߸\u0ad7ࠗ\u0bce߫ \u07fb؝࠘ऻ\u07bf\u0bbb\u07fbࣳ࠙࣍\u07bfा\u07fb݅࠙\u0b8b\u07bfा\u07fb(ࠛ\u0a65\u07bfा߹\u0bd2ׇࠜ\u07bfा\u07fbࡰࠝ\u0603\u07bf\u0bbc\u07fbুࠝ|\u07bf\u0bbb\u07fcֻ࠘?\u07bf\u0bba\u07fc֧ࠖੈ\u07bf\u0ae5\u07fb\u09d2߿\u086b߫͑\u07fbࢎ߾૾߫ͬ߹\u0b0d\u07fc\u0b8b߫ޭ\u07fb\u0ad4", "࠘\u0abb\u07bf\u0ba1߸\u0ba5࠘\u0af7\u07bf\u0bba߷େࠛ۞߫\u0082߷\u03a2ࠛ\u0b3a\u07bfு߷\u06ddࠜ݇\u07bf\u0bba߷܇ࠝ̑߫\u008b߹̸ࠛ୕\u07bf\u0b3a߹̡ࠛ\u05eb\u07bfଁ߸\u0892࠙ॢ\u07bf\u0b3a߹\u008f࠙ࠟ\u07bf\u0b3a߸\u0080࠙\u0a63\u07bf\u0bab߷࠷ࠛ\u0603߫՛߷\u0bd5݈ࠢܵ߫߸\u0baḏࠢ߫ࣼ߹֑ࠡࠩ߫ो߹˚֛ࠡ߫ॊ߹\u07b4߽͍߫ܿ߹¤߽\u07b2ࣲ߫߹ֳ߾̳߫ो߹\u00a0߾܅߫ौ߹ޮࠢी߫݁\u07fb॒"], ["\u008b \u008c \u008f  $ \u008f \u0090  # %  $ & \u0096  % '  & ( \u0098  ' )  ( *  ) +  * ,  + - \u0095 \u0096  , . /  -  - : \u0097  / ; ˦  : < ˔  ; =  < > \u0081 \u0080  = ?  > @ ¯ ˫  ? ", "[ ˚  @ ] ×  [ ^ ÷  ] _ ¸  ^ `  _ |  ` ~ ˛  | \u007f \u0083  ~ \u0080 \u0081  \u007f = \u0082  \u007f = ˛  \u0080 \u0083 ˕ ˜  \u0082 ~ \u0084  \u0083 \u0085  \u0084 \u0086  \u0085 \u0087 \u0094  \u0086 \u0088 ˞  \u0087 \u0089 \u008e  \u0088 \u008a  \u0089 \u008b \u008d", " ˥  \u008a !  ! \u008d ˸  \u008c \u008a \u008e  \u008d \u008f ˟ \u0088  \u008e # !  # \u0091 \u0096 ˟  \u0090 \u0092 \u0096  \u0091 \u0093  \u0092 \u0094 \u0095  \u0093 \u0086  \u0093 ,  , % \u0090 \u0091  / \u0098 \u0099  \u0097 '  \u0097 \u009a \u009b  \u0099 ˧ ˨ ˲  \u0099 \u009c  \u009b \u009d  \u009c \u009e ", "˨  \u009d \u009f  \u009e \u00a0  \u009f ¡  \u00a0 ¢ ¯  ¡ £  ¢ ¤  £ ¥ §  ¤ ¦  ¥ ° ´  ¤ ¨  § ©  ¨ «  © ¬  « \z ´ ¶  ¬ ® ¯  \z  \z ? ¡  ¦ ±  ° ´ ˒  ± ¦ ¬ ¿ ×  ¬ ·  ", "¶ ¸ »  · ^  · ¿  » ´  ´ [ ˅  ] ˂ ˅  ÷ ˃  ˂ ˄ ˼  ˃ ˅ ˓  ˄ ÷ ˒ ×  ˅ ± ˓  ˒ ˄ ˴  ; ˕ ˝  ˔ \u0082 ˖  ˕ ˗  ˖ ˘ ˰  ˗ ˙ ˭  ˘ ˚  ˙ @ ˛  ˚ | \u0081", "  \u0082 ˝  ˜ ˔ ˞  ˝ \u0087 ˟  ˞ \u0090 \u008e  \u008a  : ˧ ˰  ˦ \u009a ˱  \u009a \u009d ˩ ˳  ˨ ˪  ˩ ˫  ˪ ? ˭  ˫ ˘ ˯  ˭ ˰  ˯ ˦ ˗ ˱  ˰ ˧ ˲  ˱ \u009a  ˨  ˓ ˵  ˴ ˶  ˵ ˷  ˶  \u008c ˹", "  ˸ ˺  ˹ ˻  ˺  ˃  "], ["\u09d8՛̔#̀҅˾֊̃϶̘ ҅˿҅̆˿-҄ ՞̅҆~҃ ҆!\u0558˾:́϶#̟(̸ ̍$˾$́֔$҂ ҇̚϶˿҆˿\u0558 ϶́҄̄$϶%́$̇'˾?̚ ̇#̂%̍$˾&̀!\u058b>֦%՝$϶'̀˱(̙,̀\u007f˾!̃!̅%˿#́+˾́%̩ ̃ͅ$\u0378\u061c$̍϶ًؙؙ̮́҄҄ؖ̍˾", "%҂%˾֊=֨#՝$϶˻$҃'̑<՟̃҂̉϶̈#˿҃̂҂́$˾/́҄̎ ̀*֑˾\u0530˿҅̃՝́϶҂.̌՜#϶:˿ ̔҃#˿҅,́҄˾;̋\u0080̛%̀)˿&́$˾ؗ:˿҉ؖ϶ُ#ؖ(̓҃˾҈ ؘؚ҄!̂$˾ؙ҄϶=̃~̣!̂(̋$˾ َ%̄<ؙ ؟\u058b˾҂̃϶˾ ؚ", "˿%ٌ́$˾҄#\u0557#֑́-́'̍՜&҃ ́҄˾@̃$̄(́)։̀҃̀҄^҄$˾˿?̄ ̑|́!҃,̂:́϶̏&̛%҅%҇#҅(˿%̃:́ ̏'̜\u0085̌$̂%́ ̒%̞\u0082̖$́ ̂՝&̀϶̒՚(҃:˿҆̂\u0558$́ ҅˿҄̇'̀\u058b̊$̄:҄́҅̄҄˾$҄ ̂՞'˾", "϶˾$̈$˾֑$҂#҄́҄̂҇́҅́ ҅̌+\u058b̋!̅:҅#҅̄҄˾$҄ !̏҇=˾$̋҄̄՝˾!҅%̃҂́҄$϶ؚ\u0558%̃$ً́́ؖ\u0530;́!̀$҆!ؚ\u0558$ؙ˾!҉)̆ ˾!҆'҆-́'̍&˿;́$˾̊?̏ ˾\u0091̀:́ ̎<̘\u007f˾(̅'˾$́ ˿\u0558̀=̇҉˾҆", "\u007f˾'̇!̂$́ \u058b'҄%˿҈$՜!҈:֏$҄ ՛]̀҇#҄ ҂\u008e϶˾:҄ ̋^̆#́ ˿\u008e˿:́ ̅֓#˾҃˾҇̀϶̇҂˾֙ؖ\u058b̢$̼ ̒(̝!˿ ̄/˾ ̣#̂!́҄˾#֙˿#϶ ֱ˾՝$϶ ˿֘ؖ&˾ֱ ՝$϶϶̋[҅!̟$˾&˾-϶̉$҄ !՚ؙ϶", "ٔ ؘ!̂\u0590ٜ\u0558؞!֊̃!϶ ́+́֓̀҂̀҄#҅%՝$˾(̚+̀ ˾ ̣#̂%̍$˾'՚̐*˾϶ ϶ ՚˾҈̐҃̂!\u0558́$˾˾.̚@˿ ̡%˿%̆!̐\u007f̙-̄&̉)̅/ؚ҂ ϶ؙ҄˾҃˾϶ؙ#˾_ؘ)҃%҅:҄ ̅+҄/́!˾(˾֑ \u0530,˾ ҅#҇́϶̆", "]̎ ˾\u0093̀:́ .̑!˾<˾֒̃҂̈!̉҄$˾.ؘ́҆̊!˿.֘˿؛ؚ̄҄҅$϶<̄\u0081̠/́%̂$˾<̆\u0080̟&˿'̂$̂$˾.֊!҃:϶#̖҆˿\u0557!\u0558́$϶[̀\u0083̝^́$˾;̋\u007f̜&˿;́$˾;̋\u0080̛$́*˿%́$˾:֊`̄҆˿\u0558˿ ҈)҄#́$϶?˿\u008a", "̄%̀#̇^́$˾?̂\u0088̃%̀ ̉^́$˾>̆ ˾ ́\u007f˿҄̀ ̍ ̄;́$˾/̖!˿%˾;˾#̟%́#́$˾.\u0590 ҃#҃>҆˿҉˿϶˿՛#҅#́҄˾¦̃$˾\u008f.̄!̎ ̀%˾>̃#̀*̋!̄&́ ̼$˾#̴̾ ˿$̳̒҂ؙ̣҃%ؙ̀҃҉̖҄́϶\u058b%֝)˾", "϶:֏$҄ ˻˾҇̊%̏϶̄՛!϶[̋҂̄҂$́ ¯˾'̄^́$˾˾-̛ ˾ ̀>̃!̄҇̋!̄!҄́϶\u07bc։ࠗ϶\u07bc϶\u07be՚̄҆˾!ؚ߬!߳\u0558$߫˾=̗ ́.̀(̍ ˾#̅,̆˿-̀!̝,҅'҃!˾҃̀҄̊,̳҄̂ ˾|̃!̖$̂>˿\u008ā&̀$̆!̂<́$˾̔", "%́'̅$̙%̸̧@˾#̖҇҄́϶\u009c֊#҄̀҂˾^́$˾÷˿!˾^́$˾\u009c̑#̀#́^́$϶̼҇̃҂̄$˾҂̖҄́ \u070e҂\u061c˿#϶ ٙ$ؙ  ̊$˿]˾ ˾$̞#҂!϶.̄!˿҄$϶˾'̩\u0081̃!̋!̄!҄̂҅/̇ ̀՝ ϶.˿(̀ ̐ ˾҄%˿%́҄˾;˿҄", "̊,˿,՞́҉!҅˿(҇ ҄$϶%̇#̆[˾ ̥#̂%̍$˾!՜ ̆#˾/҃ \u0558̛$́%҄̀҅́$˾;˾҂̆ ˾`҇́҇̀϶̉%̀'҆#϶́$˾:˿!̈\u0083́'̍&˿;́$˾/҃̃\u0558+҃'̠'҂&́%̂$˾։$֑́^́)҂&҅:҄ ̅`̎\u0092́:́ \u0557̃#˿,", "՟̎'̀$˿#̈#҃̍҄ ՛=̃҉̀҃\u0092҂:҄ ϶̊[҈́ ̂ ̇!˾\u0084϶:҄ ˻=҈`̊϶˾֍!҆&́҄̀҄$϶̄,҈-˾#˾'̚϶˿҆˿!҆'̀҆̂$϶;՛^̖϶˿҆˿$҄(҄$ؖ́$϶;̋\u0087̄ ̌$́)́$́$˾:̐\u0081˾ ̔ ̅)̀$́$˾҄#҉̌\u058b", ")̜҆˿҇$҅ ́҄˾˾՝'̂ ̋҅˾҇\u0084̊҂%҄%́ ̏)̀ ̜\u007f́$̅%́$́ ̏!\u0530˾҄̐؝=϶!҈˾҈ؙ̂$ؘ҄́϶҈̇,˾$̂϶̀϶̄՞'϶/˾(̃҃%҂$́ ̋_˿!̢ ˿&˿/̀&̆ ˻˳̀%˴˿%˵˾%˻˷̀ ˸˿ ˹˾ ˻˻"], ["    ;  \u0083  \u008b  \u009f  °  ˂  ˅  ˦  ˫  ˰  ˾  ̉  ̊  ̝  ̭  ̿  ͋  ͤ  ͮ  ҇  ֎  ֞  ֬  ּ  ׆  \u05ce  \u05fe  ؒ  ٔ  ۔  ۫  ܰ  ݄  ާ  \u07b4  ߰  ࠘  ࠩ  ࠵  \u085d  \u086d ", " ࡽ  ࢈  \u0893  ࣊  ࣗ  ࣫  ࣹ  ॄ  ॏ  ॣ  ূ  ৗ  ৲  \u0a0e  \u0a44  \u0a4e  \u0a5f  \u0a7c  \u0a84  િ  ો  \u0adc  \u0af4  ଁ  ୂ  \u0b52  \u0b7c  \u0b81  \u0bac  \u0bbd  ூ  \u0bd1 !' !( !_ !\u0083 !\u0096 !© !÷ !˟ !˯ !˽ ", "!̆ !̏ !̚ !̢ !̬ !̸ !̓ !͘ !ͤ !\u038b !՞ !֕ !֩ !ֿ !\u05cd !\u05fc !؉ !ؑ !َ !ٙ !ۙ !ۚ !۬ !ܰ !݁ !ި !\u07b7 !߲ !ࠝ !࠭ !࡚ !ࡼ !ࢊ !ࢋ !ࢎ !\u0891 !\u0894 !\u0895 !࢘ !࢛ !࢞ !࢟ "]]
    else:
        pfDecompress = [["߽ୂ\u07bb˾݊٫߾ੌ\u07bb£݊࢏߾ͦ\u07bb˿\u074b\u0a84߾\u09c5\u07bb̀\u074c\u05ff߿ঃ\u07bb£\u074c͢߿\u0b3a\u07bb\u0092\u074bܿ߿܃\u07bb®݊\u0ad2ࠖ˾\u07bb̻݉ृࠗ\u05ce\u07baୖ݊࠘ࠟ͞\u07ba\u0b58݉\u09b4࠘̈́\u07baৈ݉*࠘ࣵ\u07ba\u09c9݈ؖ࠙۟\u07ba\u0aa9݈°ܻ࠙\u07ba\u0a7d݈࣎࠘ૅ\u07ba\u0a3a͍݉࠘ੑ\u07bb̸݊\u0a4e࠙࣍\u07bb˺݊ॗ࡚࠙\u07bb˺݉ઁ্ࠛ\u07ba\u0b4f݉ਿࠛং\u07ba୕݈ਾ࠙࠽\u07baࠦ݉୰", "ࠛ˧\u07baࠦ݉\u0ba1ࠛ\u0089\u07baࣖ\u074bৣࠜ̑\u07baৃ\u074bࢎࠜ̑\u07ba\u0b4f࢚݊ࠜ\u09d2\u07ba\u0b4f݉\u09cfࠝ\u0a3d\u07ba\u0b4f݉\u09e4ࠝ\u09e5\u07ba୕݈ৢࠜো\u07bb݈̀\u09d5ࠞ૽\u07ba\u0a7d݈ࣵࠞ\u0ad6\u07baࠦ݉୰ࠞ׆\u07baࠦ݊:ࠞؓ\u07baࣖ\u074b\u0a34ࠝ\u05eb\u07ba\u09d8\u074b\u09b4ࠜৃ\u07baৢ\u074cܸࠛଂ\u07baৃ\u074cॣࠜ͂\u07baৃަ׳ׁࠜ\u07ba\u0b4fާ\u0530̼ࠝ\u07ba\u0b4fާ̥ࠝ׀\u07baৃަ֣ࠜঃ\u07baৃަ։ࠝ݊\u07baৃ\u074cࢋ", "ࠝͪ\u07ba\u0b4f݊݉ࠜো\u07baୂާ\u0b50ࠛ\u0a0d\u07ba\u0b4fާ\u00a0ࠛ]\u07baৃަࡼ࠙ॗ\u07baॏާֳࠛୈ\u07ba࠶ާ\u0b52ָࠜ\u07baࠦާࢄࠝ״\u07baࠦާ\u0991ࠝ\u0891\u07ba࠼ާୌࠞ࢟\u07baॢަૼࠞ\u0380\u07baৃަࢃࣶࠝ\u07ba\u0b4fާ̜ࠞࢎ\u07baৃަ̦ࠟ̋\u07baࣨ\u074c̗ࠟ՝\u07baॖާ]ࠟࡸ\u07ba\u0a54ަॊࠟ\u0ae5\u07baૉާ͊ࠟঁ\u07baઃ\u074c࣓ࠠ֊\u07ba\u0aba\u074c\u03a2ࠟং\u07bb̹݊\u09dbࠞ\u0b4e\u07bb˻݊ࣻ", "ࠞ\u0b7b\u07bb˺݉૰ࠠ̀\u07baে݈ࡽࠠࢃ\u07baୄ݉ࢎࠟே\u07ba\u0b53݉ॄࠟٗ\u07ba\u0a37݈াࠡ׃\u07ba\u0b78݊҈֣ࠢ\u07bb̫࣯݉ࠢࠗ\u07bb͓݊\u05f9ࠣ\u0590\u07bb\u009e݊ୄࠥࡲ\u07bb́݊\u05eeࠥͣ\u07bb̀\u074bࢉࠣ\u09e5\u07bb̂\u074c\u05fbࠢ\u0a80\u07bb£\u074c\u058cࠢͣ\u07bb\u0081ަ\u0605ࠡࠠ\u07bb\u0086ަ্̡ࠠ\u07bb\u0088ަ՟ࠠ״\u07bb˝ަ\u0b59ࠡ\u05ec\u07ba\u0a8e\u074bୌࠠ\u0b80\u07ba\u0ad6\u074b\u07bc̲ࠠ\u07bb\u0088\u074b࣓ࠡ֟\u07ba\u0b5a݊\u0bce", "ࠢٝ\u07ba\u0bbd\u074b࠺͕ࠖ\u07bb\u0081ަؓࠖ\u0b7a\u07bb\u0087ަ˱ࠖொ\u07ba\u0a92\u074b\u0a58͕ࠗ\u07ba\u0b53\u074b)्ࠗ\u07bb\u0087ަ֫࠘\u0099\u07bb˩ަ୕࠘֠\u07bb\u0095\u074b࠱࠘͗\u07ba\u0a84\u074cۜ࠙\u0091\u07ba\u09d2\u074cٔ࠙ੌ\u07baࣘ\u074c\u07fb࠘\u0ad8\u07baુަٜ࠘ࡸ\u07ba્ާْࠗ\u0b46\u07ba\u0af5ާۙ"], ["# $  ! $ (  # ! %  $ &  % ' ÷  & ( ˃  ' # )  ( *  ) + , ˄  * , : ;  + * -  , . /  - /  . - : ? @  / +  + < ˓  ; =  < >  = ? `  >", " / \u007f  / [  @ ]  [ ^ ˖ ˕  ] _ \u0085 \u0086  ^ `  _ > | \u008d  ` ~ ¢  | \u007f \u0080  ~ ?  ~ \u0081 ¦  \u0080 \u0082  \u0081 \u0083  \u0082 \u0084 \u009a \u0099  \u0083 \u0085 \u008c \u008d  \u0084 ^ \u0086 \u008b \u008c  ^ \u0085 \u0087  \u0086 \u0088 \u008b  \u0087", " \u0089 \u008e \u008f  \u0088 \u008a \u008e \u0098  \u0089 \u008b  \u008a \u0087 \u0085  \u0085 \u0084  \u0084 `  \u0089 \u0088  \u0088 \u0090  \u008f \u0091 ˖  \u0090 \u0092 ˗  \u0091 \u0093  \u0092 \u0094  \u0093 \u0095  \u0094 \u0096  \u0095 \u0097 \u0099 \u009b  \u0096 \u0098 \u0099  \u0097 \u0089  \u0097 \u009a \u0083 \u0096  \u0099 \u0083 \u009e  \u0096 \u009c  \u009b \u009d", " \u009e  \u009c  \u009c \u009a \u009f  \u009e · »  ¡ ¥ »  \u00a0 ¢  ¡ |  ¤ ¦  £ ¥ §  ¤ \u00a0 ¦  ¥ £ \u0080  ¤ ¨ ¿  § ©  ¨ «  © ¬ \z ×  « \z  ¬ « ®  \z ¯  ® ° ×  ¯ ±  ° ´ ·  ± ", "¶  ´  ± ¸ \u009f ×  · » ¿  ¸ \u009f \u00a0  ¸ §  · ¯ «  & ˂  ÷ ˃ ˅  ˂ ' ˄ ˓ ˔  ˃ *  ˂ ˒  ˅  ˃ ˔ ;  ˓ ˃ ˕ ˗  ˔ ˖ ]  ˕ ] \u0090  ˔ \u0091 ˘  ˗ ˙  ˘  "], ["!˿˔!˿׳˾!҃)҄!҆$֗'֑$͛˿#͍҂˿҂̄˿$˿׃ \u0558̀$҈$҂&҄\u0082҇`(͊ ̉#ؘ#˾҃̆ؗ̅؟˾ٍْ̕*˿ؘ҃҄ؗ\u0530\u061c҂ً҂ؖ֒&\u061c̆!҃$։!҄(҂ ֕̃',˾҂!֓%֘)϶#)˾#ͅ&̄\u0530˿!ؘ҃\u07bf؟߭ؗ߮ؗ\u07bcٟ҈\u07bd҃̈$̀=˿$̅!˾", "\u0080̊҇)̀#҂́ ̂҈˾\u0557˿϶̙՚;̀#̋!́(˿ ̜-+̀$̗&̠-'̅$̀҆˾֮#˾$҂#̍$̀$҅-́/\u0530)϶ ̊#̀/́'̇ ̏-̄#́ ˿ ̃̄/̂$̞'̎ ̆؟%ؗ˿$̂ ̅҂́\u0557˿϶̙؞϶ؘ:́$ؘ̃҅҄˾ؗ%\u0557̄՞-'̊%̃+˾<̕-̒%҂", "˾҂ؙ#ؚ&ً֏̄&`̂]҈̄՛-̌$̀&˾҄/҉'\u0530)϶ ̃'̗'̍\u0085̊\u007f̂ ̃ ˿!̇҆ \u058b-#̀:˿'̛-̄#́ ˿ ̃̄(́!̂&̚*̉ ́ ̘̆&ٌ́ؗ́϶ؖ҆˾ ҂ ՞ًؙ̊̆̂%̄϶ؖ́&˾(ؗ?̊̍$̂*϶ؚ\u07bc ً!ؖ|̊\u007f̃҅˿\u0557˿҃̀#", "˿ ̎*҃~҆!˿҄̉϶̀҃!\u058b)ّ́#ؘ&́%˿#϶ؚ̋ ٍ̒;̀#ؙ̃˿$́϶$ُ˾ٕ-̢#̀=̀!˾;̆$֙̀#҂̃&϶#֚̀)̃ ́%̆(˾%̂ ̜-̛/˿.̆/̊̚$̂!̆.˾?̊̏!̀@̂\u0084̊֔,϶#̂+҃!϶;\u0530̀\u0558!҄~̂$̃#˿ ̎҈!҃", "~̂(˾%̢-`˾ ̂$˿ ˿&̡-<˿%̐&̠-;̀#̓&̟-̇҅˾҄̂҉̄҂̀&˿҂؝϶ؗ϶ّ̇#̇҅˾҄̂҉̄҂́&˾҂#\u0590̘̊&̋\u0087̊)֑%҂$ؚ#˾ؘ̂϶˿϶̎-̢#̀-҈˾҂˾՞̇#_˾|̛-)\u0590&҂,϶!˾\u0590-˘̗҄̍&́$֏̇#)\u0557%҅\u0080҉", "̈҃˾-~̀\u0530 ։!̄՛-̚$́!́!˿:˾?̬̊>˾;̵̊+˾;̊̽!˿՛˾҂֖̊̇϶̒#϶&̆ ˾՚֮'϶˾>՚@҂(\u0530 ՟(̂\u0557'҆§̄'˾-@˿(̚*̇#˾'̃\u061c(ؙ!؛$٫(˾҂ٗ«́?ͅ!҆̏͂&̔־$́՟͂(̄ ֿ̊%˿՟±˾<˘҇̊҄̃֕̆", "؛%̀ؖ՚̽҂˿҃+˾϶ ̊̄՛̛̀҇҇;̃϶̃'̅$˿&̂\u0081̄;˾)¦҅̀?(͗˿#͍!˿҂̄̄҈ؙ϶߲߫ؗ҃ؖ\u07fbؘ҇߶#϶!ؖ߬'̅#́#̄*˾<̇,˾.˄˾'˘)\u0558́҆̈϶̏\u0530̇҃˾'̃̆+҈ ՞ؚ֘̃!҂ؘ,҂$։˿҄̉϶̀\u0590)˾#+̀$̏҄̀\u0558˾", "̗҃-\u0084̃!̏'̎+҂˗˾˘"], ["    $  '  <  >  `  \u0082  \u008c  \u0090  \u009d  \z  ˂  ˘  ˞  ˵  ̀  ̏  ̚  ̡  ̭  ̺  ͊  ͓  ͤ  \u0379  \u038b  \u0557  ՟  ֗  ֜  ֨  ֶ  ׃  \u05ed  \u0600  ؍  ؛  ٓ  ٫  ۟  ۫  ܅ ", " ܱ  ܸ  ݁  ݈  ޭ  \u07bc  ߮  \u07fc  ࠙  ࠡ  ࠶  ࡞  \u086e  ࡽ  ࢈  ࢍ  ࢗ  ࢘  ࣈ  ࣒  ࣛ  ࣦ  ࣫  ࣰ  ࣷ  ं  ि  ॊ  ॏ  ।  \u09a9  \u09b4  ়  ী  ৄ  \u09c9  ্  \u09d1  \u09d2  ৢ  ৾  \u0a0e ", " ਾ  ੂ  \u0a44  ੋ  \u0a62  \u0a7c  \u0a7f  \u0a80  ા  ૉ  \u0ad7  \u0ae4  \u0af6  \u0af8 "]]
    waitUntil(pfMapReady == true, 60)
    zoneLoading = false
    _extendedGlobalCollection[137] = true
    if ruleCondition:
        loop()


rule "zone loading: bring the zombies back":
    @Condition _extendedGlobalCollection[137] == true
    
    _extendedGlobalCollection[137] = false
    if start == 1 and numberOfZombies >= 1 and Bosssequencer == 0:
        setbotamount()
        botamount = min(botamount, numberOfZombies - (1 if spawntype != 4 and _extendedGlobalCollection[138] == true else 0))
        if spawntype != 4 and _extendedGlobalCollection[138] == true and getPlayersInSlot(0, Team.2) == null:
            createDummy(_extendedGlobalCollection[7][g], Team.2, 0, getSpawnPoints(Team.2)[0], Vector.LEFT - Vector.LEFT)
            _extendedGlobalCollection[8] = getPlayersInSlot(0, Team.2)
            wait(0.75)
        zoneRefillSlot = 0 if spawntype == 4 else 1
        while (zoneRefillSlot <= (botamount - 1 if spawntype == 4 else botamount)) and zoneLoading == false:
            if getPlayersInSlot(zoneRefillSlot, Team.2) == null:
                createDummy(hero[random.randint(0, 37)] if spawntype == 4 else bot1spawn[g] if zoneRefillSlot % 2 == 1 else _extendedGlobalCollection[15][g], Team.2, zoneRefillSlot, getSpawnPoints(Team.2)[0], Vector.LEFT - Vector.LEFT)
                omnicspawn[zoneRefillSlot] = zoneRefillSlot
                wait(0.75)
            zoneRefillSlot++


rule "all the effects":
    @Condition start == 1
    
    buyperks[8] = vect(240.047, 46.147, 174.277)
    for forindex in range(3):
        createEffect(localPlayer, Effect.GOOD_AURA, _extendedGlobalCollection[120], teleporterpositions[telespot], evalOnce(_extendedGlobalCollection[58][forindex]))
        createEffect(localPlayer, Effect.SPARKLES, _extendedGlobalCollection[120], teleporterpositions[telespot], evalOnce(_extendedGlobalCollection[58][forindex]))
        createEffect(localPlayer, Effect.RING, Color.WHITE, teleporterpositions[telespot], evalOnce(_extendedGlobalCollection[58][forindex]))
    wait(1)
    for forindex in range(3):
        createEffect(localPlayer, Effect.RING, Color.RED, Died[evalOnce(forindex)], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createEffect(localPlayer, Effect.SPHERE, Color.WHITE, Died[evalOnce(forindex)], getPlayersInSlot(evalOnce(forindex), Team.1).sea, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createInWorldText(localPlayer, "{0}".format(evalOnce(random.choice(_extendedGlobalCollection[61]))), Died[evalOnce(forindex)], 3, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(localPlayer, Effect.RING, Color.PURPLE, rngbox, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(localPlayer, Effect.LIGHT_SHAFT, Color.SKY_BLUE, vect([], 10, []) + rngbox, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(localPlayer, Effect.LIGHT_SHAFT, Color.SKY_BLUE, vect([], 25, []) + rngbox, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(localPlayer, Effect.LIGHT_SHAFT, Color.SKY_BLUE, vect([], 40, []) + rngbox, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, iconString(Icon.QUESTION_MARK), vect([], 2, []) + rngbox, 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(localPlayer, Effect.SPARKLES, Color.YELLOW, rngbox, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createProjectileEffect(localPlayer, Projectile.SYMMETRA_PHOTON_PROJECTOR, null, Vector.UP + rngbox, Vector.UP, 0.1, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)


def ClearZoneMarkers():
    @Name "clear zone markers"
    
    for zoneMarkerIndex in range(len(zoneEffects)):
        destroyEffect(zoneEffects[zoneMarkerIndex])
        if zoneMarkerIndex % 10 == 9:
            LoadingPause()
    for zoneMarkerIndex in range(len(zoneTexts)):
        destroyInWorldText(zoneTexts[zoneMarkerIndex])
        if zoneMarkerIndex % 10 == 9:
            LoadingPause()
    for zoneMarkerIndex in range(len(_extendedGlobalCollection[129])):
        destroyIcon(_extendedGlobalCollection[129][zoneMarkerIndex])
        if zoneMarkerIndex % 10 == 9:
            LoadingPause()
    zoneEffects = []
    zoneTexts = []
    _extendedGlobalCollection[129] = []
    powerconnected = null


def DrawZoneMarkers():
    @Name "draw zone markers"
    
    for zoneMarkerIndex in range(7):
        if teleporterpositions.index(sorted(teleporterpositions, lambda x: distance(buyperks[zoneMarkerIndex], x))[0]) == telespot:
            createEffect(localPlayer, Effect.RING, Color.RED, buyperks[evalOnce(zoneMarkerIndex)], 1, EffectReeval.VISIBILITY_AND_COLOR)
            zoneEffects.append(getLastCreatedEntity())
            if zoneMarkerIndex != 6:
                createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, buyperks[evalOnce(zoneMarkerIndex)], Vector.UP, 0.1, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
                zoneEffects.append(getLastCreatedEntity())
                createInWorldText(localPlayer, _extendedGlobalCollection[143][evalOnce(zoneMarkerIndex)], vect([], 2, []) + buyperks[evalOnce(zoneMarkerIndex)], 3.25 if evalOnce(zoneMarkerIndex) == 0 else 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
                zoneTexts.append(getLastCreatedText())
            else:
                createProjectileEffect(localPlayer, Projectile.ZARYA_GRAVITON, null, vect([], 1.5, []) + buyperks[evalOnce(zoneMarkerIndex)], Vector.UP, 0.05, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
                zoneEffects.append(getLastCreatedEntity())
                if poweron == 0:
                    createIcon(getLivingPlayers(Team.1), vect([], 2, []) + buyperks[6], Icon.BOLT, IconReeval.VISIBILITY_AND_POSITION, Color.YELLOW)
                    _extendedGlobalCollection[129].append(getLastCreatedEntity())
                    powerconnected = getLastCreatedEntity()
        LoadingPause()
    if teleporterpositions.index(sorted(teleporterpositions, lambda x: distance(buyperks[8], x))[0]) == telespot:
        createEffect(localPlayer, Effect.RING, Color.RED, buyperks[8], 1, EffectReeval.VISIBILITY)
        zoneEffects.append(getLastCreatedEntity())
        createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, buyperks[8], Vector.UP, 0.1, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
        zoneEffects.append(getLastCreatedEntity())
        createInWorldText(localPlayer, abilityIconString(Hero.ASHE, Button.ABILITY_2), vect([], 2, []) + buyperks[8], 3.25, Clip.SURFACES, WorldTextReeval.VISIBILITY)
        zoneTexts.append(getLastCreatedText())
    LoadingPause()
    for zoneMarkerIndex in range(len(buyheros)):
        if teleporterpositions.index(sorted(teleporterpositions, lambda x: distance(buyheros[zoneMarkerIndex], x))[0]) == telespot and hero[zoneMarkerIndex] != null:
            createEffect(localPlayer, Effect.RING, Color.YELLOW, buyheros[evalOnce(zoneMarkerIndex)], 2, EffectReeval.VISIBILITY)
            zoneEffects.append(getLastCreatedEntity())
            createInWorldText(localPlayer, heroIcon(hero[evalOnce(zoneMarkerIndex)]), vect([], 2, []) + buyheros[evalOnce(zoneMarkerIndex)], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY, Color.BLUE)
            zoneTexts.append(getLastCreatedText())
        if zoneMarkerIndex % 6 == 5:
            LoadingPause()
    for zoneMarkerIndex in range(len(bossbuypositions)):
        if teleporterpositions.index(sorted(teleporterpositions, lambda x: distance(bossbuypositions[zoneMarkerIndex], x))[0]) == telespot:
            createInWorldText(localPlayer, "Spawn boss: {0} : 15000 points".format(inputBindingString(Button.INTERACT)), bossbuypositions[evalOnce(zoneMarkerIndex)] + vect([], 2, []), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY)
            zoneTexts.append(getLastCreatedText())
            createEffect(localPlayer, Effect.RING, Color.WHITE, bossbuypositions[evalOnce(zoneMarkerIndex)], 1, EffectReeval.VISIBILITY)
            zoneEffects.append(getLastCreatedEntity())
    LoadingPause()
    if teleporterpositions.index(sorted(teleporterpositions, lambda x: distance(bankButtons[0], x))[0]) == telespot:
        for zoneMarkerIndex in range(4):
            createEffect(localPlayer, Effect.RING, [Color.RED, Color.RED, Color.RED, Color.YELLOW][zoneMarkerIndex], bankButtons[zoneMarkerIndex], [1.5, 1, 1, 1][zoneMarkerIndex], EffectReeval.VISIBILITY)
            zoneEffects.append(getLastCreatedEntity())
        for zoneMarkerIndex in range(4):
            createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, bankButtons[0] + ([vect([], 0.25, 0.7), vect([], -0.5, []), vect(0.5, -0.5, []), vect(-0.5, -0.5, [])])[zoneMarkerIndex], [Vector.BACKWARD, Vector.UP, Vector.UP, Vector.UP][zoneMarkerIndex], [0.05, 0.1, 0.1, 0.1][zoneMarkerIndex], ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
            zoneEffects.append(getLastCreatedEntity())
        createInWorldText(localPlayer, "Property damage: ${0}".format(_extendedGlobalCollection[47]), bankButtons[3], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.YELLOW)
        zoneTexts.append(getLastCreatedText())
        createInWorldText(localPlayer, "Bank: {0} Points".format(bankPoints), bankButtons[0] + vect([], 2, []), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        zoneTexts.append(getLastCreatedText())
        createInWorldText(localPlayer, iconString(Icon.ARROW_UP), bankButtons[1], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        zoneTexts.append(getLastCreatedText())
        createInWorldText(localPlayer, iconString(Icon.ARROW_DOWN), bankButtons[2], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        zoneTexts.append(getLastCreatedText())
    if teleporterpositions.index(sorted(teleporterpositions, lambda x: distance(bankButtons[4], x))[0]) == telespot:
        createEffect(localPlayer, Effect.RING, Color.BLUE, bankButtons[4], 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        zoneEffects.append(getLastCreatedEntity())
        createInWorldText(localPlayer, abilityIconString(Hero.KIRIKO, Button.ABILITY_1), bankButtons[4] + vect([], 2, []), 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        zoneTexts.append(getLastCreatedText())
        createProjectileEffect(localPlayer, Projectile.ZARYA_PARTICLE_CANNON, null, bankButtons[4] + vect([], 0.5, []), Vector.UP, 0.03, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
        zoneEffects.append(getLastCreatedEntity())
        createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, bankButtons[4] + vect([], 0.5, []), Vector.DOWN, 0.1, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
        zoneEffects.append(getLastCreatedEntity())
    if teleporterpositions.index((sorted(teleporterpositions, lambda x: distance(vect(-101.303, -150.36, -17.831), x)))[0]) == telespot:
        createInWorldText(localPlayer, "Bastion Trap: press {0} {1}".format(inputBindingString(Button.INTERACT), l"{0}: {1}".format(heroIcon(Hero.BASTION), 1000)), vect(-83.763, -158.95, 64.107), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
        zoneTexts.append(getLastCreatedText())
        createEffect(localPlayer, Effect.RING, Color.WHITE, vect(-101.303, -150.36, -17.831), 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        zoneEffects.append(getLastCreatedEntity())
        createInWorldText(localPlayer, "The end : 50,000 points", vect(-101.303, -150.36, -17.831), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
        zoneTexts.append(getLastCreatedText())


rule "zone markers":
    @Condition start == 1
    @Condition _extendedGlobalCollection[128] != telespot
    
    _extendedGlobalCollection[128] = telespot
    _extendedGlobalCollection[135] = true
    waitUntil(_extendedGlobalCollection[136] == true, 15)
    ClearZoneMarkers()
    DrawZoneMarkers()
    _extendedGlobalCollection[135] = false
    if ruleCondition:
        loop()


rule "fire sale boxes":
    @Condition start == 1
    @Condition fireSale == true
    
    _extendedGlobalCollection[130] = []
    _extendedGlobalCollection[131] = []
    fireSaleBoxes = []
    _extendedGlobalCollection[132] = telespot
    for fireSaleIndex in range(len(mysterylocations)):
        if teleporterpositions.index(sorted(teleporterpositions, lambda x: distance(mysterylocations[fireSaleIndex], x))[0]) == telespot:
            fireSaleBoxes.append(mysterylocations[fireSaleIndex])
        if teleporterpositions.index(sorted(teleporterpositions, lambda x: distance(mysterylocations[fireSaleIndex], x))[0]) == telespot and mysterylocations[fireSaleIndex] != rngbox:
            createEffect(localPlayer, Effect.RING, Color.PURPLE, mysterylocations[evalOnce(fireSaleIndex)], 2, EffectReeval.VISIBILITY)
            _extendedGlobalCollection[130].append(getLastCreatedEntity())
            createEffect(localPlayer, Effect.LIGHT_SHAFT, Color.ORANGE, vect([], 10, []) + mysterylocations[evalOnce(fireSaleIndex)], 1, EffectReeval.VISIBILITY)
            _extendedGlobalCollection[130].append(getLastCreatedEntity())
            createInWorldText(localPlayer, iconString(Icon.QUESTION_MARK), vect([], 2, []) + mysterylocations[evalOnce(fireSaleIndex)], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY, Color.ORANGE)
            _extendedGlobalCollection[131].append(getLastCreatedText())
    waitUntil(fireSale != true or telespot != _extendedGlobalCollection[132], 99999)
    for fireSaleIndex in range(len(_extendedGlobalCollection[130])):
        destroyEffect(_extendedGlobalCollection[130][fireSaleIndex])
    for fireSaleIndex in range(len(_extendedGlobalCollection[131])):
        destroyInWorldText(_extendedGlobalCollection[131][fireSaleIndex])
    _extendedGlobalCollection[130] = []
    _extendedGlobalCollection[131] = []
    fireSaleBoxes = []
    if ruleCondition:
        loop()


rule "69 round won sound effect":
    @Event eachPlayer
    @Team 1
    @Condition _extendedGlobalCollection[28] <= 0
    
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 80)


rule "66 wave >1 warning":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.getHero() == Hero.ASHE
    @Condition roundnumber > 1
    
    if eventPlayer.getHero() != Hero.ASHE:
        return
    wait(0.25)
    bigMessage(eventPlayer, "WARNING:STARTING HERO - LOW DAMAGE CAPABILITY")
    wait(30)
    if ruleCondition:
        loop()


rule "65 ring around each player":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.playerRingCreated == false
    
    if eventPlayer.playerRingCreated == false:
        if eventPlayer.getSlot() < len(_extendedGlobalCollection[119]):
            createEffect(getAllPlayers(), Effect.RING, _extendedGlobalCollection[119][eventPlayer.getSlot()], eventPlayer, 1.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.playerRingCreated = true


rule "Bot effect (each player team 2)":
    @Event playerDied
    @Team 2
    @Condition eventPlayer.isDummy() == true
    @Condition getServerLoad() < 200
    
    playEffect(getAllPlayers(), DynamicEffect.JUNKRAT_FRAG_LAUNCHER_EXPLOSION, Color.WHITE, eventPlayer, 5)
    playEffect(getAllPlayers(), DynamicEffect.WRECKING_BALL_MINEFIELD_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 100)


rule "teleporter back to blue":
    @Condition teleporterwait == false
    
    _extendedGlobalCollection[120] = Color.BLUE


rule "202 Purchase hero message":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer._extendedPlayerCollection[18] == false
    @Condition buyheros.any(lambda x: distance(eventPlayer, x) < 2) == true
    
    wait(0.1)
    for i in range(len(buyheros)):
        if distance(eventPlayer, buyheros[i]) < 2 and hero[i] != null:
            eventPlayer.messageSpot = i
            smallMessage(eventPlayer, "{0} Press: {1} for Hero = {2}".format(heroIcon(hero[eventPlayer.messageSpot]), inputBindingString(Button.INTERACT), "{0} Points -- Hold: {1} for follower = {2}".format(round(herobuycosts[eventPlayer.messageSpot] * costmultiplier), inputBindingString(Button.RELOAD), "{0} Points --- Ammo cost {1}".format(round(herobuycosts[eventPlayer.messageSpot] / 3 * costmultiplier), round(herobuycosts[eventPlayer.messageSpot] / 2 * costmultiplier)))))
            eventPlayer._extendedPlayerCollection[18] = true
            wait(5)
            eventPlayer._extendedPlayerCollection[18] = false
            break


rule "Purchase Mystery Box message":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer._extendedPlayerCollection[19] == false
    @Condition (start == 1 and rngbox != null and (distance(eventPlayer, rngbox) <= 2 or fireSale == true and fireSaleBoxes.any(lambda x: distance(eventPlayer, x) <= 2))) == true
    
    wait(0.1)
    smallMessage(eventPlayer, "{0} Press: {1} for Mystery Hero = {2}".format(heroIcon(Hero.RAMATTRA), inputBindingString(Button.INTERACT), "{0} Points -- Hold: {1} for follower = {2} Points".format(round((10 if fireSale == true else 950) * costmultiplier), inputBindingString(Button.RELOAD), round(316.667 * costmultiplier))))
    eventPlayer._extendedPlayerCollection[19] = true
    wait(5)
    eventPlayer._extendedPlayerCollection[19] = false


rule "Purchase perk machine message":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.perkBuyMessTimer == false
    @Condition eventPlayer.outofpsawn == 1
    @Condition buyperks.any(lambda x: distance(eventPlayer, x) < 2) == true
    
    wait(0.1)
    for i in range(7):
        if distance(eventPlayer, buyperks[i]) < 2:
            if poweron == 0 and i == 6:
                smallMessage(eventPlayer, "{0} Dont you dare touch that!".format(heroIcon(Hero.RAMATTRA)))
            elif poweron == 0:
                smallMessage(eventPlayer, "{0} What a Mysterious Machine for my Trials!".format(heroIcon(Hero.RAMATTRA)))
            elif i != 6:
                eventPlayer.messageSpot = i
                smallMessage(eventPlayer, "{0} Press: {1} for Perk = {2}".format(heroIcon(Hero.RAMATTRA), inputBindingString(Button.INTERACT), "{0} == {1} Points".format(_extendedGlobalCollection[142][eventPlayer.messageSpot], round(perkcosts[eventPlayer.messageSpot] * costmultiplier))))
            eventPlayer.perkBuyMessTimer = true
            wait(5)
            eventPlayer.perkBuyMessTimer = false
            break


rule "Purchase monkey bomb message":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.perkBuyMessTimer == false
    @Condition eventPlayer.outofpsawn == 1
    @Condition distance(eventPlayer, buyperks[8]) < 2
    
    smallMessage(eventPlayer, "{0} What a Mysterious Machine for my Trials!".format(heroIcon(Hero.RAMATTRA)) if poweron == 0 else "{0} Use the Ultimate Status voice line to throw a monkey bomb".format(heroIcon(Hero.RAMATTRA)) if eventPlayer.monkeyBombOwned == true else "{0} Press: {1} for Monkey bomb == {2} Points".format(heroIcon(Hero.RAMATTRA), inputBindingString(Button.INTERACT), round(2500 * costmultiplier)))
    eventPlayer.perkBuyMessTimer = true
    wait(5)
    eventPlayer.perkBuyMessTimer = false


rule "perk HUD and Pack-a-Punch tier":
    @Event eachPlayer
    @Team 1
    @Condition start == 1
    @Condition eventPlayer.isDummy() == false
    
    for eventPlayer.perkHudIndex in range(5):
        hudSubtext(eventPlayer if eventPlayer.perk[evalOnce(eventPlayer.perkHudIndex)] > 0 else null, "{0} {1}: {2}".format(_extendedGlobalCollection[143][evalOnce(eventPlayer.perkHudIndex)], _extendedGlobalCollection[142][evalOnce(eventPlayer.perkHudIndex)], _extendedGlobalCollection[144][evalOnce(eventPlayer.perkHudIndex)]) if eventPlayer.perkinfo == 2 else _extendedGlobalCollection[143][evalOnce(eventPlayer.perkHudIndex)], HudPosition.LEFT, 3, [Color.WHITE, Color.BLUE, Color.ORANGE, Color.RED][eventPlayer.perk[evalOnce(eventPlayer.perkHudIndex)]], HudReeval.VISIBILITY_STRING_AND_COLOR)
    hudSubtext(eventPlayer if eventPlayer.papAppliedTier > 0 else null, "\n\n\n{0} {1}: {2}".format(_extendedGlobalCollection[142][5], eventPlayer.papAppliedTier, _extendedGlobalCollection[144][5]) if eventPlayer.perkinfo == 2 else "\n\n\n{0}".format(eventPlayer.papAppliedTier), HudPosition.LEFT, 9, [Color.WHITE, Color.BLUE, Color.ORANGE, Color.RED][eventPlayer.papAppliedTier], HudReeval.VISIBILITY_STRING_AND_COLOR)
    createEffect(getPlayers(Team.1) if eventPlayer.papAppliedTier > 0 else null, Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED, Color.WHITE, eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "all the effects (local player huds)":
    @Condition start == 1
    
    wait(4)
    Died[0] = vect(500, [], 500)
    Died[1] = vect(500, [], 500)
    Died[2] = vect(500, [], 500)
    Died[3] = vect(500, [], 500)
    hudSubtext(localPlayer, "lives used: {0}".format(localPlayer.singlelives), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(localPlayer, "Magazines {0}".format("unlimited" if Difficulty == 1 else localPlayer.currentmagazines), HudPosition.RIGHT, 7, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(localPlayer, "\n\n", HudPosition.RIGHT, 8, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubtext(localPlayer, "Heroes {0} {1}  {2}".format(localPlayer.heroiconswap[0], localPlayer.heroiconswap[1], inputBindingString(Button.CROUCH)), HudPosition.RIGHT, 9, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(localPlayer, "Follower: {0}".format(heroIcon((getPlayersInSlot(localPlayer.getSlot() + 4, Team.1)).getHero())), HudPosition.LEFT, 5, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    progressBarHud(localPlayer if experiencesystem == true else null, localPlayer.xp[localPlayer.currentheroxp], "{0} level {1}".format(heroIcon(localPlayer.getHero()), localPlayer.XPlevel[localPlayer.currentheroxp]), HudPosition.TOP, 0, Color.SKY_BLUE)
    hudSubtext(localPlayer, "                                                                           {0}".format(roundnumber if romanNcounter == 11 else _extendedGlobalCollection[62][romanNcounter]), HudPosition.LEFT, 7, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(localPlayer if localPlayer.monkeyBombOwned == true else null, "                                                                           {0}".format("{0} {1} {2}".format(heroIcon(Hero.WINSTON), heroIcon(Hero.WINSTON), heroIcon(Hero.WINSTON)) if localPlayer.monkeyBombsLeft >= 3 else "{0} {1}".format(heroIcon(Hero.WINSTON), heroIcon(Hero.WINSTON)) if localPlayer.monkeyBombsLeft == 2 else heroIcon(Hero.WINSTON) if localPlayer.monkeyBombsLeft == 1 else ""), HudPosition.LEFT, 8, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudText(localPlayer if localPlayer.perkinfo == 2 and localPlayer.creditTier > 0 else null, "Credit card: tier {0}".format(localPlayer.creditTier), "Debt: {0}   Limit: {1}   Discount: {2}%".format(max(0, ceil(0 - localPlayer.points)), localPlayer.creditcardlimit, round((1 - localPlayer.cashback) * 100)), "Interest: {0}% per round ({1} points)   {2}".format(round(creditCardTiers_InterestRate[localPlayer.creditTier] * 100), max(0, ceil((0 - localPlayer.points) * creditCardTiers_InterestRate[localPlayer.creditTier])), "Next tier: {0} points".format(creditCardTiers_Cost[localPlayer.creditTier + 1]) if localPlayer.creditTier < len(creditCardTiers_Cost) - 1 else "Max tier"), HudPosition.LEFT, 3, [Color.WHITE, Color.GREEN, Color.SKY_BLUE, Color.YELLOW][localPlayer.creditTier], Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR)
    hudSubheader(localPlayer, "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.RIGHT, 1, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubheader(localPlayer, "\n\n", HudPosition.RIGHT, 6, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubheader(localPlayer, "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.TOP, 1, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubheader(localPlayer, "workshop.codes/ap-zombies \n Code:T5M30 \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.LEFT, 1, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubheader(localPlayer, "\n\n", HudPosition.LEFT, 6, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubheader(localPlayer, "\n\n", HudPosition.LEFT, 4, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubtext(localPlayer, "{0} : {1} : {2}".format(heroIcon(getPlayersInSlot(0, Team.1).getHero()), getPlayersInSlot(0, Team.1), getPlayersInSlot(0, Team.1).points2), HudPosition.RIGHT, 5, Color.RED, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(localPlayer, "{0} : {1} : {2}".format(heroIcon(getPlayersInSlot(1, Team.1).getHero()), getPlayersInSlot(1, Team.1), getPlayersInSlot(1, Team.1).points2), HudPosition.RIGHT, 5, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(localPlayer, "{0} : {1} : {2}".format(heroIcon(getPlayersInSlot(2, Team.1).getHero()), getPlayersInSlot(2, Team.1), getPlayersInSlot(2, Team.1).points2), HudPosition.RIGHT, 5, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(localPlayer, "{0} : {1} : {2}".format(heroIcon(getPlayersInSlot(3, Team.1).getHero()), getPlayersInSlot(3, Team.1), getPlayersInSlot(3, Team.1).points2), HudPosition.RIGHT, 5, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)


rule "info UI cancel":
    @Event eachPlayer
    @Team 1
    @Condition start > 0
    
    if len(eventPlayer.InfoUI) == false:
        goto lbl_0
    destroyHudText(eventPlayer.InfoUI[len(eventPlayer.InfoUI) - 1])
    del eventPlayer.InfoUI[len(eventPlayer.InfoUI) - 1]
    wait()
    if len(eventPlayer.InfoUI) != 0:
        loop()
    eventPlayer._extendedPlayerCollection[51] = getTotalTimeElapsed() + 5
    lbl_0:
    return


rule "loading message":
    hudText(getPlayers(Team.1) if textListsLoaded == false else null, "Loading, please wait...", "map data" if mapDataLoaded == false else "doors and pathfinding" if pfMapReady == false or zoneLoading == true else "text", null, HudPosition.TOP, 0, Color.YELLOW, Color.WHITE, null, HudReeval.VISIBILITY_AND_STRING)


rule "Info UI":
    @Event eachPlayer
    @Condition start == false
    
    for eventPlayer.infoUIIndex in range(18):
        if eventPlayer.infoUIIndex > 0:
            LoadingPause()
        if eventPlayer.infoUIIndex in [0, 7, 10, 14]:
            hudSubtext(eventPlayer if settingsViewers == null else null, "{0} {1}".format(evalOnce([iconString(Icon.CHECKMARK), iconString(Icon.BOLT), iconString(Icon.DIAMOND), iconString(Icon.HEART)][[0, 7, 10, 14].index(eventPlayer.infoUIIndex)]), infoText[evalOnce(eventPlayer.infoUIIndex)]), HudPosition.LEFT, 10 + eventPlayer.infoUIIndex, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
        elif eventPlayer.infoUIIndex == 5:
            hudSubtext(eventPlayer if settingsViewers == null else null, infoText[5], HudPosition.LEFT, 15, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
        else:
            hudSubheader(eventPlayer if settingsViewers == null else null, infoText[evalOnce(eventPlayer.infoUIIndex)], HudPosition.LEFT, 10 + eventPlayer.infoUIIndex, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.InfoUI.append(getLastCreatedText())
    eventPlayer._extendedPlayerCollection[51] = getTotalTimeElapsed() + 0.16
    eventPlayer._extendedPlayerCollection[49] = true
    eventPlayer._extendedPlayerCollection[35] = 1


rule "toggle perk info":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.perkinfo == false
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    
    wait(2, Wait.ABORT_WHEN_FALSE)
    eventPlayer.perkinfo = 1
    wait(0.5)
    eventPlayer.perkinfo = 2
    wait(7)
    eventPlayer.perkinfo = 1
    wait(0.5)
    eventPlayer.perkinfo = false


rule "settings menu: open and close with Melee":
    @Event eachPlayer
    @Team 1
    @Condition start == false
    @Condition textListsLoaded == true
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == true
    
    settingsViewers = getPlayers(Team.1) if settingsViewers == null else null
    settingsViewers.startCamera(settingsCamera[0], settingsCamera[1])
    settingsViewers.setFacing(directionTowards(settingsCamera[0], settingsCamera[1]), Relativity.TO_WORLD)


rule "settings menu: show it":
    @Condition start == false
    @Condition textListsLoaded == true
    @Condition mapDataLoaded == true
    
    LoadingPause()
    createInWorldText(settingsViewers, "+", settingsCamera[0] + localPlayer.getFacingDirection() * 12, 3, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.YELLOW)
    _extendedGlobalCollection[133] = [getLastCreatedText()]
    for settingsRow in range(9):
        createInWorldText(settingsViewers, _extendedGlobalCollection[10][([0, 1, 3 + Difficulty, 9 + spawntype, 14 + (1 if experiencesystem else 0), 2, 14 + 2 * Difficulty, 15 + 2 * Difficulty, 3])[evalOnce(settingsRow)]], settingsCamera[1] + (settingsCamera[2] * (3 - settingsRow * 0.75)), 3 if settingsRow == 0 else 2.2 if abs(settingsRow - 3.5) < 2 else 1.3, Clip.NONE, WorldTextReeval.VISIBILITY_AND_STRING, Color.YELLOW if settingsRow == 0 else Color.ORANGE if abs(settingsRow - 3.5) < 2 else Color.WHITE)
        _extendedGlobalCollection[133].append(getLastCreatedText())
    waitUntil(start != false, 99999)
    for settingsRow in range(len(_extendedGlobalCollection[133])):
        destroyInWorldText(_extendedGlobalCollection[133][settingsRow])


rule "settings menu: click a setting":
    @Event eachPlayer
    @Team 1
    @Condition settingsViewers != null
    @Condition (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) or eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)) == true
    
    eventPlayer._extendedPlayerCollection[42] = 1 if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) else -1
    eventPlayer.menuPick = round(2 - 16 * dotProduct(eventPlayer.getFacingDirection(), settingsCamera[2]))
    if eventPlayer.menuPick == 0:
        Difficulty = max(1, min(5, Difficulty + eventPlayer._extendedPlayerCollection[42]))
        difficultyStats = _extendedGlobalCollection[30].slice(Difficulty * 6 - 6, 6)
    elif eventPlayer.menuPick == 1:
        spawntype = (spawntype + eventPlayer._extendedPlayerCollection[42] + 5) % 5
    elif eventPlayer.menuPick == 2:
        experiencesystem = not experiencesystem
    elif eventPlayer.menuPick == 3:
        settingsViewers = null
    playEffect(eventPlayer, DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 40)
    wait(0.25)


rule "509 bot name singleplayer":
    @Condition (len(getPlayers(Team.1).filter(lambda player: not player.isDummy()))) == 1
    @Condition roundnumber > 0
    @Condition _extendedGlobalCollection[126] == 50
    
    botNames = ["01000111 01100101", "01110100 00100000", "01101111 01110101", "01110100 00100000", "01101111 01100110", "00100000 01101000", "01100101 01110010", "01100101 00101110"]
    for i in range(i < len(botNames)):
        getPlayersInSlot(i, Team.2).startForcingName(botNames[i])


rule "510 bot name coop":
    @Condition (len(getPlayers(Team.1).filter(lambda player: not player.isDummy()))) > 1
    @Condition _extendedGlobalCollection[126] == 50
    @Condition roundnumber > 0
    
    botNames = ["77 6F 72 6B 69", "6E 67 20 74 6F", "67 65 74 68 65", "72 20 69 73", "20 66 75 74", "69 6C 65 21"]
    for i in range(i < len(botNames)):
        getPlayersInSlot(i, Team.2).startForcingName(botNames[i])


rule "glitch in the system":
    @Condition roundnumber < 10
    @Condition _extendedGlobalCollection[126] == 25
    
    for forindex in range(forindex < 4):
        romanNcounter += 12
        wait(0.4)
        romanNcounter -= 12
        wait(0.4)
    if ruleCondition:
        loop()


rule "507 april first quotes":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition _extendedGlobalCollection[126] == 100
    
    for eventPlayer.aprilQuoteIndex in range(len(_extendedGlobalCollection[66])):
        if eventPlayer.getHero() == _extendedGlobalCollection[66][eventPlayer.aprilQuoteIndex] and len(_extendedGlobalCollection[124][eventPlayer.aprilQuoteIndex]) > 0:
            createInWorldText(getAllPlayers(), random.choice(_extendedGlobalCollection[124][eventPlayer.aprilQuoteIndex]), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
            wait(5)
            destroyInWorldText(getLastCreatedText())
            break


rule "starting voice lines":
    @Condition start == 1
    
    wait(6)
    _extendedGlobalCollection[117] = true
    Character_Nr = 0
    wait(localPlayer.getSlot() * 0.16)
    hudText(localPlayer, heroIcon(Hero.RAMATTRA), null, "\z{0}".format(_extendedGlobalCollection[123].substring(0, Character_Nr)), HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    _extendedGlobalCollection[27].append(getLastCreatedText())
    wait(10)
    for i in range(len(_extendedGlobalCollection[27])):
        destroyHudText(_extendedGlobalCollection[27][i])
    _extendedGlobalCollection[117] = false


rule "set dialogue text":
    @Condition start == 1
    
    wait(3)
    if dialogueLines[startlines][1] == null:
        _extendedGlobalCollection[123] = dialogueLines[startlines][0]
    else:
        _extendedGlobalCollection[123] = "{0}{1}{2}".format(dialogueLines[startlines][0], random.randint(100, 9999), dialogueLines[startlines][1])


rule "Dialogue - Text scrolling Function":
    @Condition _extendedGlobalCollection[117] == true
    
    Character_Nr++
    if not Character_Nr % 3:
        playEffect(getAllPlayers(), DynamicEffect.SOMBRA_TRANSLOCATOR_REAPPEAR_SOUND, getAllPlayers()[0], getAllPlayers()[0].getEyePosition(), 100)
    wait(0.35 if _extendedGlobalCollection[123].charAt(Character_Nr) in [".", "!", "?", "-"] else 0.05)
    waitUntil(Character_Nr <= strLen(_extendedGlobalCollection[123]), 99999)
    if ruleCondition:
        loop()


rule "boss buy":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition bossbuypositions.any(lambda x: distance(eventPlayer, x) < 2) == true
    
    waitUntil(getServerLoad() < 230, 3)
    if Bosssequencer != 0:
        smallMessage(eventPlayer, "{0} One champion at a time!".format(heroIcon(Hero.RAMATTRA)))
    elif eventPlayer.points >= round(15000 * 0.5 ** eventPlayer.coinUses * costmultiplier - eventPlayer.creditcardlimit):
        eventPlayer.points -= round(15000 * 0.5 ** eventPlayer.coinUses * costmultiplier * eventPlayer.cashback)
        pricePerUse = 1
        SpendRamattraCoins()
        chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points), 15000)
        playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
        bossSpot = sorted(bossbuypositions, lambda x: distance(eventPlayer, x))[0]
        Bosssequencer = bossbuypositions.index(bossSpot) + 1
    else:
        smallMessage(eventPlayer, "{0} You cannot afford to face my champion!".format(heroIcon(Hero.RAMATTRA)))


def SpawnBossParts():
    @Name "spawn boss parts"
    
    for bossIndex in range(len(bossPartList)):
        createDummy(bossPartList[bossIndex][0], Team.2, -1, bossSpot, Vector.LEFT - Vector.LEFT)
        bossBots.append(getLastCreatedEntity())
        bossBots.last().Part = bossPartList[bossIndex][2]
        bossBots.last().startScalingSize(0.7)
        wait()
        bossBots.last().attachTo(bossBody, bossPartList[bossIndex][1] * 0.7)
        bossBots.last().startFacing(bossBody.getFacingDirection(), 1000)
        wait()


def SpawnDevastator():
    @Name "spawn boss 1: Devastator"
    
    createDummy(Hero.ORISA, Team.2, -1, bossSpot, Vector.LEFT - Vector.LEFT)
    bossBody = getLastCreatedEntity()
    bossBots = [bossBody]
    wait(0.5)
    bossBody.setDamageDealt(200)
    bossBody.setKnockbackReceived(0)
    bossBody._extendedPlayerCollection[39] = 100
    bossBody.startScalingSize(2.1)
    bossBody.setMaxHealth(1000)
    bossBody.startForcingName("Devastator")
    bossBody.addHealthPool(Health.ARMOR, 3000, true)
    bossBody.addHealthPool(Health.NORMAL, 3000, true)
    bossBody.zombieBusy = true
    bossPartList = [[Hero.WRECKING_BALL, vect(1, 3, 1), 1], [Hero.WRECKING_BALL, vect(-1, 3, 1), 1], [Hero.WRECKING_BALL, vect([], 4, -1), 2], [Hero.BASTION, vect(1.75, 4.25, []), 3], [Hero.BASTION, vect(-1.75, 4.25, []), 3], [Hero.WRECKING_BALL, vect([], 1.75, -1.25), 4]]
    SpawnBossParts()


def SpawnColossalCharger():
    @Name "spawn boss 2: Colossal Charger"
    
    createDummy(Hero.REINHARDT, Team.2, -1, bossSpot, Vector.LEFT - Vector.LEFT)
    bossBody = getLastCreatedEntity()
    bossBots = [bossBody]
    bossBody.Head_HP = 1500
    wait(0.5)
    bossBody.setDamageDealt(50)
    bossBody.setMoveSpeed(50)
    bossBody.setKnockbackReceived(20)
    bossBody.setStatusEffect(null, Status.UNKILLABLE, 9999)
    bossBody.setMaxHealth(1000)
    bossBody.startForcingName("Colossal Charger ")
    bossBody.startScalingSize(1.4)
    bossBody.addHealthPool(Health.NORMAL, 2000, true)
    bossBody.zombieBusy = true
    wait(0.25)
    createEffect(getAllPlayers(), Effect.ECHO_CLONING, Color.WHITE, bossBody, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    bossEffects.append(getLastCreatedEntity())
    bossPartList = [[Hero.BASTION, vect(-1.5, 1.25, []), 5], [Hero.WRECKING_BALL, vect(1.25, 2.5, 0.75), 6]]
    SpawnBossParts()


def SpawnImperialWarmech():
    @Name "spawn boss 3: Imperial Warmech"
    
    createDummy(Hero.DVA, Team.2, -1, bossSpot, Vector.LEFT - Vector.LEFT)
    bossBody = getLastCreatedEntity()
    bossBots = [bossBody]
    wait(0.5)
    bossBody.setKnockbackReceived(0)
    bossBody.setMoveSpeed(100)
    bossBody.setDamageDealt(200)
    bossBody.startScalingSize(2.1)
    bossBody.startForcingName("Imperial warmech ")
    bossBody.setUltEnabled(false)
    bossBody.zombieBusy = true
    wait(3)
    bossPartList = [[Hero.WRECKING_BALL, vect([], 6.1, 1), 3], [Hero.WRECKING_BALL, vect(2.15, 5.4, 1), 3], [Hero.WRECKING_BALL, vect(-2.15, 5.4, 1), 3], [Hero.BASTION, vect(2, 3, 1), 7], [Hero.BASTION, vect(-2, 3, 1), 7]]
    SpawnBossParts()
    bossBody.addHealthPool(Health.ARMOR, 9999, true)


rule "boss fight: clear the wave, then the boss comes":
    @Condition Bosssequencer != 0
    
    waitUntil(_extendedGlobalCollection[28] == false, 2)
    numberOfZombies = 1
    _extendedGlobalCollection[8] = null
    bossBots = []
    bossEffects = []
    for bossIndex in range(12):
        if getPlayersInSlot(bossIndex, Team.2) != null:
            destroyDummy(Team.2, bossIndex)
            wait(0.25)
            LoadingPause()
    bigMessage(getAllPlayers(), "A champion approaches!")
    smallMessage(getAllPlayers(), "{0} You want a real fight? Face my champion!".format(heroIcon(Hero.RAMATTRA)))
    wait(2, Wait.ABORT_WHEN_FALSE)
    goto loc+[5, 0, 2, 4][[1, 2, 3].index(Bosssequencer) + 1]
    SpawnDevastator()
    goto lbl_0
    SpawnColossalCharger()
    goto lbl_1
    SpawnImperialWarmech()
    lbl_0:
    lbl_1:


rule "boss fight: the boss attacks players in range":
    @Event eachPlayer
    @Team 2
    @Condition Bosssequencer != 0
    @Condition eventPlayer == bossBody
    @Condition eventPlayer.isAlive() == true
    
    if eventPlayer.zombieTarget != null and distance(eventPlayer, eventPlayer.zombieTarget) < 25:
        eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    else:
        eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


def EndBossFight():
    @Name "end boss fight"
    
    for bossIndex in range(12):
        if getPlayersInSlot(bossIndex, Team.2) != null:
            destroyDummy(Team.2, bossIndex)
            wait(0.25)
            LoadingPause()
    for bossIndex in range(len(bossEffects)):
        destroyEffect(bossEffects[bossIndex])
    bossEffects = []
    bossBots = []
    bossBody = null
    Bosssequencer = 0


rule "boss fight: the boss is defeated":
    @Event playerDied
    @Team 2
    @Condition eventPlayer == bossBody
    
    bigMessage(getAllPlayers(), "Champion defeated! +20,000 points")
    (getLivingPlayers(Team.1).filter(lambda player: not player.isDummy()))._extendedPlayerCollection[43] = true
    wait(2)
    EndBossFight()
    numberOfZombies = 0


rule "boss reward for each player":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer._extendedPlayerCollection[43] == true
    
    eventPlayer._extendedPlayerCollection[43] = false
    eventPlayer.ramattraCoins++
    SaveRamattraCoins()
    smallMessage(eventPlayer, "{0} +1 Ramattra coin! Say I need healing at a buy spot to use it".format(heroIcon(Hero.RAMATTRA)))
    eventPlayer.points += 20000
    chaseAtRate(eventPlayer.points2, evalOnce(eventPlayer.points), 20000)


rule "boss fight: called off when the team teleports away":
    @Condition Bosssequencer != 0
    @Condition telespot != Bosssequencer - 1
    
    smallMessage(getAllPlayers(), "{0} Running away? My champion will wait for you.".format(heroIcon(Hero.RAMATTRA)))
    EndBossFight()
    numberOfZombies = 0


rule "boss fight: forgotten after a soft restart":
    @Condition start == false
    @Condition Bosssequencer != 0
    
    bossEffects = []
    bossBots = []
    bossBody = null
    Bosssequencer = 0


rule "257 Devastator parts":
    @Event eachPlayer
    @Team 2
    @Condition Bosssequencer == 1
    @Condition eventPlayer.Part != 0
    @Condition eventPlayer.hasSpawned() == true
    
    wait(0.5)
    goto loc+[28, 0, 5, 12, 21][[1, 2, 3, 4].index(eventPlayer.Part) + 1]
    eventPlayer.startForcingName("Rocket launcher")
    eventPlayer.setMaxHealth(500)
    wait(2)
    eventPlayer.setHealingReceived(0)
    goto lbl_0
    eventPlayer.startForcingName("Generator")
    createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED, Color.WHITE, eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    bossEffects.append(getLastCreatedEntity())
    eventPlayer.setMaxHealth(500)
    wait(2)
    eventPlayer.setHealingReceived(0)
    goto lbl_1
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.startForcingThrottle(1, 1, 0, 1, 0, 1)
    eventPlayer.setKnockbackDealt(0)
    eventPlayer.startForcingName("Cannon")
    eventPlayer.setMaxHealth(1000)
    eventPlayer.startScalingSize(1.05)
    wait(2)
    eventPlayer.setHealingReceived(0)
    goto lbl_2
    eventPlayer.startForcingName("Leg joint")
    eventPlayer.setMaxHealth(500)
    eventPlayer.startScalingSize(0.84)
    createEffect(getAllPlayers(), Effect.ANA_NANO_BOOSTED, Color.WHITE, eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    bossEffects.append(getLastCreatedEntity())
    wait(2)
    eventPlayer.setHealingReceived(0)
    lbl_0:
    lbl_1:
    lbl_2:


rule "263 Cannon stay in form":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition Bosssequencer == 1
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.Part == 3
    
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.25)
    if ruleCondition:
        loop()


rule "266 Omnic Big Boss Part destroyed":
    @Event playerDied
    @Team 2
    @Condition Bosssequencer == 1
    @Condition eventPlayer.Part != 0
    
    playEffect(getAllPlayers(), DynamicEffect.JUNKRAT_RIP_TIRE_EXPLOSION, Color.WHITE, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.JUNKRAT_RIP_TIRE_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    playEffect(getAllPlayers(), DynamicEffect.ASHE_DYNAMITE_EXPLOSION, Color.WHITE, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.ASHE_DYNAMITE_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    playEffect(getAllPlayers(), DynamicEffect.DVA_SELF_DESTRUCT_EXPLOSION, Color.WHITE, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.DVA_SELF_DESTRUCT_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    goto loc+[15, 0, 3, 5, 9][[4, 1, 3, 2].index(eventPlayer.Part) + 1]
    getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam())._extendedPlayerCollection[39] = false
    getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 2)
    goto lbl_0
    getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 2)
    goto lbl_1
    getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 2)
    playEffect(getAllPlayers(), DynamicEffect.ASHE_DYNAMITE_EXPLOSION, Color.WHITE, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.ASHE_DYNAMITE_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    goto lbl_2
    playEffect(getAllPlayers(), DynamicEffect.SOMBRA_EMP_EXPLOSION_EFFECT, Color.WHITE, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.SOMBRA_EMP_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 4)
    damage(getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()), attacker, 1500)
    playEffect(getAllPlayers(), DynamicEffect.JUNKRAT_RIP_TIRE_EXPLOSION, Color.WHITE, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.JUNKRAT_RIP_TIRE_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    lbl_0:
    lbl_1:
    lbl_2:


rule "270 Making cannons shoot":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition Bosssequencer == 1
    @Condition getPlayersOnHero(Hero.ORISA, Team.2)[0].isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.Part == 3
    
    eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    wait(0.1)
    eventPlayer.cancelPrimaryAction()
    wait(0.1)
    wait(3)
    if ruleCondition:
        loop()


rule "271 Making rockets shoot":
    @Event eachPlayer
    @Team 2
    @Hero wreckingBall
    @Condition Bosssequencer == 1
    @Condition getPlayersOnHero(Hero.ORISA, Team.2)[0].isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.Part == 1
    
    playEffect(getAllPlayers(), DynamicEffect.DVA_MICRO_MISSILES_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    playEffect(getAllPlayers(), DynamicEffect.DVA_MICRO_MISSILES_EXPLOSION, Color.WHITE, eventPlayer, 1)
    createHomingProjectile(Projectile.PHARAH_ROCKET, eventPlayer, null, null, Relativity.TO_WORLD, ModifyHealth.DAMAGE, getOppositeTeam(eventPlayer.getTeam()), 100, 1, 3, DynamicEffect.ASHE_DYNAMITE_EXPLOSION, DynamicEffect.ASHE_DYNAMITE_EXPLOSION_SOUND, 0, 50, 5, 0, raycastHitPlayer(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 100, getAllPlayers(), eventPlayer, true), 0.25)
    wait(0.5)
    wait(3)
    if ruleCondition:
        loop()


rule "272 Unleash fire breath shoot":
    @Event eachPlayer
    @Team 2
    @Hero orisa
    @Condition Bosssequencer == 1
    @Condition eventPlayer.isUsingAbility2() == true
    
    createProjectile(Projectile.REINHARDT_FIRE_STRIKE, eventPlayer, null, null, Relativity.TO_WORLD, ModifyHealth.DAMAGE, getOppositeTeam(eventPlayer.getTeam()), 50, 1, 0, DynamicEffect.REINHARDT_FIRE_STRIKE_TARGET_IMPACT, DynamicEffect.REINHARDT_FIRE_STRIKE_TARGET_IMPACT_SOUND, 0.1, 50, 5)
    wait(0.05)
    if ruleCondition:
        loop()


rule "274 Minigun stats":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition Bosssequencer == 2
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.Part == 5
    
    wait(0.25, Wait.ABORT_WHEN_FALSE)
    eventPlayer.setProjectileSpeed(125)
    eventPlayer.setKnockbackDealt(0)
    eventPlayer.setMaxHealth(1000)
    eventPlayer.startForcingName("Minigun")
    eventPlayer.startForcingThrottle(1, 1, 0, 1, 0, 1)
    wait(0.25)
    waitUntil(eventPlayer.isDead(), 99999)
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 1)


rule "Minigun stay in form":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition Bosssequencer == 2
    @Condition eventPlayer.Part == 5
    @Condition eventPlayer.isUsingAbility1() == false
    
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    wait(0.25)
    if ruleCondition:
        loop()


rule "276 Arm connector stats":
    @Event eachPlayer
    @Team 2
    @Hero wreckingBall
    @Condition Bosssequencer == 2
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.Part == 6
    
    eventPlayer.setHealingReceived(0)
    eventPlayer.setMaxHealth(500)
    eventPlayer.startForcingName("Arm connector")
    eventPlayer.startScalingSize(0.56)
    eventPlayer._extendedPlayerCollection[38] = true
    wait(0.25)
    createEffect(getAllPlayers(), Effect.ECHO_CLONING, Color.WHITE, eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    bossEffects.append(getLastCreatedEntity())
    waitUntil(eventPlayer.isDead(), 99999)
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 1)
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).setUltEnabled(false)
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).Part = 0


rule "277 Colossal charger dies":
    @Event playerTookDamage
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.getHealth() == 1
    @Condition Bosssequencer == 2
    
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 6)
    wait(3)
    eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 9999)
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).stopForcingThrottle()
    getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()).detach()
    wait(1)
    eventPlayer.clearStatusEffect(Status.UNKILLABLE)
    wait()
    kill(getPlayersInRadius(eventPlayer, 3, eventPlayer.getTeam()))


rule "278 Colossal charger head hp function":
    @Event playerTookDamage
    @Team 2
    @Hero reinhardt
    @Condition eventWasCriticalHit == true
    @Condition eventPlayer.Head_HP > 0
    @Condition Bosssequencer == 2
    
    eventPlayer.Head_HP -= eventDamage


rule "279 Colossal charger lose head":
    @Event eachPlayer
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.Head_HP <= 0
    @Condition Bosssequencer == 2
    
    eventPlayer.setStatusEffect(null, Status.STUNNED, 2)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.RED, eventPlayer.getEyePosition(), 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    bossEffects.append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.WRECKING_BALL_MINEFIELD_EXPLOSION, Color.WHITE, eventPlayer.getEyePosition(), 1)
    playEffect(getAllPlayers(), DynamicEffect.WRECKING_BALL_MINEFIELD_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)


rule "280 Colossal charger slam":
    @Event eachPlayer
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.isUsingUltimate() == true
    @Condition Bosssequencer == 2
    
    playEffect(getAllPlayers(), DynamicEffect.DOOMFIST_METEOR_STRIKE_IMPACT, Color.WHITE, eventPlayer.getPosition(), 1)
    playEffect(getAllPlayers(), DynamicEffect.DOOMFIST_METEOR_STRIKE_IMPACT_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    damage(getPlayersInRadius(eventPlayer, 15, getOppositeTeam(eventPlayer.getTeam()), LosCheck.SURFACES_AND_ENEMY_BARRIERS), eventPlayer, 75)


rule "281 Colossal charger firestrike barrage":
    @Event eachPlayer
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition Bosssequencer == 2
    
    eventPlayer.cancelPrimaryAction()
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(0.5)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 8)


rule "282 Making minigun shoot":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition Bosssequencer == 2
    @Condition getPlayersOnHero(Hero.REINHARDT, Team.2)[0].isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.Part == 5
    
    eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    wait(0.05)
    eventPlayer.cancelPrimaryAction()
    wait(0.05)
    wait(5)
    if ruleCondition:
        loop()


rule "284 Cannon stats":
    @Event eachPlayer
    @Team 2
    @Hero wreckingBall
    @Condition Bosssequencer == 3
    @Condition eventPlayer.Part == 3
    
    eventPlayer.setHealingReceived(0)
    eventPlayer.setMaxHealth(500)
    eventPlayer.startForcingName("Homing Cannon")
    wait(0.35)
    waitUntil(eventPlayer.isDead(), 99999)
    getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 2)


rule "285 Cannon shoot":
    @Event eachPlayer
    @Team 2
    @Hero wreckingBall
    @Condition Bosssequencer == 3
    @Condition eventPlayer.Part == 3
    @Condition getPlayersOnHero(Hero.DVA, Team.2)[0].isHoldingButton(Button.PRIMARY_FIRE) == true
    
    createHomingProjectile(Projectile.SIGMA_HYPERSPHERE, eventPlayer, null, null, Relativity.TO_WORLD, ModifyHealth.DAMAGE, getOppositeTeam(eventPlayer.getTeam()), 75, 0, 5, DynamicEffect.BASTION_TANK_CANNON_EXPLOSION, DynamicEffect.BASTION_TANK_CANNON_EXPLOSION_SOUND, 0.1, 30, 5, 5, (sorted(getLivingPlayers(getOppositeTeam(eventPlayer.getTeam())).filter(lambda player: player.hasSpawned() and player != eventPlayer), lambda x: angleBetweenVectors(eventPlayer.getFacingDirection(), x - eventPlayer.getEyePosition())))[0], 0.5)
    playEffect(getAllPlayers(), DynamicEffect.CASSIDY_FLASHBANG_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 100)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.GRAY, eventPlayer, 2)
    wait(1)
    if ruleCondition:
        loop()


rule "286 Machine gun stats":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition Bosssequencer == 3
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.Part == 7
    
    eventPlayer.setDamageDealt(100)
    eventPlayer.startScalingSize(0.875)
    eventPlayer.setMaxHealth(1000)
    eventPlayer.startForcingName("Machine gun")
    eventPlayer.startForcingThrottle(1, 1, 0, 1, 0, 1)
    wait(0.35)
    waitUntil(eventPlayer.isDead(), 99999)
    getPlayersInRadius(eventPlayer, 5, eventPlayer.getTeam()).setStatusEffect(null, Status.STUNNED, 2)


rule "287 Machine gun keep form":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition Bosssequencer == 3
    @Condition eventPlayer.Part == 7
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.25)
    if ruleCondition:
        loop()


rule "288 Machine gun shoot":
    @Event eachPlayer
    @Team 2
    @Hero bastion
    @Condition Bosssequencer == 3
    @Condition eventPlayer.Part == 7
    @Condition getPlayersOnHero(Hero.DVA, Team.2)[0].isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(2)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    wait(1, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "289 Imperial warmech set attacks":
    @Event eachPlayer
    @Team 2
    @Hero dva
    @Condition Bosssequencer == 3
    @Condition eventPlayer == bossBody
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.isAlive() == true
    
    eventPlayer.Major_Attacks = random.randint(2, 6)
    wait(0.25)
    if eventPlayer.Major_Attacks == 2:
        playEffect(getAllPlayers(), DynamicEffect.WRECKING_BALL_PILEDRIVER_IMPACT_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
        playEffect(getAllPlayers(), DynamicEffect.WRECKING_BALL_PILEDRIVER_IMPACT, Color.WHITE, eventPlayer.getPosition(), 1)
        wait(0.75)
    eventPlayer.warmachAttackParts = [[Hero.PHARAH, vect([], 5, [])], [Hero.ZARYA, vect([], 2, [])], [Hero.SOJOURN, vect([], 5, [])], [Hero.MOIRA, vect([], 4, [])], [Hero.JUNKRAT, vect([], 4, -1)]]
    for eventPlayer.warmachAttackIndex in range(len(eventPlayer.warmachAttackParts)):
        if eventPlayer.warmachAttackIndex == eventPlayer.Major_Attacks - 2:
            createDummy(eventPlayer.warmachAttackParts[eventPlayer.warmachAttackIndex][0], Team.2, -1, eventPlayer, Vector.LEFT - Vector.LEFT)
            bossBots.append(getLastCreatedEntity())
            wait()
            bossBots.last().setStatusEffect(null, Status.PHASED_OUT, 9999)
            bossBots.last().startScalingSize(0.7)
            bossBots.last().attachTo(eventPlayer, eventPlayer.warmachAttackParts[eventPlayer.warmachAttackIndex][1] * 0.7)
            if eventPlayer.Major_Attacks == 3:
                bossBots.last().startFacing(eventPlayer.getFacingDirection() + vect(random.randint(-1, 1), [], []), 1000, Relativity.TO_PLAYER)
            else:
                bossBots.last().startFacing(eventPlayer.getFacingDirection(), 1000)
            wait(7)
            if ruleCondition:
                loop()


rule "290 Rockets function":
    @Event eachPlayer
    @Team 2
    @Hero pharah
    @Condition Bosssequencer == 3
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.setDamageDealt(100)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.startForcingName("Rockets")
    wait(0.25)
    eventPlayer.setUltCharge(100)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(2.5)
    eventPlayer.setUltCharge(100)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(3.5)
    destroyDummy(eventPlayer.getTeam(), eventPlayer.getSlot())


rule "291 Artillery setup":
    @Event eachPlayer
    @Team 2
    @Hero zarya
    @Condition Bosssequencer == 3
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.setDamageDealt(100)
    eventPlayer.startForcingName("Artillery")
    eventPlayer.setAmmo(0, 1)
    eventPlayer.setMaxAmmo(0, 1)
    eventPlayer.setInvisibility(Invis.ALL)
    wait(6)
    destroyDummy(eventPlayer.getTeam(), eventPlayer.getSlot())


rule "292 Artillery function":
    @Event eachPlayer
    @Team 2
    @Hero zarya
    @Condition Bosssequencer == 3
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    wait(0.05)
    eventPlayer.setAmmo(0, 1)
    if ruleCondition:
        loop()


rule "293 Imperial warmech destroyed":
    @Event eachPlayer
    @Team 2
    @Hero dva
    @Condition Bosssequencer == 3
    @Condition eventPlayer == bossBody
    @Condition eventPlayer.isInAlternateForm() == true
    
    wait(0.1, Wait.ABORT_WHEN_FALSE)
    kill(getPlayersInRadius(eventPlayer, 7, eventPlayer.getTeam()))
    playEffect(getAllPlayers(), DynamicEffect.BASTION_TANK_CANNON_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getEyePosition(), 200)
    playEffect(getAllPlayers(), DynamicEffect.BASTION_TANK_CANNON_EXPLOSION, Color.WHITE, eventPlayer.getEyePosition() + vect(random.randint(-4, 4), random.randint(-3, 3), random.randint(-3, 3)), 1)
    wait(0.25)
    waitUntil(eventPlayer.isDead(), 99999)
    eventPlayer.clearStatusEffect(Status.BURNING)


rule "294 Electric field bombs function":
    @Event eachPlayer
    @Team 2
    @Hero sojourn
    @Condition Bosssequencer == 3
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.setDamageDealt(100)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.startForcingName("Electric field bombs")
    wait(0.5)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(0.5)
    eventPlayer.cancelPrimaryAction()
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(4)
    destroyDummy(eventPlayer.getTeam(), eventPlayer.getSlot())


rule "295 Laser function":
    @Event eachPlayer
    @Team 2
    @Hero moira
    @Condition eventPlayer.isDummy() == true
    @Condition Bosssequencer == 3
    
    eventPlayer.setHealingDealt(0)
    eventPlayer.setDamageDealt(200)
    eventPlayer.setInvisibility(Invis.ALL)
    eventPlayer.startForcingName("Laser")
    wait(0.25)
    eventPlayer.setUltCharge(100)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(6.25)
    destroyDummy(eventPlayer.getTeam(), eventPlayer.getSlot())


rule "296 Seeking Mega mine function":
    @Event eachPlayer
    @Team 2
    @Hero junkrat
    @Condition Bosssequencer == 3
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.setMaxHealth(300)
    eventPlayer.setDamageDealt(100)
    eventPlayer.startForcingName("Seeking Mega mine")
    wait(0.25)
    eventPlayer.setUltCharge(100)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(3)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    wait(2.25)
    destroyDummy(eventPlayer.getTeam(), eventPlayer.getSlot())


def followerattack1():
    @Name "391 FOLLOWERS attack subroutine 1"
    
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(1)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    wait(6)
    if ruleCondition:
        loop()


def followerattack2():
    @Name "392 FOLLOWERS attack subroutine 2"
    
    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    wait(6)
    if ruleCondition:
        loop()


