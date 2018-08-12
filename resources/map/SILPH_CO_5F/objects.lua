map.createObject(13, 8).setSprite("lapras_giver")--[[['1 ; person']--]]
map.createObject(8, 1).setSprite("rocket").setDirection("RIGHT").onUse(function(player) possiblyBattleSILPH_CO_5F_8_1(player, true) end)
map.createObject(9, 1).onTouch(function(player) possiblyBattleSILPH_CO_5F_8_1(player, false) end)
function possiblyBattleSILPH_CO_5F_8_1(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_5F_8_1", "ROCKET", "rocket", {{33, "ARBOK"}}, 'I heard a kid was\nwandering around.', "It's not smart\nto pick a fight\nwith TEAM ROCKET!", 'Boom!')
end
map.createObject(8, 14).setSprite("oak_aide").setDirection("RIGHT").onUse(function(player) possiblyBattleSILPH_CO_5F_8_14(player, true) end)
map.createObject(9, 14).onTouch(function(player) possiblyBattleSILPH_CO_5F_8_14(player, false) end)
map.createObject(10, 14).onTouch(function(player) possiblyBattleSILPH_CO_5F_8_14(player, false) end)
function possiblyBattleSILPH_CO_5F_8_14(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_5F_8_14", "SCIENTIST", "scientist", {{26, "MAGNETON"}, {26, "KOFFING"}, {26, "WEEZING"}, {26, "MAGNEMITE"}}, 'We study POKE\nBALL technology\non this floor!', 'We worked on the\nultimate POKE\nBALL which would\ncatch anything!', 'Dang!\nBlast it!')
end
map.createObject(18, 7).setSprite("rocker").setDirection("UP").onUse(function(player) possiblyBattleSILPH_CO_5F_18_7(player, true) end)
map.createObject(18, 8).onTouch(function(player) possiblyBattleSILPH_CO_5F_18_7(player, false) end)
map.createObject(18, 9).onTouch(function(player) possiblyBattleSILPH_CO_5F_18_7(player, false) end)
map.createObject(18, 10).onTouch(function(player) possiblyBattleSILPH_CO_5F_18_7(player, false) end)
map.createObject(18, 11).onTouch(function(player) possiblyBattleSILPH_CO_5F_18_7(player, false) end)
function possiblyBattleSILPH_CO_5F_18_7(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_5F_18_7", "JUGGLER", "juggler", {{29, "KADABRA"}, {29, "MR_MIME"}}, "Whaaat? There\nshouldn't be any\nchildren here?", "You're only on 5F.\nIt's a long way\nto my BOSS!", 'Oh\ngoodness!')
end
map.createObject(28, 13).setSprite("rocket").setDirection("UP").onUse(function(player) possiblyBattleSILPH_CO_5F_28_13(player, true) end)
map.createObject(28, 14).onTouch(function(player) possiblyBattleSILPH_CO_5F_28_13(player, false) end)
map.createObject(28, 15).onTouch(function(player) possiblyBattleSILPH_CO_5F_28_13(player, false) end)
map.createObject(28, 16).onTouch(function(player) possiblyBattleSILPH_CO_5F_28_13(player, false) end)
function possiblyBattleSILPH_CO_5F_28_13(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_5F_28_13", "ROCKET", "rocket", {{33, "HYPNO"}}, 'Show TEAM ROCKET\na little respect!', 'Which reminds me.', 'Cough...\nCough...')
end
map.createObject(2, 4).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SILPH_CO_5F_2_4", "TM 09") end)
map.createObject(4, 11).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SILPH_CO_5F_4_11", "PROTEIN") end)
map.createObject(21, 1).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SILPH_CO_5F_21_1", "CARD KEY") end)
map.createObject(22, 5).setSprite("clipboard")--[[['9 ; person']--]]
map.createObject(25, 7).setSprite("clipboard")--[[['10 ; person']--]]
map.createObject(24, 11).setSprite("clipboard")--[[['11 ; person']--]]
