rule "56  points loss for high roller":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.points >= 3000
    
    eventPlayer.points -= eventPlayer.points * 0.2
    eventPlayer.points = ceil(eventPlayer.points)


rule "57  death points loss":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.points >= 1000
    
    eventPlayer.points -= 200 * eventPlayer.H
    eventPlayer.points = ceil(eventPlayer.points)


rule "global debt to ramattra - tracker":
#need points to be tracked for all purchase events
#perhaps create a way to track numbers beyond workshop limits

rule "global bank system":
#NEED TO BETA TEST THIS IDEA FIRST BEFORE IMPLEMENTING THE REST OF THE IDEAS
# BETA TEST INCLUDES: THE BANK ONLY, AND THE TIER 1 BANK ACCOUNT, NOTHING ELSE.
#need to track points for all player deaths and for all deposits and withdrawals
#needs set location (easy, normal), but also random when on hard mode
#tier 1 will have a yield of .5% per round, and a fee of 0, and a withdrawal fee of 100
#tier 2 will have a yield of 2% per round, and a fee of 5000 and a withdrawal fee of 200
#tier 3 will have a yield of 3% per round, and a fee of 10000 and a withdrawal fee of 250

#rule "global bank withdraw button":
# make interact key incrament up, crouch to decrament, and jump to confirm withdrawl

#rule "global bank deposit button":
# make interact key incrament up, crouch to decrament, and jump to confirm deposit


#rule "global bank buy upgrade":
# put interact key to buy upgrade here

#rule "global bank upgrade effect":
# put upgrade effect in the effects folder of the map specific folder

#rule "credit card system":
# allow player points to go negative up to a certain limit
#needs hud element to show current credit card tier in a color, and the rest when player holds spacebar: current debt, current APR, current fee per round, and one time fee for next upgrade
#tier 1 will allow -2000 points, have a APR of 30% per round, and a fee of 0 points per round, and a one time fee of 1000 points
#tier 2 will allow -10000 points have a APR of 20% per round, and a fee of 100 points per round, and a one time fee of 2000 points
#tier 3 will allow -20000 points have a APR of 15% per round, and a fee of 200 points per round, and a one time fee of 4000 points

#rule "credit card buy upgrade":


#rule "credit card upgrade effect":

#rule "credit card every round fee if negative":


#rule "credit card":