map.createObject(9, 6).setSprite("rocket").setDirection("RIGHT").onUse(function(player) possiblyBattlePOKEMONTOWER_7_9_6(player, true) end)
map.createObject(10, 6).onTouch(function(player) possiblyBattlePOKEMONTOWER_7_9_6(player, false) end)
map.createObject(11, 6).onTouch(function(player) possiblyBattlePOKEMONTOWER_7_9_6(player, false) end)
map.createObject(12, 6).onTouch(function(player) possiblyBattlePOKEMONTOWER_7_9_6(player, false) end)
function possiblyBattlePOKEMONTOWER_7_9_6(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "POKEMONTOWER_7_9_6", "ROCKET", "rocket", {{25, "ZUBAT"}, {25, "ZUBAT"}, {25, "GOLBAT"}}, 'What do you want?\nWhy are you here?', "I'm not going to\nforget this!", 'I give up!')
end
map.createObject(12, 8).setSprite("rocket").setDirection("LEFT").onUse(function(player) possiblyBattlePOKEMONTOWER_7_12_8(player, true) end)
map.createObject(11, 8).onTouch(function(player) possiblyBattlePOKEMONTOWER_7_12_8(player, false) end)
map.createObject(10, 8).onTouch(function(player) possiblyBattlePOKEMONTOWER_7_12_8(player, false) end)
map.createObject(9, 8).onTouch(function(player) possiblyBattlePOKEMONTOWER_7_12_8(player, false) end)
function possiblyBattlePOKEMONTOWER_7_12_8(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "POKEMONTOWER_7_12_8", "ROCKET", "rocket", {{26, "KOFFING"}, {26, "DROWZEE"}}, 'This old guy came\nand complained\nabout us harming\nuseless POKEMON!', 'POKEMON are only\ngood for making\nmoney!', 'Please!\nNo more!')
end
map.createObject(9, 10).setSprite("rocket").setDirection("RIGHT").onUse(function(player) possiblyBattlePOKEMONTOWER_7_9_10(player, true) end)
map.createObject(10, 10).onTouch(function(player) possiblyBattlePOKEMONTOWER_7_9_10(player, false) end)
map.createObject(11, 10).onTouch(function(player) possiblyBattlePOKEMONTOWER_7_9_10(player, false) end)
map.createObject(12, 10).onTouch(function(player) possiblyBattlePOKEMONTOWER_7_9_10(player, false) end)
function possiblyBattlePOKEMONTOWER_7_9_10(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "POKEMONTOWER_7_9_10", "ROCKET", "rocket", {{23, "ZUBAT"}, {23, "RATTATA"}, {23, "RATICATE"}, {23, "ZUBAT"}}, "You're not saving\nanyone, kid!", "You're not getting\naway with this!", "Don't\nfight us ROCKETs!")
end
map.createObject(10, 14).setSprite("mr_fuji").setDirection("DOWN")--[[['4 ; person']--]]
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {19, 17}, 0.0588235).type("LAND").add(51, 21, "GASTLY").add(51, 22, "GASTLY").add(39, 23, "GASTLY").add(25, 24, "GASTLY").add(25, 20, "GASTLY").add(25, 28, "HAUNTER").add(13, 22, "CUBONE").add(13, 24, "CUBONE").add(11, 28, "HAUNTER").add(3, 30, "HAUNTER")
