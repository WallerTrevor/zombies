rule "starting voice lines (needs new text system for more enjoyable readability)":
    @Condition start == 1
    
    #can be optmizied to not use as many if statements and use only 1 small message action
    wait(14)
        cutscene = true
        Character_Nr = 0
        hudText(getPlayers(Team.1), heroIcon(Hero.RAMATTRA), null, "                                                                                                                   ­\n{0}".format(Dialogue_Text.substring(0, Character_Nr)), HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait()
        hudappend.append(getLastCreatedText())
        wait(10)
        destroyHudText(hudappend[0])
        cutscene = false



rule "set dialogue text":
    @Condition start == 1
    wait(3)
    Character_Nr = 0
    if startlines == false:
        Dialogue_Text = "Trial {0}. The path to a new world begins.".format(random.randint(100, 9999))
    elif startlines == 1:
        Dialogue_Text = "This time, Null Sector will not be denied."
    elif startlines == 2:
        Dialogue_Text = "Trial {0}. Data insufficient.".format(random.randint(100, 9999))
    elif startlines == 3:
        Dialogue_Text = "Subject: Overwatch. This trial will determine their fate."
    elif startlines == 4:
        Dialogue_Text = "Commencing Trial {0}.".format(random.randint(100, 9999))
    elif startlines == 5:
        Dialogue_Text = "Subjects: Detected. Trial {0} begins.".format(random.randint(100, 9999))
    elif startlines == 6:
        Dialogue_Text = "Pathetic. Your defiance only delays the inevitable."
    elif startlines == 7:
        Dialogue_Text = "Trial malfunction detected. Overclocking systems. Failure is not an option."
    elif startlines == 8:
        Dialogue_Text = "You call yourselves heroes? You're merely variables in my equation."



rule "Dialogue - Text scrolling Function":
    @Event eachPlayer
    @Condition cutscene == true
    
    Character_Nr++
    if not (Character_Nr % 3): playEffect(getAllPlayers(), DynamicEffect.SOMBRA_TRANSLOCATOR_REAPPEAR_SOUND, eventPlayer.getTeam(), eventPlayer.getEyePosition(), 100)
    wait(0.7 if Dialogue_Text.charAt(Character_Nr) in [".", "!", "?", "-"] else 0.100)
    waitUntil(Character_Nr <= strLen(Dialogue_Text), 99999)
    if ruleCondition:
        loop()

