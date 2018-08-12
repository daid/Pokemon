map.createObject(5, 3).setSprite("boulder")--[[['1 ; person']--]]
map.createObject(3, 2).setSprite("boulder")--[[['2 ; person']--]]
map.createObject(8, 3).setSprite("boulder")--[[['3 ; person']--]]
map.createObject(9, 3).setSprite("boulder")--[[['4 ; person']--]]
map.createObject(18, 11).setSprite("boulder")--[[['5 ; person']--]]
map.createObject(19, 11).setSprite("boulder")--[[['6 ; person']--]]
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {29, 17}, 0.0392157).type("LAND").mode("RED").add(51, 31, "SLOWPOKE").add(51, 31, "SEEL").add(39, 33, "SLOWPOKE").add(25, 33, "SEEL").add(25, 29, "HORSEA").add(25, 31, "SHELLDER").add(13, 31, "HORSEA").add(13, 29, "SHELLDER").add(11, 39, "SEADRA").add(3, 37, "DEWGONG")
map.setWildPokemon({0, 0}, {29, 17}, 0.0392157).type("LAND").mode("BLUE").add(51, 31, "PSYDUCK").add(51, 31, "SEEL").add(39, 33, "PSYDUCK").add(25, 33, "SEEL").add(25, 29, "KRABBY").add(25, 31, "STARYU").add(13, 31, "KRABBY").add(13, 29, "STARYU").add(11, 39, "KINGLER").add(3, 37, "DEWGONG")
