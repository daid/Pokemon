map.createObject(5, 16).setSprite("rocker").setDirection("DOWN")--[[NO HEADER: .onUse(function(player)
    checkForTrainerBattle(player, true, "VERMILION_GYM_5_16", "LT.SURGE", "lt.surge", {{21, "VOLTORB"}, {18, "PIKACHU"}, {24, "RAICHU"}}, '?', '?', '?')
end)--]]
map.createObject(9, 11).setSprite("gentleman").setDirection("LEFT").onUse(function(player) possiblyBattleVERMILION_GYM_9_11(player, true) end)
map.createObject(8, 11).onTouch(function(player) possiblyBattleVERMILION_GYM_9_11(player, false) end)
map.createObject(7, 11).onTouch(function(player) possiblyBattleVERMILION_GYM_9_11(player, false) end)
map.createObject(6, 11).onTouch(function(player) possiblyBattleVERMILION_GYM_9_11(player, false) end)
function possiblyBattleVERMILION_GYM_9_11(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VERMILION_GYM_9_11", "GENTLEMAN", "gentleman", {{23, "PIKACHU"}}, 'When I was in the\nArmy, LT.SURGE\nwas my strict CO!', "The door won't\nopen?", "Stop!\nYou're very good!")
end
map.createObject(3, 9).setSprite("black_hair_boy_2").setDirection("LEFT").onUse(function(player) possiblyBattleVERMILION_GYM_3_9(player, true) end)
map.createObject(2, 9).onTouch(function(player) possiblyBattleVERMILION_GYM_3_9(player, false) end)
map.createObject(1, 9).onTouch(function(player) possiblyBattleVERMILION_GYM_3_9(player, false) end)
function possiblyBattleVERMILION_GYM_3_9(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VERMILION_GYM_3_9", "ROCKER", "rocker", {{20, "VOLTORB"}, {20, "MAGNEMITE"}, {20, "VOLTORB"}}, "I'm a lightweight,\nbut I'm good with\nelectricity!", "OK, I'll talk!", 'Fried!')
end
map.createObject(0, 7).setSprite("sailor").setDirection("RIGHT").onUse(function(player) possiblyBattleVERMILION_GYM_0_7(player, true) end)
map.createObject(1, 7).onTouch(function(player) possiblyBattleVERMILION_GYM_0_7(player, false) end)
map.createObject(2, 7).onTouch(function(player) possiblyBattleVERMILION_GYM_0_7(player, false) end)
map.createObject(3, 7).onTouch(function(player) possiblyBattleVERMILION_GYM_0_7(player, false) end)
function possiblyBattleVERMILION_GYM_0_7(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VERMILION_GYM_0_7", "SAILOR", "sailor", {{21, "PIKACHU"}, {21, "PIKACHU"}}, 'This is no place\nfor kids!', "LT.SURGE set up\ndouble locks!\nHere's a hint!", 'Wow!\nSurprised me!')
end
map.createObject(4, 3).setSprite("gym_helper").setDirection("DOWN")--[[['5 ; person']--]]
