map.createObject(5, 7).setSprite("medium").setDirection("RIGHT").onUse(function(player) possiblyBattlePOKEMONTOWER_4_5_7(player, true) end)
map.createObject(6, 7).onTouch(function(player) possiblyBattlePOKEMONTOWER_4_5_7(player, false) end)
map.createObject(7, 7).onTouch(function(player) possiblyBattlePOKEMONTOWER_4_5_7(player, false) end)
function possiblyBattlePOKEMONTOWER_4_5_7(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "POKEMONTOWER_4_5_7", "CHANNELER", "channeler", {{24, "GASTLY"}}, 'GHOST! No!\nKwaaah!', 'I must have been\ndreaming...', 'Where\nis the GHOST?')
end
map.createObject(15, 10).setSprite("medium").setDirection("DOWN").onUse(function(player) possiblyBattlePOKEMONTOWER_4_15_10(player, true) end)
map.createObject(15, 9).onTouch(function(player) possiblyBattlePOKEMONTOWER_4_15_10(player, false) end)
map.createObject(15, 8).onTouch(function(player) possiblyBattlePOKEMONTOWER_4_15_10(player, false) end)
function possiblyBattlePOKEMONTOWER_4_15_10(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "POKEMONTOWER_4_15_10", "CHANNELER", "channeler", {{23, "GASTLY"}, {23, "GASTLY"}}, 'Be cursed with\nme! Kwaaah!', "We can't crack\nthe identity of\nthe GHOSTs.", 'What!')
end
map.createObject(14, 5).setSprite("medium").setDirection("LEFT").onUse(function(player) possiblyBattlePOKEMONTOWER_4_14_5(player, true) end)
map.createObject(13, 5).onTouch(function(player) possiblyBattlePOKEMONTOWER_4_14_5(player, false) end)
map.createObject(12, 5).onTouch(function(player) possiblyBattlePOKEMONTOWER_4_14_5(player, false) end)
function possiblyBattlePOKEMONTOWER_4_14_5(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "POKEMONTOWER_4_14_5", "CHANNELER", "channeler", {{22, "GASTLY"}}, 'Huhuhu...\nBeat me not!', 'May the departed\nsouls of POKEMON\nrest in peace...', 'Huh?\nWho? What?')
end
map.createObject(12, 7).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "POKEMONTOWER_4_12_7", "ELIXER") end)
map.createObject(9, 7).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "POKEMONTOWER_4_9_7", "AWAKENING") end)
map.createObject(12, 1).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "POKEMONTOWER_4_12_1", "HP UP") end)
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {19, 17}, 0.0392157).type("LAND").add(51, 20, "GASTLY").add(51, 21, "GASTLY").add(39, 22, "GASTLY").add(25, 23, "GASTLY").add(25, 19, "GASTLY").add(25, 18, "GASTLY").add(13, 25, "HAUNTER").add(13, 20, "CUBONE").add(11, 22, "CUBONE").add(3, 24, "GASTLY")