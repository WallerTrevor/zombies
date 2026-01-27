rule "196 (effect) GOAL: omnic part collector":
    @Disabled
    
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, vect(0, 0, 0), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "197 GOAL: omnic part collector (players gather souls from omnics)":
    @Disabled
    
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, vect(0, 0, 0), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "198 GOAL: save little winstons (carry miniature winstons to a location)":
    @Disabled
    
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, vect(0, 0, 0), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "199 GOAL: gather 3 teleporter parts":
    @Disabled
    
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, vect(0, 0, 0), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "200 GOAL: The main easter egg":
    @Disabled
    
    hudHeader(getAllPlayers(), "stay tuned...", HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)

