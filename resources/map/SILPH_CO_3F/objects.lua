map.createObject(24, 9).setSprite("lapras_giver")--[[['1 ; person']--]]
map.createObject(20, 10).setSprite("rocket").setDirection("LEFT").onUse(function(player) possiblyBattleSILPH_CO_3F_20_10(player, true) end)
map.createObject(19, 10).onTouch(function(player) possiblyBattleSILPH_CO_3F_20_10(player, false) end)
map.createObject(18, 10).onTouch(function(player) possiblyBattleSILPH_CO_3F_20_10(player, false) end)
function possiblyBattleSILPH_CO_3F_20_10(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_3F_20_10", "ROCKET", "rocket", {{28, "RATICATE"}, {28, "HYPNO"}, {28, "RATICATE"}}, 'Quit messing with\nus, kid!', 'A hint? You can\nopen doors with a\nCARD KEY!', 'I give\nup!')
end
map.createObject(7, 8).setSprite("oak_aide").setDirection("DOWN").onUse(function(player) possiblyBattleSILPH_CO_3F_7_8(player, true) end)
map.createObject(7, 7).onTouch(function(player) possiblyBattleSILPH_CO_3F_7_8(player, false) end)
map.createObject(7, 6).onTouch(function(player) possiblyBattleSILPH_CO_3F_7_8(player, false) end)
map.createObject(7, 5).onTouch(function(player) possiblyBattleSILPH_CO_3F_7_8(player, false) end)
function possiblyBattleSILPH_CO_3F_7_8(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_3F_7_8", "SCIENTIST", "scientist", {{29, "ELECTRODE"}, {29, "WEEZING"}}, 'I support TEAM\nROCKET more than\nI support SILPH!', 'Humph...', 'You\nreally got me!')
end
map.createObject(8, 12).setSprite("ball").onUse(function(player) attemptToPickupObject("SILPH_CO_3F_8_12", "HYPER POTION") end)
