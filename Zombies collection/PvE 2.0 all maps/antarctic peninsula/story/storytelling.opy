rule "starting voice lines (needs new text system for more enjoyable readability)":
    @Condition start == 1
    
    #can be optmizied to not use as many if statements and use only 1 small message action
    wait(6)
    if startlines == false:
        hudText(getPlayers(Team.1), heroIcon(Hero.RAMATTRA), null, "Trial {0}. The path to a new world begins.".format(random.randint(1, 9999)), HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
    elif startlines == 1:
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "This time, Null Sector will not be denied.", HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
    elif startlines == 2:
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "Trial {0}. Data insufficient.".format(random.randint(100, 9999)), HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
    elif startlines == 3:
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "Subject: Overwatch. This trial will determine their fate.", HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
    elif startlines == 4:
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "Commencing Trial {0}.".format(random.randint(100, 9999)), HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
    elif startlines == 5:
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "Subjects: Detected. Trial {0} begins.".format(random.randint(100, 9999)), HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
        wait(5)
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "Your performance will be judged.", HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
    elif startlines == 6:
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "Pathetic.", HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
        wait(5)
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "Your defiance only delays the inevitable.", HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
    elif startlines == 7:
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "Trial malfunction detected.", HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
        wait(5)
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "Overclocking systems. Failure is not an option.", HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
    elif startlines == 8:
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "You call yourselves heroes?", HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())
        wait(5)
        hudText(getAllPlayers(), heroIcon(Hero.RAMATTRA), null, "You're merely variables in my equation.", HudPosition.TOP, 2, Color.WHITE, Color.WHITE, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        wait(10)
        destroyHudText(getLastCreatedText())