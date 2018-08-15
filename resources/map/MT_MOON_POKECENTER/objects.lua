map.createObject(3, 6).setSprite("nurse").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(3, 5).onUse(pokecenterNurse)
map.createObject(4, 4).setSprite("bug_catcher").setDirection("UP")--[[['2 ; person']--]]
map.createObject(7, 4).setSprite("gentleman").setDirection("UP")--[[['3 ; person']--]]
map.createObject(10, 1).setSprite("fat_bald_guy")--[[.enableWander()--]]--[[['4 ; person']--]]
map.createObject(7, 5).setSprite("clipboard")--[[['5 ; person']--]]
map.createObject(11, 5).setSprite("cable_club_woman").setDirection("DOWN")--[[['6 ; person']--]]

map.createObject(13, 4).onUse(pokecenterComputer)
