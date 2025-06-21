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
            eventPlayer.startForcingHero(hero[0])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[0]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[0])
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            eventPlayer.points -= 1000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == hero[0]:
                goto lbl_0
            if experiencesystem == false:
                goto lbl_1
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_0:
            lbl_1:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[0]))
        #hanzo
    elif distance(eventPlayer, buyheros[1]) < 2:
        if eventPlayer.points >= 1250:
            herobuy1250()
            eventPlayer.startForcingHero(hero[1])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[1]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[1])
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            if eventPlayer.getHero() == hero[1]:
                goto lbl_2
            eventPlayer.xp = eventPlayer.xparray[0]
            lbl_2:
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[1]))
        #zenyatta
    elif distance(eventPlayer, buyheros[2]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(hero[2])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[2]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[2])
            eventPlayer.points -= 1000
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == hero[2]:
                goto lbl_3
            if experiencesystem == false:
                goto lbl_4
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_3:
            lbl_4:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[2]))
        #soldier 76
    elif distance(eventPlayer, buyheros[3]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(hero[3])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[3]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[3])
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.points -= 1000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == hero[3]:
                goto lbl_5
            if experiencesystem == false:
                goto lbl_6
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_5:
            lbl_6:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[3]))
        #mercy
    elif distance(eventPlayer, buyheros[4]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(hero[4])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[4]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[4])
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.points -= 1000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == hero[4]:
                goto lbl_7
            if experiencesystem == false:
                goto lbl_8
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_7:
            lbl_8:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[4]))
        #pharah
    elif distance(eventPlayer, buyheros[5]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(hero[5])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[5]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[5])
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.points -= 1000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == hero[5]:
                goto lbl_9
            if experiencesystem == false:
                goto lbl_10
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_9:
            lbl_10:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[5]))
        #junkrat
    elif distance(eventPlayer, buyheros[6]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(hero[6])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[6]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[6])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[6]))
        #symmetra
    elif distance(eventPlayer, buyheros[7]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(hero[7])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[7]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[7])
            eventPlayer.points -= 1000 + 750
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == hero[7]:
                goto lbl_11
            if experiencesystem == false:
                goto lbl_12
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_11:
            lbl_12:
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[7]))
        #doomfist
    elif distance(eventPlayer, buyheros[8]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(hero[8])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[8]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[8])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[8]))
        #baptiste
    elif distance(eventPlayer, buyheros[9]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.startForcingHero(hero[9])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[9]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[9])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[9]))
        #bastion
    elif distance(eventPlayer, buyheros[10]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(hero[10])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[10]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[10])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[10]))
        #reaper
    elif distance(eventPlayer, buyheros[11]) < 2:
        if eventPlayer.points >= 1000:
            eventPlayer.startForcingHero(hero[11])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[11]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[11])
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.points -= 1000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
            eventPlayer.currentmagazines = 10
            if eventPlayer.getHero() == hero[11]:
                goto lbl_13
            if experiencesystem == false:
                goto lbl_14
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_13:
            lbl_14:
        elif eventPlayer.points < 1000:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[11]))
        #genji
    elif distance(eventPlayer, buyheros[12]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.startForcingHero(hero[12])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[12]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[12])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[12]))
        #ashe
    elif distance(eventPlayer, buyheros[13]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.startForcingHero(hero[13])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[13]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[13])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[13]))
        #zarya
    elif distance(eventPlayer, buyheros[14]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(hero[14])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[14]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[14])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[14]))
        #roadhog
    elif distance(eventPlayer, buyheros[15]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(hero[15])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[15]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[15])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[15]))
        #dva
    elif distance(eventPlayer, buyheros[16]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(hero[16])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[16]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[16])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            eventPlayer.setUltEnabled(true)
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[16]))
        #brig
    elif distance(eventPlayer, buyheros[17]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(hero[17])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[17]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[17])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[17]))
        #rein
    elif distance(eventPlayer, buyheros[18]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(hero[18])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[18]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[18])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[18]))
        #torb
    elif distance(eventPlayer, buyheros[19]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(hero[19])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[19]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[19])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[19]))
        #sigma
    elif distance(eventPlayer, buyheros[20]) < 2:
        if eventPlayer.points >= 1750:
            eventPlayer.startForcingHero(hero[20])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[20]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[20])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1750()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1750:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[20]))
        #orisa
    elif distance(eventPlayer, buyheros[21]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.startForcingHero(hero[21])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[21]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[21])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[21]))
        #moira
    elif distance(eventPlayer, buyheros[22]) < 2:
        if eventPlayer.points >= 1250:
            eventPlayer.startForcingHero(hero[22])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[22]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[22])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            herobuy1250()
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
        elif eventPlayer.points < 1250:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[22]))
        #mei
    elif distance(eventPlayer, buyheros[23]) < 2:
        if eventPlayer.points >= 30000:
            eventPlayer.startForcingHero(hero[23])
            eventPlayer.heroswap[eventPlayer.currentswap] = hero[23]
            eventPlayer.heroiconswap[eventPlayer.currentswap] = heroIcon(hero[23])
            (getPlayersInSlot(eventPlayer.getSlot() + 4, Team.1)).attachTo(eventPlayer, vect(-0.5, 1.8, -0.2))
            if eventPlayer.getHero() not in eventPlayer.allowedheroes:  
                eventPlayer.allowedheroes.append(eventPlayer.getHero())
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            eventPlayer.points -= 30000
            wait(0.25)
            chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
            playEffect(getPlayers(Team.1), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 70)
            eventPlayer.currentmagazines = 50
            if eventPlayer.getHero() == hero[23]:
                goto lbl_15
            if experiencesystem == false:
                goto lbl_16
            eventPlayer.XPlevel = false
            eventPlayer.xp = false
            lbl_15:
            lbl_16:
        elif eventPlayer.points < 30000:
            smallMessage(eventPlayer, "{0}".format(herobuymessages[23]))
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