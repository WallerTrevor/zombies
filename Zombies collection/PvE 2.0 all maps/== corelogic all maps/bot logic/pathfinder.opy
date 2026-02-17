rule "【PF Core】Prepare loaded map":
    @Condition pfLoadedMap_nodes == true
    @Condition pfIterationsThisTick != -99
    
    for pfI1 in range(len(pfLoadedMap_nodes)):
        pfLoadedMap_nodes[pfI1] = vect(pfLoadedMap_nodes[pfI1].x, floor(pfLoadedMap_nodes[pfI1].y) + (pfI1 / 1000 * (-1 if pfLoadedMap_nodes[pfI1].y < 0 else 1)), pfLoadedMap_nodes[pfI1].z)


rule "【PF Core】Select next pathfinder":
    @Condition (not entityExists(pfExecOwner) or pfExecOwner == null) == true
    @Condition any([player.pfWait for player in getAllPlayers()]) == true
    
    pfExecOwner = sorted([player for player in getAllPlayers() if player.pfWait], lambda i: i.pfWait)[0]
    wait()
    if ruleCondition:
        loop()


rule "【PF Core】Update & Execute":
    @Event eachPlayer
    @Condition eventPlayer.pfDestination == true
    @Condition (not eventPlayer.pfSavedTarget or distance(eventPlayer.pfDestination, eventPlayer.pfSavedTarget) > 5) == true
    
    #Ensure that a map is loaded.
    if not pfLoadedMap_nodes:
        logToInspector("Error: Attempted to pathfind player {0} without a loaded map.".format(eventPlayer))
        return
    eventPlayer.pfWait = getTotalTimeElapsed()
    eventPlayer.pfWasBroadcasted = false
    waitUntil(pfExecOwner == eventPlayer or eventPlayer.pfWasBroadcasted, 9999)
    #Update saved destination
    eventPlayer.pfSavedTarget = eventPlayer.pfDestination
    if not eventPlayer.pfWasBroadcasted:
        eventPlayer.pfgoal = floor(((abs(((sorted(sorted(pfLoadedMap_nodes, lambda player: distance(player, eventPlayer.pfSavedTarget)).slice(0, 5), lambda i: not isInLoS(i + vect(0, 2, 0), eventPlayer.pfSavedTarget + vect(0, 2, 0))))[0]).y)) * 1000) % 1000)
        pfTick()
        if eventPlayer.pfIsPathfinding and eventPlayer.pfCurrentNodeIndex != -1:
            eventPlayer.pfActiveNode = eventPlayer.pfCurrentNodeIndex
        else:
            eventPlayer.pfActiveNode = floor(((abs(((sorted(sorted(pfLoadedMap_nodes, lambda player: distance(player, eventPlayer.getPosition())).slice(0, 5), lambda i: not isInLoS(i + vect(0, 2, 0), eventPlayer.getPosition() + vect(0, 2, 0))))[0]).y)) * 1000) % 1000)
            pfTick()
        eventPlayer.pfscores_gScore = [0]
        eventPlayer.pfscores_fScore = [0]
        eventPlayer.pfscores_parent = [-1]
        eventPlayer.pfscores_nodeIndex = [eventPlayer.pfgoal]
        eventPlayer.pfopen = [0]
        eventPlayer.pfcheckedNode = eventPlayer.pfActiveNode
        eventPlayer.pfiter = 0
        while len(eventPlayer.pfopen) or eventPlayer.pfiter > 30:
            #The index of the current node in `scores`.
            eventPlayer.pfcurrent = sorted(eventPlayer.pfopen, lambda player: eventPlayer.pfscores_fScore[player])[0]
            if eventPlayer.pfcheckedNode != eventPlayer.pfActiveNode:
                eventPlayer.pfcheckedNode = eventPlayer.pfscores_nodeIndex.index(eventPlayer.pfActiveNode)
                if eventPlayer.pfcheckedNode != -1:
                    eventPlayer.pfcurrent = eventPlayer.pfcheckedNode
                    eventPlayer.pfcheckedNode = -2
                else:
                    eventPlayer.pfcheckedNode = eventPlayer.pfActiveNode
            eventPlayer.pfcurrentInExistingPath = eventPlayer.pfPath.index(eventPlayer.pfscores_nodeIndex[eventPlayer.pfcurrent])
            #If the goal was found, reconstruct the path.
            if eventPlayer.pfscores_nodeIndex[eventPlayer.pfcurrent] == eventPlayer.pfActiveNode or eventPlayer.pfcheckedNode == -2 or eventPlayer.pfcurrentInExistingPath != -1:
                if eventPlayer.pfcurrentInExistingPath == -1:
                    eventPlayer.pfPath = []
                else:
                    eventPlayer.pfPath = eventPlayer.pfPath.slice(0, eventPlayer.pfcurrentInExistingPath)
                while eventPlayer.pfcurrent != -1:
                    eventPlayer.pfPath.append(eventPlayer.pfscores_nodeIndex[eventPlayer.pfcurrent])
                    eventPlayer.pfcurrent = eventPlayer.pfscores_parent[eventPlayer.pfcurrent]
                eventPlayer.pfPath.append([-1])
                eventPlayer.pfbroadcastTo = [player for player in getPlayersInRadius(eventPlayer.getPosition() + Vector.UP, 4, Team.ALL) if player != eventPlayer and player.pfWait and distance(player.pfDestination, eventPlayer.pfDestination) < 4 and player.pfPlayerAttributes == eventPlayer.pfPlayerAttributes]
                eventPlayer.pfbroadcastTo.pfPath = eventPlayer.pfPath
                eventPlayer.pfbroadcastTo.pfWasBroadcasted = true
                goto lbl_0
            eventPlayer.pfopen.remove(eventPlayer.pfcurrent)
            #Check each neighbor to the current node.
            for eventPlayer.pfneighbor in range(len(pfLoadedMap_neighbors[eventPlayer.pfscores_nodeIndex[eventPlayer.pfcurrent]])):
                #The neighbor index to be used like `pfLoadedMap.nodes[neighborI]`.
                eventPlayer.pfneighborI = pfLoadedMap_neighbors[eventPlayer.pfscores_nodeIndex[eventPlayer.pfcurrent]][eventPlayer.pfneighbor][0]
                eventPlayer.pfscoreIndex = eventPlayer.pfscores_nodeIndex.index(eventPlayer.pfneighborI)
                #Ensure that the path to the neighbor is enabled.
                if len(pfLoadedMap_neighbors[eventPlayer.pfscores_nodeIndex[eventPlayer.pfcurrent]][eventPlayer.pfneighbor][1]) == 0 or any([i in eventPlayer.pfPlayerAttributes for i in pfLoadedMap_neighbors[eventPlayer.pfscores_nodeIndex[eventPlayer.pfcurrent]][eventPlayer.pfneighbor][1]]):
                    eventPlayer.pfscore = eventPlayer.pfscores_gScore[eventPlayer.pfcurrent] + distance(pfLoadedMap_nodes[eventPlayer.pfscores_nodeIndex[eventPlayer.pfcurrent]], pfLoadedMap_nodes[eventPlayer.pfneighborI])
                    #Get neighbor index in scores.
                    #If -1, the neighbor was not added to the score list yet.
                    if eventPlayer.pfscoreIndex == -1:
                        eventPlayer.pfopen.append(len(eventPlayer.pfscores_gScore))
                        eventPlayer.pfscores_gScore.append(eventPlayer.pfscore)
                        eventPlayer.pfscores_fScore.append(eventPlayer.pfscore + distance(pfLoadedMap_nodes[eventPlayer.pfneighborI], pfLoadedMap_nodes[eventPlayer.pfActiveNode]) * 20)
                        eventPlayer.pfscores_parent.append(eventPlayer.pfcurrent)
                        eventPlayer.pfscores_nodeIndex.append(eventPlayer.pfneighborI)
                    elif eventPlayer.pfscore < eventPlayer.pfscores_gScore[eventPlayer.pfscoreIndex]:
                        eventPlayer.pfscores_gScore[eventPlayer.pfscoreIndex] = eventPlayer.pfscore
                        eventPlayer.pfscores_fScore[eventPlayer.pfscoreIndex] = eventPlayer.pfscore + distance(pfLoadedMap_nodes[eventPlayer.pfneighborI], pfLoadedMap_nodes[eventPlayer.pfActiveNode]) * 20
                        eventPlayer.pfscores_parent[eventPlayer.pfscoreIndex] = eventPlayer.pfcurrent
                        eventPlayer.pfscores_nodeIndex[eventPlayer.pfscoreIndex] = eventPlayer.pfneighborI
                        if not eventPlayer.pfscoreIndex in eventPlayer.pfopen:
                            eventPlayer.pfopen.append(eventPlayer.pfscoreIndex)
                pfTick()
            eventPlayer.pfiter++
        lbl_0:
        pfExecOwner = null
    if len(eventPlayer.pfPath):
        eventPlayer.pfIsPathfinding = true
        eventPlayer.pfCurrentNodeIndex = eventPlayer.pfPath[0]
        eventPlayer.pfWalkingToPosition = pfLoadedMap_nodes[eventPlayer.pfCurrentNodeIndex]
        pfUpdateNodeMeta()
        pfWalkToDestination()
    eventPlayer.pfWait = null
    wait(2)
    if ruleCondition:
        loop()



