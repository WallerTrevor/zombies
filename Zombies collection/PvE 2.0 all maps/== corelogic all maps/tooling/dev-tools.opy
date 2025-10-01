/*
rule "DEV door numbers":
      
      createInWorldText(getAllPlayers(), "1", firstpos[0], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "2", firstpos[1], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "3", firstpos[2], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "4", firstpos[3], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "5", firstpos[4], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "6", firstpos[5], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "7", firstpos[6], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "8", firstpos[7], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "9", firstpos[8], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "10", firstpos[9], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "11", firstpos[10], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "12", firstpos[11], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "13", firstpos[12], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "14", firstpos[13], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "15", firstpos[14], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "16", firstpos[15], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "17", firstpos[16], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "18", firstpos[17], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "19", firstpos[18], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "20", firstpos[19], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "21", firstpos[20], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "22", firstpos[21], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "23", firstpos[22], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "24", firstpos[23], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "25", firstpos[24], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "26", firstpos[25], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "27", firstpos[26], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "28", firstpos[27], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "29", firstpos[28], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "30", firstpos[29], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "31", firstpos[30], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "32", firstpos[31], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "33", firstpos[32], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "34", firstpos[33], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "35", firstpos[34], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "36", firstpos[35], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "37", firstpos[36], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "38", firstpos[37], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "39", firstpos[38], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "40", firstpos[39], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "41", firstpos[40], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "42", firstpos[41], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "43", firstpos[42], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "44", firstpos[43], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "45", firstpos[44], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "46", firstpos[45], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "47", firstpos[46], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "48", firstpos[47], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "49", firstpos[48], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "50", firstpos[49], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "51", firstpos[50], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "52", firstpos[51], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "53", firstpos[52], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "54", firstpos[53], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "55", firstpos[54], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "56", firstpos[55], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "57", firstpos[56], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "58", firstpos[57], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "59", firstpos[58], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "60", firstpos[59], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "61", firstpos[60], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "62", firstpos[61], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "63", firstpos[62], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "64", firstpos[63], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "65", firstpos[64], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "66", firstpos[65], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "67", firstpos[66], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "68", firstpos[67], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "69", firstpos[68], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "70", firstpos[69], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "71", firstpos[70], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "72", firstpos[71], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "73", firstpos[72], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "74", firstpos[73], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "75", firstpos[74], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "76", firstpos[75], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "77", firstpos[76], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "78", firstpos[77], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "79", firstpos[78], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)
      createInWorldText(getAllPlayers(), "80", firstpos[79], 1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING)

 rule "use interact to give pack a punch (Dev testing)":
     @Event eachPlayer
     @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
     @Disabled
     
     eventPlayer.Packapunch = 1


 rule "Dev Tool Show variables":
 hudText(hostPlayer, "{0} - {1} - {2}".format(getServerLoad(), getAverageServerLoad(), " {0} A {1} B {2}".format(getPeakServerLoad(), A, "{0} C {1} D {2}".format(B, C, " {0} E {1} F {2}".format(null, null, null)))), E, F, HudPosition.TOP, 0, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)

 rule "change waves":
     @Event eachPlayer
     @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
     @Disabled
     
     numberOfZombies = 1
     g += 1


 rule "force random hero":
     @Event eachPlayer
     @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
     @Disabled
 
     eventPlayer.startForcingHero(random.choice(getAllHeroes()))


 rule "Rule 243":
     @Event eachPlayer
     @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
     @Disabled
     eventPlayer.allowedheroes = [Hero.ANA]

 rule "Rule 244":
     @Event eachPlayer
     @Disabled
     
     hudHeader(getAllPlayers(), "{0} -- {1} --- {2}".format(eventPlayer.allowedheroes[0], eventPlayer.allowedheroes[1], eventPlayer.allowedheroes[2]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)

 rule "Rule 245":
     @Event eachPlayer
     @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
     @Disabled
     
     eventPlayer.allowedheroes.append(eventPlayer.getHero())


 rule "Rule 245":
     @Event eachPlayer
     @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
     @Disabled
 
     eventPlayer.allowedheroes = []
*/
/*
rule "Toggle edit mode":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    #@Disabled

    #toggle edit
    eventPlayer.ToggleEdit = not eventPlayer.ToggleEdit
    #prevent spamming
    wait(0.25)
*/
/*
rule "Enable edit mode":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.ToggleEdit == true
    #@Disabled
    
    #setSlowMotion(10)
    #createDummy(eventPlayer.getHero(), Team.1, getNumberOfPlayers(Team.1) + 1, eventPlayer, eventPlayer.getFacingDirection())
    #start noclipping from current position
    eventPlayer.Noclip = eventPlayer.getEyePosition()
    #disable controls
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)
    eventPlayer.setMeleeEnabled(false)
    eventPlayer.setJumpEnabled(false)
    #don't physically move
    eventPlayer.setMoveSpeed(false)
    #don't fall
    eventPlayer.setGravity(false)
    #make a camera from the noclip position and copy the player's facing direction
    eventPlayer.startCamera(eventPlayer.Noclip, eventPlayer.Noclip + eventPlayer.getFacingDirection(), 128)
    #take into account throttle, facing direction, jump, and crouch inputs to make a decent noclip  # chase the noclip's position
    chaseAtRate(eventPlayer.Noclip, eventPlayer.Noclip + ((eventPlayer.getFacingDirection() * eventPlayer.getThrottle().z + worldVector(eventPlayer.getThrottle() * vect(true, false, false), eventPlayer, Transform.ROTATION) + (Vector.UP * (eventPlayer.isHoldingButton(Button.JUMP) - eventPlayer.isHoldingButton(Button.CROUCH)))) * 100), 28)
    #wait for a bit so the player doesn't see where they are teleported to
    wait(0.032)
    #go to the sky
    eventPlayer.teleport(Vector.UP * 10000)
*/
/*
rule "Disable edit mode":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.ToggleEdit == false
    #@Disabled

    #setSlowMotion(100)
    destroyDummy(Team.1, getNumberOfPlayers(Team.1))
    #save some server load
    stopChasingVariable(eventPlayer.Noclip)
    #subtract player's height from noclipPosition so that the camera is teleported to where the noclip camera was
    eventPlayer.teleport(eventPlayer.Noclip - (eventPlayer.getEyePosition() - eventPlayer.getPosition()))
    #return values to normal
    eventPlayer.setGravity(100)
    eventPlayer.setMoveSpeed(100)
    #enable controls
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)
    eventPlayer.setMeleeEnabled(true)
    eventPlayer.setJumpEnabled(true)
    eventPlayer.setUltCharge(100)
    #player is back in world, can use native player camera
    eventPlayer.stopCamera()
    #cancel momentum
    eventPlayer.applyImpulse(eventPlayer.getVelocity() * -1, eventPlayer.getSpeed(), Relativity.TO_WORLD, Impulse.INCORPORATE_CONTRARY_MOTION)
*/
/*    
 rule "Rule 258":
     @Disabled
     
     hudHeader(getAllPlayers(), "{0}".format(firstpos[0]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(secondpos[0]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(firstpoint2[0]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(secondpoint2[0]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(AllDir[0]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(AllPos[0]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(Beameffectdoors[0]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(Beameffectdoors[1]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(Beameffectdoors[2]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(Beameffectdoors[3]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(firstpos[0]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(secondpos[1]), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(firstpoint2[1]), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(secondpoint2[1]), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(AllDir[1]), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(AllPos[1]), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(Beameffectdoors[4]), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(Beameffectdoors[5]), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(Beameffectdoors[6]), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(Beameffectdoors[7]), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(getAllPlayers(), "{0}".format(i), HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)

rule "Rule 258":
   @Disabled
    
    wait(10)
    getPlayers(Team.1).points = 100000000

rule "Rule 259":
    @Event eachPlayer

    hudHeader(eventPlayer, "points: {0} Points2 {1}".format(eventPlayer.points, eventPlayer.points2), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING) 
rule "destroy all doors":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Disabled

    destroyEffect(doors)

rule "hud for door physics":
    @Event eachPlayer
    @Disabled
    
    hudHeader(eventPlayer, "doorZoneStart: {0} doorZoneEnd: {1} dooreffectsequencer: {2}".format(doorZoneStart, doorZoneEnd, dooreffectsequencer), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
*/
/*
rule "hud for door effect appending":
     @Event eachPlayer
     #@Disabled

      #Display doors in groups of 3 for readability
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[0], doors[1], doors[2]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[3], doors[4], doors[5]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[6], doors[7], doors[8]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[9], doors[10], doors[11]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[12], doors[13], doors[14]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[15], doors[16], doors[17]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[18], doors[19], doors[20]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[21], doors[22], doors[23]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[24], doors[25], doors[26]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[27], doors[28], doors[29]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[30], doors[31], doors[32]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[33], doors[34], doors[35]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[36], doors[37], doors[38]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[39], doors[40], doors[41]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[42], doors[43], doors[44]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[45], doors[46], doors[47]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[48], doors[49], doors[50]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[51], doors[52], doors[53]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[54], doors[55], doors[56]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[57], doors[58], doors[59]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[60], doors[61], doors[62]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[63], doors[64], doors[65]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[66], doors[67], doors[68]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[69], doors[70], doors[71]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[72], doors[73], doors[74]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[75], doors[76], doors[77]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
     hudHeader(eventPlayer, "doors: {0} {1} {2}".format(doors[78], doors[79], doors[80]), HudPosition.TOP, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
*/
/*
rule "create dummy bot":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    #@Disabled

    createDummy(Hero.CASSIDY, Team.1, 1, eventPlayer, eventPlayer.getFacingDirection())
    wait(0.25)
*/