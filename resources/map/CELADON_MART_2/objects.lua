map.createObject(5, 4).setSprite("mart_guy").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(5, 3).onUse(function(player) shopkeeper(player, {"GREAT BALL", "SUPER POTION", "REVIVE", "SUPER REPEL", "ANTIDOTE", "BURN HEAL", "ICE HEAL", "AWAKENING", "PARLYZ HEAL"}) end)
map.createObject(6, 4).setSprite("mart_guy").setDirection("DOWN")--[[['2 ; person']--]]
map.createObject(6, 3).onUse(function(player) shopkeeper(player, {"TM 32", "TM 33", "TM 02", "TM 07", "TM 37", "TM 01", "TM 05", "TM 09", "TM 17"}) end)
map.createObject(19, 2).setSprite("fat_bald_guy")--[[['3 ; person']--]]
map.createObject(14, 3).setSprite("girl")--[[.enableWander()--]]--[[['4 ; person']--]]
