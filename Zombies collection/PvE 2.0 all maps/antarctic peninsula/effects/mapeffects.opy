
rule "all the effects":
    @Condition start == 1
    #@Condition outofpsawn == 1

    #set all this to be array elements for each perk name, so it can easily be swapped with each map file
    for forindex in range(3):
        createEffect(localPlayer, Effect.GOOD_AURA, teleportercolor, teleporterpositions[telespot], evalOnce(teleradiusef[forindex]))
        createEffect(localPlayer, Effect.SPARKLES, teleportercolor, teleporterpositions[telespot], evalOnce(teleradiusef[forindex]))
        createEffect(localPlayer, Effect.RING, Color.WHITE, teleporterpositions[telespot], evalOnce(teleradiusef[forindex]))
    wait(1)
    #this can be created on the spot instead of always present
    for forindex in range(0, 3, 1):
        createEffect(localPlayer, Effect.RING, Color.RED, Died[evalOnce(forindex)], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createEffect(localPlayer, Effect.SPHERE, Color.WHITE, Died[evalOnce(forindex)], getPlayersInSlot(evalOnce(forindex), Team.1).C, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        createInWorldText(localPlayer, "{0}".format(random.choice(diedtext)), Died[evalOnce(forindex)], 3, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    #mystery box
    createEffect(localPlayer, Effect.RING, Color.PURPLE, rngbox, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(localPlayer, Effect.LIGHT_SHAFT, Color.SKY_BLUE, Vector.UP * 10 + rngbox, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(localPlayer, Effect.LIGHT_SHAFT, Color.SKY_BLUE, Vector.UP * 25 + rngbox, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(localPlayer, Effect.LIGHT_SHAFT, Color.SKY_BLUE, Vector.UP * 40 + rngbox, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, iconString(Icon.QUESTION_MARK), Vector.UP * 2 + rngbox, 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(localPlayer, Effect.SPARKLES, Color.YELLOW, rngbox, 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createProjectileEffect(localPlayer, Projectile.SYMMETRA_PHOTON_PROJECTOR, null, Vector.UP + rngbox, Vector.UP, 0.10, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)

    for forindex in range(0, 7, 1):
        if forindex == 0:
            createEffect(localPlayer, Effect.RING, Color.SKY_BLUE, buyperks[forindex], 1, EffectReeval.VISIBILITY_AND_COLOR)
            createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, buyperks[forindex] + vect(0, 1, 0), Vector.DOWN, 0.10, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
            createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, buyperks[forindex] + vect(0.5, 1, 0), Vector.DOWN, 0.10, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
            createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, buyperks[forindex] + vect(-0.5, 1, 0), Vector.DOWN, 0.10, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
        elif forindex != 6 and forindex != 0:
            createEffect(localPlayer, Effect.RING, Color.RED, buyperks[forindex], 1, EffectReeval.VISIBILITY_AND_COLOR)
            createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, buyperks[forindex], Vector.UP, 0.10, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
        else:

            createProjectileEffect(localPlayer, Projectile.ZARYA_GRAVITON, null, Vector.UP * 1.5 + buyperks[forindex], Vector.UP, 0.05, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
            powerconnected[0] = getLastCreatedEntity()
            createEffect(localPlayer, Effect.RING, Color.VIOLET, buyperks[forindex], 1, EffectReeval.VISIBILITY_AND_COLOR)
            powerconnected[1] = getLastCreatedEntity()
            createIcon(getLivingPlayers(Team.1), Vector.UP * 2 +buyperks[6], Icon.BOLT, IconReeval.VISIBILITY_AND_POSITION, Color.YELLOW)
            powerconnected[2] = getLastCreatedEntity()

    #might be able to make this a loop as well, but since the perks are all different it would be more difficult to do so maybe an array
    createInWorldText(localPlayer, iconString(Icon.HEART), Vector.UP * 2 + buyperks[1], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createInWorldText(localPlayer, iconString(Icon.FIRE), Vector.UP * 2 + buyperks[2], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.RED)
    createInWorldText(localPlayer, iconString(Icon.DIAMOND), Vector.UP * 2 + buyperks[3], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.BLUE)
    createInWorldText(localPlayer, iconString(Icon.EYE), Vector.UP * 2 + buyperks[4], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createInWorldText(localPlayer, iconString(Icon.SKULL), Vector.UP * 2 + buyperks[5], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createInWorldText(localPlayer, iconString(Icon.RADIOACTIVE), Vector.UP * 2 + buyperks[0], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    #createInWorldText(localPlayer, abilityIconString(Hero.SOLDIER, Button.ABILITY_1), Vector.UP * 2 + buyperks[7], 3.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    #createInWorldText(localPlayer, abilityIconString(Hero.ASHE, Button.ABILITY_2), Vector.UP * 2 + buyperks[9], 3.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    for forindex in range(len(buyheros)):
        createEffect(localPlayer, Effect.RING, Color.YELLOW, buyheros[forindex], 2, EffectReeval.VISIBILITY)
        createInWorldText(localPlayer, heroIcon(hero[forindex]), Vector.UP * 2 + buyheros[forindex], 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY, Color.BLUE)
        wait(3)
    createInWorldText(localPlayer, "Bastion Trap: press {0} {1}".format(inputBindingString(Button.INTERACT), l"{0}: {1}".format(heroIcon(Hero.BASTION), 1000)), vect(-83.763, -158.95, 64.107), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.PURPLE)
    createEffect(localPlayer, Effect.RING, Color.WHITE, vect(-101.303, -150.36, -17.831), 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, "The end : 50,000 points", vect(-101.303, -150.36, -17.831), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(localPlayer, Effect.RING, Color.WHITE, bossbuypositions[0], 1, EffectReeval.POSITION_AND_RADIUS)
    for forindex in range(3):
        createInWorldText(localPlayer, "Spawn boss: {0} : 15000 points".format(inputBindingString(Button.INTERACT)), bossbuypositions[indexofbosseffect], 1, Clip.SURFACES, WorldTextReeval.VISIBILITY)
        createEffect(localPlayer, Effect.RING, Color.WHITE, bossbuypositions[indexofbosseffect], 1, EffectReeval.VISIBILITY)
    createEffect(localPlayer, Effect.RING, Color.YELLOW, vect(269.882, 44.205, 179.101), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, "Property damage: ${0}".format(extraVar[36]), vect(269.882, 44.205, 179.101), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.YELLOW)
    createEffect(localPlayer, Effect.RING, Color.RED, vect(273.459, 44.205, 176.795), 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, "Bank: {0} Points".format(extraVar[38]), vect(273.459, 44.205, 176.795) + Vector.UP * 2.0, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, vect(273.459, 44.205, 176.795) + vect(0, 0.25, 0.70), Vector.BACKWARD, 0.05, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
    createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, vect(273.459, 44.205, 176.795) + vect(0, -0.50, 0), Vector.UP, 0.10, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
    createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, vect(273.459, 44.205, 176.795) + vect(0.5, -0.50, 0), Vector.UP, 0.10, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
    createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, vect(273.459, 44.205, 176.795) + vect(-0.5, -0.50, 0), Vector.UP, 0.10, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
    createEffect(localPlayer, Effect.RING, Color.RED, vect(277.123, 44.205, 177.262), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, iconString(Icon.ARROW_UP), vect(277.123, 44.205, 177.262), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(localPlayer, Effect.RING, Color.RED, vect(275.451, 44.205, 175.244), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, iconString(Icon.ARROW_DOWN), vect(275.451, 44.205, 175.244), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createEffect(localPlayer, Effect.RING, Color.BLUE, vect(300.839, -13.533, -219.392), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createInWorldText(localPlayer, abilityIconString(Hero.KIRIKO, Button.ABILITY_1), vect(300.839, -13.533, -219.392) + Vector.UP * 2.0, 2.25, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
    createProjectileEffect(localPlayer, Projectile.ZARYA_PARTICLE_CANNON, null, Vector.UP * 0.5 + vect(300.839, -13.533, -219.392), Vector.UP, 0.03, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)
    createProjectileEffect(localPlayer, Projectile.BAPTISTE_BIOTIC_LAUNCHER, null, vect(300.839, -13.533, -219.392) + Vector.UP * 0.5, Vector.DOWN, 0.10, ProjectileEffectReeval.VISIBILITY_AND_FRIENDLINESS)



rule "488 button held teleporter":
    @Event eachPlayer
    @Team 1
    #need to fix this as the index for teleporter has changed
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition getPlayersInRadius(teleporterpositions[telespot], 3, Team.1) == true
    #@Condition any([distance(i, eventPlayer) < doorradius.slice(101, 103)[idx] for i, idx in Vectordoorpositions.slice(101, 103)]) == true

    if getLivingPlayers(Team.1) == getPlayersInRadius(teleporterpositions[telespot], 3, Team.1):
        if teleporterwait == false:
            #might need to not use destroy effect last created, and append every single one to array then delete all
            createEffect(eventPlayer, Effect.ANA_NANO_BOOSTED, eventPlayer.getTeam(), eventPlayer, 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            zzz.append(getLastCreatedEntity())
            #need a for loop needs 4 loops
            createEffect(localPlayer, Effect.WINSTON_TESLA_CANNON_TARGET, Color.BLACK, eventPlayer, 80, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            zzz.append(getLastCreatedEntity())
            wait(0.25)
            getPlayersInRadius(teleporterpositions[telespot], 5, Team.2).setStatusEffect([0], Status.STUNNED, 0.25)
            destroyEffect(zzz[0])
            playEffect(localPlayer, DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 80)
            wait(0.25)
            kill(getPlayersInRadius(teleporterpositions[101], 5, Team.2), getLivingPlayers(Team.1)[0])
            destroyEffect(zzz[1])
            teleporterwait = 1
            teleportercolor = Color.RED
            #needs to be set to current telespot
            if len(teleporterpositions) > 0:
                telespot = (telespot + 1) % len(teleporterpositions)
                wait()
                teleporterused = 1
                eventPlayer.lastsavedpos = null
                wait(0.5)
                getPlayers(Team.1).teleport(teleporterpositions[telespot])
            wait(0.5)
            teleporterused = 0
            makedoors()
        elif teleporterwait > 0:
            smallMessage(eventPlayer, "  {0} That machine is not a toy!".format(heroIcon(Hero.RAMATTRA)))
            wait(4)
    elif getLivingPlayers(Team.1) != getPlayersInRadius(teleporterpositions[telespot], 3, Team.1):
        smallMessage(eventPlayer, "  You can't leave your friends behind!")
        wait(4)
