map.createObject(12, 9).setSprite("medium")--[[['1 ; person']--]]
map.createObject(17, 10).setSprite("medium").setDirection("LEFT").onUse(function(player) possiblyBattlePOKEMONTOWER_5_17_10(player, true) end)
map.createObject(16, 10).onTouch(function(player) possiblyBattlePOKEMONTOWER_5_17_10(player, false) end)
map.createObject(15, 10).onTouch(function(player) possiblyBattlePOKEMONTOWER_5_17_10(player, false) end)
function possiblyBattlePOKEMONTOWER_5_17_10(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "POKEMONTOWER_5_17_10", "CHANNELER", "channeler", {{23, "HAUNTER"}}, 'Give...me...\nyour...soul...', 'I was under\npossession!', 'Gasp!')
end
map.createObject(14, 14).setSprite("medium").setDirection("LEFT").onUse(function(player) possiblyBattlePOKEMONTOWER_5_14_14(player, true) end)
map.createObject(13, 14).onTouch(function(player) possiblyBattlePOKEMONTOWER_5_14_14(player, false) end)
map.createObject(12, 14).onTouch(function(player) possiblyBattlePOKEMONTOWER_5_14_14(player, false) end)
map.createObject(11, 14).onTouch(function(player) possiblyBattlePOKEMONTOWER_5_14_14(player, false) end)
function possiblyBattlePOKEMONTOWER_5_14_14(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "POKEMONTOWER_5_14_14", "CHANNELER", "channeler", {{22, "GASTLY"}}, 'You...shall...\njoin...us...', 'I was possessed!', 'What\na nightmare!')
end
map.createObject(6, 7).setSprite("medium").setDirection("RIGHT").onUse(function(player) possiblyBattlePOKEMONTOWER_5_6_7(player, true) end)
map.createObject(7, 7).onTouch(function(player) possiblyBattlePOKEMONTOWER_5_6_7(player, false) end)
map.createObject(8, 7).onTouch(function(player) possiblyBattlePOKEMONTOWER_5_6_7(player, false) end)
function possiblyBattlePOKEMONTOWER_5_6_7(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "POKEMONTOWER_5_6_7", "CHANNELER", "channeler", {{24, "GASTLY"}}, 'Zombies!', 'I regained my\nsenses!', 'Ha?')
end
map.createObject(9, 1).setSprite("medium").setDirection("RIGHT").onUse(function(player) possiblyBattlePOKEMONTOWER_5_9_1(player, true) end)
map.createObject(10, 1).onTouch(function(player) possiblyBattlePOKEMONTOWER_5_9_1(player, false) end)
map.createObject(11, 1).onTouch(function(player) possiblyBattlePOKEMONTOWER_5_9_1(player, false) end)
function possiblyBattlePOKEMONTOWER_5_9_1(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "POKEMONTOWER_5_9_1", "CHANNELER", "channeler", {{22, "HAUNTER"}}, 'Urgah...\nUrff....', 'I fell to evil\nspirits despite\nmy training!', 'Whoo!')
end
map.createObject(6, 3).setSprite("ball").onUse(function(player) attemptToPickupObject("POKEMONTOWER_5_6_3", "NUGGET") end)
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {19, 17}, 0.0392157).type("LAND").add(51, 20, "GASTLY").add(51, 21, "GASTLY").add(39, 22, "GASTLY").add(25, 23, "GASTLY").add(25, 19, "GASTLY").add(25, 18, "GASTLY").add(13, 25, "HAUNTER").add(13, 20, "CUBONE").add(11, 22, "CUBONE").add(3, 24, "GASTLY")
