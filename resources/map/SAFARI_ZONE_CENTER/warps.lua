map.createObject(14, -1).onTouch(function(player) player.teleportTo("SAFARI_ZONE_ENTRANCE", 3, 5) end)
map.createObject(15, -1).onTouch(function(player) player.teleportTo("SAFARI_ZONE_ENTRANCE", 4, 5) end)
map.createObject(0, 15).onTouch(function(player) player.teleportTo("SAFARI_ZONE_WEST", 29, 3) end)
map.createObject(0, 14).onTouch(function(player) player.teleportTo("SAFARI_ZONE_WEST", 29, 2) end)
map.createObject(14, 25).onTouch(function(player) player.teleportTo("SAFARI_ZONE_NORTH", 20, 0) end)
map.createObject(15, 25).onTouch(function(player) player.teleportTo("SAFARI_ZONE_NORTH", 21, 0) end)
map.createObject(29, 15).onTouch(function(player) player.teleportTo("SAFARI_ZONE_EAST", 0, 3) end)
map.createObject(29, 14).onTouch(function(player) player.teleportTo("SAFARI_ZONE_EAST", 0, 2) end)
map.createObject(17, 6).onTouch(function(player) player.teleportTo("SAFARI_ZONE_REST_HOUSE_1", 2, 0) end)
