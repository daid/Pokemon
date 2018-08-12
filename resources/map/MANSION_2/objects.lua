map.createObject(3, 10).setSprite("black_hair_boy_2")--[[.enableWander()--]].onUse(function(player)
    checkForTrainerBattle(player, true, "MANSION_2_3_10", "BURGLAR", "burglar", {{34, "CHARMANDER"}, {34, "CHARMELEON"}}, "I can't get out!\nThis old place is\none big puzzle!", 'Switches open and\nclose alternating\nsets of doors!', 'Oh no!\nMy bag of loot!')
end)
map.createObject(28, 20).setSprite("ball").onUse(function(player) attemptToPickupObject("MANSION_2_28_20", "CALCIUM") end)
map.createObject(18, 25).setSprite("book_map_dex")--[[['3 ; person']--]]
map.createObject(3, 5).setSprite("book_map_dex")--[[['4 ; person']--]]
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {29, 27}, 0.0392157).type("LAND").mode("RED").add(51, 32, "GROWLITHE").add(51, 34, "KOFFING").add(39, 34, "KOFFING").add(25, 30, "PONYTA").add(25, 30, "KOFFING").add(25, 32, "PONYTA").add(13, 30, "GRIMER").add(13, 28, "PONYTA").add(11, 39, "WEEZING").add(3, 37, "MUK")
map.setWildPokemon({0, 0}, {29, 27}, 0.0392157).type("LAND").mode("BLUE").add(51, 32, "VULPIX").add(51, 34, "GRIMER").add(39, 34, "GRIMER").add(25, 30, "PONYTA").add(25, 30, "GRIMER").add(25, 32, "PONYTA").add(13, 30, "KOFFING").add(13, 28, "PONYTA").add(11, 39, "MUK").add(3, 37, "WEEZING")
