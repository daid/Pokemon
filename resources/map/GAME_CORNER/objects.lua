map.createObject(2, 11).setSprite("foulard_woman").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(5, 11).setSprite("mart_guy").setDirection("DOWN")--[[['2 ; person']--]]
map.createObject(2, 7).setSprite("fat_bald_guy").setDirection("LEFT")--[[['3 ; person']--]]
map.createObject(2, 4).setSprite("foulard_woman").setDirection("LEFT")--[[['4 ; person']--]]
map.createObject(5, 6).setSprite("fisher").setDirection("RIGHT")--[[['5 ; person']--]]
map.createObject(8, 6).setSprite("mom_geisha").setDirection("LEFT")--[[['6 ; person']--]]
map.createObject(8, 3).setSprite("gym_helper").setDirection("LEFT")--[[['7 ; person']--]]
map.createObject(11, 2).setSprite("gambler").setDirection("RIGHT")--[[['8 ; person']--]]
map.createObject(14, 6).setSprite("mart_guy").setDirection("LEFT")--[[['9 ; person']--]]
map.createObject(17, 4).setSprite("gentleman").setDirection("RIGHT")--[[['10 ; person']--]]
map.createObject(9, 12).setSprite("rocket").setDirection("UP")--[[NO HEADER: .onUse(function(player)
    checkForTrainerBattle(player, true, "GAME_CORNER_9_12", "ROCKET", "rocket", {{20, "RATICATE"}, {20, "ZUBAT"}}, '?', '?', '?')
end)--]]
