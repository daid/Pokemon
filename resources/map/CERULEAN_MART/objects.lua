map.createObject(0, 2).setSprite("mart_guy").setDirection("RIGHT")--[[['1 ; person']--]]
map.createObject(1, 2).onUse(function(player) shopkeeper(player, {"POKE_BALL", "POTION", "REPEL", "ANTIDOTE", "BURN_HEAL", "AWAKENING", "PARLYZ_HEAL"}) end)
map.createObject(3, 3).setSprite("black_hair_boy_1")--[[.enableWander()--]]--[[['2 ; person']--]]
map.createObject(6, 5).setSprite("lass")--[[.enableWander()--]]--[[['3 ; person']--]]
