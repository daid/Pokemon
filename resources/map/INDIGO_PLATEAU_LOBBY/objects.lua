map.createObject(7, 6).setSprite("nurse").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(7, 5).onUse(pokecenterNurse)
map.createObject(4, 2).setSprite("gym_helper").setDirection("RIGHT")--[[['2 ; person']--]]
map.createObject(5, 10).setSprite("lass").setDirection("DOWN")--[[['3 ; person']--]]
map.createObject(0, 6).setSprite("mart_guy").setDirection("RIGHT")--[[['4 ; person']--]]
map.createObject(1, 6).onUse(function(player) shopkeeper(player, {"ULTRA BALL", "GREAT BALL", "FULL RESTORE", "MAX POTION", "FULL HEAL", "REVIVE", "MAX REPEL"}) end)
map.createObject(13, 5).setSprite("cable_club_woman").setDirection("DOWN")--[[['5 ; person']--]]

map.createObject(15, 4).onUse(pokecenterComputer)
