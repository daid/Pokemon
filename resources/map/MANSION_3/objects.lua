map.createObject(5, 6).setSprite("black_hair_boy_2")--[[.enableWander()--]].onUse(function(player)
    checkForTrainerBattle(player, true, "MANSION_3_5_6", "BURGLAR", "burglar", {{38, "NINETALES"}}, 'This place is\nlike, huge!', 'I wonder where\nmy partner went.', 'Ayah!')
end)
map.createObject(20, 6).setSprite("oak_aide").setDirection("LEFT").onUse(function(player) possiblyBattleMANSION_3_20_6(player, true) end)
map.createObject(19, 6).onTouch(function(player) possiblyBattleMANSION_3_20_6(player, false) end)
map.createObject(18, 6).onTouch(function(player) possiblyBattleMANSION_3_20_6(player, false) end)
function possiblyBattleMANSION_3_20_6(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "MANSION_3_20_6", "SCIENTIST", "scientist", {{33, "MAGNEMITE"}, {33, "MAGNETON"}, {33, "VOLTORB"}}, 'My mentor once\nlived here.', "So, you're stuck?\nTry jumping off\nover there!", 'Whew!\nOverwhelming!')
end
map.createObject(1, 1).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "MANSION_3_1_1", "MAX POTION") end)
map.createObject(25, 12).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "MANSION_3_25_12", "IRON") end)
map.createObject(6, 5).setSprite("book_map_dex")--[[['5 ; person']--]]
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {29, 17}, 0.0392157).type("LAND").mode("RED").add(51, 31, "KOFFING").add(51, 33, "GROWLITHE").add(39, 35, "KOFFING").add(25, 32, "PONYTA").add(25, 34, "PONYTA").add(25, 40, "WEEZING").add(13, 34, "GRIMER").add(13, 38, "WEEZING").add(11, 36, "PONYTA").add(3, 42, "MUK")
map.setWildPokemon({0, 0}, {29, 17}, 0.0392157).type("LAND").mode("BLUE").add(51, 31, "GRIMER").add(51, 33, "VULPIX").add(39, 35, "GRIMER").add(25, 32, "PONYTA").add(25, 34, "MAGMAR").add(25, 40, "MUK").add(13, 34, "KOFFING").add(13, 38, "MUK").add(11, 36, "PONYTA").add(3, 42, "WEEZING")
