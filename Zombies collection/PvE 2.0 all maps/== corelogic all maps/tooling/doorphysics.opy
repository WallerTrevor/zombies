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
    doors = []

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
    @Condition eventPlayer.isAlive() == true
    @Condition start == 1
    @Condition eventPlayer.isDummy() == false
    #@Disabled

    if teleporterused == 1:
        wait(1)
    if outofpsawn == 0:
        waitUntil(outofpsawn == 1)
        wait(1.5)
    eventPlayer.lastsavedpos = (eventPlayer.getEyePosition() + eventPlayer.getPosition()) / 2
    wait(0.16 + 0.32 * (getPeakServerLoad() / 255) + (eventPlayer.getSlot() * 0.016))    #wait()
    eventPlayer.closestwall = [player for player, i in AllPos if distance(AllPos[i], eventPlayer) <= distance(AllPos[i], firstpos[i]) or eventPlayer.active_wall[i] == 1 or dotProduct(directionTowards(player, eventPlayer.lastsavedpos), AllDir[i]) > 0 != (dotProduct(directionTowards(player, eventPlayer), AllDir[i]) > 0)]
    for eventPlayer.x_ in range(len(eventPlayer.closestwall)):
        if Wall_ID[z] == 0:
            eventPlayer.active_wall[z] = 0
            eventPlayer.setMoveSpeed(100) #needs to use gamemode wide movement speed, when player gets perks
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
                    if eventPlayer.doorNotif == 0:
                        eventPlayer.doorNotif = 1
                    if eventPlayer.isHoldingButton(Button.INTERACT) and eventPlayer.points >= 1000 - eventPlayer.creditcardlimit:
                        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, AllPos[z], 50) 
                        eventPlayer.points -= 1000 * eventPlayer.cashback
                        destroyEffect(doors[z + z])
                        destroyEffect(doors[z + z + 1])
                        Wall_ID[z] = 0
                        eventPlayer.active_wall[z] = 0
                        smallMessage(eventPlayer, "  Door bought!")
                        eventPlayer.doorNotif = 0
                        chaseAtRate(eventPlayer.points2, (evalOnce(eventPlayer.points) + 0) * eventPlayer.H, 1000)
                        wait()
                        eventPlayer.setMoveSpeed(100)
                    eventPlayer.setMoveSpeed(100 - ((dotProduct(directionTowards(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + worldVector(eventPlayer.getThrottle(), eventPlayer, Transform.ROTATION)), directionTowards(eventPlayer.filterpos, eventPlayer.fullbodypos) * -1)) * 100))
                elif Wall_ID[z] == 3:
                    eventPlayer.applyImpulse(directionTowards(eventPlayer.filterpos, eventPlayer.fullbodypos), eventPlayer.getSpeed() + eventPlayer.getSpeed(), Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            else:
                eventPlayer.active_wall[z] = 0
                eventPlayer.setMoveSpeed(100) #needs to use gamemode wide movement speed, when player gets perks
    if ruleCondition:
        loop()


rule "Reset":
    @Event eachPlayer
    @Condition len([player for player in eventPlayer.active_wall if player != 0]) == 0
    
    eventPlayer.enableEnvironmentCollision()

rule "Make door arrays":
    @Condition start == 1
    i = 0
    wait(1.0)
    looping = 0
    Beameffectdoors = []
    while i < len(doorVectors):
        loopwait(i, 2)
        Beameffectdoors.append(doorVectors[i])  # bottom left
        Beameffectdoors.append(doorVectors[i] + (directionFromAngles(doorParams[looping + 2] - 90, 0) * doorParams[looping]) + (Vector.UP * doorParams[looping + 1]))  # top right
        Beameffectdoors.append(doorVectors[i] + (Vector.UP * doorParams[looping + 1]))  # top left
        Beameffectdoors.append(doorVectors[i] + (directionFromAngles(doorParams[looping + 2] - 90, 0) * doorParams[looping]))  # bottom right
        if doorParams[looping + 3] == 0: #if boolean is false, then use infinite height
            firstpos.append(doorVectors[i]) #bottom left, but this is for the collision logic
            secondpos.append(doorVectors[i] + (directionFromAngles(doorParams[looping + 2] - 90, 0) * doorParams[looping]) + (Vector.UP * 50))  # top right point
            firstpoint2.append(doorVectors[i] + Vector.UP * 50) # top left point, but use infinite height
            secondpoint2.append(doorVectors[i] + (directionFromAngles(doorParams[looping + 2] - 90, 0) * doorParams[looping])) # bottom right point, but use infinite height (why does this use infinite height?)
            AllPos.append((firstpos[i] + secondpos[i]) / 2) # the center position of the door for collision logic
            AllDir.append(directionFromAngles(doorParams[looping + 2] + 180, 0)) #the direction the door is facing for collision logic
        elif doorParams[looping + 3] == 1: #if boolean is true, then use height params
            firstpos.append(doorVectors[i]) #bottom left
            secondpos.append(doorVectors[i] + (directionFromAngles(doorParams[looping + 2] - 90, 0) * doorParams[looping + 4]) + (Vector.UP * doorParams[looping + 5]))  # top right point
            firstpoint2.append(doorVectors[i] + (Vector.UP * doorParams[looping + 5]))  # top left point
            secondpoint2.append(doorVectors[i] + (directionFromAngles(doorParams[looping + 2] - 90, 0) * doorParams[looping + 4]))  # bottom right point
            AllPos.append((firstpos[i] + secondpos[i]) / 2) #center position of the door for collision logic
            AllDir.append(directionFromAngles(doorParams[looping + 2] + 180, 0)) #the direction the door is facing for collision logic
        if doorParams[looping + 3] == 1:
            looping += 6
        else:
            looping += 4
        i += 1


rule "Reset door notif":
    @Event eachPlayer
    @Condition eventPlayer.doorNotif == 1

    smallMessage(eventPlayer, "  Hold {0} to buy door - cost: 1000".format(inputBindingString(Button.INTERACT)))
    wait(4)
    eventPlayer.doorNotif = 0
    wait(0.5)
    if ruleCondition:
        loop()

rule "destroy all door effects on teleporter use":
   @Condition teleporterused == 1

    for i in range(doorZoneStart, doorZoneEnd):
        destroyEffect(doors[i * 2])
        destroyEffect(doors[i * 2 + 1])

rule "set zonestart zoneend":
    @Condition teleporterused == 1
    if telespot == 0:
        doorZoneStart = 0
        doorZoneEnd = 38
    elif telespot == 1:
        doorZoneStart = 39
        doorZoneEnd = 67
    elif telespot == 2:
        doorZoneStart = 68
        doorZoneEnd = 89
