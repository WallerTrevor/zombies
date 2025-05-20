rule "starting voice lines (needs new text system for more enjoyable readability)":
    @Condition start == 1
    
    #can be optmizied to not use as many if statements and use only 1 small message action
    wait(6)
    if startlines == false:
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


