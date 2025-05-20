rule "65 ring around each player":
    @Event eachPlayer
    @Team 1
    
    #this could probably be simpler
    if eventPlayer.getSlot() == false:
        createEffect(getAllPlayers(), Effect.RING, Color.RED, eventPlayer, 1.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    elif eventPlayer.getSlot() == 1:
        createEffect(getAllPlayers(), Effect.RING, Color.BLUE, eventPlayer, 1.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    elif eventPlayer.getSlot() == 2:
        createEffect(getAllPlayers(), Effect.RING, Color.GREEN, eventPlayer, 1.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    elif eventPlayer.getSlot() == 3:
        createEffect(getAllPlayers(), Effect.RING, Color.ORANGE, eventPlayer, 1.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "Bot effect (each player team 2)":
    @Event playerDied
    @Team 2
    @Condition eventPlayer.isDummy() == true
    
    #need to see how this looks when the bots dont instantly disappear on death
    playEffect(getAllPlayers(), DynamicEffect.JUNKRAT_FRAG_LAUNCHER_EXPLOSION, Color.WHITE, eventPlayer, 5)
    playEffect(getAllPlayers(), DynamicEffect.WRECKING_BALL_MINEFIELD_EXPLOSION_SOUND, Color.WHITE, eventPlayer, 100)


