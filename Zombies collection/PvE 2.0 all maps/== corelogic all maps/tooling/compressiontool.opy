def DecompressString():
    @Name "Decompress string"
    
    decompressed = [player.split(",") for player in compressedData]
    compressedData = []
    wait()
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
    smallMessage(getAllPlayers(), "Decompression complete")
    Beameffectdoors = []
    i = 0

def ParseNumber():
    @Name "Parse number"
    
    param0 = 0
    param1 = 0
    param2 = 1
    param3 = 0
    param4 = null
    for charIndex in range(strLen(compressedData[i])):
        if i / 4 == floor(i / 4):
            wait()
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
    wait(1.0)
    DecompressString()
    doorscompresser = decompressed


rule "Make door arrays":
    @Condition start == 1

    while i < len(doorscompresser):
        if i / 2 == floor(i / 2):
            wait()
        Beameffectdoors.append(doorscompresser[i])  # bottom left
        Beameffectdoors.append(doorscompresser[i] + (directionFromAngles(doorscompresser[i + 3] - 90, 0) * doorscompresser[i + 1]) + (Vector.UP * doorscompresser[i + 2]))  # top right
        Beameffectdoors.append(doorscompresser[i] + (Vector.UP * doorscompresser[i + 1]))  # top left
        Beameffectdoors.append(doorscompresser[i] + (directionFromAngles(doorscompresser[i + 3] - 90, 0) * doorscompresser[i + 1]))  # bottom right
        #if doorscompresser[i + 5] == 1: #if boolean is true, then don't use infinite height
        firstpos.append(doorscompresser[i])
        secondpos.append(doorscompresser[i] + ((directionFromAngles(doorscompresser[i + 3] + 90, 0)) * (doorscompresser[i + 1])) + (Vector.UP * (doorscompresser[i + 2])))        #top right point
        firstpoint2.append(doorscompresser[i] + (Vector.UP * (doorscompresser[i + 1])))        #top left point
        secondpoint2.append(doorscompresser[i] + ((directionFromAngles(doorscompresser[i + 3] + 90, 0)) * (doorscompresser[i + 1])))        #bottom right point
        AllPos.append((firstpos[doorLoopIndex] + secondpos[doorLoopIndex]) / 2)
        AllDir.append(directionFromAngles(doorscompresser[i + 3] + 90, 0))
        #else: #if boolean is false, then use infinite height
            #firstpos.append(doorscompresser[i]) #bottom left, but this is for the collision logic
            #wait()
            #secondpos.append(doorscompresser[i] + ((directionFromAngles(doorscompresser[i + 3], 0)) * (doorscompresser[i + 2])))
            #wait()
            #firstpoint2.append(doorscompresser[i] + Vector.UP * 1000)
            #wait()
            #secondpoint2.append(doorscompresser[i] + (directionFromAngles((doorscompresser[i + 4]) * (doorscompresser[i + 3]), 0)) + Vector.UP * 1000)
        # wait()
            #AllPos.append((firstpos[doorLoopIndex] + secondpos[doorLoopIndex]) / 2)
            #wait()
            #AllDir.append(directionFromAngles(doorscompresser[i + 3] + 90, 0))
        if doorscompresser[i + 5] == 1: #loop to the next door in compressed data
            i += 7
        else: 
            i += 5
        if i == len(doorscompresser) - 1:
            smallMessage(getAllPlayers(), "Door arrays created")
        doorLoopIndex += 1


