map.createObject(4, 7).setSprite("blackbelt").setDirection("DOWN")--[[NO HEADER: .onUse(function(player)
    checkForTrainerBattle(player, true, "FUCHSIA_GYM_4_7", "KOGA", "koga", {{37, "KOFFING"}, {39, "MUK"}, {37, "KOFFING"}, {43, "WEEZING"}}, '?', '?', '?')
end)--]]
map.createObject(8, 4).setSprite("rocker").setDirection("DOWN").onUse(function(player) possiblyBattleFUCHSIA_GYM_8_4(player, true) end)
map.createObject(8, 3).onTouch(function(player) possiblyBattleFUCHSIA_GYM_8_4(player, false) end)
map.createObject(8, 2).onTouch(function(player) possiblyBattleFUCHSIA_GYM_8_4(player, false) end)
function possiblyBattleFUCHSIA_GYM_8_4(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "FUCHSIA_GYM_8_4", "JUGGLER", "juggler", {{38, "HYPNO"}}, "Strength isn't\nthe key for\nPOKEMON!", 'So, you mix brawn\nwith brains?\nGood strategy!', 'What?\nExtraordinary!')
end
map.createObject(7, 9).setSprite("rocker").setDirection("RIGHT").onUse(function(player) possiblyBattleFUCHSIA_GYM_7_9(player, true) end)
map.createObject(8, 9).onTouch(function(player) possiblyBattleFUCHSIA_GYM_7_9(player, false) end)
map.createObject(9, 9).onTouch(function(player) possiblyBattleFUCHSIA_GYM_7_9(player, false) end)
function possiblyBattleFUCHSIA_GYM_7_9(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "FUCHSIA_GYM_7_9", "JUGGLER", "juggler", {{31, "DROWZEE"}, {31, "DROWZEE"}, {31, "KADABRA"}, {31, "DROWZEE"}}, 'I wanted to become\na ninja, so I\njoined this GYM!', 'I will keep on\ntraining under\nKOGA, my ninja\nmaster!', "I'm done\nfor!")
end
map.createObject(1, 5).setSprite("rocker").setDirection("DOWN").onUse(function(player) possiblyBattleFUCHSIA_GYM_1_5(player, true) end)
map.createObject(1, 4).onTouch(function(player) possiblyBattleFUCHSIA_GYM_1_5(player, false) end)
map.createObject(1, 3).onTouch(function(player) possiblyBattleFUCHSIA_GYM_1_5(player, false) end)
map.createObject(1, 2).onTouch(function(player) possiblyBattleFUCHSIA_GYM_1_5(player, false) end)
map.createObject(1, 1).onTouch(function(player) possiblyBattleFUCHSIA_GYM_1_5(player, false) end)
function possiblyBattleFUCHSIA_GYM_1_5(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "FUCHSIA_GYM_1_5", "JUGGLER", "juggler", {{34, "DROWZEE"}, {34, "KADABRA"}}, "Let's see you\nbeat my special\ntechniques!", 'I like poison and\nsleep techniques,\nas they linger\nafter battle!', 'You\nhad me fooled!')
end
map.createObject(3, 12).setSprite("rocker").setDirection("UP").onUse(function(player) possiblyBattleFUCHSIA_GYM_3_12(player, true) end)
map.createObject(3, 13).onTouch(function(player) possiblyBattleFUCHSIA_GYM_3_12(player, false) end)
map.createObject(3, 14).onTouch(function(player) possiblyBattleFUCHSIA_GYM_3_12(player, false) end)
function possiblyBattleFUCHSIA_GYM_3_12(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "FUCHSIA_GYM_3_12", "TAMER", "tamer", {{34, "SANDSLASH"}, {34, "ARBOK"}}, 'Stop right there!', "You impressed me!\nHere's a hint!", "Whoa!\nHe's got it!")
end
map.createObject(8, 15).setSprite("rocker").setDirection("DOWN").onUse(function(player) possiblyBattleFUCHSIA_GYM_8_15(player, true) end)
map.createObject(8, 14).onTouch(function(player) possiblyBattleFUCHSIA_GYM_8_15(player, false) end)
map.createObject(8, 13).onTouch(function(player) possiblyBattleFUCHSIA_GYM_8_15(player, false) end)
function possiblyBattleFUCHSIA_GYM_8_15(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "FUCHSIA_GYM_8_15", "TAMER", "tamer", {{33, "ARBOK"}, {33, "SANDSLASH"}, {33, "ARBOK"}}, 'I also study the\nway of the ninja\nwith master KOGA!', 'I still have much\nto learn!', 'Awoo!')
end
map.createObject(2, 10).setSprite("rocker").setDirection("LEFT").onUse(function(player) possiblyBattleFUCHSIA_GYM_2_10(player, true) end)
map.createObject(1, 10).onTouch(function(player) possiblyBattleFUCHSIA_GYM_2_10(player, false) end)
map.createObject(0, 10).onTouch(function(player) possiblyBattleFUCHSIA_GYM_2_10(player, false) end)
function possiblyBattleFUCHSIA_GYM_2_10(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "FUCHSIA_GYM_2_10", "JUGGLER", "juggler", {{34, "DROWZEE"}, {34, "HYPNO"}}, 'Master KOGA comes\nfrom a long line\nof ninjas!', 'Where there is\nlight, there is\nshadow!', 'Dropped\nmy balls!')
end
map.createObject(7, 2).setSprite("gym_helper").setDirection("DOWN")--[[['8 ; person']--]]
