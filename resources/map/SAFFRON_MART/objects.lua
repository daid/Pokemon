map.createObject(0, 2).setSprite("mart_guy").setDirection("RIGHT")--[[['1 ; person']--]]
map.createObject(1, 2).onUse(function(player) shopkeeper(player, {"GREAT BALL", "HYPER POTION", "MAX REPEL", "ESCAPE ROPE", "FULL HEAL", "REVIVE"}) end)
map.createObject(4, 5).setSprite("black_hair_boy_2")--[[['2 ; person']--]]
map.createObject(6, 2).setSprite("lass")--[[.enableWander()--]]--[[['3 ; person']--]]
