map.createObject(7, 12).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleVICTORY_ROAD_1_7_12(player, true) end)
map.createObject(8, 12).onTouch(function(player) possiblyBattleVICTORY_ROAD_1_7_12(player, false) end)
map.createObject(9, 12).onTouch(function(player) possiblyBattleVICTORY_ROAD_1_7_12(player, false) end)
function possiblyBattleVICTORY_ROAD_1_7_12(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_1_7_12", "COOLTRAINER#FEMALE", "cooltrainerf", {{44, "PERSIAN"}, {44, "NINETALES"}}, 'I wonder if you\nare good enough\nfor me!', 'I never wanted to\nlose to anybody!', 'I\nlost out!')
end
map.createObject(3, 15).setSprite("black_hair_boy_1").setDirection("DOWN").onUse(function(player) possiblyBattleVICTORY_ROAD_1_3_15(player, true) end)
map.createObject(3, 14).onTouch(function(player) possiblyBattleVICTORY_ROAD_1_3_15(player, false) end)
map.createObject(3, 13).onTouch(function(player) possiblyBattleVICTORY_ROAD_1_3_15(player, false) end)
function possiblyBattleVICTORY_ROAD_1_3_15(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_1_3_15", "COOLTRAINER#MALE", "cooltrainerm", {{42, "IVYSAUR"}, {42, "WARTORTLE"}, {42, "CHARMELEON"}, {42, "CHARIZARD"}}, "I can see you're\ngood! Let me see\nexactly how good!", "I concede, you're\nbetter than me!", 'I\nhad a chance...')
end
map.createObject(11, 17).setSprite("ball").onUse(function(player) attemptToPickupObject("VICTORY_ROAD_1_11_17", "TM 43") end)
map.createObject(9, 15).setSprite("ball").onUse(function(player) attemptToPickupObject("VICTORY_ROAD_1_9_15", "RARE CANDY") end)
map.createObject(5, 2).setSprite("boulder")--[[['5 ; person']--]]
map.createObject(14, 15).setSprite("boulder")--[[['6 ; person']--]]
map.createObject(2, 7).setSprite("boulder")--[[['7 ; person']--]]
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {19, 17}, 0.0588235).type("LAND").add(51, 24, "MACHOP").add(51, 26, "GEODUDE").add(39, 22, "ZUBAT").add(25, 36, "ONIX").add(25, 39, "ONIX").add(25, 42, "ONIX").add(13, 41, "GRAVELER").add(13, 41, "GOLBAT").add(11, 42, "MACHOKE").add(3, 43, "MAROWAK")