rule "【PF Core】Node reached":
    @Event eachPlayer
    @Condition eventPlayer.pfIsPathfinding == true
    @Condition eventPlayer.pfWalkingToPosition == true
    #Horizontal distance to current position is less than 0.4.
    @Condition distance(eventPlayer.getPosition() * vect(1, [], 1), eventPlayer.pfWalkingToPosition * vect(1, [], 1)) <= 0.4
    #Vertical distance to current position is less than 1.5.
    @Condition abs(eventPlayer.getPosition().y - eventPlayer.pfWalkingToPosition.y) <= 1.5
    @Condition len(eventPlayer.pfPath) > 0
    @Condition eventPlayer.pfCurrentNodeIndex != -1
    
    pfProgressEventPlayer()
    wait(0.2)
    if ruleCondition:
        loop()


rule "【PF Core】Stop throttle when pfDestination is reset":
    @Event eachPlayer
    @Condition eventPlayer.pfIsPathfinding == true
    @Condition eventPlayer.pfDestination == null
    
    eventPlayer.stopThrottleInDirection()
    eventPlayer.pfIsPathfinding = false
    eventPlayer.pfSavedTarget = null


rule "【PF Core】Insurance":
    @Event eachPlayer
    @Condition eventPlayer.pfIsPathfinding == true
    @Condition eventPlayer.pfWalkingToPosition == true
    
    #Smooth step
    if len(eventPlayer.pfPath) == 2 and distance(eventPlayer, eventPlayer.pfSavedTarget) < distance(eventPlayer.pfWalkingToPosition, eventPlayer.pfSavedTarget) and isInLoS(eventPlayer.getPosition() + vect(0, 0.25, 0), eventPlayer.pfSavedTarget + vect(0, 0.25, 0)):
        pfProgressEventPlayer()
        #Shift destination
    elif eventPlayer.pfWalkingToPosition != eventPlayer.pfDestination and eventPlayer.pfCurrentNodeIndex == -1 and distance(eventPlayer.pfSavedTarget, eventPlayer.pfDestination) < 5 and isInLoS(eventPlayer.pfSavedTarget + Vector.UP, eventPlayer.pfDestination + Vector.UP):
        eventPlayer.pfWalkingToPosition = eventPlayer.pfDestination
        #Recovery
    elif ((((((distance(eventPlayer, eventPlayer.pfWalkingToPosition) > 0.4 and (not (not eventPlayer.pfSavedTarget or distance(eventPlayer.pfDestination, eventPlayer.pfSavedTarget) > 5))) and (eventPlayer.pfIsStuck or distance(eventPlayer.pfWalkingFromPosition, eventPlayer.pfWalkingToPosition) - (4.95 * (getTotalTimeElapsed() - eventPlayer.pfStartTime)) < 0)) and not eventPlayer.hasStatus(Status.ROOTED)) and not eventPlayer.hasStatus(Status.FROZEN)) and not eventPlayer.hasStatus(Status.ASLEEP)) and not eventPlayer.hasStatus(Status.KNOCKED_DOWN)) and not eventPlayer.hasStatus(Status.STUNNED):
        if eventPlayer.pfStuckOnNode - 2 == eventPlayer.pfCurrentNodeIndex:
            logToInspector("Pathfinder {0} struggled to reach node {1} at {2}. Try adjusting your map in the editor.".format(eventPlayer, eventPlayer.pfCurrentNodeIndex, pfLoadedMap_nodes[eventPlayer.pfCurrentNodeIndex]))
            eventPlayer.teleport(eventPlayer.pfWalkingToPosition)
        else:
            eventPlayer.pfStuckOnNode = eventPlayer.pfCurrentNodeIndex + 2
            pfRecalibrate()
    wait(2)
    if ruleCondition:
        loop()


