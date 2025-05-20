rule "350 hanzo ammo cancel (wip)":
    @Event eachPlayer
    @Hero hanzo
    @Condition (eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE)) == true
    @Disabled
    
    wait(0.1, Wait.ABORT_WHEN_FALSE)
    if eventPlayer.doublemag == false:
        eventPlayer.magazines += 0.25
    elif eventPlayer.doublemag == 1:
        eventPlayer.magazines += 0.125


rule "132  rien out of ammo":
    @Event eachPlayer
    @Team 1
    @Hero reinhardt
    @Condition eventPlayer.currentmagazines <= 0
    @Condition eventPlayer.isUsingAbility2() == true
    
    eventPlayer.disallowButton(Button.ABILITY_2)
    wait(15)
    eventPlayer.allowButton(Button.ABILITY_2)


rule "112  hanzo ammo":
    @Event eachPlayer
    @Team 1
    @Hero hanzo
    @Condition eventPlayer.isFiringPrimaryFire() == true
    @Condition eventPlayer.doublemag == false
    
    eventPlayer.currentmagazines -= 0.25


