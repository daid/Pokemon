map.createObject(28, 12).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleVICTORY_ROAD_3_28_12(player, true) end)
map.createObject(27, 12).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_28_12(player, false) end)
function possiblyBattleVICTORY_ROAD_3_28_12(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_3_28_12", "COOLTRAINER#MALE", "cooltrainerm", {{43, "EXEGGUTOR"}, {43, "CLOYSTER"}, {43, "ARCANINE"}}, 'I heard rumors of\na child prodigy!', 'You beat GIOVANNI\nof TEAM ROCKET?', 'The\nrumors were true!')
end
map.createObject(7, 4).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleVICTORY_ROAD_3_7_4(player, true) end)
map.createObject(8, 4).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_7_4(player, false) end)
map.createObject(9, 4).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_7_4(player, false) end)
map.createObject(10, 4).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_7_4(player, false) end)
map.createObject(11, 4).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_7_4(player, false) end)
function possiblyBattleVICTORY_ROAD_3_7_4(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_3_7_4", "COOLTRAINER#FEMALE", "cooltrainerf", {{43, "BELLSPROUT"}, {43, "WEEPINBELL"}, {43, "VICTREEBEL"}}, "I'll show you just\nhow good you are!", 'You showed me just\nhow good I was!', "I'm\nfurious!")
end
map.createObject(6, 3).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleVICTORY_ROAD_3_6_3(player, true) end)
map.createObject(5, 3).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_6_3(player, false) end)
map.createObject(4, 3).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_6_3(player, false) end)
map.createObject(3, 3).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_6_3(player, false) end)
map.createObject(2, 3).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_6_3(player, false) end)
function possiblyBattleVICTORY_ROAD_3_6_3(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_3_6_3", "COOLTRAINER#MALE", "cooltrainerm", {{43, "KINGLER"}, {43, "TENTACRUEL"}, {43, "BLASTOISE"}}, 'Only the chosen\ncan pass here!', 'All trainers here\nare headed to the\nPOKEMON LEAGUE!\nBe careful!', "I\ndon't believe it!")
end
map.createObject(13, 14).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleVICTORY_ROAD_3_13_14(player, true) end)
map.createObject(14, 14).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_13_14(player, false) end)
map.createObject(15, 14).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_13_14(player, false) end)
map.createObject(16, 14).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_13_14(player, false) end)
map.createObject(17, 14).onTouch(function(player) possiblyBattleVICTORY_ROAD_3_13_14(player, false) end)
function possiblyBattleVICTORY_ROAD_3_13_14(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_3_13_14", "COOLTRAINER#FEMALE", "cooltrainerf", {{43, "PARASECT"}, {43, "DEWGONG"}, {43, "CHANSEY"}}, 'Trainers live to\nseek stronger\nopponents!', 'By fighting tough\nbattles, you get\nstronger!', 'Oh!\nSo strong!')
end
map.createObject(26, 12).setSprite("ball").onUse(function(player) attemptToPickupObject("VICTORY_ROAD_3_26_12", "MAX REVIVE") end)
map.createObject(7, 10).setSprite("ball").onUse(function(player) attemptToPickupObject("VICTORY_ROAD_3_7_10", "TM 47") end)
map.createObject(22, 14).setSprite("boulder")--[[['7 ; person']--]]
map.createObject(13, 5).setSprite("boulder")--[[['8 ; person']--]]
map.createObject(24, 7).setSprite("boulder")--[[['9 ; person']--]]
map.createObject(22, 2).setSprite("boulder")--[[['10 ; person']--]]
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {29, 17}, 0.0588235).type("LAND").add(51, 24, "MACHOP").add(51, 26, "GEODUDE").add(39, 22, "ZUBAT").add(25, 42, "ONIX").add(25, 40, "VENOMOTH").add(25, 45, "ONIX").add(13, 43, "GRAVELER").add(13, 41, "GOLBAT").add(11, 42, "MACHOKE").add(3, 45, "MACHOKE")