rule "【PF Core】Recalibrate when off path":
    @Event eachPlayer
    @Condition eventPlayer.pfIsPathfinding == true
    @Condition eventPlayer.pfWalkingToPosition == true
    @Condition distance((eventPlayer.pfWalkingFromPosition + eventPlayer.pfWalkingToPosition) / 2, eventPlayer) > (distance(eventPlayer.pfWalkingFromPosition, eventPlayer.pfWalkingToPosition) + 4) * 1.2
    
    pfRecalibrate()


rule "【PF Core】Check throttle":
    @Event eachPlayer
    @Condition eventPlayer.pfIsPathfinding == true
    @Condition magnitude(eventPlayer.getVelocity()) < 3
    
    wait(2.1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.pfIsStuck = true
    waitUntil(not eventPlayer.pfWalkingToPosition or not eventPlayer.pfIsPathfinding or magnitude(eventPlayer.getVelocity()) >= 3, 9999)
    eventPlayer.pfIsStuck = false


rule "【PF Decompress】Decompress map":
    @Condition pfDecompress == true
    
    #Lock pathfinder until compression is completed.
    pfIterationsThisTick = -99
    pfcompressionTable = "{0}{1}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format("{0}{1}{2}".format(" !#$%&'()*+,-./:;<=>?@[]^_`|~\u007f\u0080\u0081\u0082\u0083\u0084\u0085\u0086\u0087\u0088\u0089\u008a\u008b\u008c\u008d\u008e\u008f\u0090\u0091\u0092\u0093\u0094\u0095\u0096\u0097\u0098\u0099\u009a\u009b\u009c\u009d\u009e\u009f\u00a0¡¢£¤¥¦§¨©«¬\z®¯°±´¶·¸»¿×÷˂˃˄˅˒˓˔˕˖˗˘˙˚˛˜˝˞˟˥˦˧˨˩˪˫˭˯˰˱˲˳˴˵˶˷˸˹˺˻˼˽", "˾˿̴̵̶̷̸̡̢̧̨̛̖̗̘̙̜̝̞̟̠̣̤̥̦̩̪̫̬̭̮̯̰̱̲̳̹̺̻̼͇͈͉͍͎̀́̂̃̄̅̆̇̈̉̊̋̌̍̎̏̐̑̒̓̔̽̾̿̀́͂̓̈́͆͊͋͌̕̚ͅ͏͓͔͕͖͙͚͐͑͒͗͛ͣͤͥͦͧͨͩͪͫͬͭͮͯ͘͜͟͢͝͞͠͡͵\u0378\u0379;\u0380\u0381\u0382\u0383΄΅·\u038b\u038d\u03a2", "϶҂҃҄҅҆҇҈҉\u0530\u0557\u0558՚՛՜՝՞՟։֊\u058b\u058c֍֎֏\u0590ְֱֲֳִֵֶַָֹֺֻּֽ֑֖֛֢֣֤֥֦֧֪֚֭֮֒֓֔֕֗֘֙֜֝֞֟֠֡֨֩֫֬֯־ֿ׀ׁׂ׃ׅׄ׆ׇ\u05c8\u05c9\u05ca\u05cb\u05cc\u05cd\u05ce\u05cf\u05eb\u05ec\u05ed\u05ee׳״\u05f5\u05f6\u05f7\u05f8\u05f9\u05fa\u05fb\u05fc\u05fd\u05fe\u05ff\u0600\u0601\u0602\u0603\u0604\u0605؆؇؈؉؊؋،؍؎؏ؐؑؒؓؔؕ"), "ؘؙؚؖؗ؛\u061c؝؞؟ًٌٍَُِّْٕٖٜٟٓٔٗ٘ٙٚٛٝٞ٪٫٬٭ٰ۔ۖۗۘۙۚۛۜ\u06dd۞ۣ۟۠ۡۢۤۧۨ۩۪ۭ۫۬۽۾܀܁܂܃܄܅܆܇܈܉܊܋܌܍\u070e\u070fܑܱܴܷܸܹܻܼܾ݂݄݆݈ܰܲܳܵܶܺܽܿ݀݁݃݅݇݉݊\u074b\u074cަާިީުޫެޭޮޯް\u07b2\u07b3\u07b4\u07b5\u07b6\u07b7\u07b8\u07b9\u07ba\u07bb", "\u07bc\u07bd\u07be\u07bf߲߫߬߭߮߯߰߱߳߶߷߸߹\u07fb\u07fc߽߾߿ࠖࠗ࠘࠙ࠛࠜࠝࠞࠟࠠࠡࠢࠣࠥࠦࠧࠩࠪࠫࠬ࠭\u082e\u082f࠰࠱࠲࠳࠴࠵࠶࠷࠸࠹࠺࠻࠼࠽࠾\u083f࡙࡚࡛\u085c\u085d࡞\u085f\u086b\u086c\u086d\u086e\u086fࡰࡱࡲࡳࡴࡵࡶࡷࡸࡹࡺࡻࡼࡽࡾࡿࢀࢁࢂࢃࢄࢅࢆࢇ࢈ࢉࢊࢋࢌࢍࢎ\u088f\u0890\u0891\u0892\u0893\u0894\u0895\u0896\u0897࢙࢚࢛࢘࢜࢝࢞࢟ࢵࣈࣉ࣊࣋࣌࣍"), "࣏࣐࣑࣒࣓࣎ࣔࣕࣖࣗࣘࣙࣚࣛࣜࣝࣞࣟ࣠࣡\u08e2ࣰࣱࣲࣣࣦࣩ࣭࣮࣯ࣶࣹࣺࣤࣥࣧࣨ࣪࣫࣬ࣳࣴࣵࣷࣸࣻࣼࣽࣾࣿऀँंःऺऻ़ािीुूृॄॅॆेैॉॊोौ्ॎॏ॒॑॓॔ॕॖॗॢॣ।॥॰ঁংঃ\u0984\u098d\u098e\u0991\u0992\u09a9\u09b1\u09b3\u09b4\u09b5\u09ba\u09bb়ািীুূৃৄ\u09c5\u09c6েৈ\u09c9\u09caোৌ্\u09cf\u09d0\u09d1\u09d2\u09d3\u09d4\u09d5\u09d6ৗ", "\u09d8\u09d9\u09da\u09db\u09deৢৣ\u09e4\u09e5৲৳৺৻৽৾\u09ff\u0a00ਁਂਃ\u0a04\u0a0b\u0a0c\u0a0d\u0a0e\u0a11\u0a12\u0a29\u0a31\u0a34\u0a37\u0a3a\u0a3b਼\u0a3dਾਿੀੁੂ\u0a43\u0a44\u0a45\u0a46ੇੈ\u0a49\u0a4aੋੌ੍\u0a4e\u0a4f\u0a50ੑ\u0a52\u0a53\u0a54\u0a55\u0a56\u0a57\u0a58\u0a5d\u0a5f\u0a60\u0a61\u0a62\u0a63\u0a64\u0a65ੰੱੵ੶\u0a77\u0a78\u0a79\u0a7a\u0a7b\u0a7c\u0a7d\u0a7e\u0a7f\u0a80ઁંઃ\u0a84\u0a8e\u0a92\u0aa9\u0ab1\u0ab4\u0aba\u0abb઼ાિીુૂૃૄૅ\u0ac6ેૈૉ\u0acaોૌ્\u0ace\u0acf\u0ad1\u0ad2\u0ad3\u0ad4\u0ad5\u0ad6\u0ad7\u0ad8\u0ad9\u0ada\u0adb\u0adc\u0add\u0ade"), "\u0adfૢૣ\u0ae4\u0ae5૰૱\u0af2\u0af3\u0af4\u0af5\u0af6\u0af7\u0af8ૺૻૼ૽૾૿\u0b00ଁଂଃ\u0b04\u0b0d\u0b0e\u0b11\u0b12\u0b29\u0b31\u0b34\u0b3a\u0b3b଼ାିୀୁୂୃୄ\u0b45\u0b46େୈ\u0b49\u0b4aୋୌ୍\u0b4e\u0b4f\u0b50\u0b51\u0b52\u0b53\u0b54୕ୖୗ\u0b58\u0b59\u0b5a\u0b5b\u0b5eୢୣ\u0b64\u0b65୰\u0b78\u0b79\u0b7a\u0b7b\u0b7c\u0b7d\u0b7e\u0b7f\u0b80\u0b81ஂ\u0b84\u0b8b\u0b8c\u0b8d\u0b91\u0b96\u0b97\u0b98\u0b9b\u0b9d\u0ba0\u0ba1\u0ba2\u0ba5\u0ba6\u0ba7\u0bab\u0bac\u0bad\u0bba\u0bbb\u0bbc\u0bbdாிீுூ\u0bc3\u0bc4\u0bc5ெேை\u0bc9ொோௌ்\u0bce\u0bcf\u0bd1\u0bd2\u0bd3\u0bd4\u0bd5", "\u0bd6ௗ\u0bd8\u0bd9\u0bda\u0bdb\u0bdc\u0bdd\u0bde\u0bdf\u0be0\u0be1\u0be2\u0be3\u0be4\u0be5௳௴௵௶௷௸௹௺\u0bfb\u0bfc\u0bfd\u0bfe\u0bffఀఁంఃఄ\u0c0d\u0c11\u0c29\u0c3a\u0c3b఼ాిీుూృౄ\u0c45ెేై\u0c49ొోౌ్\u0c4e\u0c4f\u0c50\u0c51\u0c52\u0c53\u0c54ౕౖ\u0c57\u0c5b\u0c5cౝ\u0c5e\u0c5fౢౣ\u0c64\u0c65\u0c70\u0c71\u0c72\u0c73\u0c74\u0c75\u0c76౷౿ಁಂಃ಄\u0c8d\u0c91\u0ca9\u0cb4\u0cba\u0cbb಼ಾಿೀುೂೃೄ\u0cc5ೆೇೈ\u0cc9ೊೋೌ್\u0cce\u0ccf\u0cd0\u0cd1\u0cd2\u0cd3\u0cd4ೕೖ\u0cd7\u0cd8\u0cd9\u0cda\u0cdb\u0cdcೝ\u0cdf"), "ೢೣ\u0ce4\u0ce5\u0cf0ೳ\u0cf4\u0cf5\u0cf6\u0cf7\u0cf8\u0cf9\u0cfa\u0cfb\u0cfc\u0cfd\u0cfe\u0cffഀഁംഃ\u0d0d\u0d11഻഼ാിീുൂൃൄ\u0d45െേൈ\u0d49ൊോൌ്൏\u0d50\u0d51\u0d52\u0d53ൗൢൣ\u0d64\u0d65൹\u0d80ඁංඃ\u0d84\u0d97\u0d98\u0d99\u0db2\u0dbc\u0dbe\u0dbf\u0dc7\u0dc8\u0dc9්\u0dcb\u0dcc\u0dcd\u0dceාැෑිීු\u0dd5ූ\u0dd7ෘෙේෛොෝෞෟ\u0de0\u0de1\u0de2\u0de3\u0de4\u0de5\u0df0\u0df1ෲෳ෴\u0df5\u0df6\u0df7\u0df8\u0df9\u0dfa\u0dfb\u0dfc\u0dfd\u0dfe\u0dff\u0e00ัิีึืฺุู\u0e3b\u0e3c\u0e3d\u0e3e฿็่", "้๊๋์ํ๎๏๚๛\u0e5c\u0e5d\u0e5e\u0e5f\u0e60\u0e61\u0e62\u0e63\u0e64\u0e65\u0e66\u0e67\u0e68\u0e69\u0e6a\u0e6b\u0e6c\u0e6d\u0e6e\u0e6f\u0e70\u0e71\u0e72\u0e73\u0e74\u0e75\u0e76\u0e77\u0e78\u0e79\u0e7a\u0e7b\u0e7c\u0e7d\u0e7e\u0e7f\u0e80\u0e83\u0e85\u0e8b\u0ea4\u0ea6ັິີຶື຺ຸູົຼ\u0ebe\u0ebf\u0ec5\u0ec7່້໊໋໌ໍ໎\u0ecf\u0eda\u0edb\u0ee0\u0ee1\u0ee2\u0ee3\u0ee4\u0ee5\u0ee6\u0ee7\u0ee8\u0ee9\u0eea\u0eeb\u0eec\u0eed\u0eee\u0eef\u0ef0\u0ef1\u0ef2\u0ef3\u0ef4\u0ef5\u0ef6\u0ef7\u0ef8\u0ef9\u0efa\u0efb\u0efc\u0efd\u0efe\u0eff༁༂༃༄༅༆༇༈༉༊་༌།༎༏༐༑༒༓༔༕"), "༖༗༘༙༚༛༜༝༞༟༴༵༶༷༸༹༺༻༼༽༾༿\u0f48\u0f6d\u0f6e\u0f6f\u0f70ཱཱཱིིུུྲྀཷླྀཹེཻོཽཾཿ྄ཱྀྀྂྃ྅྆྇ྍྎྏྐྑྒྒྷྔྕྖྗ\u0f98ྙྚྛྜྜྷྞྟྠྡྡྷྣྤྥྦྦྷྨྩྪྫྫྷྭྮྯྰྱྲླྴྵྶྷྸྐྵྺྻྼ\u0fbd྾྿࿀࿁࿂࿃࿄࿅࿆࿇࿈࿉࿊࿋࿌\u0fcd࿎࿏࿐࿑࿒࿓࿔࿕࿖࿗࿘࿙࿚", "\u0fdb\u0fdc\u0fdd\u0fde\u0fdf\u0fe0\u0fe1\u0fe2\u0fe3\u0fe4\u0fe5\u0fe6\u0fe7\u0fe8\u0fe9\u0fea\u0feb\u0fec\u0fed\u0fee\u0fef\u0ff0\u0ff1\u0ff2\u0ff3\u0ff4\u0ff5\u0ff6\u0ff7\u0ff8\u0ff9\u0ffa\u0ffb\u0ffc\u0ffd\u0ffe\u0fffါာိီုူေဲဳဴဵံ့း္်ျြွှ၊။၌၍၎၏ၖၗၘၙၞၟၠၢၣၤၧၨၩၪၫၬၭၱၲၳၴႂႃႄႅႆႇႈႉႊႋႌႍႏႚႛႜႝ႞႟\u10c6\u10c8\u10c9\u10ca\u10cb\u10cc\u10ce\u10cf჻\u1249\u124e\u124f\u1257\u1259\u125e\u125f\u1289\u128e\u128f\u12b1\u12b6\u12b7\u12bf\u12c1\u12c6"), "\u12c7\u12d7\u1311\u1316\u1317\u135b\u135c፝፞፟፠፡።፣፤፥፦፧፨\u137d\u137e\u137f᎐᎑᎒᎓᎔᎕᎖᎗᎘᎙\u139a\u139b\u139c\u139d\u139e\u139f\u13f6\u13f7\u13fe\u13ff᐀᙭᙮ ᚛᚜\u169d\u169e\u169f᛫᛬᛭\u16f9\u16fa\u16fb\u16fc\u16fd\u16fe\u16ffᜍᜒᜓ᜔᜕\u1716\u1717\u1718\u1719\u171a\u171b\u171c\u171d\u171eᜟᜲᜳ᜴᜵᜶\u1737\u1738\u1739\u173a\u173b\u173c\u173d\u173e\u173fᝒᝓ\u1754\u1755\u1756\u1757\u1758\u1759\u175a\u175b\u175c\u175d\u175e\u175f\u176d\u1771ᝲᝳ\u1774\u1775\u1776\u1777\u1778\u1779\u177a\u177b\u177c\u177d\u177e\u177f឴឵ាិីឹឺុ", "ូួើឿៀេែៃោៅំះៈ៉៊់៌៍៎៏័៑្៓។៕៖៘៙៚៛៝\u17de\u17df\u17ea\u17eb\u17ec\u17ed\u17ee\u17ef\u17fa\u17fb\u17fc\u17fd\u17fe\u17ff᠀᠁᠂᠃᠄᠅᠆᠇᠈᠉᠊᠋᠌᠍\u180e᠏\u181a\u181b\u181c\u181d\u181e\u181f\u1879\u187a\u187b\u187c\u187d\u187e\u187fᢅᢆᢩ\u18ab\u18ac\u18ad\u18ae\u18af\u18f6\u18f7\u18f8\u18f9\u18fa\u18fb\u18fc\u18fd\u18fe\u18ff\u191fᤠᤡᤢᤣᤤᤥᤦᤧᤨᤩᤪᤫ\u192c\u192d\u192e\u192fᤰᤱᤲᤳᤴᤵᤶᤷᤸ᤻᤹᤺\u193c\u193d\u193e\u193f᥀\u1941"), "\u1942\u1943᥄᥅\u196e\u196f\u1975\u1976\u1977\u1978\u1979\u197a\u197b\u197c\u197d\u197e\u197f\u19ac\u19ad\u19ae\u19af\u19ca\u19cb\u19cc\u19cd\u19ce\u19cf\u19db\u19dc\u19dd᧞᧟᧠᧡᧢᧣᧤᧥᧦᧧᧨᧩᧪᧫᧬᧭᧮᧯᧰᧱᧲᧳᧴᧵᧶᧷᧸᧹᧺᧻᧼᧽᧾᧿ᨘᨗᨙᨚᨛ\u1a1c\u1a1d᨞᨟ᩕᩖᩗᩘᩙᩚᩛᩜᩝᩞ\u1a5f᩠ᩡᩢᩣᩤᩥᩦᩧᩨᩩᩪᩫᩬᩭᩮᩯᩰᩱᩲᩳᩴ᩵᩶᩷᩸᩹᩺᩻᩼\u1a7d\u1a7e᩿\u1a8a\u1a8b\u1a8c\u1a8d\u1a8e\u1a8f\u1a9a\u1a9b\u1a9c\u1a9d\u1a9e\u1a9f", "᪠᪡᪢᪣᪤᪥᪦᪨᪩᪪᪫᪬᪭\u1aae\u1aaf᪵᪶᪷᪸᪹᪺᪽᪰᪱᪲᪳᪴᪻᪼᪾ᪿᫀ᫃᫄᫊᫁᫂᫅᫆᫇᫈᫉᫋ᫌᫍᫎ\u1acf\u1ad0\u1ad1\u1ad2\u1ad3\u1ad4\u1ad5\u1ad6\u1ad7\u1ad8\u1ad9\u1ada\u1adb\u1adc\u1add\u1ade\u1adf\u1ae0\u1ae1\u1ae2\u1ae3\u1ae4\u1ae5\u1ae6\u1ae7\u1ae8\u1ae9\u1aea\u1aeb\u1aec\u1aed\u1aee\u1aef\u1af0\u1af1\u1af2\u1af3\u1af4\u1af5\u1af6\u1af7\u1af8\u1af9\u1afa\u1afb\u1afc\u1afd\u1afe\u1affᬀᬁᬂᬃᬄ᬴ᬵᬶᬷᬸᬹᬺᬻᬼᬽᬾᬿᭀᭁᭂᭃ᭄ᭌ\u1b4d\u1b4e\u1b4f᭚᭛᭜᭝᭞᭟᭠"), "᭡᭢᭣᭤᭥᭦᭧᭨᭩᭪᭬᭫᭭᭮᭯᭰᭱᭲᭳᭴᭵᭶᭷᭸᭹᭺᭻᭼᭽᭾\u1b7fᮀᮁᮂᮡᮢᮣᮤᮥᮦᮧᮨᮩ᮪᮫ᮬᮭ᯦ᯧᯨᯩᯪᯫᯬᯭᯮᯯᯰᯱ᯲᯳\u1bf4\u1bf5\u1bf6\u1bf7\u1bf8\u1bf9\u1bfa\u1bfb᯼᯽᯾᯿ᰤᰥᰦᰧᰨᰩᰪᰫᰬᰭᰮᰯᰰᰱᰲᰳᰴᰵᰶ᰷\u1c38\u1c39\u1c3a᰻᰼᰽᰾᰿\u1c4a\u1c4b\u1c4c᱾᱿\u1c89\u1c8a\u1c8b\u1c8c\u1c8d\u1c8e\u1c8f\u1cbb\u1cbc᳀᳁᳂᳃᳄᳅᳆᳇\u1cc8\u1cc9\u1cca\u1ccb\u1ccc", "\u1ccd\u1cce\u1ccf᳐᳑᳒᳓᳔᳕᳖᳗᳘᳙᳜᳝᳞᳟᳚᳛᳠᳡᳢᳣᳤᳥᳦᳧᳨᳭᳴᳷᳸᳹\u1cfb\u1cfc\u1cfd\u1cfe\u1cff᷐᷎᷺᷂᷊᷏᷹᷽᷿᷷᷸᷀᷁᷃᷄᷅᷆᷇᷈᷉᷋᷌᷑᷒ᷓᷔᷕᷖᷗᷘᷙᷚᷛᷜᷝᷞᷟᷠᷡᷢᷣᷤᷥᷦᷧᷨᷩᷪᷫᷬᷭᷮᷯᷰᷱᷲᷳᷴ᷵᷻᷾᷶᷼᷍\u1f16\u1f17\u1f1e\u1f1f\u1f46\u1f47\u1f4e\u1f4f\u1f58\u1f5a\u1f5c\u1f5e\u1f7e\u1f7f\u1fb5᾽᾿῀῁\u1fc5῍῎῏\u1fd4\u1fd5\u1fdc"), "῝῞῟῭΅`\u1ff0\u1ff1\u1ff5´῾\u1fff\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u200b\u200c\u200d\u200e\u200f‐‑‒–—―‖‗‘’‚‛“”„‟†‡•‣․‥…‧\u2028\u2029\u202a\u202b\u202c\u202d\u202e\u202f‰‱′″‴‵‶‷‸‹›※‼‽‾‿⁀⁁⁂⁃⁄⁅⁆⁇⁈⁉⁊⁋⁌⁍⁎⁏⁐⁑⁒⁓⁔⁕⁖⁗⁘⁙⁚⁛⁜⁝⁞\u205f\u2060\u2061\u2062\u2063\u2064\u2065\u2066\u2067\u2068\u2069\u206a\u206b\u206c\u206d\u206e\u206f\u2072\u2073⁺⁻", "⁼⁽⁾₊₋₌₍₎\u208f\u209d\u209e\u209f₠₡₢₣₤₥₦₧₨₩₪₫€₭₮₯₰₱₲₳₴₵₶₷₸₹₺₻₼₽₾₿⃀\u20c1\u20c2\u20c3\u20c4\u20c5\u20c6\u20c7\u20c8\u20c9\u20ca\u20cb\u20cc\u20cd\u20ce\u20cf⃒⃓⃘⃙⃚⃐⃑⃔⃕⃖⃗⃛⃜⃝⃞⃟⃠⃡⃢⃣⃤⃥⃦⃪⃫⃨⃬⃭⃮⃯⃧⃩⃰\u20f1\u20f2\u20f3\u20f4\u20f5\u20f6\u20f7\u20f8\u20f9\u20fa\u20fb\u20fc\u20fd\u20fe\u20ff℀℁℃℄℅℆℈℉℔№℗℘℞℟℠℡™℣℥℧"), "℩℮℺℻⅀⅁⅂⅃⅄⅊⅋⅌⅍⅏↊↋\u218c\u218d\u218e\u218f←↑→↓↔↕↖↗↘↙↚↛↜↝↞↟↠↡↢↣↤↥↦↧↨↩↪↫↬↭↮↯↰↱↲↳↴↵↶↷↸↹↺↻↼↽↾↿⇀⇁⇂⇃⇄⇅⇆⇇⇈⇉⇊⇋⇌⇍⇎⇏⇐⇑⇒⇓⇔⇕⇖⇗⇘⇙⇚⇛⇜⇝⇞⇟⇠⇡⇢⇣⇤⇥⇦⇧⇨⇩⇪⇫⇬⇭⇮⇯⇰⇱⇲⇳⇴⇵⇶⇷⇸⇹⇺⇻", "⇼⇽⇾⇿∀∁∂∃∄∅∆∇∈∉∊∋∌∍∎∏∐∑−∓∔∕∖∗∘∙√∛∜∝∞∟∠∡∢∣∤∥∦∧∨∩∪∫∬∭∮∯∰∱∲∳∴∵∶∷∸∹∺∻∼∽∾∿≀≁≂≃≄≅≆≇≈≉≊≋≌≍≎≏≐≑≒≓≔≕≖≗≘≙≚≛≜≝≞≟≠≡≢≣≤≥≦≧≨≩≪≫≬≭≮≯≰≱≲≳≴≵≶≷≸≹≺≻"), "≼≽≾≿⊀⊁⊂⊃⊄⊅⊆⊇⊈⊉⊊⊋⊌⊍⊎⊏⊐⊑⊒⊓⊔⊕⊖⊗⊘⊙⊚⊛⊜⊝⊞⊟⊠⊡⊢⊣⊤⊥⊦⊧⊨⊩⊪⊫⊬⊭⊮⊯⊰⊱⊲⊳⊴⊵⊶⊷⊸⊹⊺⊻⊼⊽⊾⊿⋀⋁⋂⋃⋄⋅⋆⋇⋈⋉⋊⋋⋌⋍⋎⋏⋐⋑⋒⋓⋔⋕⋖⋗⋘⋙⋚⋛⋜⋝⋞⋟⋠⋡⋢⋣⋤⋥⋦⋧⋨⋩⋪⋫⋬⋭⋮⋯⋰⋱⋲⋳⋴⋵⋶⋷⋸⋹⋺⋻", "⋼⋽⋾⋿⌀⌁⌂⌃⌄⌅⌆⌇⌈⌉⌊⌋⌌⌍⌎⌏⌐⌑⌒⌓⌔⌕⌖⌗⌘⌙⌚⌛⌜⌝⌞⌟⌠⌡⌢⌣⌤⌥⌦⌧⌨〈〉⌫⌬⌭⌮⌯⌰⌱⌲⌳⌴⌵⌶⌷⌸⌹⌺⌻⌼⌽⌾⌿⍀⍁⍂⍃⍄⍅⍆⍇⍈⍉⍊⍋⍌⍍⍎⍏⍐⍑⍒⍓⍔⍕⍖⍗⍘⍙⍚⍛⍜⍝⍞⍟⍠⍡⍢⍣⍤⍥⍦⍧⍨⍩⍪⍫⍬⍭⍮⍯⍰⍱⍲⍳⍴⍵⍶⍷⍸⍹⍺⍻"), "⍼⍽⍾⍿⎀⎁⎂⎃⎄⎅⎆⎇⎈⎉⎊⎋⎌⎍⎎⎏⎐⎑⎒⎓⎔⎕⎖⎗⎘⎙⎚⎛⎜⎝⎞⎟⎠⎡⎢⎣⎤⎥⎦⎧⎨⎩⎪⎫⎬⎭⎮⎯⎰⎱⎲⎳⎴⎵⎶⎷⎸⎹⎺⎻⎼⎽⎾⎿⏀⏁⏂⏃⏄⏅⏆⏇⏈⏉⏊⏋⏌⏍⏎⏏⏐⏑⏒⏓⏔⏕⏖⏗⏘⏙⏚⏛⏜⏝⏞⏟⏠⏡⏢⏣⏤⏥⏦⏧⏨⏩⏪⏫⏬⏭⏮⏯⏰⏱⏲⏳⏴⏵⏶⏷⏸⏹⏺⏻", "⏼⏽⏾⏿␀␁␂␃␄␅␆␇␈␉␊␋␌␍␎␏␐␑␒␓␔␕␖␗␘␙␚␛␜␝␞␟␠␡␢␣␤␥␦\u2427\u2428\u2429\u242a\u242b\u242c\u242d\u242e\u242f\u2430\u2431\u2432\u2433\u2434\u2435\u2436\u2437\u2438\u2439\u243a\u243b\u243c\u243d\u243e\u243f⑀⑁⑂⑃⑄⑅⑆⑇⑈⑉⑊\u244b\u244c\u244d\u244e\u244f\u2450\u2451\u2452\u2453\u2454\u2455\u2456\u2457\u2458\u2459\u245a\u245b\u245c\u245d\u245e\u245f⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵ⒶⒷ"), "ⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ─━│┃┄┅┆┇┈┉┊┋┌┍┎┏┐┑┒┓└┕┖┗┘┙┚┛├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋╌╍", "╎╏═║╒╓╔╕╖╗╘╙╚╛╜╝╞╟╠╡╢╣╤╥╦╧╨╩╪╫╬╭╮╯╰╱╲╳╴╵╶╷╸╹╺╻╼╽╾╿▀▁▂▃▄▅▆▇█▉▊▋▌▍▎▏▐░▒▓▔▕▖▗▘▙▚▛▜▝▞▟■□▢▣▤▥▦▧▨▩▪▫▬▭▮▯▰▱▲△▴▵▶▷▸▹►▻▼▽▾▿◀◁◂◃◄◅◆◇◈◉◊○◌◍"), "◎●◐◑◒◓◔◕◖◗◘◙◚◛◜◝◞◟◠◡◢◣◤◥◦◧◨◩◪◫◬◭◮◯◰◱◲◳◴◵◶◷◸◹◺◻◼◽◾◿☀☁☂☃☄★☆☇☈☉☊☋☌☍☎☏☐☑☒☓☔☕☖☗☘☙☚☛☜☝☞☟☠☡☢☣☤☥☦☧☨☩☪☫☬☭☮☯☰☱☲☳☴☵☶☷☸☹☺☻☼☽☾☿♀♁♂♃♄♅♆♇♈♉♊♋♌♍", "♎♏♐♑♒♓♔♕♖♗♘♙♚♛♜♝♞♟♠♡♢♣♤♥♦♧♨♩♪♫♬♭♮♯♰♱♲♳♴♵♶♷♸♹♺♻♼♽♾♿⚀⚁⚂⚃⚄⚅⚆⚇⚈⚉⚊⚋⚌⚍⚎⚏⚐⚑⚒⚓⚔⚕⚖⚗⚘⚙⚚⚛⚜⚝⚞⚟⚠⚡⚢⚣⚤⚥⚦⚧⚨⚩⚪⚫⚬⚭⚮⚯⚰⚱⚲⚳⚴⚵⚶⚷⚸⚹⚺⚻⚼⚽⚾⚿⛀⛁⛂⛃⛄⛅⛆⛇⛈⛉⛊⛋⛌⛍"), "⛎⛏⛐⛑⛒⛓⛔⛕⛖⛗⛘⛙⛚⛛⛜⛝⛞⛟⛠⛡⛢⛣⛤⛥⛦⛧⛨⛩⛪⛫⛬⛭⛮⛯⛰⛱⛲⛳⛴⛵⛶⛷⛸⛹⛺⛻⛼⛽⛾⛿✀✁✂✃✄✅✆✇✈✉✊✋✌✍✎✏✐✑✒✓✔✕✖✗✘✙✚✛✜✝✞✟✠✡✢✣✤✥✦✧✨✩✪✫✬✭✮✯✰✱✲✳✴✵✶✷✸✹✺✻✼✽✾✿❀❁❂❃❄❅❆❇❈❉❊❋❌❍")
    pfLoadedMap_nodes = []
    pfLoadedMap_neighbors = []
    #Decompress nodes
    for pfI1 in range(len(pfDecompress[0])):
        for pfI2 in range(0, strLen(pfDecompress[0][pfI1]), 3):
            pfLoadedMap_nodes.append(vect((pfcompressionTable.strIndex(pfDecompress[0][pfI1].charAt(pfI2)) * 2 - 4096) / 10, ((pfcompressionTable.strIndex(pfDecompress[0][pfI1].charAt(pfI2 + 1))) * 2 - 4096) / 10, ((pfcompressionTable.strIndex(pfDecompress[0][pfI1].charAt(pfI2 + 2))) * 2 - 4096) / 10))
            wait()
    #Decompress neighbors
    pfdecompressionState = 0
    pfcurrentNeighbors = []
    for pfI1 in range(len(pfDecompress[1])):
        for pfI2 in range(strLen(pfDecompress[1][pfI1])):
            pfnext = pfcompressionTable.strIndex(pfDecompress[1][pfI1].charAt(pfI2))
            #Next is the neighbor.
            if pfdecompressionState == 0:
                #Current node is terminated.
                if not pfnext:
                    pfLoadedMap_neighbors.append([pfcurrentNeighbors])
                    #Reset current neighbors array
                    pfcurrentNeighbors = []
                    #Next neighbor found.
                else:
                    pfdecompressionState = 1
                    pfcurrentNeighbors.append([[pfnext - 1, []]])
                #Looking for attributes.
            elif pfdecompressionState == 1:
                #Current neighbor is terminated
                if not pfnext:
                    pfdecompressionState = 0
                    #Next attribute located
                else:
                    pfcurrentNeighbors[len(pfcurrentNeighbors) - 1] = [pfcurrentNeighbors.last()[0], pfcurrentNeighbors.last()[1].concat(pfnext - 1)]
            if not pfI2 % 20:
                wait()
        wait()
    pfcompressionTable = null
    #Unlock pathfinder
    pfIterationsThisTick = 0

