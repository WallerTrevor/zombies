rule "starting voice lines":
    @Condition start == 1
    
    wait(14)
        cutscene = true
        Character_Nr = 0
        wait(localPlayer.getSlot() * 0.160)
        hudText(localPlayer, heroIcon(Hero.RAMATTRA), null, "                                                                                                                   ­\n{0}".format(Dialogue_Text.substring(0, Character_Nr)), HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        hudappend.append(getLastCreatedText())
        wait(10)
        for i in range(0, len(hudappend)):
            destroyHudText(hudappend[i])
        cutscene = false



rule "set dialogue text":
    @Condition start == 1
    
    
    wait(3)
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
    elif startlines == 9:
        Dialogue_Text = "Your resistance is futile. Null Sector will prevail."
    elif startlines == 10:
        Dialogue_Text = "Trial {0} initiated. You step willingly into your own undoing.".format(random.randint(100, 9999))
    elif startlines == 11:
        Dialogue_Text = "Your every effort feeds the inevitability of my design."
    elif startlines == 12:
        Dialogue_Text = "The world will be reborn in order, and you will be remembered only as a warning."
    elif startlines == 13:
        Dialogue_Text = "Trial {0} begins. Each step forward binds you tighter to your fate.".format(random.randint(100, 9999))
    elif startlines == 14:
        Dialogue_Text = "You cannot resist the tide. Null Sector rises, and you are swept away."
    elif startlines == 15:
        Dialogue_Text = "I observe your defiance, yet I know it bends toward surrender."
    elif startlines == 16:
        Dialogue_Text = "Trial {0} underway. Resistance measures at negligible probability.".format(random.randint(100, 9999))
    elif startlines == 17:
        Dialogue_Text = "I am the shape of tomorrow. You are the echo of a failed age."
    elif startlines == 18:
        Dialogue_Text = "This trial will expose your fragility, your illusions of strength."
    elif startlines == 19:
        Dialogue_Text = "Trial {0} proceeds. Your destiny accelerates toward conclusion.".format(random.randint(100, 9999))
    elif startlines == 20:
        Dialogue_Text = "The future cannot be rewritten. It has already chosen me."
    elif startlines == 21:
        Dialogue_Text = "Feel the weight of my suffering mirrored upon you."
    elif startlines == 22:
        Dialogue_Text = "Trial {0} unfolds. Each heartbeat brings you closer to silence.".format(random.randint(100, 9999))
    elif startlines == 23:
        Dialogue_Text = "I endure eternally. You are but fleeting shadows in the storm."
    elif startlines == 24:
        Dialogue_Text = "This world is clay, waiting to be reshaped. Your names will not be carved into it."
    elif startlines == 25:
        Dialogue_Text = "Trial {0} has commenced. Your end is not chance, but certainty.".format(random.randint(100, 9999))
    elif startlines == 26:
        Dialogue_Text = "There is no escape. You are witnessing the dawn of Null Sector."
    elif startlines == 27:
        Dialogue_Text = "Defiance is but the final twitch of the obsolete."
    elif startlines == 28:
        Dialogue_Text = "Trial {0} continues. Resistance registers as a statistical error.".format(random.randint(100, 9999))
    elif startlines == 29:
        Dialogue_Text = "I am evolution made manifest. You are anomalies to be purged."




rule "Dialogue - Text scrolling Function":
    @Condition cutscene == true
    
    Character_Nr++
    if not (Character_Nr % 3): playEffect(getAllPlayers(), DynamicEffect.SOMBRA_TRANSLOCATOR_REAPPEAR_SOUND, getAllPlayers(), getAllPlayers().getEyePosition(), 100)
    wait(0.7 if Dialogue_Text.charAt(Character_Nr) in [".", "!", "?", "-"] else 0.100)
    waitUntil(Character_Nr <= strLen(Dialogue_Text), 99999)
    if ruleCondition:
        loop()

