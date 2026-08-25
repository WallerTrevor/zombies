/*
have only one objective running at a time

rule "196 (effect) GOAL: omnic part collector":
    @Disabled
    
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, vect(0, 0, 0), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "197 GOAL: omnic part collector (players gather souls from omnics)":
    @Disabled
    
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, vect(0, 0, 0), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "198 GOAL: save followers (find the follower and save them from wondering around)":
    @Disabled
    
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, vect(0, 0, 0), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    #perhaps followers get an upgrade or immediate pack a punch tier 1 when you complete this objective
    #have it so they walk around the map and navigate randomly, basically make it a game of hide and seek
    #have a timer for 5 minutes to make sure it doesnt go on forever

rule "199 GOAL: gather 3 teleporter parts":
    @Disabled
    
    createEffect(getAllPlayers(), Effect.RING, Color.WHITE, vect(0, 0, 0), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    #will need to manage it so that the parts are in the starting zone as the player, though this would be a immidiate objective instead of one you activate

rule "200 GOAL: The main easter egg":
    @Disabled
    
    hudHeader(getAllPlayers(), "stay tuned...", HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    #another hidden but immidiate objective for the user to do

rule "201 GOAL: Escort the robot":
    @Disabled
    
    hudHeader(getAllPlayers(), "stay tuned...", HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)

rule "Protect the generator":
    @Disabled


rule "sombra: hack multiple computers with sombra, effectively protect the sombra":
    @Disabled


rule "survive the failing simulation (rising lava, flash flood, tornado, gravity reduced, blizzards, toxic gas, meteor shower, power outage, darkness)"
    @Disabled

rule "save the miniature winstons from the zombies and carry them to the goal":


rule "Destroy the many nest around the map (make it a bot that is invisible that you attack for the hitbox)":
    #this would turn off the wave boss for 3 rounds


rule "activate the signal, by having the players seperate(if playing in coop, or just leave only 1 button for solo and just survive for 60 seconds in solo) and have the players seperate":

rule "reinhardt: protect the crusaiders: have one player be reinhart and have several ally reins protect a gate from zombies."

rule "torbjorn: help build a mega turret by collecting scrap from wave bosses":

rule "lucio: broadcast music around the map, which then slows the zombies for 3 minutes after doing the objective"
    #have lucio go to a computer and compose his music

rule "junkrat: have him plant explosives to make the team lots of money!":

rule "echo: clones the zombie code, and becomes one of them, becoming tier 3 pack a punched"

*/