map.createObject(27, 4).setSprite("slowbro").setDirection("DOWN")--[[['1', 'MEWTWO', '70']--]]
map.createObject(16, 8).setSprite("ball").onUse(function(player) attemptToPickupObject("UNKNOWN_DUNGEON_3_16_8", "ULTRA BALL") end)
map.createObject(18, 16).setSprite("ball").onUse(function(player) attemptToPickupObject("UNKNOWN_DUNGEON_3_18_16", "MAX REVIVE") end)
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {29, 17}, 0.0980392).type("LAND").mode("RED").add(51, 55, "RHYDON").add(51, 55, "MAROWAK").add(39, 55, "ELECTRODE").add(25, 64, "CHANSEY").add(25, 64, "PARASECT").add(25, 64, "RAICHU").add(13, 57, "ARBOK").add(13, 65, "DITTO").add(11, 63, "DITTO").add(3, 67, "DITTO")
map.setWildPokemon({0, 0}, {29, 17}, 0.0980392).type("LAND").mode("BLUE").add(51, 55, "RHYDON").add(51, 55, "MAROWAK").add(39, 55, "ELECTRODE").add(25, 64, "CHANSEY").add(25, 64, "PARASECT").add(25, 64, "RAICHU").add(13, 57, "SANDSLASH").add(13, 65, "DITTO").add(11, 63, "DITTO").add(3, 67, "DITTO")
--[[Leftover trainer headers:
{'post_battle': 'Mew!@@', 'pre_battle': 'Mew!@@', 'view_range': 0, 'done_battle': 'Mew!@@'}
--]]
