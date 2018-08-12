map.createObject(1, 8).setSprite("rocket").setDirection("RIGHT").onUse(function(player) possiblyBattleSILPH_CO_10F_1_8(player, true) end)
map.createObject(2, 8).onTouch(function(player) possiblyBattleSILPH_CO_10F_1_8(player, false) end)
map.createObject(3, 8).onTouch(function(player) possiblyBattleSILPH_CO_10F_1_8(player, false) end)
map.createObject(4, 8).onTouch(function(player) possiblyBattleSILPH_CO_10F_1_8(player, false) end)
function possiblyBattleSILPH_CO_10F_1_8(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_10F_1_8", "ROCKET", "rocket", {{33, "MACHOKE"}}, 'Welcome to the\n10F! So good of\nyou to join me!', 'Nice try, but the\nboardroom is up\none more floor!', "I'm\nstunned!")
end
map.createObject(10, 15).setSprite("oak_aide").setDirection("LEFT").onUse(function(player) possiblyBattleSILPH_CO_10F_10_15(player, true) end)
map.createObject(9, 15).onTouch(function(player) possiblyBattleSILPH_CO_10F_10_15(player, false) end)
map.createObject(8, 15).onTouch(function(player) possiblyBattleSILPH_CO_10F_10_15(player, false) end)
map.createObject(7, 15).onTouch(function(player) possiblyBattleSILPH_CO_10F_10_15(player, false) end)
map.createObject(6, 15).onTouch(function(player) possiblyBattleSILPH_CO_10F_10_15(player, false) end)
function possiblyBattleSILPH_CO_10F_10_15(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_10F_10_15", "SCIENTIST", "scientist", {{29, "MAGNEMITE"}, {29, "KOFFING"}}, 'Enough of your\nsilly games!', 'Are you satisfied\nwith beating me?\nThen go on home!', 'No\ncontinues left!')
end
map.createObject(9, 2).setSprite("erika")--[[.enableWander()--]]--[[['3 ; person']--]]
map.createObject(2, 5).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SILPH_CO_10F_2_5", "TM 26") end)
map.createObject(4, 3).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SILPH_CO_10F_4_3", "RARE CANDY") end)
map.createObject(5, 6).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SILPH_CO_10F_5_6", "CARBOS") end)
