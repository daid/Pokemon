map.createObject(6, 15).setSprite("lapras_giver")--[[['1 ; person']--]]
map.createObject(9, 3).setSprite("rocket").setDirection("RIGHT").onUse(function(player) possiblyBattleSILPH_CO_4F_9_3(player, true) end)
map.createObject(10, 3).onTouch(function(player) possiblyBattleSILPH_CO_4F_9_3(player, false) end)
map.createObject(11, 3).onTouch(function(player) possiblyBattleSILPH_CO_4F_9_3(player, false) end)
map.createObject(12, 3).onTouch(function(player) possiblyBattleSILPH_CO_4F_9_3(player, false) end)
map.createObject(13, 3).onTouch(function(player) possiblyBattleSILPH_CO_4F_9_3(player, false) end)
function possiblyBattleSILPH_CO_4F_9_3(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_4F_9_3", "ROCKET", "rocket", {{29, "MACHOP"}, {29, "DROWZEE"}}, 'TEAM ROCKET has\ntaken command of\nSILPH CO.!', 'Fwahahaha!\nMy BOSS has been\nafter this place!', 'Arrgh!')
end
map.createObject(14, 11).setSprite("oak_aide").setDirection("LEFT").onUse(function(player) possiblyBattleSILPH_CO_4F_14_11(player, true) end)
map.createObject(13, 11).onTouch(function(player) possiblyBattleSILPH_CO_4F_14_11(player, false) end)
map.createObject(12, 11).onTouch(function(player) possiblyBattleSILPH_CO_4F_14_11(player, false) end)
map.createObject(11, 11).onTouch(function(player) possiblyBattleSILPH_CO_4F_14_11(player, false) end)
function possiblyBattleSILPH_CO_4F_14_11(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_4F_14_11", "SCIENTIST", "scientist", {{33, "ELECTRODE"}}, 'My POKEMON are my\nloyal soldiers!', 'The doors are\nelectronically\nlocked! A CARD\nKEY opens them!', 'Darn!\nYou weak POKEMON!')
end
map.createObject(26, 7).setSprite("rocket").setDirection("UP").onUse(function(player) possiblyBattleSILPH_CO_4F_26_7(player, true) end)
map.createObject(26, 8).onTouch(function(player) possiblyBattleSILPH_CO_4F_26_7(player, false) end)
map.createObject(26, 9).onTouch(function(player) possiblyBattleSILPH_CO_4F_26_7(player, false) end)
map.createObject(26, 10).onTouch(function(player) possiblyBattleSILPH_CO_4F_26_7(player, false) end)
map.createObject(26, 11).onTouch(function(player) possiblyBattleSILPH_CO_4F_26_7(player, false) end)
function possiblyBattleSILPH_CO_4F_26_7(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_4F_26_7", "ROCKET", "rocket", {{28, "EKANS"}, {28, "ZUBAT"}, {28, "CUBONE"}}, 'Intruder spotted!', 'I better tell the\nBOSS on 11F!', 'Who\nare you?')
end
map.createObject(3, 8).setSprite("ball").onUse(function(player) attemptToPickupObject("SILPH_CO_4F_3_8", "FULL HEAL") end)
map.createObject(4, 10).setSprite("ball").onUse(function(player) attemptToPickupObject("SILPH_CO_4F_4_10", "MAX REVIVE") end)
map.createObject(5, 9).setSprite("ball").onUse(function(player) attemptToPickupObject("SILPH_CO_4F_5_9", "ESCAPE ROPE") end)
