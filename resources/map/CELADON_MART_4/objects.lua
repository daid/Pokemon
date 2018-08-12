map.createObject(5, 0).setSprite("mart_guy")--[[['1 ; person']--]]
map.createObject(5, 1).onUse(function(player) shopkeeper(player, {"POKE DOLL", "FIRE STONE", "THUNDER STONE", "WATER STONE", "LEAF STONE"}) end)
map.createObject(15, 2).setSprite("black_hair_boy_2")--[[.enableWander()--]]--[[['2 ; person']--]]
map.createObject(5, 5).setSprite("bug_catcher")--[[.enableWander()--]]--[[['3 ; person']--]]
