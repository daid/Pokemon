map.createObject(16, 4).setSprite("bug_catcher")--[[['1 ; person']--]]
map.createObject(30, 14).setSprite("bug_catcher").setDirection("LEFT").onUse(function(player) possiblyBattleVIRIDIAN_FOREST_30_14(player, true) end)
map.createObject(29, 14).onTouch(function(player) possiblyBattleVIRIDIAN_FOREST_30_14(player, false) end)
map.createObject(28, 14).onTouch(function(player) possiblyBattleVIRIDIAN_FOREST_30_14(player, false) end)
map.createObject(27, 14).onTouch(function(player) possiblyBattleVIRIDIAN_FOREST_30_14(player, false) end)
map.createObject(26, 14).onTouch(function(player) possiblyBattleVIRIDIAN_FOREST_30_14(player, false) end)
function possiblyBattleVIRIDIAN_FOREST_30_14(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VIRIDIAN_FOREST_30_14", "BUG CATCHER", "bugcatcher", {{6, "WEEDLE"}, {6, "CATERPIE"}}, "Hey! You have\nPOKEMON! Come on!\nLet's battle'em!", "Ssh! You'll scare\nthe bugs away!", "No!\nCATERPIE can't\ncut it!")
end
map.createObject(30, 28).setSprite("bug_catcher").setDirection("LEFT").onUse(function(player) possiblyBattleVIRIDIAN_FOREST_30_28(player, true) end)
map.createObject(29, 28).onTouch(function(player) possiblyBattleVIRIDIAN_FOREST_30_28(player, false) end)
map.createObject(28, 28).onTouch(function(player) possiblyBattleVIRIDIAN_FOREST_30_28(player, false) end)
map.createObject(27, 28).onTouch(function(player) possiblyBattleVIRIDIAN_FOREST_30_28(player, false) end)
map.createObject(26, 28).onTouch(function(player) possiblyBattleVIRIDIAN_FOREST_30_28(player, false) end)
function possiblyBattleVIRIDIAN_FOREST_30_28(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VIRIDIAN_FOREST_30_28", "BUG CATCHER", "bugcatcher", {{7, "WEEDLE"}, {7, "KAKUNA"}, {7, "WEEDLE"}}, "Yo! You can't jam\nout if you're a\nPOKEMON trainer!", "Darn! I'm going\nto catch some\nstronger ones!", 'Huh?\nI ran out of\nPOKEMON!')
end
map.createObject(2, 29).setSprite("bug_catcher").setDirection("LEFT").onUse(function(player) possiblyBattleVIRIDIAN_FOREST_2_29(player, true) end)
map.createObject(1, 29).onTouch(function(player) possiblyBattleVIRIDIAN_FOREST_2_29(player, false) end)
function possiblyBattleVIRIDIAN_FOREST_2_29(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "VIRIDIAN_FOREST_2_29", "BUG CATCHER", "bugcatcher", {{9, "WEEDLE"}}, "Hey, wait up!\nWhat's the hurry?", 'Sometimes, you\ncan find stuff on\nthe ground!', "I\ngive! You're good\nat this!")
end
map.createObject(25, 36).setSprite("ball").onUse(function(player) attemptToPickupObject("VIRIDIAN_FOREST_25_36", "ANTIDOTE") end)
map.createObject(12, 18).setSprite("ball").onUse(function(player) attemptToPickupObject("VIRIDIAN_FOREST_12_18", "POTION") end)
map.createObject(1, 16).setSprite("ball").onUse(function(player) attemptToPickupObject("VIRIDIAN_FOREST_1_16", "POKE BALL") end)
map.createObject(27, 7).setSprite("bug_catcher")--[[['8 ; person']--]]
map.setWildPokemon({0, 0}, {33, 47}, 0.0313725).type("LAND").mode("RED").add(51, 4, "WEEDLE").add(51, 5, "KAKUNA").add(39, 3, "WEEDLE").add(25, 5, "WEEDLE").add(25, 4, "KAKUNA").add(25, 6, "KAKUNA").add(13, 4, "METAPOD").add(13, 3, "CATERPIE").add(11, 3, "PIKACHU").add(3, 5, "PIKACHU")
map.setWildPokemon({0, 0}, {33, 47}, 0.0313725).type("LAND").mode("BLUE").add(51, 4, "CATERPIE").add(51, 5, "METAPOD").add(39, 3, "CATERPIE").add(25, 5, "CATERPIE").add(25, 4, "METAPOD").add(25, 6, "METAPOD").add(13, 4, "KAKUNA").add(13, 3, "WEEDLE").add(11, 3, "PIKACHU").add(3, 5, "PIKACHU")
