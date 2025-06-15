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
    wait(0.4)
    romanNcounter -= 12
    wait(0.4)
    romanNcounter += 12
    wait(0.4)
    romanNcounter -= 12
    wait(0.4)
    if ruleCondition:
        loop()


