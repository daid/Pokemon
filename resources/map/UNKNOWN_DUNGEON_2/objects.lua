map.createObject(29, 8).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "UNKNOWN_DUNGEON_2_29_8", "PP UP") end)
map.createObject(4, 2).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "UNKNOWN_DUNGEON_2_4_2", "ULTRA BALL") end)
map.createObject(13, 11).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "UNKNOWN_DUNGEON_2_13_11", "FULL RESTORE") end)
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {29, 17}, 0.0588235).type("LAND").add(51, 51, "DODRIO").add(51, 51, "VENOMOTH").add(39, 51, "KADABRA").add(25, 52, "RHYDON").add(25, 52, "MAROWAK").add(25, 52, "ELECTRODE").add(13, 56, "CHANSEY").add(13, 54, "WIGGLYTUFF").add(11, 55, "DITTO").add(3, 60, "DITTO")
