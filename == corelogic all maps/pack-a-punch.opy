rule "Torbjorn pack a punch Dispencer active":
    @Event eachPlayer
    @Team 1
    @Condition getPlayersInRadius(dispencerposition, 3.5, Team.1, LosCheck.SURFACES_AND_ENEMY_BARRIERS) == true
    @Condition dispencerplaced == 1
    
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    heal(eventPlayer, null, 20)
    eventPlayer.currentmagazines += 0.2
    wait(0.5, Wait.ABORT_WHEN_FALSE)
    if ruleCondition:
        loop()


rule "give pack a punch a sound":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.Packapunch >= 1
    @Condition getServerLoad() < 220
    #this needs to check if secondary fire is the gun or not
    @Condition (eventPlayer.isFiringPrimaryFire() or eventPlayer.isFiringSecondaryFire()) == true
    
    if eventPlayer.isFiringPrimaryFire() == true:
        if eventPlayer.getHero() in [Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY]:
            PaPsound()
    elif eventPlayer.isFiringSecondaryFire() == true:
        if eventPlayer.getHero() in [Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY, Hero.CASSIDY]:
            PaPsound()


rule "Pack a punch Ongoing - player":
    @Event eachPlayer
    @Condition eventPlayer.Packapunch >= 1
    @Condition (eventPlayer.isUsingAbility1() or eventPlayer.isUsingAbility2() or eventPlayer.isUsingUltimate() or eventPlayer.isFiringPrimaryFire() or eventPlayer.isFiringSecondaryFire()) == true
    
    if eventPlayer.getHero() == Hero.ASHE:
        if eventWasCriticalHit == true:
            #fix this and the positions for status, and damage over time. - dealt damage
            raycast(eventPlayer, vect(0, 0, 0), getPlayers(Team.2), getPlayers(Team.1), true).getPlayerHit().setStatusEffect(eventPlayer, Status.BURNING, 4)
            raycast(vect(0, 0, 0), vect(0, 0, 0), getPlayers(Team.2), eventPlayer, true).getPlayerHit().startDamageOverTime(eventPlayer, 4, 150)
    elif eventPlayer.getHero() == Hero.BAPTISTE:
        if eventPlayer.isUsingAbility1():
            eventPlayer.removeAllHealthPools()
            wait()
            eventPlayer.addHealthPool(Health.NORMAL, 100, false, false)
    elif eventPlayer.isFiringPrimaryFire():
        if eventPlayer.getHero() == Hero.BASTION:
            if eventPlayer.isInAlternateForm() == true:
                wait(0.5, Wait.ABORT_WHEN_FALSE)
                createHomingProjectile(Projectile.PHARAH_ROCKET, eventPlayer, eventPlayer.getEyePosition() + eventPlayer.getFacingDirection(), eventPlayer.getFacingDirection(), Relativity.TO_WORLD, ModifyHealth.DAMAGE, Team.2, 500, 1, 15, DynamicEffect.ASHE_DYNAMITE_EXPLOSION, DynamicEffect.EXPLOSION_SOUND, 0.2, 25, 5, 0, getLivingPlayers(Team.2), 0.5)
                wait(1.5, Wait.ABORT_WHEN_FALSE)
                if ruleCondition:
                    loop()
    elif eventPlayer.getHero() == Hero.TORBJORN:
        if dispencerplaced == false:
            if eventPlayer.isCommunicating(Comms.NEED_HEALING) == true:
                eventPlayer.dispencereffect = []
                wait()
                createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, eventPlayer.getPosition(), 0.8, EffectReeval.VISIBILITY)
                eventPlayer.dispencereffect.append(getLastCreatedEntity())
                wait()
                createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, vect(0, 1.3, 0) + eventPlayer.getPosition(), 0.8, EffectReeval.VISIBILITY)
                eventPlayer.dispencereffect.append(getLastCreatedEntity())
                wait()
                createEffect(getAllPlayers(), Effect.RING, Color.GREEN, eventPlayer.getPosition(), 3.5, EffectReeval.VISIBILITY)
                eventPlayer.dispencereffect.append(getLastCreatedEntity())
                dispencerposition = evalOnce(eventPlayer.getPosition())
                dispencerplaced = 1
                wait(30)
                dispencerplaced = 2
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
                dispencerplaced = false
    elif eventPlayer.isFiringSecondaryFire():
        if eventPlayer.getHero() == Hero.ROADHOG:
            if eventPlayer.getAbilityResource(Button.SECONDARY_FIRE) > 0:
                getPlayersInRadius(eventPlayer, 5, Team.1, LosCheck.SURFACES_AND_ENEMY_BARRIERS).startHealingOverTime(eventPlayer, 2, 20)
                createEffect(getPlayers(Team.1), Effect.RING, Color.ORANGE, eventPlayer, 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
                waitUntil(false, 5)
                destroyEffect(getLastCreatedEntity())
        elif eventPlayer.getHero() == Hero.SOLDIER:
            createHomingProjectile(Projectile.PHARAH_ROCKET, eventPlayer, eventPlayer.getEyePosition() + eventPlayer.getFacingDirection(), eventPlayer.getFacingDirection(), Relativity.TO_WORLD, ModifyHealth.DAMAGE, Team.2, 500, 1, 15, DynamicEffect.ASHE_DYNAMITE_EXPLOSION, DynamicEffect.EXPLOSION_SOUND, 0.2, 25, 5, 0, getLivingPlayers(Team.2), 0.5)
        elif eventPlayer.getHero() == Hero.ECHO:
            #needs more than 1 but will fix later
            createHomingProjectile(Projectile.ECHO_STICKY_BOMB, eventPlayer, eventPlayer.getEyePosition() + eventPlayer.getFacingDirection(), eventPlayer.getFacingDirection(), Relativity.TO_WORLD, ModifyHealth.DAMAGE, Team.2, 500, 1, 15, DynamicEffect.ASHE_DYNAMITE_EXPLOSION, DynamicEffect.EXPLOSION_SOUND, 0.2, 25, 5, 0, getLivingPlayers(Team.2), 0.5)
            wait(0.2, Wait.ABORT_WHEN_FALSE)
            if ruleCondition:
                loop()
        elif eventPlayer.getHero() == Hero.JUNO:
            createHomingProjectile(Projectile.ECHO_STICKY_BOMB, eventPlayer, eventPlayer.getEyePosition() + eventPlayer.getFacingDirection(), eventPlayer.getFacingDirection(), Relativity.TO_WORLD, ModifyHealth.DAMAGE, Team.2, 500, 1, 15, DynamicEffect.ASHE_DYNAMITE_EXPLOSION, DynamicEffect.EXPLOSION_SOUND, 0, 25, 5, 0, getLivingPlayers(Team.2), 0.5)
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
            if eventPlayer.isUsingAbility1() == true:
                eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
            elif eventPlayer.isUsingAbility2() == true:
                eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
        elif eventPlayer.getHero() == Hero.WIDOWMAKER:
            eventPlayer.T = 1
            if getNumberOfPlayers(Team.1) < 2:
                waitUntil(false, 4)
                eventPlayer.T = false
            elif getNumberOfPlayers(Team.1) >= 2:
                waitUntil(false, 16)
                eventPlayer.T = false
        elif eventPlayer.getHero() == Hero.LUCIO:
            getPlayersInRadius(eventPlayer, 3, Team.2, LosCheck.SURFACES_AND_ENEMY_BARRIERS).setStatusEffect(eventPlayer, Status.ROOTED, 3)
        elif eventPlayer.getHero() == Hero.RAMATTRA:
            getLivingPlayers(Team.1).points += 1000
            getLivingPlayers(Team.1).magazines += 5
        elif eventPlayer.getHero() == Hero.GENJI:
            if eventPlayer.isFiringPrimaryFire() == true:
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
    elif eventPlayer.isUsingAbility1() == true:
        if eventPlayer.getHero() == Hero.SOJOURN:
            getPlayersInRadius(eventPlayer, 3, Team.2).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 4)
    elif eventPlayer.isUsingAbility2() == true:
        if eventPlayer.getHero() == Hero.TRACER:
            getPlayersInRadius(evalOnce(eventPlayer.getPosition()), 5, Team.2).setStatusEffect(eventPlayer, Status.STUNNED, 4)
        elif eventPlayer.getHero() == Hero.SOMBRA:
            wait(1)
            eventPlayer.T = 1
            wait(4)
            eventPlayer.T = false
        elif eventPlayer.getHero() == Hero.DVA:
            wait(0.2, Wait.ABORT_WHEN_FALSE)
            createHomingProjectile(Projectile.PHARAH_ROCKET, eventPlayer, eventPlayer.getEyePosition() + eventPlayer.getFacingDirection(), eventPlayer.getFacingDirection(), Relativity.TO_WORLD, ModifyHealth.DAMAGE, Team.2, 400, 1, 15, DynamicEffect.ASHE_DYNAMITE_EXPLOSION, DynamicEffect.EXPLOSION_SOUND, 0, 25, 5, 0, getLivingPlayers(Team.2), 0.5)
        elif eventPlayer.getHero() == Hero.LIFEWEAVER:
            eventPlayer.getPlayersInViewAngle(Team.1, 5).addHealthPool(Health.NORMAL, 100, false, false)
        elif eventPlayer.getHero() == Hero.PHARAH:
            createHomingProjectile(Projectile.PHARAH_ROCKET, eventPlayer, eventPlayer.getEyePosition() + eventPlayer.getFacingDirection(), eventPlayer.getFacingDirection(), Relativity.TO_WORLD, ModifyHealth.DAMAGE, Team.2, 500, 1, 15, DynamicEffect.ASHE_DYNAMITE_EXPLOSION, DynamicEffect.EXPLOSION_SOUND, 0.2, 25, 5, 0, getLivingPlayers(Team.2), 0.5)
            wait(0.2, Wait.ABORT_WHEN_FALSE)
            if ruleCondition:
                loop()


