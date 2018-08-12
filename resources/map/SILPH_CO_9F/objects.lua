map.createObject(3, 3).setSprite("nurse").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(2, 13).setSprite("rocket").setDirection("UP").onUse(function(player) possiblyBattleSILPH_CO_9F_2_13(player, true) end)
map.createObject(2, 14).onTouch(function(player) possiblyBattleSILPH_CO_9F_2_13(player, false) end)
map.createObject(2, 15).onTouch(function(player) possiblyBattleSILPH_CO_9F_2_13(player, false) end)
map.createObject(2, 16).onTouch(function(player) possiblyBattleSILPH_CO_9F_2_13(player, false) end)
map.createObject(2, 17).onTouch(function(player) possiblyBattleSILPH_CO_9F_2_13(player, false) end)
function possiblyBattleSILPH_CO_9F_2_13(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_9F_2_13", "ROCKET", "rocket", {{28, "DROWZEE"}, {28, "GRIMER"}, {28, "MACHOP"}}, 'Your POKEMON seem\nto adore you, kid!', 'If I had started\nas a trainer at\nyour age...', 'Ghaaah!')
end
map.createObject(21, 4).setSprite("oak_aide").setDirection("DOWN").onUse(function(player) possiblyBattleSILPH_CO_9F_21_4(player, true) end)
map.createObject(21, 3).onTouch(function(player) possiblyBattleSILPH_CO_9F_21_4(player, false) end)
map.createObject(21, 2).onTouch(function(player) possiblyBattleSILPH_CO_9F_21_4(player, false) end)
function possiblyBattleSILPH_CO_9F_21_4(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_9F_21_4", "SCIENTIST", "scientist", {{28, "VOLTORB"}, {28, "KOFFING"}, {28, "MAGNETON"}}, 'Your POKEMON have\nweak points! I\ncan nail them!', 'Exploiting weak\nspots does work!\nThink about\nelement types!', 'You\nhammered me!')
end
map.createObject(13, 1).setSprite("rocket").setDirection("UP").onUse(function(player) possiblyBattleSILPH_CO_9F_13_1(player, true) end)
map.createObject(13, 2).onTouch(function(player) possiblyBattleSILPH_CO_9F_13_1(player, false) end)
map.createObject(13, 3).onTouch(function(player) possiblyBattleSILPH_CO_9F_13_1(player, false) end)
map.createObject(13, 4).onTouch(function(player) possiblyBattleSILPH_CO_9F_13_1(player, false) end)
map.createObject(13, 5).onTouch(function(player) possiblyBattleSILPH_CO_9F_13_1(player, false) end)
function possiblyBattleSILPH_CO_9F_13_1(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_9F_13_1", "ROCKET", "rocket", {{28, "GOLBAT"}, {28, "DROWZEE"}, {28, "HYPNO"}}, 'I am one of the 4\nROCKET BROTHERS!', 'My brothers will\navenge me!', 'Warg!\nBrothers, I lost!')
end
