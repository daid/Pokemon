map.createObject(0, 2).setSprite("sailor").setDirection("DOWN").onUse(function(player) possiblyBattleSS_ANNE_10_0_2(player, true) end)
map.createObject(0, 1).onTouch(function(player) possiblyBattleSS_ANNE_10_0_2(player, false) end)
map.createObject(0, 0).onTouch(function(player) possiblyBattleSS_ANNE_10_0_2(player, false) end)
function possiblyBattleSS_ANNE_10_0_2(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_10_0_2", "SAILOR", "sailor", {{21, "SHELLDER"}}, 'You know what they\nsay about sailors\nand fighting!', 'Haha! Want to be\na sailor, mate?', 'Right!\nGood fight, mate!')
end
map.createObject(2, 4).setSprite("sailor").setDirection("DOWN").onUse(function(player) possiblyBattleSS_ANNE_10_2_4(player, true) end)
map.createObject(2, 3).onTouch(function(player) possiblyBattleSS_ANNE_10_2_4(player, false) end)
map.createObject(2, 2).onTouch(function(player) possiblyBattleSS_ANNE_10_2_4(player, false) end)
map.createObject(2, 1).onTouch(function(player) possiblyBattleSS_ANNE_10_2_4(player, false) end)
function possiblyBattleSS_ANNE_10_2_4(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_10_2_4", "SAILOR", "sailor", {{17, "HORSEA"}, {17, "SHELLDER"}, {17, "TENTACOOL"}}, "My sailor's pride\nis at stake!", 'Did you see the\nFISHING GURU in\nVERMILION CITY?', 'Your\nspirit sank me!')
end
map.createObject(12, 12).setSprite("sailor").setDirection("LEFT").onUse(function(player) possiblyBattleSS_ANNE_10_12_12(player, true) end)
map.createObject(11, 12).onTouch(function(player) possiblyBattleSS_ANNE_10_12_12(player, false) end)
map.createObject(10, 12).onTouch(function(player) possiblyBattleSS_ANNE_10_12_12(player, false) end)
function possiblyBattleSS_ANNE_10_12_12(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_10_12_12", "SAILOR", "sailor", {{18, "TENTACOOL"}, {18, "STARYU"}}, 'Us sailors have\nPOKEMON too!', 'We caught all our\nPOKEMON while\nout at sea!', "OK, \nyou're not bad.")
end
map.createObject(22, 13).setSprite("sailor").setDirection("DOWN").onUse(function(player) possiblyBattleSS_ANNE_10_22_13(player, true) end)
map.createObject(22, 12).onTouch(function(player) possiblyBattleSS_ANNE_10_22_13(player, false) end)
map.createObject(22, 11).onTouch(function(player) possiblyBattleSS_ANNE_10_22_13(player, false) end)
function possiblyBattleSS_ANNE_10_22_13(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_10_22_13", "SAILOR", "sailor", {{17, "HORSEA"}, {17, "HORSEA"}, {17, "HORSEA"}}, 'I like feisty\nkids like you!@@', "Sea POKEMON live\nin deep water.\nYou'll need a ROD!", 'Argh!\nLost it!')
end
map.createObject(0, 13).setSprite("sailor").setDirection("RIGHT").onUse(function(player) possiblyBattleSS_ANNE_10_0_13(player, true) end)
map.createObject(1, 13).onTouch(function(player) possiblyBattleSS_ANNE_10_0_13(player, false) end)
map.createObject(2, 13).onTouch(function(player) possiblyBattleSS_ANNE_10_0_13(player, false) end)
function possiblyBattleSS_ANNE_10_0_13(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_10_0_13", "SAILOR", "sailor", {{20, "MACHOP"}}, "Matey, you're\nwalking the plank\nif you lose!", 'Jellyfish some-\ntimes drift into\nthe ship.', 'Argh!\nBeaten by a kid!')
end
map.createObject(0, 11).setSprite("fisher2").setDirection("RIGHT").onUse(function(player) possiblyBattleSS_ANNE_10_0_11(player, true) end)
map.createObject(1, 11).onTouch(function(player) possiblyBattleSS_ANNE_10_0_11(player, false) end)
map.createObject(2, 11).onTouch(function(player) possiblyBattleSS_ANNE_10_0_11(player, false) end)
map.createObject(3, 11).onTouch(function(player) possiblyBattleSS_ANNE_10_0_11(player, false) end)
function possiblyBattleSS_ANNE_10_0_11(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_10_0_11", "FISHER", "fisher", {{17, "TENTACOOL"}, {17, "STARYU"}, {17, "SHELLDER"}}, 'Hello stranger!\nStop and chat!', 'I was going to\nmake you my\nassistant too!', 'Darn!\nI let that one\nget away!')
end
map.createObject(10, 2).setSprite("black_hair_boy_2").setDirection("RIGHT")--[[['7 ; person']--]]
map.createObject(11, 3).setSprite("slowbro")--[[['8 ; person']--]]
map.createObject(20, 13).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SS_ANNE_10_20_13", "ETHER") end)
map.createObject(10, 13).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SS_ANNE_10_10_13", "TM 44") end)
map.createObject(12, 4).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SS_ANNE_10_12_4", "MAX POTION") end)
