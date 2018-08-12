map.createObject(0, 2).setSprite("mart_guy").setDirection("RIGHT")--[[['1 ; person']--]]
map.createObject(1, 2).onUse(function(player) shopkeeper(player, {"GREAT BALL", "SUPER POTION", "REVIVE", "ESCAPE ROPE", "SUPER REPEL", "ANTIDOTE", "BURN HEAL", "ICE HEAL", "PARLYZ HEAL"}) end)
map.createObject(3, 3).setSprite("balding_guy")--[[['2 ; person']--]]
map.createObject(7, 5).setSprite("black_hair_boy_1")--[[['3 ; person']--]]
