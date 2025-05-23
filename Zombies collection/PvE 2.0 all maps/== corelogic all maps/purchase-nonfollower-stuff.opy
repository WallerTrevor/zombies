def perkbuyanimation():
    @Name "buy perk subroutine"
    
    wait(0.25)
    eventPlayer.communicate(Comms.EMOTE_UP)
    wait(0.05)
    eventPlayer.setMoveSpeed(0)
    wait(2)
    eventPlayer.setMoveSpeed(100)


rule "229 buy perks and power activate":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition any([distance(player, eventPlayer) < heroradius[i] for player, i in perkbuyrandomized]) == true
    
    #add a subroutine for the perk system
    if distance(eventPlayer, perkbuyrandomized[0]) < 2:
        if K == false:
            destroyEffect(powerconnected[0])
            destroyInWorldText(powerconnected[1])
            powerconnected = 1
            K = 1
            bigMessage(getAllPlayers(), l"{0} {1}".format(l"Power", l"On"))
            getPlayers(Team.2).setUltCharge(100)
        #juggernaut
    elif distance(eventPlayer, perkbuyrandomized[1]) < 2:
        if eventPlayer.points >= 2500:
            if eventPlayer.Jugg == false:
                eventPlayer.points -= 2500
                wait(0.25)
                eventPlayer.setMaxHealth(createWorkshopSettingInt("perks", "max HP/ juggernaut", 100, 100, 400))
                heal(eventPlayer, null, 1000)
                eventPlayer.Jugg = 1
                perkbuyanimation()
            elif eventPlayer.Jugg == 1:
                eventPlayer.points -= 2500
                wait(0.25)
                smallMessage(eventPlayer, "  you now get (25) shields 10 seconds after not taking damage")
                heal(eventPlayer, null, 1000)
                eventPlayer.Jugg = 2
                perkbuyanimation()
            elif eventPlayer.Jugg == 2:
                eventPlayer.points -= 2500
                wait(0.25)
                smallMessage(eventPlayer, "  you now get (50) shields 10 seconds after not taking damage")
                heal(eventPlayer, null, 1000)
                eventPlayer.Jugg = 3
                perkbuyanimation()
        elif eventPlayer.points < 2500:
            smallMessage(eventPlayer, "  {0} No points? NO perks!".format(heroIcon(Hero.RAMATTRA)))
        #pack a punch
    elif distance(eventPlayer, perkbuyrandomized[2]) < 2:
        if eventPlayer.points >= 5000:
            if eventPlayer.Packapunch ==false:
                eventPlayer.magazines += 20
                eventPlayer.points -= 5000
                eventPlayer.damagevariable = createWorkshopSettingInt("perks", "pack a punch; damage", 200, 200, 500)
                eventPlayer.setDamageDealt(eventPlayer.damagevariable)
                createEffect(getPlayers(Team.1), Effect.BAPTISTE_IMMORTALITY_FIELD_PROTECTED, Color.WHITE, eventPlayer, 1)
                eventPlayer.Packapunch = 1
                eventPlayer.Maniac = false
                perkbuyanimation()
            elif eventPlayer.Packapunch == 1:
                eventPlayer.points -= 5000
                eventPlayer.damagevariable = 400
                eventPlayer.setDamageDealt(eventPlayer.damagevariable)
                wait(0.25)
                smallMessage(eventPlayer, "  you now get (+400%) damage with this hero")
                createEffect(getPlayers(Team.1), Effect.ANA_NANO_BOOSTED, Color.WHITE, eventPlayer, 1)
                eventPlayer.Packapunch = 2
                perkbuyanimation()
            elif eventPlayer.Packapunch == 2:
                eventPlayer.points -= 5000
                eventPlayer.damagevariable = 800
                eventPlayer.setDamageDealt(eventPlayer.damagevariable)
                wait(0.25)
                smallMessage(eventPlayer, "  you now get (+800%) damage with this hero")
                createEffect(getPlayers(Team.1), Effect.ECHO_CLONING, Color.GREEN, eventPlayer, 1)
                eventPlayer.Packapunch = 3
                perkbuyanimation()
        elif eventPlayer.points < 5000:
            smallMessage(eventPlayer, "  {0} How about pack a few points first!".format(heroIcon(Hero.RAMATTRA)))
        #headshot maniac
    elif distance(eventPlayer, perkbuyrandomized[4]) < 2:
        #check this variable name
        eventPlayer.Packapunch = false
        if eventPlayer.points >= 4000:
            eventPlayer.points -= 4000
            eventPlayer.clearStatusEffect(Status.BURNING)
            #check this variable name
            eventPlayer.damagevariable = 200
            eventPlayer.Maniac = 1
            perkbuyanimation()
            #double mag
        elif distance(eventPlayer, perkbuyrandomized[5]) < 2:
            if eventPlayer.points >= 2000:
                eventPlayer.points -= 2000
                eventPlayer.doublemag = 1
                perkbuyanimation()
                #double mag again?
            elif distance(eventPlayer, perkbuyrandomized[6]) < 2:
                if eventPlayer.points >= 2000:
                    eventPlayer.points -= 2000
                    eventPlayer.doublemag = 1
                    perkbuyanimation()
                    #sprint burst
                elif distance(eventPlayer, perkbuyrandomized[7]) < 2:
                    if eventPlayer.points >= 2000:
                        eventPlayer.points -= 2000
                        eventPlayer.sprintburstperk = 1
                        perkbuyanimation()


