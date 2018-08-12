map.createObject(4, 11).setSprite("brunette_girl").setDirection("DOWN")--[[NO HEADER: .onUse(function(player)
    checkForTrainerBattle(player, true, "CERULEAN_GYM_4_11", "MISTY", "misty", {{18, "STARYU"}, {21, "STARMIE"}}, '?', '?', '?')
end)--]]
map.createObject(2, 10).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleCERULEAN_GYM_2_10(player, true) end)
map.createObject(3, 10).onTouch(function(player) possiblyBattleCERULEAN_GYM_2_10(player, false) end)
map.createObject(4, 10).onTouch(function(player) possiblyBattleCERULEAN_GYM_2_10(player, false) end)
map.createObject(5, 10).onTouch(function(player) possiblyBattleCERULEAN_GYM_2_10(player, false) end)
function possiblyBattleCERULEAN_GYM_2_10(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "CERULEAN_GYM_2_10", "JR.TRAINER#FEMALE", "jr.trainerf", {{19, "GOLDEEN"}}, "I'm more than good\nenough for you!", 'You have to face\nother trainers to\nfind out how good\nyou really are.', 'You\noverwhelmed me!')
end
map.createObject(8, 6).setSprite("swimmer").setDirection("LEFT").onUse(function(player) possiblyBattleCERULEAN_GYM_8_6(player, true) end)
map.createObject(7, 6).onTouch(function(player) possiblyBattleCERULEAN_GYM_8_6(player, false) end)
map.createObject(6, 6).onTouch(function(player) possiblyBattleCERULEAN_GYM_8_6(player, false) end)
map.createObject(5, 6).onTouch(function(player) possiblyBattleCERULEAN_GYM_8_6(player, false) end)
function possiblyBattleCERULEAN_GYM_8_6(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "CERULEAN_GYM_8_6", "SWIMMER", "swimmer", {{16, "HORSEA"}, {16, "SHELLDER"}}, 'Splash!', 'MISTY is going to\nkeep improving!', "That\ncan't be!")
end
map.createObject(7, 3).setSprite("gym_helper").setDirection("DOWN")--[[['4 ; person']--]]
