map.createObject(3, 6).setSprite("nurse").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(3, 5).onUse(pokecenterNurse)
map.createObject(5, 2).setSprite("foulard_woman")--[[['2 ; person']--]]
map.createObject(8, 4).setSprite("gentleman").setDirection("DOWN")--[[['3 ; person']--]]
map.createObject(11, 5).setSprite("cable_club_woman").setDirection("DOWN")--[[['4 ; person']--]]

map.createObject(13, 4).onUse(pokecenterComputer)
