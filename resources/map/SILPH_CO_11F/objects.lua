map.createObject(7, 12).setSprite("mr_masterball").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(10, 12).setSprite("foulard_woman").setDirection("DOWN")--[[['2 ; person']--]]
map.createObject(6, 8).setSprite("giovanni").setDirection("DOWN")--[[NO HEADER: .onUse(function(player)
    checkForTrainerBattle(player, true, "SILPH_CO_11F_6_8", "GIOVANNI", "giovanni", {{37, "NIDORINO"}, {35, "KANGASKHAN"}, {37, "RHYHORN"}, {41, "NIDOQUEEN"}}, '?', '?', '?')
end)--]]
map.createObject(3, 1).setSprite("rocket").setDirection("UP").onUse(function(player) possiblyBattleSILPH_CO_11F_3_1(player, true) end)
map.createObject(3, 2).onTouch(function(player) possiblyBattleSILPH_CO_11F_3_1(player, false) end)
map.createObject(3, 3).onTouch(function(player) possiblyBattleSILPH_CO_11F_3_1(player, false) end)
map.createObject(3, 4).onTouch(function(player) possiblyBattleSILPH_CO_11F_3_1(player, false) end)
map.createObject(3, 5).onTouch(function(player) possiblyBattleSILPH_CO_11F_3_1(player, false) end)
function possiblyBattleSILPH_CO_11F_3_1(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_11F_3_1", "ROCKET", "rocket", {{32, "CUBONE"}, {32, "DROWZEE"}, {32, "MAROWAK"}}, "Stop right there!\nDon't you move!", 'So, you want to\nsee my BOSS?', "Don't...\nPlease!")
end
map.createObject(15, 8).setSprite("rocket").setDirection("UP").onUse(function(player) possiblyBattleSILPH_CO_11F_15_8(player, true) end)
map.createObject(15, 9).onTouch(function(player) possiblyBattleSILPH_CO_11F_15_8(player, false) end)
map.createObject(15, 10).onTouch(function(player) possiblyBattleSILPH_CO_11F_15_8(player, false) end)
map.createObject(15, 11).onTouch(function(player) possiblyBattleSILPH_CO_11F_15_8(player, false) end)
function possiblyBattleSILPH_CO_11F_15_8(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_11F_15_8", "ROCKET", "rocket", {{25, "RATTATA"}, {25, "RATTATA"}, {25, "ZUBAT"}, {25, "RATTATA"}, {25, "EKANS"}}, 'Halt! Do you have\nan appointment\nwith my BOSS?', 'Watch your step,\nmy BOSS likes his\nPOKEMON tough!', 'Gaah!\nDemolished!')
end
