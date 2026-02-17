#Global variables

globalvar roundnumber 0
globalvar Beameffectdoors 65
globalvar AllPos 83
globalvar AllDir 84
globalvar firstpos 85
globalvar secondpos 86
globalvar firstpoint2 87
globalvar secondpoint2 88
globalvar numbers 95
globalvar colors 96
globalvar compressedData 97
globalvar doorscompresser 98
globalvar decompressed 99
globalvar i 100
globalvar scratch 101
globalvar param0 102
globalvar param1 103
globalvar param2 104
globalvar param3 105
globalvar param4 106
globalvar charIndex 107


#Subroutine names

subroutine DecompressString 9
subroutine ParseNumber 10


rule "Dev Decompressed hud":
    hudHeader(localPlayer, "firstpos {0} secondpos {1} firstpos2 {2}".format(firstpos[0], secondpos[0], firstpoint2[0]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudHeader(localPlayer, "allpos {0} alldir {1} secondpoint2 {2}".format(AllPos[0], AllDir[0], secondpoint2[0]), HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)


def DecompressString():
    @Name "Decompress string"
    
    decompressed = [player.split(",") for player in compressedData]
    compressedData = []
    for i in range(len(decompressed)):
        compressedData.append(decompressed[i])
    decompressed = []
    for i in range(len(compressedData)):
        if compressedData[i].charAt(0) == "v":
            compressedData[i] = compressedData[i].substring(1, 999)
            ParseNumber()
            scratch[0] = param0
            i += 1
            ParseNumber()
            scratch[1] = param0
            i += 1
            ParseNumber()
            scratch[2] = param0
            decompressed.append(vect(scratch[0], scratch[1], scratch[2]))
        elif compressedData[i].charAt(0) == "c":
            decompressed.append(colors[numbers.strIndex(compressedData[i].charAt(1))])
        elif compressedData[i].charAt(0) == "$":
            decompressed.append(compressedData[i].substring(1, 999))
        else:
            ParseNumber()
            decompressed.append(param0)
    compressedData = null


def ParseNumber():
    @Name "Parse number"
    
    param0 = 0
    param1 = 0
    param2 = 1
    param3 = 0
    param4 = null
    for charIndex in range(strLen(compressedData[i])):
        param4 = compressedData[i].charAt(charIndex)
        if param4 == "-":
            param2 *= -1
        elif param4 == ".":
            param3 = 10
        else:
            param1 = numbers.strIndex(param4)
            if param1 != -1:
                if param3 == 0:
                    param0 = param0 * 10 + param1
                else:
                    param0 += param1 / param3
                    param3 *= 10
    param0 *= param2


rule "set arrays":
    numbers = "0123456789abcdef"
    compressedData = "{0}".format("v132,0,304,4,4,90,1,5,5")
    DecompressString()
    doorscompresser = decompressed


rule "use data from original point of door":
    #Note: this '__for__' had no 'end' action.
    if len(doorscompresser) > 0 and i < 0 or len(doorscompresser) <= 0 and i > 0:
        #first point - bottom left
        Beameffectdoors.append(doorscompresser[i])
        #top right point
        Beameffectdoors.append(doorscompresser[i] + ((directionFromAngles(doorscompresser[i + 3], 0)) * (doorscompresser[i + 2])) + (Vector.UP * (doorscompresser[i + 1])))
        #top left point
        Beameffectdoors.append(doorscompresser[i] + (Vector.UP * (doorscompresser[i + 2])))
        #bottom right point
        Beameffectdoors.append(doorscompresser[i] + ((directionFromAngles(doorscompresser[i + 3], 0)) * (doorscompresser[i + 2])))
        #firstpos.append(doorscompresser[i])
        #accounts for 2nd point using first point, angle and width.
        #secondpos.append(doorscompresser[i] + ((directionFromAngles(doorscompresser[i + 3], 0)) * (doorscompresser[i + 2])))
        #firstpoint2.append(doorscompresser[i] + Vector.UP * 1000)
        #secondpoint2.append(doorscompresser[i] + (directionFromAngles((doorscompresser[i + 4]) * (doorscompresser[i + 3]), 0)) + Vector.UP * 1000)
        #i += 1
        #do something with width
        #roundnumber = 0
        #i += 1
        #do something with height
        #roundnumber = 0
        #i += 1
        #do something with angle
        #roundnumber = 0
        AllDir.append(directionFromAngles(doorscompresser[i + 3] + 90, 0))
        #i += 1
        #if doorscompresser[i] == 1:
        #i += 1
        #do something with width
        #roundnumber = 0
        #i += 1
        #do something with height
        #roundnumber = 0
        #roundnumber = Vector.UP
        #first point - bottom left
        firstpos.append(doorscompresser[i])
        #top right point
        secondpos.append(doorscompresser[i] + ((directionFromAngles(doorscompresser[i + 3], 0)) * (doorscompresser[i + 2])) + (Vector.UP * (doorscompresser[i + 1])))
        #top left point
        firstpoint2.append(doorscompresser[i] + (Vector.UP * (doorscompresser[i + 2])))
        #bottom right point
        secondpoint2.append(doorscompresser[i] + ((directionFromAngles(doorscompresser[i + 3], 0)) * (doorscompresser[i + 2])))
        AllPos.append((firstpos[i] + secondpos[i]) / 2)


