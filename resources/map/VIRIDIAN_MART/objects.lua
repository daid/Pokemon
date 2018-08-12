map.createObject(0, 2).setSprite("mart_guy").setDirection("RIGHT")
map.createObject(1, 2).onUse(function(player) shopkeeper(player, {"POKE BALL", "ANTIDOTE", "PARLYZ HEAL", "BURN HEAL"}) end)
map.createObject(5, 2).setSprite("bug_catcher")--[[.enableWander()--]]--[[['2 ; person']--]]
map.createObject(3, 4).setSprite("black_hair_boy_1")--[[['3 ; person']--]]
