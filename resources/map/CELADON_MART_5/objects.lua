map.createObject(14, 2).setSprite("gentleman")--[[.enableWander()--]]--[[['1 ; person']--]]
map.createObject(2, 1).setSprite("sailor")--[[['2 ; person']--]]
map.createObject(5, 4).setSprite("mart_guy").setDirection("DOWN")--[[['3 ; person']--]]
map.createObject(5, 3).onUse(function(player) shopkeeper(player, {"X ACCURACY", "GUARD SPEC", "DIRE HIT", "X ATTACK", "X DEFEND", "X SPEED", "X SPECIAL"}) end)
map.createObject(6, 4).setSprite("mart_guy").setDirection("DOWN")--[[['4 ; person']--]]
map.createObject(6, 3).onUse(function(player) shopkeeper(player, {"HP UP", "PROTEIN", "IRON", "CARBOS", "CALCIUM"}) end)
