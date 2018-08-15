map.createObject(3, 6).setSprite("nurse").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(3, 5).onUse(pokecenterNurse)
map.createObject(11, 0).setSprite("gentleman").setDirection("LEFT")--[[['2 ; person']--]]
map.createObject(1, 4).setSprite("clefairy").setDirection("DOWN")--[[['3 ; person']--]]
map.createObject(11, 5).setSprite("cable_club_woman").setDirection("DOWN")--[[['4 ; person']--]]

map.createObject(13, 4).onUse(pokecenterComputer)
