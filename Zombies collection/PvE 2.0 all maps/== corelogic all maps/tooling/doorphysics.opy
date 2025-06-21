rule "Initial Global":
    AllPos = []
    AllDir = []
    firstpos = []
    secondpos = []
    firstpoint2 = []
    secondpoint2 = []
    second = []
    z = []
    Wall_ID = []
    g_beamType = []


rule "Initial Player":
    @Event eachPlayer
    
    eventPlayer.filterpos = false
    eventPlayer.lastsavedpos = false
    eventPlayer.closestbodypos = false
    eventPlayer.fullbodypos = false
    eventPlayer.prevpos_intersection = false
    eventPlayer.active_wall = []
    eventPlayer.closestwall = []


rule "Collision Logic":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasSpawned() == true
    @Disabled

    eventPlayer.lastsavedpos = (eventPlayer.getEyePosition() + eventPlayer.getPosition()) / 2
    wait(getAverageServerLoad() / 255 * (0.34 - 0.032) + 0.032)
    eventPlayer.closestwall = [player for player, i in AllPos if distance(AllPos[i], eventPlayer) <= distance(AllPos[i], firstpos[i]) or eventPlayer.active_wall[i] == 1 or dotProduct(directionTowards(player, eventPlayer.lastsavedpos), AllDir[i]) > 0 != (dotProduct(directionTowards(player, eventPlayer), AllDir[i]) > 0)]
    for eventPlayer.x_ in range(len(eventPlayer.closestwall)):
        z = AllPos.index(eventPlayer.closestwall[eventPlayer.x_])
        if Wall_ID[z] == 1 or Wall_ID[z] == 3 or Wall_ID[z] == 5:
            if firstpos[z].y >= eventPlayer.getPosition().y and firstpos[z].y <= (eventPlayer.getEyePosition() + vect([], 0.2, [])).y:
                eventPlayer.closestbodypos = firstpos[z]
            elif secondpos[z].y >= eventPlayer.getPosition().y and secondpos[z].y <= (eventPlayer.getEyePosition() + vect([], 0.2, [])).y:
                eventPlayer.closestbodypos = secondpos[z]
            else:
                eventPlayer.closestbodypos = eventPlayer.getPosition()
            eventPlayer.fullbodypos = vect(eventPlayer.getEyePosition().x, eventPlayer.closestbodypos.y, eventPlayer.getEyePosition().z)
            eventPlayer.filterpos = eventPlayer.fullbodypos + ((AllDir[z] * (dotProduct(AllPos[z] - eventPlayer.fullbodypos, AllDir[z]))) / dotProduct(AllDir[z], AllDir[z]))
            if Wall_ID[z] == 1 or Wall_ID[z] == 3:
                if dotProduct(directionTowards(AllPos[z], eventPlayer.lastsavedpos), AllDir[z]) > 0 != (dotProduct(directionTowards(AllPos[z], eventPlayer.fullbodypos), AllDir[z]) > 0):
                    eventPlayer.intersection_length = (dotProduct(AllPos[z] - eventPlayer.fullbodypos, AllDir[z])) / dotProduct(directionTowards(eventPlayer.lastsavedpos, eventPlayer.fullbodypos), AllDir[z])
                    eventPlayer.prevpos_intersection = eventPlayer.fullbodypos + directionTowards(eventPlayer.lastsavedpos, eventPlayer.fullbodypos) * vect(1, [], 1) * eventPlayer.intersection_length
                    if dotProduct(directionTowards(firstpos[z], vect(secondpos[z].x, firstpos[z].y, secondpos[z].z)), directionTowards(firstpos[z], eventPlayer.prevpos_intersection)) >= 0 and dotProduct(directionTowards(firstpos[z], vect(firstpos[z].x, secondpos[z].y, firstpos[z].z)), directionTowards(firstpos[z], eventPlayer.prevpos_intersection)) >= 0 and dotProduct(directionTowards(secondpos[z], vect(secondpos[z].x, firstpos[z].y, secondpos[z].z)), directionTowards(secondpos[z], eventPlayer.prevpos_intersection)) >= 0 and dotProduct(directionTowards(secondpos[z], vect(firstpos[z].x, secondpos[z].y, firstpos[z].z)), directionTowards(secondpos[z], eventPlayer.prevpos_intersection)) >= 0:
                        eventPlayer.cancelPrimaryAction()
                        eventPlayer.teleport(eventPlayer.prevpos_intersection + directionTowards(eventPlayer.prevpos_intersection, eventPlayer.lastsavedpos) * vect(1, [], 1) * 2)
            eventPlayer.thickness = 0
            if Wall_ID[z] == 5:
                eventPlayer.thickness = 8
            else:
                eventPlayer.thickness = 4
            if distance(eventPlayer.fullbodypos, eventPlayer.filterpos) <= eventPlayer.thickness and dotProduct(directionTowards(firstpos[z], vect(secondpos[z].x, firstpos[z].y, secondpos[z].z)), directionTowards(firstpos[z], eventPlayer.filterpos)) >= 0 and dotProduct(directionTowards(firstpos[z], vect(firstpos[z].x, secondpos[z].y, firstpos[z].z)), directionTowards(firstpos[z], eventPlayer.filterpos)) >= 0 and dotProduct(directionTowards(secondpos[z], vect(secondpos[z].x, firstpos[z].y, secondpos[z].z)), directionTowards(secondpos[z], eventPlayer.filterpos)) >= 0 and dotProduct(directionTowards(secondpos[z], vect(firstpos[z].x, secondpos[z].y, firstpos[z].z)), directionTowards(secondpos[z], eventPlayer.filterpos)) >= 0:
                if eventPlayer.active_wall[z] == false:
                    eventPlayer.active_wall[z] = 1
                    if (Wall_ID[z] == 1 or Wall_ID[z] == 3) and is_Grounded == false:
                        eventPlayer.setGravity(100)
                    elif Wall_ID[z] == 5:
                        eventPlayer.disableEnvironmentCollision(false)
                if Wall_ID[z] == 1:
                    eventPlayer.applyImpulse(directionTowards(eventPlayer.filterpos, eventPlayer.fullbodypos) * vect(1, [], 1), 1, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
                    eventPlayer.setMoveSpeed(100 - ((dotProduct(directionTowards(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + worldVector(eventPlayer.getThrottle(), eventPlayer, Transform.ROTATION)), directionTowards(eventPlayer.filterpos, eventPlayer.fullbodypos) * -1)) * 100))
                elif Wall_ID[z] == 3:
                    eventPlayer.applyImpulse(directionTowards(eventPlayer.filterpos, eventPlayer.fullbodypos), eventPlayer.getSpeed() + eventPlayer.getSpeed(), Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            else:
                eventPlayer.active_wall[z] = 0
                eventPlayer.setMoveSpeed(100) #needs to use gamemode wide movement speed, when player gets perks
    loop()


rule "Reset":
    @Event eachPlayer
    @Condition len([player for player in eventPlayer.active_wall if player != 0]) == 0
    
    eventPlayer.enableEnvironmentCollision()


rule "all the door effects loop (need to figure out how to manage which doors were bought and unload zones not currently in)":
    @Condition dooreffectsequencer < 436
    @Condition start == 1
    @Condition i >= 400

    #needs to have 3 zones with the map.
    if impulseDoorArray[appenddoorsequencer] == false:
        #create effect starting at 0 - 1
        createBeam(getPlayers(Team.1), Beam.JUNKRAT_TRAP_CHAIN, Beameffectdoors[evalOnce(dooreffectsequencer)], Beameffectdoors[evalOnce(1 + dooreffectsequencer)], Color.RED, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        wait()
        #append to allow the game to delete for later
        doors[appenddoorsequencer].append(getLastCreatedEntity())
        wait()
        #the index to create the door at
        dooreffectsequencer += 2
        #the doors index itself, counted by 1 whole, while the door contains 2 effects. need to optimize so door is compatible with 1 and 2 effects with a toggle.
        appenddoorsequencer += 1
        if ruleCondition:
            loop()
    elif impulseDoorArray[appenddoorsequencer] == 1:
        wait()
        dooreffectsequencer += 2
        appenddoorsequencer += 1
        if ruleCondition:
            loop()