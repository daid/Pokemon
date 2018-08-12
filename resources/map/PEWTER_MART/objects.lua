map.createObject(0, 2).setSprite("mart_guy").setDirection("RIGHT")--[[['1 ; person']--]]
map.createObject(1, 2).onUse(function(player) shopkeeper(player, {"POKE BALL", "POTION", "ESCAPE ROPE", "ANTIDOTE", "BURN HEAL", "AWAKENING", "PARLYZ HEAL"}) end)
map.createObject(3, 4).setSprite("bug_catcher")--[[.enableWander()--]]--[[['2 ; person']--]]
map.createObject(5, 2).setSprite("black_hair_boy_2")--[[['3 ; person']--]]
