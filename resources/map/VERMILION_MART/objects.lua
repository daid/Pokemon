map.createObject(0, 2).setSprite("mart_guy").setDirection("RIGHT")--[[['1 ; person']--]]
map.createObject(1, 2).onUse(function(player) shopkeeper(player, {"POKE BALL", "SUPER POTION", "ICE HEAL", "AWAKENING", "PARLYZ HEAL", "REPEL"}) end)
map.createObject(5, 1).setSprite("black_hair_boy_1")--[[['2 ; person']--]]
map.createObject(3, 4).setSprite("lass")--[[.enableWander()--]]--[[['3 ; person']--]]
