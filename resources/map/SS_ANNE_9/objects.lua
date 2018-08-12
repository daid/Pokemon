map.createObject(10, 13).setSprite("gentleman").setDirection("RIGHT").onUse(function(player) possiblyBattleSS_ANNE_9_10_13(player, true) end)
map.createObject(11, 13).onTouch(function(player) possiblyBattleSS_ANNE_9_10_13(player, false) end)
map.createObject(12, 13).onTouch(function(player) possiblyBattleSS_ANNE_9_10_13(player, false) end)
function possiblyBattleSS_ANNE_9_10_13(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_9_10_13", "GENTLEMAN", "gentleman", {{23, "PIKACHU"}}, 'Competing against\nthe young keeps\nme youthful.', '15 years ago, I\nwould have won!', 'Good\nfight! Ah, I feel\nyoung again!')
end
map.createObject(13, 11).setSprite("fisher2").setDirection("LEFT").onUse(function(player) possiblyBattleSS_ANNE_9_13_11(player, true) end)
map.createObject(12, 11).onTouch(function(player) possiblyBattleSS_ANNE_9_13_11(player, false) end)
map.createObject(11, 11).onTouch(function(player) possiblyBattleSS_ANNE_9_13_11(player, false) end)
map.createObject(10, 11).onTouch(function(player) possiblyBattleSS_ANNE_9_13_11(player, false) end)
function possiblyBattleSS_ANNE_9_13_11(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_9_13_11", "FISHER", "fisher", {{17, "GOLDEEN"}, {17, "TENTACOOL"}, {17, "GOLDEEN"}}, 'Check out what I\nfished up!', 'Party?', "I'm\nall out!")
end
map.createObject(0, 1).setSprite("gentleman").setDirection("RIGHT").onUse(function(player) possiblyBattleSS_ANNE_9_0_1(player, true) end)
map.createObject(1, 1).onTouch(function(player) possiblyBattleSS_ANNE_9_0_1(player, false) end)
map.createObject(2, 1).onTouch(function(player) possiblyBattleSS_ANNE_9_0_1(player, false) end)
map.createObject(3, 1).onTouch(function(player) possiblyBattleSS_ANNE_9_0_1(player, false) end)
function possiblyBattleSS_ANNE_9_0_1(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_9_0_1", "GENTLEMAN", "gentleman", {{17, "GROWLITHE"}, {17, "PONYTA"}}, 'Which do you like,\na strong or a\nrare POKEMON?', 'I prefer strong\nand rare POKEMON.', 'I must\nsalute you!')
end
map.createObject(2, 4).setSprite("lass").setDirection("DOWN").onUse(function(player) possiblyBattleSS_ANNE_9_2_4(player, true) end)
map.createObject(2, 3).onTouch(function(player) possiblyBattleSS_ANNE_9_2_4(player, false) end)
map.createObject(2, 2).onTouch(function(player) possiblyBattleSS_ANNE_9_2_4(player, false) end)
function possiblyBattleSS_ANNE_9_2_4(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_9_2_4", "LASS", "lass", {{18, "RATTATA"}, {18, "PIKACHU"}}, 'I never saw you\nat the party.', 'Oh, I adore your\nstrong POKEMON!', 'Take\nit easy!')
end
map.createObject(1, 13).setSprite("gentleman").setDirection("DOWN")--[[['5 ; person']--]]
map.createObject(12, 14).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SS_ANNE_9_12_14", "MAX ETHER") end)
map.createObject(21, 13).setSprite("gentleman").setDirection("DOWN")--[[['7 ; person']--]]
map.createObject(22, 14).setSprite("old_person").setDirection("DOWN")--[[['8 ; person']--]]
map.createObject(0, 3).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SS_ANNE_9_0_3", "RARE CANDY") end)
map.createObject(12, 3).setSprite("gentleman").setDirection("DOWN")--[[['10 ; person']--]]
map.createObject(11, 1).setSprite("young_boy")--[[['11 ; person']--]]
map.createObject(22, 3).setSprite("brunette_girl").setDirection("LEFT")--[[['12 ; person']--]]
map.createObject(20, 3).setSprite("foulard_woman").setDirection("RIGHT")--[[['13 ; person']--]]
