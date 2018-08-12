map.createObject(0, 2).setSprite("mart_guy").setDirection("RIGHT")--[[['1 ; person']--]]
map.createObject(1, 2).onUse(function(player) shopkeeper(player, {"ULTRA BALL", "GREAT BALL", "SUPER POTION", "REVIVE", "FULL HEAL", "SUPER REPEL"}) end)
map.createObject(4, 5).setSprite("fat_bald_guy")--[[['2 ; person']--]]
map.createObject(6, 2).setSprite("lass")--[[.enableWander()--]]--[[['3 ; person']--]]
