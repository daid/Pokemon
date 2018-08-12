map.createObject(4, 12).setSprite("black_hair_boy_2").setDirection("DOWN")--[[NO HEADER: .onUse(function(player)
    checkForTrainerBattle(player, true, "PEWTER_GYM_4_12", "BROCK", "brock", {{12, "GEODUDE"}, {14, "ONIX"}}, '?', '?', '?')
end)--]]
map.createObject(3, 7).setSprite("black_hair_boy_1").setDirection("RIGHT").onUse(function(player) possiblyBattlePEWTER_GYM_3_7(player, true) end)
map.createObject(4, 7).onTouch(function(player) possiblyBattlePEWTER_GYM_3_7(player, false) end)
map.createObject(5, 7).onTouch(function(player) possiblyBattlePEWTER_GYM_3_7(player, false) end)
map.createObject(6, 7).onTouch(function(player) possiblyBattlePEWTER_GYM_3_7(player, false) end)
map.createObject(7, 7).onTouch(function(player) possiblyBattlePEWTER_GYM_3_7(player, false) end)
map.createObject(8, 7).onTouch(function(player) possiblyBattlePEWTER_GYM_3_7(player, false) end)
function possiblyBattlePEWTER_GYM_3_7(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "PEWTER_GYM_3_7", "JR.TRAINER#MALE", "jr.trainerm", {{11, "DIGLETT"}, {11, "SANDSHREW"}}, 'Stop right there,\nkid!', "You're pretty hot,\nbut not as hot\nas BROCK!", 'Darn!')
end
map.createObject(7, 3).setSprite("gym_helper").setDirection("DOWN")--[[['3 ; person']--]]
