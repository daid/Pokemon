map.createObject(21, 15).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SAFARI_ZONE_EAST_21_15", "FULL RESTORE") end)
map.createObject(3, 18).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SAFARI_ZONE_EAST_3_18", "MAX POTION") end)
map.createObject(20, 12).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SAFARI_ZONE_EAST_20_12", "CARBOS") end)
map.createObject(15, 13).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "SAFARI_ZONE_EAST_15_13", "TM 37") end)
map.setWildPokemon({0, 0}, {29, 25}, 0.117647).type("LAND").mode("RED").add(51, 24, "NIDORAN_M").add(51, 26, "DODUO").add(39, 22, "PARAS").add(25, 25, "EXEGGCUTE").add(25, 33, "NIDORINO").add(25, 23, "EXEGGCUTE").add(13, 24, "NIDORAN_F").add(13, 25, "PARASECT").add(11, 25, "KANGASKHAN").add(3, 28, "SCYTHER")
map.setWildPokemon({0, 0}, {29, 25}, 0.117647).type("LAND").mode("BLUE").add(51, 24, "NIDORAN_F").add(51, 26, "DODUO").add(39, 22, "PARAS").add(25, 25, "EXEGGCUTE").add(25, 33, "NIDORINA").add(25, 23, "EXEGGCUTE").add(13, 24, "NIDORAN_M").add(13, 25, "PARASECT").add(11, 25, "KANGASKHAN").add(3, 28, "PINSIR")
