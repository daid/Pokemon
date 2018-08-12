map.createObject(9, 15).setSprite("ball")--[[['1', 'VOLTORB', '40']--]]
map.createObject(32, 17).setSprite("ball")--[[['2', 'VOLTORB', '40']--]]
map.createObject(21, 10).setSprite("ball")--[[['3', 'VOLTORB', '40']--]]
map.createObject(25, 17).setSprite("ball")--[[['4', 'ELECTRODE', '43']--]]
map.createObject(23, 1).setSprite("ball")--[[['5', 'VOLTORB', '40']--]]
map.createObject(26, 7).setSprite("ball")--[[['6', 'VOLTORB', '40']--]]
map.createObject(21, 21).setSprite("ball")--[[['7', 'ELECTRODE', '43']--]]
map.createObject(37, 3).setSprite("ball")--[[['8', 'VOLTORB', '40']--]]
map.createObject(4, 26).setSprite("bird").setDirection("UP")--[[['9', 'ZAPDOS', '50']--]]
map.createObject(7, 10).setSprite("ball").onUse(function(player) attemptToPickupObject("POWER_PLANT_7_10", "CARBOS") end)
map.createObject(28, 32).setSprite("ball").onUse(function(player) attemptToPickupObject("POWER_PLANT_28_32", "HP UP") end)
map.createObject(34, 32).setSprite("ball").onUse(function(player) attemptToPickupObject("POWER_PLANT_34_32", "RARE CANDY") end)
map.createObject(26, 3).setSprite("ball").onUse(function(player) attemptToPickupObject("POWER_PLANT_26_3", "TM 25") end)
map.createObject(20, 3).setSprite("ball").onUse(function(player) attemptToPickupObject("POWER_PLANT_20_3", "TM 33") end)
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {39, 35}, 0.0392157).type("LAND").mode("RED").add(51, 21, "VOLTORB").add(51, 21, "MAGNEMITE").add(39, 20, "PIKACHU").add(25, 24, "PIKACHU").add(25, 23, "MAGNEMITE").add(25, 23, "VOLTORB").add(13, 32, "MAGNETON").add(13, 35, "MAGNETON").add(11, 33, "ELECTABUZZ").add(3, 36, "ELECTABUZZ")
map.setWildPokemon({0, 0}, {39, 35}, 0.0392157).type("LAND").mode("BLUE").add(51, 21, "VOLTORB").add(51, 21, "MAGNEMITE").add(39, 20, "PIKACHU").add(25, 24, "PIKACHU").add(25, 23, "MAGNEMITE").add(25, 23, "VOLTORB").add(13, 32, "MAGNETON").add(13, 35, "MAGNETON").add(11, 33, "RAICHU").add(3, 36, "RAICHU")
--[[Leftover trainer headers:
{'post_battle': 'Bzzzt!', 'pre_battle': 'Bzzzt!', 'view_range': 0, 'done_battle': 'Bzzzt!'}
{'post_battle': 'Bzzzt!', 'pre_battle': 'Bzzzt!', 'view_range': 0, 'done_battle': 'Bzzzt!'}
{'post_battle': 'Bzzzt!', 'pre_battle': 'Bzzzt!', 'view_range': 0, 'done_battle': 'Bzzzt!'}
{'post_battle': 'Bzzzt!', 'pre_battle': 'Bzzzt!', 'view_range': 0, 'done_battle': 'Bzzzt!'}
{'post_battle': 'Bzzzt!', 'pre_battle': 'Bzzzt!', 'view_range': 0, 'done_battle': 'Bzzzt!'}
{'post_battle': 'Bzzzt!', 'pre_battle': 'Bzzzt!', 'view_range': 0, 'done_battle': 'Bzzzt!'}
{'post_battle': 'Bzzzt!', 'pre_battle': 'Bzzzt!', 'view_range': 0, 'done_battle': 'Bzzzt!'}
{'post_battle': 'Bzzzt!', 'pre_battle': 'Bzzzt!', 'view_range': 0, 'done_battle': 'Bzzzt!'}
{'post_battle': 'Gyaoo!@@', 'pre_battle': 'Gyaoo!@@', 'view_range': 0, 'done_battle': 'Gyaoo!@@'}
--]]
