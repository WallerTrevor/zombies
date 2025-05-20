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


rule "perk info expanded":
    @Event eachPlayer
    @Condition eventPlayer.perkinfo == 2
    
    #these need to have an array of details with info for each perk
    hudText(eventPlayer, "{0}".format(iconString(Icon.CLUB)), "Increased health", "juggernaut", HudPosition.LEFT, 3, Color.ORANGE, Color.ORANGE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.Perkui.append(getLastCreatedText())
    hudText(eventPlayer, "{0}".format(iconString(Icon.DIAMOND)), "increased damage", "Pack-a-Punch", HudPosition.LEFT, 3, Color.SKY_BLUE, Color.ORANGE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.Perkui.append(getLastCreatedText())
    hudText(eventPlayer, "{0}".format(iconString(Icon.BOLT)), "speed increased", "sprint boost", HudPosition.LEFT, 3, Color.RED, Color.ORANGE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.Perkui.append(getLastCreatedText())
    hudText(eventPlayer, "{0}".format(iconString(Icon.HEART)), "increased healing", "Field Medic", HudPosition.LEFT, 3, Color.RED, Color.ORANGE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.Perkui.append(getLastCreatedText())


rule "perk delete":
    @Event eachPlayer
    @Condition eventPlayer.perkinfo == 1
    
    destroyHudText(eventPlayer.Perkui[len(eventPlayer.Perkui) - 1])
    del eventPlayer.Perkui[len(eventPlayer.Perkui) - 1]
    wait()
    if len(eventPlayer.Perkui) != 0:
        loop()
    return


rule "perk info simplified":
    @Event eachPlayer
    @Team 1
    @Condition start == 1
    @Condition eventPlayer.perkinfo == false
    
    #this could be a loop
    if roundnumber > 0:
        goto lbl_0
    wait(9)
    lbl_0:
    hudHeader(eventPlayer, "{0}".format(iconString(Icon.CLUB)), HudPosition.LEFT, 3, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.Perkui.append(getLastCreatedText())
    hudHeader(eventPlayer, "{0}".format(iconString(Icon.DIAMOND)), HudPosition.LEFT, 3, Color.SKY_BLUE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.Perkui.append(getLastCreatedText())
    hudHeader(eventPlayer, "{0}".format(iconString(Icon.BOLT)), HudPosition.LEFT, 3, Color.RED, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.Perkui.append(getLastCreatedText())
    hudHeader(eventPlayer, "{0}".format(iconString(Icon.HEART)), HudPosition.LEFT, 3, Color.RED, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.Perkui.append(getLastCreatedText())
    hudSubheader(eventPlayer, " \n\n", HudPosition.LEFT, 6, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    eventPlayer.Perkui.append(getLastCreatedText())


rule "settings page (not finished)":
    @Event eachPlayer
    @Team 1
    @Condition start == 2
    
    eventPlayer.startCamera(vect(169.539, 51.549, 424.869), vect(183.415, 49.892, 412.655))
    hudHeader(getAllPlayers(), "Difficulty settings:", HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(eventPlayer, "Damage recieved: {0}".format(Difficulty), HudPosition.TOP, 0, Color.RED, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(eventPlayer, "bonus points: 0", HudPosition.TOP, 0, Color.RED, HudReeval.VISIBILITY_AND_STRING)
    hudHeader(getAllPlayers(), "Stability settings:", HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(eventPlayer, "less zombies: {0}".format(lesszomb), HudPosition.TOP, 0, Color.RED, HudReeval.VISIBILITY_AND_STRING)


rule "settings page initial control":
    @Event eachPlayer
    @Condition start != 1
    
    #could probably use a if-then-else here unless double if doesnt work with this
    if start == false:
        if eventPlayer.isHoldingButton(Button.MELEE) == true:
            start = 2
        elif start == 2:
            if eventPlayer.isHoldingButton(Button.CROUCH):
                start = false


rule "521 settings screen message (i feel like a small message isnt what i want)":
    @Event eachPlayer
    @Condition start == 2
    
    smallMessage(eventPlayer, "Press crouch to go back!")
    wait(8)
    if ruleCondition:
        loop()


rule "fun fact system (make this on main menu, or its only when the team dies on a game over screen)":
    @Event eachPlayer
    @Team 1
    @Condition start == false
    @Disabled
    
    wait(3)
    hudSubtext(eventPlayer, "Tip: {0}".format(random.choice(tipstrings)), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    wait(15)
    destroyHudText(getLastCreatedText())


rule "66 wave >1 warning":
    @Event eachPlayer
    @Team 1
    #might need to make this for any starting hero, and
    @Condition isHeroBeingPlayed(Hero.CASSIDY, Team.1) == eventPlayer.getHero()
    #then once player buys said hero again they become stronger, but playtesting required
    @Condition roundnumber > 1
    
    if eventPlayer.getHero() != Hero.CASSIDY:
        return
    wait(0.25)
    bigMessage(eventPlayer, "WARNING:STARTING HERO - LOW DAMAGE CAPABILITY")
    wait(30)
    if ruleCondition:
        loop()


rule "69 round won sound effect":
    @Event eachPlayer
    @Team 1
    @Condition Z <= 0
    
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 80)


rule "info UI cancel":
    @Event eachPlayer
    @Team 1
    @Condition start > 0
    
    if len(eventPlayer.InfoUI) == false:
        goto lbl_0
    destroyHudText(eventPlayer.InfoUI[len(eventPlayer.InfoUI) - 1])
    del eventPlayer.InfoUI[len(eventPlayer.InfoUI) - 1]
    wait(0)
    if len(eventPlayer.InfoUI) != 0:
        loop()
    eventPlayer.InfoCooldown = getTotalTimeElapsed() + 5
    #eventPlayer.UI = false
    lbl_0:
    return


rule "Info UI":
    @Event eachPlayer
    @Condition start == false
    
    #might make this a subroutine and then let it be a toggle players can use to read while playing
    #hudSubtext(eventPlayer, ".", HudPosition.LEFT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    #eventPlayer.InfoUI.append(getLastCreatedText())
    #wait()
    hudSubtext(eventPlayer, "Hold spacebar for perk info, and use crouch to switch heros.", HudPosition.LEFT, 15, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "You will only get your ultimate once per wave, use it wisely!", HudPosition.LEFT, 15, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "You can find the latest version on Workshop.codes made by dropthatbeat", HudPosition.LEFT, 102, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "Zombies collection:workshop.codes/c/bvziup", HudPosition.LEFT, 101, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubtext(eventPlayer, "{0} Workshop Information:".format(iconString(Icon.HEART)), HudPosition.LEFT, 100, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "You have limited ammo, Reloading throws away your old magazine", HudPosition.LEFT, 33, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "shooting the same zombie in coop gives bonus points", HudPosition.LEFT, 32, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "Score in the bottom right. prices displayed in game. press interact to buy", HudPosition.LEFT, 31, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubtext(eventPlayer, "{0}How points work:".format(iconString(Icon.DIAMOND)), HudPosition.LEFT, 30, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "Connecting the power allows you to buy perks and pack a punch.", HudPosition.LEFT, 22, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "When you connect the power make sure no zombies are around as they will ultimate", HudPosition.LEFT, 21, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubtext(eventPlayer, "{0}Connect the power".format(iconString(Icon.BOLT)), HudPosition.LEFT, 20, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, " in the map there is a mystery box, several perks, if you die you lose them, excluding Pack a punch", HudPosition.LEFT, 13, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "Try to progress and survive by switching heros, starting heros do less damage, instead melee for bonus damage!", HudPosition.LEFT, 12, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "most waves are normal zombies, but randomly picked waves will have challenges", HudPosition.LEFT, 11, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubtext(eventPlayer, "{0} How This mode works:".format(iconString(Icon.CHECKMARK)), HudPosition.LEFT, 10, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    hudSubheader(eventPlayer, "In solo play, you get 3 lives, however in coop you can revive each other", HudPosition.LEFT, 14, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    wait()
    #hudSubtext(eventPlayer, ".", HudPosition.LEFT, 2, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    #eventPlayer.InfoUI.append(getLastCreatedText())
    hudSubheader(eventPlayer, "                                                    |   Start the mode to hide the instructions   |", HudPosition.LEFT, 900, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.InfoUI.append(getLastCreatedText())
    eventPlayer.InfoCooldown = getTotalTimeElapsed() + 0.16
    eventPlayer.HideHints = true
    eventPlayer.UI = 1


rule "all the effects (each player) (and huds)":
    @Event eachPlayer
    @Team 1
    @Condition start == 1
    
    #if experiencesystem == 1:
    #progressBarHud(eventPlayer, eventPlayer.xp[eventPlayer.currentheroxp], "current level {0}".format(eventPlayer.XPlevel[eventPlayer.currentheroxp]), HudPosition.TOP, 0, Color.GREEN, Color.BLUE, ProgressHudReeval.VALUES)
    Died[0] = vect(500, 0, 500)
    Died[1] = vect(500, 0, 500)
    Died[2] = vect(500, 0, 500)
    Died[3] = vect(500, 0, 500)
    wait(9)
    if not ruleCondition:
        return
    hudSubtext(eventPlayer, "lives used: {0}".format(eventPlayer.singlelives), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(eventPlayer, " \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.RIGHT, 1, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubheader(eventPlayer, " \n\n", HudPosition.RIGHT, 6, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubtext(eventPlayer, "Magazines {0}".format(eventPlayer.currentmagazines), HudPosition.RIGHT, 7, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudText(eventPlayer, "", null, "{0} : {1} : {2}".format(heroIcon(getPlayersInSlot(0, Team.1).getHero()), getPlayersInSlot(0, Team.1), getPlayersInSlot(0, Team.1).points2), HudPosition.RIGHT, 5, Color.WHITE, Color.WHITE, Color.RED, HudReeval.VISIBILITY_AND_STRING)
    hudText(eventPlayer, "", null, "{0} : {1} : {2}".format(heroIcon(getPlayersInSlot(1, Team.1).getHero()), getPlayersInSlot(1, Team.1), getPlayersInSlot(1, Team.1).points2), HudPosition.RIGHT, 5, Color.WHITE, Color.WHITE, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    hudText(eventPlayer, "", null, "{0} : {1} : {2}".format(heroIcon(getPlayersInSlot(2, Team.1).getHero()), getPlayersInSlot(2, Team.1), getPlayersInSlot(2, Team.1).points2), HudPosition.RIGHT, 5, Color.WHITE, Color.WHITE, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    hudText(eventPlayer, "", null, "{0} : {1} : {2}".format(heroIcon(getPlayersInSlot(3, Team.1).getHero()), getPlayersInSlot(3, Team.1), getPlayersInSlot(3, Team.1).points2), HudPosition.RIGHT, 5, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(eventPlayer, " \n\n", HudPosition.RIGHT, 8, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubtext(eventPlayer, "Heroes {0} {1}  {2}".format(eventPlayer.heroiconswap[0], eventPlayer.heroiconswap[1], inputBindingString(Button.CROUCH)), HudPosition.RIGHT, 9, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(eventPlayer, "Follower: {0}".format(heroIcon((getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).getHero())), HudPosition.LEFT, 5, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(eventPlayer, " \n\n", HudPosition.LEFT, 4, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubtext(eventPlayer, "                                                                             {0}".format(romanN[romanNcounter]), HudPosition.LEFT, 7, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(eventPlayer, " \n\n", HudPosition.LEFT, 6, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubheader(eventPlayer, " \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.LEFT, 1, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudSubheader(eventPlayer, "workshop.codes/ap-zombies \n Code:T5M30", HudPosition.LEFT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubheader(eventPlayer, " \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", HudPosition.TOP, 1, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.NEVER)


rule "193 achivements logic":
    @Disabled
    @Delimiter
    


rule "194 achivements menu":
    @Disabled
    
    hudSubtext(getAllPlayers(), "achivement progress carries between playthroughs", HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(getAllPlayers(), "deal 50000 damage {0}".format(null), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(getAllPlayers(), "teleport 20 times {0}".format(null), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(getAllPlayers(), "play as each hero once {0}".format(null), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(getAllPlayers(), "complete the easteregg {0}".format(null), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(getAllPlayers(), "buy the trap 10 times {0}".format(null), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(getAllPlayers(), "pack a punch the wonderweapon {0}".format(null), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(getAllPlayers(), "earn 500 eliminations {0}".format(null), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudSubtext(getAllPlayers(), "beat all 3 boss'", HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)


rule "195 credits":
    @Disabled
    
    createInWorldText(getAllPlayers(), "by Dropthatbeat#11756", vect(0, 0, 0), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createInWorldText(getAllPlayers(), "B73NS#2325 for the boss fights", vect(0, 0, 0), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createInWorldText(getAllPlayers(), "with the help of the people over at workshop.codes", vect(0, 0, 0), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createInWorldText(getAllPlayers(), "and lastly: you guys, Thanks for playing!", vect(0, 0, 0), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    getPlayers(Team.1).startCamera(vect(0, 0, 0), vect(0, 0, 0))


