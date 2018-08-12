map.createObject(4, 2).setSprite("boulder")--[[['1 ; person']--]]
map.createObject(5, 2).setSprite("boulder")--[[['2 ; person']--]]
map.createObject(6, 16).setSprite("bird").setDirection("DOWN")--[[['3', 'ARTICUNO', '50']--]]
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {29, 17}, 0.0392157).type("LAND").mode("RED").add(51, 31, "HORSEA").add(51, 31, "SHELLDER").add(39, 33, "HORSEA").add(25, 33, "SHELLDER").add(25, 29, "SLOWPOKE").add(25, 31, "SEEL").add(13, 31, "SLOWPOKE").add(13, 29, "SEEL").add(11, 39, "SLOWBRO").add(3, 32, "GOLBAT")
map.setWildPokemon({0, 0}, {29, 17}, 0.0392157).type("LAND").mode("BLUE").add(51, 31, "KRABBY").add(51, 31, "STARYU").add(39, 33, "KRABBY").add(25, 33, "STARYU").add(25, 29, "PSYDUCK").add(25, 31, "SEEL").add(13, 31, "PSYDUCK").add(13, 29, "SEEL").add(11, 39, "GOLDUCK").add(3, 32, "GOLBAT")
--[[Leftover trainer headers:
{'post_battle': 'Gyaoo!@@', 'pre_battle': 'Gyaoo!@@', 'view_range': 0, 'done_battle': 'Gyaoo!@@'}
--]]
