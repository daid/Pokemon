map.createObject(16, 4).setSprite("black_hair_boy_2").onUse(function(player)
    checkForTrainerBattle(player, true, "MANSION_4_16_4", "BURGLAR", "burglar", {{34, "GROWLITHE"}, {34, "PONYTA"}}, 'Uh-oh. Where am\nI now?', 'You can find stuff\nlying around.', 'Awooh!')
end)
map.createObject(27, 16).setSprite("oak_aide").setDirection("DOWN").onUse(function(player) possiblyBattleMANSION_4_27_16(player, true) end)
map.createObject(27, 15).onTouch(function(player) possiblyBattleMANSION_4_27_16(player, false) end)
map.createObject(27, 14).onTouch(function(player) possiblyBattleMANSION_4_27_16(player, false) end)
map.createObject(27, 13).onTouch(function(player) possiblyBattleMANSION_4_27_16(player, false) end)
function possiblyBattleMANSION_4_27_16(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "MANSION_4_27_16", "SCIENTIST", "scientist", {{34, "MAGNEMITE"}, {34, "ELECTRODE"}}, 'This place is\nideal for a lab.', "I like it here!\nIt's conducive to\nmy studies!", 'What\nwas that for?')
end
map.createObject(10, 25).setSprite("ball").onUse(function(player) attemptToPickupObject("MANSION_4_10_25", "RARE CANDY") end)
map.createObject(1, 5).setSprite("ball").onUse(function(player) attemptToPickupObject("MANSION_4_1_5", "FULL RESTORE") end)
map.createObject(19, 2).setSprite("ball").onUse(function(player) attemptToPickupObject("MANSION_4_19_2", "TM 14") end)
map.createObject(5, 23).setSprite("ball").onUse(function(player) attemptToPickupObject("MANSION_4_5_23", "TM 22") end)
map.createObject(16, 7).setSprite("book_map_dex")--[[['7 ; person']--]]
map.createObject(5, 14).setSprite("ball").onUse(function(player) attemptToPickupObject("MANSION_4_5_14", "SECRET KEY") end)
map.setAlwaysWildEncounters()
map.setWildPokemon({0, 0}, {29, 27}, 0.0392157).type("LAND").mode("RED").add(51, 33, "KOFFING").add(51, 31, "KOFFING").add(39, 35, "GROWLITHE").add(25, 32, "PONYTA").add(25, 31, "KOFFING").add(25, 40, "WEEZING").add(13, 34, "PONYTA").add(13, 35, "GRIMER").add(11, 42, "WEEZING").add(3, 42, "MUK")
map.setWildPokemon({0, 0}, {29, 27}, 0.0392157).type("LAND").mode("BLUE").add(51, 33, "GRIMER").add(51, 31, "GRIMER").add(39, 35, "VULPIX").add(25, 32, "PONYTA").add(25, 31, "GRIMER").add(25, 40, "MUK").add(13, 34, "PONYTA").add(13, 35, "KOFFING").add(11, 38, "MAGMAR").add(3, 42, "WEEZING")
