map.createObject(10, 11).setSprite("lapras_giver")--[[['1 ; person']--]]
map.createObject(20, 11).setSprite("lapras_giver")--[[['2 ; person']--]]
map.createObject(21, 11).setSprite("erika").setDirection("DOWN")--[[['3 ; person']--]]
map.createObject(11, 7).setSprite("erika").setDirection("RIGHT")--[[['4 ; person']--]]
map.createObject(18, 4).setSprite("lapras_giver").setDirection("UP")--[[['5 ; person']--]]
map.createObject(17, 14).setSprite("rocket").setDirection("RIGHT").onUse(function(player) possiblyBattleSILPH_CO_6F_17_14(player, true) end)
map.createObject(18, 14).onTouch(function(player) possiblyBattleSILPH_CO_6F_17_14(player, false) end)
map.createObject(19, 14).onTouch(function(player) possiblyBattleSILPH_CO_6F_17_14(player, false) end)
function possiblyBattleSILPH_CO_6F_17_14(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_6F_17_14", "ROCKET", "rocket", {{29, "MACHOP"}, {29, "MACHOKE"}}, 'I am one of the 4\nROCKET BROTHERS!', 'No matter!\nMy brothers will\navenge me!', 'Flame\nout!')
end
map.createObject(7, 9).setSprite("oak_aide").setDirection("DOWN").onUse(function(player) possiblyBattleSILPH_CO_6F_7_9(player, true) end)
map.createObject(7, 8).onTouch(function(player) possiblyBattleSILPH_CO_6F_7_9(player, false) end)
map.createObject(7, 7).onTouch(function(player) possiblyBattleSILPH_CO_6F_7_9(player, false) end)
map.createObject(7, 6).onTouch(function(player) possiblyBattleSILPH_CO_6F_7_9(player, false) end)
function possiblyBattleSILPH_CO_6F_7_9(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_6F_7_9", "SCIENTIST", "scientist", {{25, "VOLTORB"}, {25, "KOFFING"}, {25, "MAGNETON"}, {25, "MAGNEMITE"}, {25, "KOFFING"}}, 'That rotten\nPRESIDENT!', "TIKSI BRANCH?\nIt's in Russian\nno man's land!", 'Shoot!')
end
map.createObject(14, 2).setSprite("rocket").setDirection("LEFT").onUse(function(player) possiblyBattleSILPH_CO_6F_14_2(player, true) end)
map.createObject(13, 2).onTouch(function(player) possiblyBattleSILPH_CO_6F_14_2(player, false) end)
map.createObject(12, 2).onTouch(function(player) possiblyBattleSILPH_CO_6F_14_2(player, false) end)
function possiblyBattleSILPH_CO_6F_14_2(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_6F_14_2", "ROCKET", "rocket", {{28, "ZUBAT"}, {28, "ZUBAT"}, {28, "GOLBAT"}}, 'You dare betray\nTEAM ROCKET?', 'If you stand for\njustice, you\nbetray evil!', 'You\ntraitor!')
end
map.createObject(3, 5).setSprite("ball").onUse(function(player) attemptToPickupObject("SILPH_CO_6F_3_5", "HP UP") end)
map.createObject(2, 2).setSprite("ball").onUse(function(player) attemptToPickupObject("SILPH_CO_6F_2_2", "X ACCURACY") end)