rule "Pack a Punch - Damage dealt":
    @Event playerDealtDamage
    @Team 1
    @Condition eventPlayer.getHero() in [Hero.SOLDIER, Hero.CASSIDY, Hero.SIGMA, Hero.JUNKRAT, Hero.MOIRA, Hero.BRIGITTE, Hero.DOOMFIST] == true
    @Condition eventPlayer.Packapunch >= 1
    @Condition (eventPlayer.isUsingAbility1() or eventPlayer.isUsingAbility2() or eventPlayer.isUsingUltimate() or eventPlayer.isFiringPrimaryFire() == true or eventPlayer.isFiringSecondaryFire()) == true
    
    if attacker.getHero() == Hero.CASSIDY:
        if eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true:
            damage(getPlayersInRadius(victim, 3, Team.2), attacker, 420)
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, victim, 3)
            wait(0.45)
    elif attacker.getHero() == Hero.SIGMA:
        damage(getPlayersInRadius(victim, 5, Team.ALL), eventPlayer, 200)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, victim, 5)
    elif attacker.getHero() == Hero.JUNKRAT:
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, victim, 8)
        #make sure this doesnt damage self
        damage(getPlayersInRadius(victim, 8, Team.2), attacker, 300)
    elif eventPlayer.isUsingUltimate():
        if attacker.getHero() == Hero.MOIRA:
            victim.setStatusEffect(eventPlayer, Status.ROOTED, 4)
            wait(0.25)
        elif attacker.getHero() == Hero.MOIRA:
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, victim, 5)
            damage(getPlayersInRadius(victim, 5, Team.2), attacker, 400)
        elif attacker.getHero() == Hero.BRIGITTE:
            if victim.hasStatus(Status.STUNNED) == true:
                victim.setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 4)
        elif eventPlayer.isUsingAbility1() == true:
            if attacker.getHero() == Hero.DOOMFIST:
                victim.setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 4)


rule "":
    @Event playerDealtFinalBlow
    @Team 1
    @Condition eventPlayer.getHero() in [Hero.VENTURE, Hero.MAUGA, Hero.SIGMA] == true
    @Condition eventPlayer.Packapunch >= 1
    @Condition (eventPlayer.isUsingAbility1() or eventPlayer.isUsingAbility2() or eventPlayer.isUsingUltimate() or eventPlayer.isFiringPrimaryFire() or eventPlayer.isFiringSecondaryFire() or eventPlayer.isMeleeing()) == true
    
    if attacker.getHero() == Hero.VENTURE:
        if eventPlayer.isMeleeing() == true:
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, victim, 5)
            damage(getPlayersInRadius(victim, 5, Team.ALL), attacker, 800)
    elif attacker.getHero() == Hero.MAUGA:
        eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
        eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    elif attacker.getHero() == Hero.SIGMA:
        eventPlayer.points += 50