rule "boss buy (consolidate later)":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition any([distance(player, eventPlayer) < heroradius[i] for player, i in bossbuypositions]) == true
    
    if distance(bossbuypositions[0], eventPlayer) < 2:
        Bosssequencer = 1
    elif distance(bossbuypositions[1], eventPlayer) < 2:
        Bosssequencer = 2
    elif distance(bossbuypositions[2], eventPlayer) < 2:
        Bosssequencer = 3


rule "202 Purchase hero action (needs purchase hero subroutine)":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition any([distance(player, eventPlayer) < heroradius[i] for player, i in buyheros]) == true
    
    #lucio
    if distance(eventPlayer, buyheros[0]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(Hero.LUCIO)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.LUCIO
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.LUCIO)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            eventPlayer.points -= 1000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == Hero.LUCIO:
                goto lbl_0
            if experiencesystem == false:
                goto lbl_1
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_0:
            lbl_1:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} This melody requires a different kind of rythem".format(heroIcon(Hero.RAMATTRA)))
        #hanzo
    elif distance(eventPlayer, buyheros[1]) < 2:
        if eventPlayer.points >= 1250:
            herobuy1250()
            eventPlayer.startForcingHero(Hero.HANZO)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.HANZO
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.HANZO)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            if eventPlayer.getHero() == Hero.HANZO:
                goto lbl_2
            eventPlayer.xp = eventPlayer.xparray[0]
            lbl_2:
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} This path requires greater discipline".format(heroIcon(Hero.RAMATTRA)))
        #zenyatta
    elif distance(eventPlayer, buyheros[2]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(Hero.ZENYATTA)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.ZENYATTA
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.ZENYATTA)
            eventPlayer.points -= 1000
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == Hero.ZENYATTA:
                goto lbl_3
            if experiencesystem == false:
                goto lbl_4
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_3:
            lbl_4:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} Harmony requires a different balance".format(heroIcon(Hero.RAMATTRA)))
        #soldier 76
    elif distance(eventPlayer, buyheros[3]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(Hero.SOLDIER)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.SOLDIER
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.SOLDIER)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.points -= 1000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == Hero.SOLDIER:
                goto lbl_5
            if experiencesystem == false:
                goto lbl_6
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_5:
            lbl_6:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} This hero cant be bought on impulse! Earn it.".format(heroIcon(Hero.RAMATTRA)))
        #mercy
    elif distance(eventPlayer, buyheros[4]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(Hero.MERCY)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.MERCY
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.MERCY)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.points -= 1000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == Hero.MERCY:
                goto lbl_7
            if experiencesystem == false:
                goto lbl_8
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_7:
            lbl_8:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} You think you can afford a medical license? ".format(heroIcon(Hero.RAMATTRA)))
        #pharah
    elif distance(eventPlayer, buyheros[5]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(Hero.PHARAH)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.PHARAH
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.PHARAH)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.points -= 1000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == Hero.PHARAH:
                goto lbl_9
            if experiencesystem == false:
                goto lbl_10
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_9:
            lbl_10:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} Come back when you're ready to fly.".format(heroIcon(Hero.RAMATTRA)))
        #junkrat
    elif distance(eventPlayer, buyheros[6]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(Hero.JUNKRAT)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.JUNKRAT
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.JUNKRAT)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} This hero needs a more... Explosive budget".format(heroIcon(Hero.RAMATTRA)))
        #symmetra
    elif distance(eventPlayer, buyheros[7]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(Hero.SYMMETRA)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.SYMMETRA
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.SYMMETRA)
            eventPlayer.points -= 1000 + 750
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == Hero.SYMMETRA:
                goto lbl_11
            if experiencesystem == false:
                goto lbl_12
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_11:
            lbl_12:
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} This architect requires a stronger foundation".format(heroIcon(Hero.RAMATTRA)))
        #doomfist
    elif distance(eventPlayer, buyheros[8]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(Hero.DOOMFIST)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.DOOMFIST
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.DOOMFIST)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} This gauntlet wasnt built for free, you know!".format(heroIcon(Hero.RAMATTRA)))
        #baptiste
    elif distance(eventPlayer, buyheros[9]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.startForcingHero(Hero.BAPTISTE)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.BAPTISTE
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.BAPTISTE)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} This detective needs a deeper well of empathy.".format(heroIcon(Hero.RAMATTRA)))
        #bastion
    elif distance(eventPlayer, buyheros[10]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(Hero.BASTION)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.BASTION
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.BASTION)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} No, the bird doesnt come free.".format(heroIcon(Hero.RAMATTRA)))
        #reaper
    elif distance(eventPlayer, buyheros[11]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(Hero.REAPER)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.REAPER
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.REAPER)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.points -= 1000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == Hero.REAPER:
                goto lbl_13
            if experiencesystem == false:
                goto lbl_14
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_13:
            lbl_14:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "  {0} Death awaits... you, if you dont get some points!".format(heroIcon(Hero.RAMATTRA)))
        #genji
    elif distance(eventPlayer, buyheros[12]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.startForcingHero(Hero.GENJI)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.GENJI
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.GENJI)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} Well dont wait for a coupon. start getting points!".format(heroIcon(Hero.RAMATTRA)))
        #ashe
    elif distance(eventPlayer, buyheros[13]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.startForcingHero(Hero.ASHE)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.ASHE
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.ASHE)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} this isnt the right iron for your holster.".format(heroIcon(Hero.RAMATTRA)))
        #zarya
    elif distance(eventPlayer, buyheros[14]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(Hero.ZARYA)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.ZARYA
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.ZARYA)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} You need a bigger heart to bear this power.".format(heroIcon(Hero.RAMATTRA)))
        #roadhog
    elif distance(eventPlayer, buyheros[15]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(Hero.ROADHOG)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.ROADHOG
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.ROADHOG)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} This ain't your brand of brawl".format(heroIcon(Hero.RAMATTRA)))
        #dva
    elif distance(eventPlayer, buyheros[16]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(Hero.DVA)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.DVA
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.DVA)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            eventPlayer.setUltEnabled(true)
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} This is in fact, not easy mode.".format(heroIcon(Hero.RAMATTRA)))
        #brig
    elif distance(eventPlayer, buyheros[17]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(Hero.BRIGITTE)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.BRIGITTE
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.BRIGITTE)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} This armor doesnt come cheap!".format(heroIcon(Hero.RAMATTRA)))
        #rein
    elif distance(eventPlayer, buyheros[18]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(Hero.REINHARDT)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.REINHARDT
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.REINHARDT)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} Honor demands courage... and more points. Now get to it!".format(heroIcon(Hero.RAMATTRA)))
        #torb
    elif distance(eventPlayer, buyheros[19]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(Hero.TORBJORN)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.TORBJORN
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.TORBJORN)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} Seems like your hard works not paying off.".format(heroIcon(Hero.RAMATTRA)))
        #sigma
    elif distance(eventPlayer, buyheros[20]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(Hero.SIGMA)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.SIGMA
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.SIGMA)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "  {0} The melody sounds like you're broke.".format(heroIcon(Hero.RAMATTRA)))
        #orisa
    elif distance(eventPlayer, buyheros[21]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.startForcingHero(Hero.ORISA)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.ORISA
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.ORISA)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} This protector needs more purpose... and points.".format(heroIcon(Hero.RAMATTRA)))
        #moira
    elif distance(eventPlayer, buyheros[22]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.startForcingHero(Hero.MOIRA)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.MOIRA
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.MOIRA)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "  {0} This scientist demands a more curious mind!".format(heroIcon(Hero.RAMATTRA)))
        #mei
    elif distance(eventPlayer, buyheros[23]) < 2:
        if eventPlayer.points >= 30000:
            eventPlayer.startForcingHero(Hero.MEI)
            eventPlayer.heroswap[eventPlayer.currentswap] = Hero.MEI
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(Hero.MEI)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
           if eventPlayer.getHero() not in eventPlayer.allowedheroes:   
                eventPlayer.allowedheroes.append(eventPlayer.getHero())

            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            eventPlayer.points -= 30000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 250)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            eventPlayer.currentmagazines = 50
            if eventPlayer.getHero() == Hero.MEI:
                goto lbl_15
            if experiencesystem == false:
                goto lbl_16
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_15:
            lbl_16:
        elif eventPlayer.points < 30000:
            smallMessage(eventPlayer, "  {0} No, this is not... A-mei-zing. Get points!".format(heroIcon(Hero.RAMATTRA)))
    #buy ending
    if distance(eventPlayer, vect(-101.303, -150.36, -17.831)) < 2:
        if eventPlayer.points >= 50000:
            setSlowMotion(40)
            wait(2)
            declareTeamVictory(Team.1)
        elif eventPlayer.points < 50000:
            smallMessage(eventPlayer, "  {0} HA, good luck escaping...".format(heroIcon(Hero.RAMATTRA)))


rule "78 buy revive multiplayer":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, vect(-83.583, -155.045, 120.352)) < 4
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.points >= 4000
    @Condition powerconnected == 1
    #@Condition __assignTo__(eventPlayer.revivebought, false)
    @Condition getNumberOfPlayers(Team.1) > 1
    
    eventPlayer.points -= 10000
    eventPlayer.revived = 1
    wait(0.1)
    eventPlayer.communicate(Comms.EMOTE_UP)
    #eventPlayer.revivebought = 1
    wait(0.05)
    eventPlayer.setMoveSpeed(0)
    wait(2)
    eventPlayer.setMoveSpeed(100)


rule "173 Purchase winston Omnic bomb":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer, buyperks[9]) < 4
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.points >= 2500
    @Condition powerconnected == 1
    @Condition eventPlayer.Movement == false
    
    eventPlayer.points -= 2500
    eventPlayer.Movement = 1
    playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
    wait(0.1)
    eventPlayer.communicate(Comms.EMOTE_UP)
    eventPlayer.Head_HP = 3
    wait(0.05)
    eventPlayer.setMoveSpeed(0)
    wait(2)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.Part2 = false