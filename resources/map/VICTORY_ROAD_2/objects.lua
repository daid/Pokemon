map.createObject(12, 8).setSprite("hiker").setDirection("LEFT").onUse(function(player) possiblyBattleVICTORY_ROAD_2_12_8(player, true) end)
map.createObject(11, 8).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_12_8(player, false) end)
map.createObject(10, 8).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_12_8(player, false) end)
map.createObject(9, 8).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_12_8(player, false) end)
map.createObject(8, 8).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_12_8(player, false) end)
function possiblyBattleVICTORY_ROAD_2_12_8(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_2_12_8", "BLACKBELT", "blackbelt", {{43, "MACHOKE"}, {43, "MACHOP"}, {43, "MACHOKE"}}, 'VICTORY ROAD is\nthe final test\nfor trainers!', 'If you get stuck,\ntry moving some\nboulders around!', 'Aiyah!')
end
map.createObject(21, 4).setSprite("black_hair_boy_2").setDirection("LEFT").onUse(function(player) possiblyBattleVICTORY_ROAD_2_21_4(player, true) end)
map.createObject(20, 4).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_21_4(player, false) end)
map.createObject(19, 4).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_21_4(player, false) end)
map.createObject(18, 4).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_21_4(player, false) end)
function possiblyBattleVICTORY_ROAD_2_21_4(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_2_21_4", "JUGGLER", "juggler", {{41, "DROWZEE"}, {41, "HYPNO"}, {41, "KADABRA"}, {41, "KADABRA"}}, 'Ah, so you wish\nto challenge the\nELITE FOUR?', '<RIVAL> also came\nthrough here!', 'You\ngot me!')
end
map.createObject(19, 9).setSprite("black_hair_boy_1").setDirection("DOWN").onUse(function(player) possiblyBattleVICTORY_ROAD_2_19_9(player, true) end)
map.createObject(19, 8).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_19_9(player, false) end)
map.createObject(19, 7).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_19_9(player, false) end)
map.createObject(19, 6).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_19_9(player, false) end)
function possiblyBattleVICTORY_ROAD_2_19_9(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_2_19_9", "TAMER", "tamer", {{44, "PERSIAN"}, {44, "GOLDUCK"}}, "Come on!\nI'll whip you!", 'You earned the\nright to be on\nVICTORY ROAD!', 'I got\nwhipped!')
end
map.createObject(4, 15).setSprite("black_hair_boy_2").setDirection("DOWN").onUse(function(player) possiblyBattleVICTORY_ROAD_2_4_15(player, true) end)
map.createObject(4, 14).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_4_15(player, false) end)
function possiblyBattleVICTORY_ROAD_2_4_15(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_2_4_15", "POKEMANIAC", "pokemaniac", {{40, "CHARMELEON"}, {40, "LAPRAS"}, {40, "LICKITUNG"}}, 'If you can get\nthrough here, you\ncan go meet the\nELITE FOUR!', 'I can beat you\nwhen it comes to\nknowledge about\nPOKEMON!', 'No!\nUnbelievable!')
end
map.createObject(26, 14).setSprite("black_hair_boy_2").setDirection("LEFT").onUse(function(player) possiblyBattleVICTORY_ROAD_2_26_14(player, true) end)
map.createObject(25, 14).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_26_14(player, false) end)
map.createObject(24, 14).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_26_14(player, false) end)
map.createObject(23, 14).onTouch(function(player) possiblyBattleVICTORY_ROAD_2_26_14(player, false) end)
function possiblyBattleVICTORY_ROAD_2_26_14(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VICTORY_ROAD_2_26_14", "JUGGLER", "juggler", {{48, "MR_MIME"}}, 'Is VICTORY ROAD\ntoo tough?', 'Many trainers give\nup the challenge\nhere.', 'Well\ndone!')
end
map.createObject(11, 12).setSprite("bird").setDirection("UP")--[[['6', 'MOLTRES', '50']--]]
map.createObject(27, 12).setSprite("ball").onUse(function(player) attemptToPickupObject("VICTORY_ROAD_2_27_12", "TM 17") end)
map.createObject(18, 8).setSprite("ball").onUse(function(player) attemptToPickupObject("VICTORY_ROAD_2_18_8", "FULL HEAL") end)
map.createObject(9, 6).setSprite("ball").onUse(function(player) attemptToPickupObject("VICTORY_ROAD_2_9_6", "TM 05") end)
map.createObject(11, 17).setSprite("ball").onUse(function(player) attemptToPickupObject("VICTORY_ROAD_2_11_17", "GUARD SPEC") end)
map.createObject(4, 3).setSprite("boulder")--[[['11 ; person']--]]
map.createObject(5, 12).setSprite("boulder")--[[['12 ; person']--]]
map.createObject(23, 1).setSprite("boulder")--[[['13 ; person']--]]
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {29, 17}, 0.0392157).type("LAND").add(51, 22, "MACHOP").add(51, 24, "GEODUDE").add(39, 26, "ZUBAT").add(25, 36, "ONIX").add(25, 39, "ONIX").add(25, 42, "ONIX").add(13, 41, "MACHOKE").add(13, 40, "GOLBAT").add(11, 40, "MAROWAK").add(3, 43, "GRAVELER")
--[[Leftover trainer headers:
{'post_battle': 'Gyaoo!@@', 'pre_battle': 'Gyaoo!@@', 'view_range': 0, 'done_battle': 'Gyaoo!@@'}
--]]
