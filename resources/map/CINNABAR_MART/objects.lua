map.createObject(0, 2).setSprite("mart_guy").setDirection("RIGHT")--[[['1 ; person']--]]
map.createObject(1, 2).onUse(function(player) shopkeeper(player, {"ULTRA BALL", "GREAT BALL", "HYPER POTION", "MAX REPEL", "ESCAPE ROPE", "FULL HEAL", "REVIVE"}) end)
map.createObject(6, 5).setSprite("erika")--[[['2 ; person']--]]
map.createObject(3, 3).setSprite("oak_aide")--[[['3 ; person']--]]
