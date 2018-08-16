--map: CELADON_CITY
map.createObject(158, 234).setSprite("little_girl")--[[.enableWander()--]]--[[['1 ; person']--]]
map.createObject(161, 223).setSprite("old_person").setDirection("UP")--[[['2 ; person']--]]
map.createObject(164, 232).setSprite("girl")--[[.enableWander()--]]--[[['3 ; person']--]]
map.createObject(175, 229).setSprite("old_person").setDirection("DOWN")--[[['4 ; person']--]]
map.createObject(172, 235).setSprite("old_person").setDirection("DOWN")--[[['5 ; person']--]]
map.createObject(182, 239).setSprite("fisher2").setDirection("LEFT")--[[['6 ; person']--]]
map.createObject(180, 239).setSprite("slowbro").setDirection("RIGHT")--[[['7 ; person']--]]
map.createObject(182, 222).setSprite("rocket")--[[.enableWander()--]]--[[['8 ; person']--]]
map.createObject(192, 237).setSprite("rocket")--[[.enableWander()--]]--[[['9 ; person']--]]
--map: CERULEAN_CITY
map.createObject(240, 321).setSprite("blue").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(250, 315).setSprite("rocket")--[[NO HEADER: .onUse(function(player)
    checkForTrainerBattle(player, true, "CERULEAN_CITY_250_315", "ROCKET", "rocket", {{17, "MACHOP"}, {17, "DROWZEE"}}, '?', '?', '?')
end)--]]
map.createObject(251, 303).setSprite("black_hair_boy_1").setDirection("DOWN")--[[['3 ; person']--]]
map.createObject(235, 305).setSprite("black_hair_boy_2")--[[.enableWander()--]]--[[['4 ; person']--]]
map.createObject(229, 302).setSprite("black_hair_boy_2")--[[.enableWander()--]]--[[['5 ; person']--]]
map.createObject(248, 311).setSprite("guard").setDirection("DOWN")--[[['6 ; person']--]]
map.createObject(249, 297).setSprite("lass").setDirection("LEFT")--[[['7 ; person']--]]
map.createObject(248, 297).setSprite("slowbro").setDirection("DOWN")--[[['8 ; person']--]]
map.createObject(229, 296).setSprite("lass")--[[.enableWander()--]]--[[['9 ; person']--]]
map.createObject(224, 311).setSprite("black_hair_boy_2").setDirection("DOWN")--[[['10 ; person']--]]
--Guard in front of the door: map.createObject(247, 311).setSprite("guard").setDirection("DOWN")--[[['11 ; person']--]]
--map: CINNABAR_ISLAND
map.createObject(62, 12).setSprite("girl")--[[.enableWander()--]]--[[['1 ; person']--]]
map.createObject(64, 11).setSprite("gambler")--[[['2 ; person']--]]
--map: FUCHSIA_CITY
map.createObject(170, 77).setSprite("bug_catcher")--[[.enableWander()--]]--[[['1 ; person']--]]
map.createObject(188, 72).setSprite("gambler")--[[.enableWander()--]]--[[['2 ; person']--]]
map.createObject(190, 75).setSprite("fisher2").setDirection("DOWN")--[[['3 ; person']--]]
map.createObject(184, 81).setSprite("bug_catcher").setDirection("UP")--[[['4 ; person']--]]
map.createObject(191, 84).setSprite("clefairy")--[[.enableWander()--]]--[[['5 ; person']--]]
map.createObject(185, 83).setSprite("ball")--[[['6 ; person']--]]
map.createObject(172, 83).setSprite("slowbro")--[[.enableWander()--]]--[[['7 ; person']--]]
map.createObject(190, 77).setSprite("slowbro")--[[.enableWander()--]]--[[['8 ; person']--]]
map.createObject(168, 72).setSprite("seel")--[[.enableWander()--]]--[[['9 ; person']--]]
map.createObject(166, 84).setSprite("omanyte")--[[['10 ; person']--]]
--map: INDIGO_PLATEAU
--map: LAVENDER_TOWN
map.createObject(335, 234).setSprite("little_girl")--[[.enableWander()--]]--[[['1 ; person']--]]
map.createObject(329, 233).setSprite("black_hair_boy_1")--[[['2 ; person']--]]
map.createObject(328, 236).setSprite("black_hair_boy_2")--[[.enableWander()--]]--[[['3 ; person']--]]
--map: PALLET_TOWN
--[[ map.createObject(58, 120).setSprite("oak") -- Removed, because is part of dynamic action we cannot replicate in the MMO situation. ]]
map.createObject(60, 124).onTouch(function(player) if hasPokemon(player) then return end showMessage(player, "Dude, visit Oak\n\nto get a Pokemon.") player.teleportTo("OVERWORLD", 60, 123) end)
map.createObject(61, 124).onTouch(function(player) if hasPokemon(player) then return end showMessage(player, "Dude, visit Oak\n\nto get a Pokemon.") player.teleportTo("OVERWORLD", 60, 123) end)
map.createObject(53, 117).setSprite("girl").onUse(function(player) --[[.enableWander()--]]
    if confirmQuestion(player, "Did you hear about\nthe secret\nFIGHT CLUB?") then
        showMessage(player, "Nether have I.")
    else
        showMessage(player, "You know the\n\nfirst rule!")
        showMessage(player, "Letting POKEMON\n\nfight to their")
        showMessage(player, "death is the\n\nhighest trill!")
        showMessage(player, "Just wished\nthat I remembered\nthe entrance.")
    end
end)
map.createObject(61, 111).setSprite("fisher2").onUse(function(player) showMessage(player, "Make POKEMON\n\ngreat again!") end)
--map: PEWTER_CITY
map.createObject(48, 290).setSprite("lass")--[[['1 ; person']--]]
map.createObject(57, 280).setSprite("black_hair_boy_1")--[[['2 ; person']--]]
map.createObject(67, 288).setSprite("black_hair_boy_2")--[[['3 ; person']--]]
map.createObject(66, 280).setSprite("black_hair_boy_2")--[[.enableWander()--]]--[[['4 ; person']--]]
map.createObject(75, 289).setSprite("bug_catcher").setDirection("DOWN")--[[['5 ; person']--]]
--map: ROUTE_1
map.createObject(55, 137).setSprite("bug_catcher")--[[.enableWander()--]]--[[['1 ; person']--]]
map.createObject(65, 148).setSprite("bug_catcher")--[[.enableWander()--]]--[[['2 ; person']--]]
map.setWildPokemon({50, 126}, {69, 161}, 0.0980392).type("LAND").add(51, 3, "PIDGEY").add(51, 3, "RATTATA").add(39, 3, "RATTATA").add(25, 2, "RATTATA").add(25, 2, "PIDGEY").add(25, 3, "PIDGEY").add(13, 3, "PIDGEY").add(13, 4, "RATTATA").add(11, 4, "PIDGEY").add(3, 5, "PIDGEY")
--map: ROUTE_10
map.createObject(330, 271).setSprite("black_hair_boy_2").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_10_330_271(player, true) end)
map.createObject(329, 271).onTouch(function(player) possiblyBattleROUTE_10_330_271(player, false) end)
map.createObject(328, 271).onTouch(function(player) possiblyBattleROUTE_10_330_271(player, false) end)
map.createObject(327, 271).onTouch(function(player) possiblyBattleROUTE_10_330_271(player, false) end)
map.createObject(326, 271).onTouch(function(player) possiblyBattleROUTE_10_330_271(player, false) end)
function possiblyBattleROUTE_10_330_271(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_10_330_271", "POKEMANIAC", "pokemaniac", {{30, "RHYHORN"}, {30, "LICKITUNG"}}, 'Wow, are you a\nPOKEMANIAC too?\nWant to see my\ncollection?', 'I have more rare\nPOKEMON at home!', "Humph.\nI'm not angry!")
end
map.createObject(323, 258).setSprite("hiker").setDirection("UP").onUse(function(player) possiblyBattleROUTE_10_323_258(player, true) end)
map.createObject(323, 259).onTouch(function(player) possiblyBattleROUTE_10_323_258(player, false) end)
map.createObject(323, 260).onTouch(function(player) possiblyBattleROUTE_10_323_258(player, false) end)
map.createObject(323, 261).onTouch(function(player) possiblyBattleROUTE_10_323_258(player, false) end)
function possiblyBattleROUTE_10_323_258(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_10_323_258", "HIKER", "hiker", {{21, "GEODUDE"}, {21, "ONIX"}}, 'Ha-hahah-ah-ha!', 'Haha-ha-choo!\nHa-choo!\nSnort! Snivel!', 'Ha-haha!\nNot laughing!\nHa-hay fever!\nHaha-ha-choo!')
end
map.createObject(334, 251).setSprite("black_hair_boy_2").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_10_334_251(player, true) end)
map.createObject(333, 251).onTouch(function(player) possiblyBattleROUTE_10_334_251(player, false) end)
map.createObject(332, 251).onTouch(function(player) possiblyBattleROUTE_10_334_251(player, false) end)
map.createObject(331, 251).onTouch(function(player) possiblyBattleROUTE_10_334_251(player, false) end)
map.createObject(330, 251).onTouch(function(player) possiblyBattleROUTE_10_334_251(player, false) end)
function possiblyBattleROUTE_10_334_251(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_10_334_251", "POKEMANIAC", "pokemaniac", {{20, "CUBONE"}, {20, "SLOWPOKE"}}, 'Hi kid, want to\nsee my POKEMON?', "I don't like you\nfor beating me!", 'Oh no!\nMy POKEMON!')
end
map.createObject(327, 290).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_10_327_290(player, true) end)
map.createObject(326, 290).onTouch(function(player) possiblyBattleROUTE_10_327_290(player, false) end)
map.createObject(325, 290).onTouch(function(player) possiblyBattleROUTE_10_327_290(player, false) end)
map.createObject(324, 290).onTouch(function(player) possiblyBattleROUTE_10_327_290(player, false) end)
function possiblyBattleROUTE_10_327_290(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_10_327_290", "JR.TRAINER#FEMALE", "jr.trainerf", {{20, "PIKACHU"}, {20, "CLEFAIRY"}}, "I've been to a\nPOKEMON GYM a few\ntimes. But, I\nlost each time.", 'I noticed some\nPOKEMANIACs\nprowling around.', 'Ohh!\nBlew it again!')
end
map.createObject(323, 254).setSprite("hiker").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_10_323_254(player, true) end)
map.createObject(323, 253).onTouch(function(player) possiblyBattleROUTE_10_323_254(player, false) end)
map.createObject(323, 252).onTouch(function(player) possiblyBattleROUTE_10_323_254(player, false) end)
function possiblyBattleROUTE_10_323_254(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_10_323_254", "HIKER", "hiker", {{19, "ONIX"}, {19, "GRAVELER"}}, 'Ah! This mountain\nair is delicious!', 'I feel bloated on\nmountain air!', 'That\ncleared my head!')
end
map.createObject(327, 261).setSprite("lass").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_10_327_261(player, true) end)
map.createObject(327, 260).onTouch(function(player) possiblyBattleROUTE_10_327_261(player, false) end)
map.createObject(327, 259).onTouch(function(player) possiblyBattleROUTE_10_327_261(player, false) end)
function possiblyBattleROUTE_10_327_261(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_10_327_261", "JR.TRAINER#FEMALE", "jr.trainerf", {{21, "PIDGEY"}, {21, "PIDGEOTTO"}}, "I'm feeling a bit\nfaint from this\ntough hike.", 'The POKEMON here\nare so chunky!\nThere should be a\npink one with a\nfloral pattern!', "I'm\nnot up to it!")
end
map.setWildPokemon({320, 244}, {339, 315}, 0.0588235).type("LAND").mode("RED").add(51, 16, "VOLTORB").add(51, 16, "SPEAROW").add(39, 14, "VOLTORB").add(25, 11, "EKANS").add(25, 13, "SPEAROW").add(25, 15, "EKANS").add(13, 17, "VOLTORB").add(13, 17, "SPEAROW").add(11, 13, "EKANS").add(3, 17, "EKANS")
map.setWildPokemon({320, 244}, {339, 315}, 0.0588235).type("LAND").mode("BLUE").add(51, 16, "VOLTORB").add(51, 16, "SPEAROW").add(39, 14, "VOLTORB").add(25, 11, "SANDSHREW").add(25, 13, "SPEAROW").add(25, 15, "SANDSHREW").add(13, 17, "VOLTORB").add(13, 17, "SPEAROW").add(11, 13, "SANDSHREW").add(3, 17, "SANDSHREW")
--map: ROUTE_11
map.createObject(270, 157).setSprite("gambler").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_11_270_157(player, true) end)
map.createObject(270, 156).onTouch(function(player) possiblyBattleROUTE_11_270_157(player, false) end)
map.createObject(270, 155).onTouch(function(player) possiblyBattleROUTE_11_270_157(player, false) end)
map.createObject(270, 154).onTouch(function(player) possiblyBattleROUTE_11_270_157(player, false) end)
function possiblyBattleROUTE_11_270_157(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_11_270_157", "GAMBLER", "gambler", {{18, "POLIWAG"}, {18, "HORSEA"}}, 'Win, lose or draw!', 'POKEMON is life!\nAnd to live is to\ngamble!', "Atcha!\nDidn't go my way!")
end
map.createObject(286, 162).setSprite("gambler").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_11_286_162(player, true) end)
map.createObject(286, 161).onTouch(function(player) possiblyBattleROUTE_11_286_162(player, false) end)
map.createObject(286, 160).onTouch(function(player) possiblyBattleROUTE_11_286_162(player, false) end)
function possiblyBattleROUTE_11_286_162(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_11_286_162", "GAMBLER", "gambler", {{18, "BELLSPROUT"}, {18, "ODDISH"}}, "Competition! I\ncan't get enough!", "You can't be a\ncoward in the\nworld of POKEMON!", 'I had\na chance!')
end
map.createObject(273, 166).setSprite("bug_catcher").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_11_273_166(player, true) end)
map.createObject(272, 166).onTouch(function(player) possiblyBattleROUTE_11_273_166(player, false) end)
map.createObject(271, 166).onTouch(function(player) possiblyBattleROUTE_11_273_166(player, false) end)
map.createObject(270, 166).onTouch(function(player) possiblyBattleROUTE_11_273_166(player, false) end)
function possiblyBattleROUTE_11_273_166(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_11_273_166", "YOUNGSTER", "youngster", {{21, "EKANS"}}, "Let's go, but\ndon't cheat!", 'I did my best! I\nhave no regrets!', "Huh?\nThat's not right!")
end
map.createObject(296, 160).setSprite("black_hair_boy_2").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_11_296_160(player, true) end)
map.createObject(296, 159).onTouch(function(player) possiblyBattleROUTE_11_296_160(player, false) end)
map.createObject(296, 158).onTouch(function(player) possiblyBattleROUTE_11_296_160(player, false) end)
map.createObject(296, 157).onTouch(function(player) possiblyBattleROUTE_11_296_160(player, false) end)
function possiblyBattleROUTE_11_296_160(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_11_296_160", "ENGINEER", "engineer", {{21, "MAGNEMITE"}}, "Careful!\nI'm laying down\nsome cables!", 'Spread the word\nto save energy!', 'That\nwas electric!')
end
map.createObject(282, 167).setSprite("bug_catcher").setDirection("UP").onUse(function(player) possiblyBattleROUTE_11_282_167(player, true) end)
map.createObject(282, 168).onTouch(function(player) possiblyBattleROUTE_11_282_167(player, false) end)
map.createObject(282, 169).onTouch(function(player) possiblyBattleROUTE_11_282_167(player, false) end)
map.createObject(282, 170).onTouch(function(player) possiblyBattleROUTE_11_282_167(player, false) end)
map.createObject(282, 171).onTouch(function(player) possiblyBattleROUTE_11_282_167(player, false) end)
function possiblyBattleROUTE_11_282_167(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_11_282_167", "YOUNGSTER", "youngster", {{19, "SANDSHREW"}, {19, "ZUBAT"}}, 'I just became a\ntrainer! But, I\nthink I can win!', 'What do you want?\nLeave me alone!', "My\nPOKEMON couldn't!")
end
map.createObject(305, 164).setSprite("gambler").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_11_305_164(player, true) end)
map.createObject(305, 163).onTouch(function(player) possiblyBattleROUTE_11_305_164(player, false) end)
map.createObject(305, 162).onTouch(function(player) possiblyBattleROUTE_11_305_164(player, false) end)
map.createObject(305, 161).onTouch(function(player) possiblyBattleROUTE_11_305_164(player, false) end)
function possiblyBattleROUTE_11_305_164(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_11_305_164", "GAMBLER", "gambler", {{18, "VOLTORB"}, {18, "MAGNEMITE"}}, 'Fwahaha! I have\nnever lost!', 'Luck of the draw!\nJust luck!', 'My\nfirst loss!')
end
map.createObject(293, 168).setSprite("gambler").setDirection("UP").onUse(function(player) possiblyBattleROUTE_11_293_168(player, true) end)
map.createObject(293, 169).onTouch(function(player) possiblyBattleROUTE_11_293_168(player, false) end)
map.createObject(293, 170).onTouch(function(player) possiblyBattleROUTE_11_293_168(player, false) end)
map.createObject(293, 171).onTouch(function(player) possiblyBattleROUTE_11_293_168(player, false) end)
function possiblyBattleROUTE_11_293_168(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_11_293_168", "GAMBLER", "gambler", {{18, "GROWLITHE"}, {18, "VULPIX"}}, 'I have never won\nbefore...', "It's just luck.\nLuck of the draw.", 'I saw\nthis coming...')
end
map.createObject(303, 166).setSprite("bug_catcher").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_11_303_166(player, true) end)
map.createObject(304, 166).onTouch(function(player) possiblyBattleROUTE_11_303_166(player, false) end)
map.createObject(305, 166).onTouch(function(player) possiblyBattleROUTE_11_303_166(player, false) end)
map.createObject(306, 166).onTouch(function(player) possiblyBattleROUTE_11_303_166(player, false) end)
map.createObject(307, 166).onTouch(function(player) possiblyBattleROUTE_11_303_166(player, false) end)
function possiblyBattleROUTE_11_303_166(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_11_303_166", "YOUNGSTER", "youngster", {{17, "RATTATA"}, {17, "RATTATA"}, {17, "RATICATE"}}, "I'm the best in\nmy class!", "There's a fat\nPOKEMON that\ncomes down from\nthe mountains.", 'Darn!\nI need to make my\nPOKEMON stronger!')
end
map.createObject(305, 155).setSprite("black_hair_boy_2").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_11_305_155(player, true) end)
map.createObject(304, 155).onTouch(function(player) possiblyBattleROUTE_11_305_155(player, false) end)
map.createObject(303, 155).onTouch(function(player) possiblyBattleROUTE_11_305_155(player, false) end)
map.createObject(302, 155).onTouch(function(player) possiblyBattleROUTE_11_305_155(player, false) end)
function possiblyBattleROUTE_11_305_155(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_11_305_155", "ENGINEER", "engineer", {{18, "MAGNEMITE"}, {18, "MAGNEMITE"}, {18, "MAGNETON"}}, 'Watch out for\nlive wires!', 'Well, better get\nback to work.', 'Whoa!\nYou spark plug!')
end
map.createObject(282, 159).setSprite("bug_catcher").setDirection("UP").onUse(function(player) possiblyBattleROUTE_11_282_159(player, true) end)
map.createObject(282, 160).onTouch(function(player) possiblyBattleROUTE_11_282_159(player, false) end)
map.createObject(282, 161).onTouch(function(player) possiblyBattleROUTE_11_282_159(player, false) end)
map.createObject(282, 162).onTouch(function(player) possiblyBattleROUTE_11_282_159(player, false) end)
map.createObject(282, 163).onTouch(function(player) possiblyBattleROUTE_11_282_159(player, false) end)
function possiblyBattleROUTE_11_282_159(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_11_282_159", "YOUNGSTER", "youngster", {{18, "NIDORAN_M"}, {18, "NIDORINO"}}, 'My POKEMON should\nbe ready by now!', 'I better go find\nstronger ones!', 'Too\nmuch, too young!')
end
map.setWildPokemon({260, 154}, {319, 171}, 0.0588235).type("LAND").mode("RED").add(51, 14, "EKANS").add(51, 15, "SPEAROW").add(39, 12, "EKANS").add(25, 9, "DROWZEE").add(25, 13, "SPEAROW").add(25, 13, "DROWZEE").add(13, 15, "EKANS").add(13, 17, "SPEAROW").add(11, 11, "DROWZEE").add(3, 15, "DROWZEE")
map.setWildPokemon({260, 154}, {319, 171}, 0.0588235).type("LAND").mode("BLUE").add(51, 14, "SANDSHREW").add(51, 15, "SPEAROW").add(39, 12, "SANDSHREW").add(25, 9, "DROWZEE").add(25, 13, "SPEAROW").add(25, 13, "DROWZEE").add(13, 15, "SANDSHREW").add(13, 17, "SPEAROW").add(11, 11, "DROWZEE").add(3, 15, "DROWZEE")
--map: ROUTE_12
map.createObject(330, 163).setSprite("snorlax").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(334, 194).setSprite("fisher2").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_12_334_194(player, true) end)
map.createObject(333, 194).onTouch(function(player) possiblyBattleROUTE_12_334_194(player, false) end)
map.createObject(332, 194).onTouch(function(player) possiblyBattleROUTE_12_334_194(player, false) end)
map.createObject(331, 194).onTouch(function(player) possiblyBattleROUTE_12_334_194(player, false) end)
map.createObject(330, 194).onTouch(function(player) possiblyBattleROUTE_12_334_194(player, false) end)
function possiblyBattleROUTE_12_334_194(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_12_334_194", "FISHER", "fisher", {{22, "GOLDEEN"}, {22, "POLIWAG"}, {22, "GOLDEEN"}}, 'Yeah! I got a\nbite, here!', "Hang on! My line's\nsnagged!", 'Tch!\nJust a small fry!')
end
map.createObject(325, 186).setSprite("fisher2").setDirection("UP").onUse(function(player) possiblyBattleROUTE_12_325_186(player, true) end)
map.createObject(325, 187).onTouch(function(player) possiblyBattleROUTE_12_325_186(player, false) end)
map.createObject(325, 188).onTouch(function(player) possiblyBattleROUTE_12_325_186(player, false) end)
map.createObject(325, 189).onTouch(function(player) possiblyBattleROUTE_12_325_186(player, false) end)
map.createObject(325, 190).onTouch(function(player) possiblyBattleROUTE_12_325_186(player, false) end)
function possiblyBattleROUTE_12_325_186(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_12_325_186", "FISHER", "fisher", {{24, "TENTACOOL"}, {24, "GOLDEEN"}}, 'Be patient!\nFishing is a\nwaiting game!', 'With a better ROD,\nI could catch\nbetter POKEMON!', 'That\none got away!')
end
map.createObject(331, 133).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_12_331_133(player, true) end)
map.createObject(330, 133).onTouch(function(player) possiblyBattleROUTE_12_331_133(player, false) end)
map.createObject(329, 133).onTouch(function(player) possiblyBattleROUTE_12_331_133(player, false) end)
map.createObject(328, 133).onTouch(function(player) possiblyBattleROUTE_12_331_133(player, false) end)
map.createObject(327, 133).onTouch(function(player) possiblyBattleROUTE_12_331_133(player, false) end)
function possiblyBattleROUTE_12_331_133(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_12_331_133", "JR.TRAINER#MALE", "jr.trainerm", {{29, "NIDORAN_M"}, {29, "NIDORINO"}}, 'Have you found a\nMOON STONE?', 'I could have made\nmy POKEMON evolve\nwith MOON STONE!', 'Oww!')
end
map.createObject(334, 149).setSprite("black_hair_boy_2").setDirection("UP").onUse(function(player) possiblyBattleROUTE_12_334_149(player, true) end)
map.createObject(334, 150).onTouch(function(player) possiblyBattleROUTE_12_334_149(player, false) end)
map.createObject(334, 151).onTouch(function(player) possiblyBattleROUTE_12_334_149(player, false) end)
map.createObject(334, 152).onTouch(function(player) possiblyBattleROUTE_12_334_149(player, false) end)
map.createObject(334, 153).onTouch(function(player) possiblyBattleROUTE_12_334_149(player, false) end)
function possiblyBattleROUTE_12_334_149(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_12_334_149", "ROCKER", "rocker", {{29, "VOLTORB"}, {29, "ELECTRODE"}}, 'Electricity is my\nspecialty!', 'Water conducts\nelectricity, so\nyou should zap\nsea POKEMON!', 'Unplugged!')
end
map.createObject(332, 185).setSprite("fisher2").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_12_332_185(player, true) end)
map.createObject(331, 185).onTouch(function(player) possiblyBattleROUTE_12_332_185(player, false) end)
map.createObject(330, 185).onTouch(function(player) possiblyBattleROUTE_12_332_185(player, false) end)
map.createObject(329, 185).onTouch(function(player) possiblyBattleROUTE_12_332_185(player, false) end)
map.createObject(328, 185).onTouch(function(player) possiblyBattleROUTE_12_332_185(player, false) end)
function possiblyBattleROUTE_12_332_185(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_12_332_185", "FISHER", "fisher", {{27, "GOLDEEN"}}, 'The FISHING FOOL\nvs. POKEMON KID!', "You beat me at\nPOKEMON, but I'm\ngood at fishing!", 'Too\nmuch!')
end
map.createObject(329, 173).setSprite("fisher2").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_12_329_173(player, true) end)
map.createObject(330, 173).onTouch(function(player) possiblyBattleROUTE_12_329_173(player, false) end)
map.createObject(331, 173).onTouch(function(player) possiblyBattleROUTE_12_329_173(player, false) end)
map.createObject(332, 173).onTouch(function(player) possiblyBattleROUTE_12_329_173(player, false) end)
map.createObject(333, 173).onTouch(function(player) possiblyBattleROUTE_12_329_173(player, false) end)
function possiblyBattleROUTE_12_329_173(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_12_329_173", "FISHER", "fisher", {{21, "POLIWAG"}, {21, "SHELLDER"}, {21, "GOLDEEN"}, {21, "HORSEA"}}, "I'd rather be\nworking!", "It's all right.\nLosing doesn't\nbug me any more.", "It's\nnot easy...")
end
map.createObject(326, 138).setSprite("fisher2").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_12_326_138(player, true) end)
map.createObject(326, 137).onTouch(function(player) possiblyBattleROUTE_12_326_138(player, false) end)
function possiblyBattleROUTE_12_326_138(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_12_326_138", "FISHER", "fisher", {{24, "MAGIKARP"}, {24, "MAGIKARP"}}, 'You never know\nwhat you could\ncatch!', "I catch MAGIKARP\nall the time, but\nthey're so weak!", 'Lost\nit!')
end
map.createObject(334, 190).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "ROUTE_12_334_190", "TM 16") end)
map.createObject(325, 136).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "ROUTE_12_325_136", "IRON") end)
map.setWildPokemon({320, 118}, {339, 225}, 0.0588235).type("LAND").mode("RED").add(51, 24, "ODDISH").add(51, 25, "PIDGEY").add(39, 23, "PIDGEY").add(25, 24, "VENONAT").add(25, 22, "ODDISH").add(25, 26, "VENONAT").add(13, 26, "ODDISH").add(13, 27, "PIDGEY").add(11, 28, "GLOOM").add(3, 30, "GLOOM")
map.setWildPokemon({320, 118}, {339, 225}, 0.0588235).type("LAND").mode("BLUE").add(51, 24, "BELLSPROUT").add(51, 25, "PIDGEY").add(39, 23, "PIDGEY").add(25, 24, "VENONAT").add(25, 22, "BELLSPROUT").add(25, 26, "VENONAT").add(13, 26, "BELLSPROUT").add(13, 27, "PIDGEY").add(11, 28, "WEEPINBELL").add(3, 30, "WEEPINBELL")
--map: ROUTE_13
map.createObject(329, 107).setSprite("black_hair_boy_1").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_13_329_107(player, true) end)
map.createObject(330, 107).onTouch(function(player) possiblyBattleROUTE_13_329_107(player, false) end)
map.createObject(331, 107).onTouch(function(player) possiblyBattleROUTE_13_329_107(player, false) end)
function possiblyBattleROUTE_13_329_107(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_13_329_107", "BIRD KEEPER", "birdkeeper", {{29, "PIDGEY"}, {29, "PIDGEOTTO"}}, 'My bird POKEMON\nwant to scrap!', 'My POKEMON look\nhappy even though\nthey lost.', 'My\nbird combo lost?')
end
map.createObject(328, 107).setSprite("lass").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_13_328_107(player, true) end)
map.createObject(328, 106).onTouch(function(player) possiblyBattleROUTE_13_328_107(player, false) end)
map.createObject(328, 105).onTouch(function(player) possiblyBattleROUTE_13_328_107(player, false) end)
function possiblyBattleROUTE_13_328_107(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_13_328_107", "JR.TRAINER#FEMALE", "jr.trainerf", {{24, "PIDGEY"}, {24, "MEOWTH"}, {24, "RATTATA"}, {24, "PIKACHU"}, {24, "MEOWTH"}}, "I'm told I'm good\nfor a kid!", "I want to become\na good trainer.\nI'll train hard.", 'Ohh!\nI lost!')
end
map.createObject(307, 108).setSprite("lass").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_13_307_108(player, true) end)
map.createObject(307, 107).onTouch(function(player) possiblyBattleROUTE_13_307_108(player, false) end)
map.createObject(307, 106).onTouch(function(player) possiblyBattleROUTE_13_307_108(player, false) end)
function possiblyBattleROUTE_13_307_108(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_13_307_108", "JR.TRAINER#FEMALE", "jr.trainerf", {{30, "POLIWAG"}, {30, "POLIWAG"}}, 'Wow! Your BADGEs\nare too cool!', 'You got those\nBADGEs from GYM\nLEADERs. I know!', 'Not\nenough!')
end
map.createObject(303, 107).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_13_303_107(player, true) end)
map.createObject(302, 107).onTouch(function(player) possiblyBattleROUTE_13_303_107(player, false) end)
map.createObject(301, 107).onTouch(function(player) possiblyBattleROUTE_13_303_107(player, false) end)
function possiblyBattleROUTE_13_303_107(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_13_303_107", "JR.TRAINER#FEMALE", "jr.trainerf", {{27, "PIDGEY"}, {27, "MEOWTH"}, {27, "PIDGEY"}, {27, "PIDGEOTTO"}}, 'My cute POKEMON\nwish to make your\nacquaintance.', 'You have to make\nPOKEMON fight to\ntoughen them up!', 'Wow!\nYou totally won!')
end
map.createObject(330, 112).setSprite("lass").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_13_330_112(player, true) end)
map.createObject(330, 111).onTouch(function(player) possiblyBattleROUTE_13_330_112(player, false) end)
map.createObject(330, 110).onTouch(function(player) possiblyBattleROUTE_13_330_112(player, false) end)
map.createObject(330, 109).onTouch(function(player) possiblyBattleROUTE_13_330_112(player, false) end)
map.createObject(330, 108).onTouch(function(player) possiblyBattleROUTE_13_330_112(player, false) end)
function possiblyBattleROUTE_13_330_112(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_13_330_112", "JR.TRAINER#FEMALE", "jr.trainerf", {{28, "GOLDEEN"}, {28, "POLIWAG"}, {28, "HORSEA"}}, 'I found CARBOS in\na cave once.', 'CARBOS boosted\nthe SPEED of my\nPOKEMON.', 'Just\nmessed up!')
end
map.createObject(292, 113).setSprite("black_hair_boy_1").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_13_292_113(player, true) end)
map.createObject(293, 113).onTouch(function(player) possiblyBattleROUTE_13_292_113(player, false) end)
map.createObject(294, 113).onTouch(function(player) possiblyBattleROUTE_13_292_113(player, false) end)
function possiblyBattleROUTE_13_292_113(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_13_292_113", "BIRD KEEPER", "birdkeeper", {{25, "SPEAROW"}, {25, "PIDGEY"}, {25, "PIDGEY"}, {25, "SPEAROW"}, {25, "SPEAROW"}}, "The wind's blowing\nmy way!", "I'm beat. I guess\nI'll FLY home.", 'The\nwind turned!')
end
map.createObject(313, 111).setSprite("foulard_woman").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_13_313_111(player, true) end)
map.createObject(313, 110).onTouch(function(player) possiblyBattleROUTE_13_313_111(player, false) end)
map.createObject(313, 109).onTouch(function(player) possiblyBattleROUTE_13_313_111(player, false) end)
map.createObject(313, 108).onTouch(function(player) possiblyBattleROUTE_13_313_111(player, false) end)
map.createObject(313, 107).onTouch(function(player) possiblyBattleROUTE_13_313_111(player, false) end)
function possiblyBattleROUTE_13_313_111(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_13_313_111", "BEAUTY", "beauty", {{27, "RATTATA"}, {27, "PIKACHU"}, {27, "RATTATA"}}, "Sure, I'll play\nwith you!", 'I wonder which is\nstronger, male or\nfemale POKEMON?', 'Oh!\nYou little brute!')
end
map.createObject(312, 111).setSprite("foulard_woman").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_13_312_111(player, true) end)
map.createObject(312, 110).onTouch(function(player) possiblyBattleROUTE_13_312_111(player, false) end)
map.createObject(312, 109).onTouch(function(player) possiblyBattleROUTE_13_312_111(player, false) end)
function possiblyBattleROUTE_13_312_111(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_13_312_111", "BEAUTY", "beauty", {{29, "CLEFAIRY"}, {29, "MEOWTH"}}, 'Do you want to\nPOKEMON with me?', "I don't know\nanything about\nPOKEMON. I just\nlike cool ones!", "It's over\nalready?")
end
map.createObject(290, 110).setSprite("biker").setDirection("UP").onUse(function(player) possiblyBattleROUTE_13_290_110(player, true) end)
map.createObject(290, 111).onTouch(function(player) possiblyBattleROUTE_13_290_110(player, false) end)
map.createObject(290, 112).onTouch(function(player) possiblyBattleROUTE_13_290_110(player, false) end)
function possiblyBattleROUTE_13_290_110(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_13_290_110", "BIKER", "biker", {{28, "KOFFING"}, {28, "KOFFING"}, {28, "KOFFING"}}, "What're you\nlookin' at?", 'Get lost!', 'Dang!\nStripped gears!')
end
map.createObject(287, 104).setSprite("black_hair_boy_1").setDirection("UP").onUse(function(player) possiblyBattleROUTE_13_287_104(player, true) end)
map.createObject(287, 105).onTouch(function(player) possiblyBattleROUTE_13_287_104(player, false) end)
map.createObject(287, 106).onTouch(function(player) possiblyBattleROUTE_13_287_104(player, false) end)
map.createObject(287, 107).onTouch(function(player) possiblyBattleROUTE_13_287_104(player, false) end)
map.createObject(287, 108).onTouch(function(player) possiblyBattleROUTE_13_287_104(player, false) end)
function possiblyBattleROUTE_13_287_104(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_13_287_104", "BIRD KEEPER", "birdkeeper", {{26, "PIDGEY"}, {26, "PIDGEOTTO"}, {26, "SPEAROW"}, {26, "FEAROW"}}, 'I always go with\nbird POKEMON!', 'I wish I could\nfly like PIDGEY\nand PIDGEOTTO...', 'Out\nof power!')
end
map.setWildPokemon({280, 100}, {339, 117}, 0.0784314).type("LAND").mode("RED").add(51, 24, "ODDISH").add(51, 25, "PIDGEY").add(39, 27, "PIDGEY").add(25, 24, "VENONAT").add(25, 22, "ODDISH").add(25, 26, "VENONAT").add(13, 26, "ODDISH").add(13, 25, "DITTO").add(11, 28, "GLOOM").add(3, 30, "GLOOM")
map.setWildPokemon({280, 100}, {339, 117}, 0.0784314).type("LAND").mode("BLUE").add(51, 24, "BELLSPROUT").add(51, 25, "PIDGEY").add(39, 27, "PIDGEY").add(25, 24, "VENONAT").add(25, 22, "BELLSPROUT").add(25, 26, "VENONAT").add(13, 26, "BELLSPROUT").add(13, 25, "DITTO").add(11, 28, "WEEPINBELL").add(3, 30, "WEEPINBELL")
--map: ROUTE_14
map.createObject(264, 113).setSprite("black_hair_boy_1").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_14_264_113(player, true) end)
map.createObject(264, 112).onTouch(function(player) possiblyBattleROUTE_14_264_113(player, false) end)
map.createObject(264, 111).onTouch(function(player) possiblyBattleROUTE_14_264_113(player, false) end)
function possiblyBattleROUTE_14_264_113(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_14_264_113", "BIRD KEEPER", "birdkeeper", {{28, "PIDGEY"}, {28, "DODUO"}, {28, "PIDGEOTTO"}}, 'You need to use\nTMs to teach good\nmoves to POKEMON!', "You have some HMs\nright? POKEMON\ncan't ever forget\nthose moves.", 'Not\ngood enough!')
end
map.createObject(275, 111).setSprite("black_hair_boy_1").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_14_275_111(player, true) end)
map.createObject(275, 110).onTouch(function(player) possiblyBattleROUTE_14_275_111(player, false) end)
map.createObject(275, 109).onTouch(function(player) possiblyBattleROUTE_14_275_111(player, false) end)
function possiblyBattleROUTE_14_275_111(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_14_275_111", "BIRD KEEPER", "birdkeeper", {{26, "PIDGEY"}, {26, "SPEAROW"}, {26, "PIDGEY"}, {26, "FEAROW"}}, 'My bird POKEMON\nshould be ready\nfor battle.', 'They need to learn\nbetter moves.', 'Not\nready yet!')
end
map.createObject(272, 106).setSprite("black_hair_boy_1").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_14_272_106(player, true) end)
map.createObject(272, 105).onTouch(function(player) possiblyBattleROUTE_14_272_106(player, false) end)
map.createObject(272, 104).onTouch(function(player) possiblyBattleROUTE_14_272_106(player, false) end)
map.createObject(272, 103).onTouch(function(player) possiblyBattleROUTE_14_272_106(player, false) end)
map.createObject(272, 102).onTouch(function(player) possiblyBattleROUTE_14_272_106(player, false) end)
function possiblyBattleROUTE_14_272_106(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_14_272_106", "BIRD KEEPER", "birdkeeper", {{29, "PIDGEOTTO"}, {29, "FEAROW"}}, 'TMs are on sale\nin CELADON!\nBut, only a few\npeople have HMs!', 'Teach POKEMON\nmoves of the same\nelement type for\nmore power.', 'Aww,\nbummer!')
end
map.createObject(274, 102).setSprite("black_hair_boy_1").setDirection("UP").onUse(function(player) possiblyBattleROUTE_14_274_102(player, true) end)
map.createObject(274, 103).onTouch(function(player) possiblyBattleROUTE_14_274_102(player, false) end)
map.createObject(274, 104).onTouch(function(player) possiblyBattleROUTE_14_274_102(player, false) end)
map.createObject(274, 105).onTouch(function(player) possiblyBattleROUTE_14_274_102(player, false) end)
function possiblyBattleROUTE_14_274_102(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_14_274_102", "BIRD KEEPER", "birdkeeper", {{28, "SPEAROW"}, {28, "DODUO"}, {28, "FEAROW"}}, 'Have you taught\nyour bird POKEMON\nhow to FLY?', 'Bird POKEMON are\nmy true love!', 'Shot\ndown in flames!')
end
map.createObject(275, 86).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_14_275_86(player, true) end)
map.createObject(274, 86).onTouch(function(player) possiblyBattleROUTE_14_275_86(player, false) end)
map.createObject(273, 86).onTouch(function(player) possiblyBattleROUTE_14_275_86(player, false) end)
map.createObject(272, 86).onTouch(function(player) possiblyBattleROUTE_14_275_86(player, false) end)
function possiblyBattleROUTE_14_275_86(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_14_275_86", "BIRD KEEPER", "birdkeeper", {{33, "FARFETCHD"}}, 'Have you heard of\nthe legendary\nPOKEMON?', 'The 3 legendary\nPOKEMON are all\nbirds of prey.', "Why?\nWhy'd I lose?")
end
map.createObject(266, 68).setSprite("black_hair_boy_1").setDirection("UP").onUse(function(player) possiblyBattleROUTE_14_266_68(player, true) end)
map.createObject(266, 69).onTouch(function(player) possiblyBattleROUTE_14_266_68(player, false) end)
map.createObject(266, 70).onTouch(function(player) possiblyBattleROUTE_14_266_68(player, false) end)
map.createObject(266, 71).onTouch(function(player) possiblyBattleROUTE_14_266_68(player, false) end)
map.createObject(266, 72).onTouch(function(player) possiblyBattleROUTE_14_266_68(player, false) end)
function possiblyBattleROUTE_14_266_68(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_14_266_68", "BIRD KEEPER", "birdkeeper", {{29, "SPEAROW"}, {29, "FEAROW"}}, "I'm not into it,\nbut OK! Let's go!", "Winning, losing,\nit doesn't matter\nin the long run!", 'I\nknew it!')
end
map.createObject(265, 78).setSprite("biker").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_14_265_78(player, true) end)
map.createObject(265, 77).onTouch(function(player) possiblyBattleROUTE_14_265_78(player, false) end)
map.createObject(265, 76).onTouch(function(player) possiblyBattleROUTE_14_265_78(player, false) end)
map.createObject(265, 75).onTouch(function(player) possiblyBattleROUTE_14_265_78(player, false) end)
map.createObject(265, 74).onTouch(function(player) possiblyBattleROUTE_14_265_78(player, false) end)
function possiblyBattleROUTE_14_265_78(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_14_265_78", "BIKER", "biker", {{26, "KOFFING"}, {26, "KOFFING"}, {26, "GRIMER"}, {26, "KOFFING"}}, "C'mon, c'mon.\nLet's go, let's\ngo, let's go!", 'What, what, what?\nWhat do you want?', 'Arrg!\nLost! Get lost!')
end
map.createObject(264, 87).setSprite("biker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_14_264_87(player, true) end)
map.createObject(265, 87).onTouch(function(player) possiblyBattleROUTE_14_264_87(player, false) end)
map.createObject(266, 87).onTouch(function(player) possiblyBattleROUTE_14_264_87(player, false) end)
map.createObject(267, 87).onTouch(function(player) possiblyBattleROUTE_14_264_87(player, false) end)
map.createObject(268, 87).onTouch(function(player) possiblyBattleROUTE_14_264_87(player, false) end)
function possiblyBattleROUTE_14_264_87(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_14_264_87", "BIKER", "biker", {{28, "GRIMER"}, {28, "GRIMER"}, {28, "KOFFING"}}, 'Perfect! I need to\nburn some time!', 'Raising POKEMON\nis a drag, man.', 'What?\nYou!?')
end
map.createObject(275, 87).setSprite("biker").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_14_275_87(player, true) end)
map.createObject(274, 87).onTouch(function(player) possiblyBattleROUTE_14_275_87(player, false) end)
map.createObject(273, 87).onTouch(function(player) possiblyBattleROUTE_14_275_87(player, false) end)
map.createObject(272, 87).onTouch(function(player) possiblyBattleROUTE_14_275_87(player, false) end)
function possiblyBattleROUTE_14_275_87(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_14_275_87", "BIKER", "biker", {{29, "KOFFING"}, {29, "MUK"}}, "We ride out here\nbecause there's\nmore room!", "It's cool you\nmade your POKEMON\nso strong!", 'Wipe out!')
end
map.createObject(264, 86).setSprite("biker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_14_264_86(player, true) end)
map.createObject(265, 86).onTouch(function(player) possiblyBattleROUTE_14_264_86(player, false) end)
map.createObject(266, 86).onTouch(function(player) possiblyBattleROUTE_14_264_86(player, false) end)
map.createObject(267, 86).onTouch(function(player) possiblyBattleROUTE_14_264_86(player, false) end)
map.createObject(268, 86).onTouch(function(player) possiblyBattleROUTE_14_264_86(player, false) end)
function possiblyBattleROUTE_14_264_86(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_14_264_86", "BIKER", "biker", {{29, "KOFFING"}, {29, "GRIMER"}}, 'POKEMON fight?\nCool! Rumble!', "You know who'd\nwin, you and me\none on one!", 'Blown\naway!')
end
map.setWildPokemon({260, 64}, {279, 117}, 0.0588235).type("LAND").mode("RED").add(51, 24, "ODDISH").add(51, 26, "PIDGEY").add(39, 23, "DITTO").add(25, 24, "VENONAT").add(25, 22, "ODDISH").add(25, 26, "VENONAT").add(13, 26, "ODDISH").add(13, 30, "GLOOM").add(11, 28, "PIDGEOTTO").add(3, 30, "PIDGEOTTO")
map.setWildPokemon({260, 64}, {279, 117}, 0.0588235).type("LAND").mode("BLUE").add(51, 24, "BELLSPROUT").add(51, 26, "PIDGEY").add(39, 23, "DITTO").add(25, 24, "VENONAT").add(25, 22, "BELLSPROUT").add(25, 26, "VENONAT").add(13, 26, "BELLSPROUT").add(13, 30, "WEEPINBELL").add(11, 28, "PIDGEOTTO").add(3, 30, "PIDGEOTTO")
--map: ROUTE_15
map.createObject(241, 70).setSprite("lass").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_15_241_70(player, true) end)
map.createObject(241, 69).onTouch(function(player) possiblyBattleROUTE_15_241_70(player, false) end)
map.createObject(241, 68).onTouch(function(player) possiblyBattleROUTE_15_241_70(player, false) end)
function possiblyBattleROUTE_15_241_70(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_15_241_70", "JR.TRAINER#FEMALE", "jr.trainerf", {{28, "GLOOM"}, {28, "ODDISH"}, {28, "ODDISH"}}, 'Let me try out the\nPOKEMON I just\ngot in a trade!', "You can't change\nthe nickname of\nany POKEMON you\nget in a trade.", 'Not\ngood enough!')
end
map.createObject(253, 71).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_15_253_71(player, true) end)
map.createObject(252, 71).onTouch(function(player) possiblyBattleROUTE_15_253_71(player, false) end)
map.createObject(251, 71).onTouch(function(player) possiblyBattleROUTE_15_253_71(player, false) end)
map.createObject(250, 71).onTouch(function(player) possiblyBattleROUTE_15_253_71(player, false) end)
function possiblyBattleROUTE_15_253_71(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_15_253_71", "JR.TRAINER#FEMALE", "jr.trainerf", {{29, "PIKACHU"}, {29, "RAICHU"}}, 'You look gentle,\nso I think I can\nbeat you!', "I'm afraid of\nBIKERs, they look\nso ugly and mean!", 'No,\nwrong!')
end
map.createObject(231, 68).setSprite("black_hair_boy_1").setDirection("UP").onUse(function(player) possiblyBattleROUTE_15_231_68(player, true) end)
map.createObject(231, 69).onTouch(function(player) possiblyBattleROUTE_15_231_68(player, false) end)
map.createObject(231, 70).onTouch(function(player) possiblyBattleROUTE_15_231_68(player, false) end)
map.createObject(231, 71).onTouch(function(player) possiblyBattleROUTE_15_231_68(player, false) end)
function possiblyBattleROUTE_15_231_68(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_15_231_68", "BIRD KEEPER", "birdkeeper", {{26, "PIDGEOTTO"}, {26, "FARFETCHD"}, {26, "DODUO"}, {26, "PIDGEY"}}, 'When I whistle, I\ncan summon bird\nPOKEMON!', "Maybe I'm not cut\nout for battles.", "Ow!\nThat's tragic!")
end
map.createObject(235, 68).setSprite("black_hair_boy_1").setDirection("UP").onUse(function(player) possiblyBattleROUTE_15_235_68(player, true) end)
map.createObject(235, 69).onTouch(function(player) possiblyBattleROUTE_15_235_68(player, false) end)
map.createObject(235, 70).onTouch(function(player) possiblyBattleROUTE_15_235_68(player, false) end)
map.createObject(235, 71).onTouch(function(player) possiblyBattleROUTE_15_235_68(player, false) end)
function possiblyBattleROUTE_15_235_68(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_15_235_68", "BIRD KEEPER", "birdkeeper", {{28, "DODRIO"}, {28, "DODUO"}, {28, "DODUO"}}, "Hmm? My birds are\nshivering! You're\ngood, aren't you?", "Did you know moves\nlike EARTHQUAKE\ndon't have any\neffect on birds?", 'Just\nas I thought!')
end
map.createObject(253, 70).setSprite("foulard_woman").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_15_253_70(player, true) end)
map.createObject(253, 69).onTouch(function(player) possiblyBattleROUTE_15_253_70(player, false) end)
map.createObject(253, 68).onTouch(function(player) possiblyBattleROUTE_15_253_70(player, false) end)
function possiblyBattleROUTE_15_253_70(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_15_253_70", "BEAUTY", "beauty", {{29, "PIDGEOTTO"}, {29, "WIGGLYTUFF"}}, "Oh, you're a\nlittle cutie!", 'I forgive you!\nI can take it!', 'You looked\nso cute too!')
end
map.createObject(241, 71).setSprite("foulard_woman").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_15_241_71(player, true) end)
map.createObject(242, 71).onTouch(function(player) possiblyBattleROUTE_15_241_71(player, false) end)
map.createObject(243, 71).onTouch(function(player) possiblyBattleROUTE_15_241_71(player, false) end)
map.createObject(244, 71).onTouch(function(player) possiblyBattleROUTE_15_241_71(player, false) end)
function possiblyBattleROUTE_15_241_71(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_15_241_71", "BEAUTY", "beauty", {{29, "BULBASAUR"}, {29, "IVYSAUR"}}, 'I raise POKEMON\nbecause I live\nalone!', 'I just like going\nhome to be with\nmy POKEMON!', "I didn't\nask for this!")
end
map.createObject(248, 71).setSprite("biker").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_15_248_71(player, true) end)
map.createObject(248, 70).onTouch(function(player) possiblyBattleROUTE_15_248_71(player, false) end)
map.createObject(248, 69).onTouch(function(player) possiblyBattleROUTE_15_248_71(player, false) end)
map.createObject(248, 68).onTouch(function(player) possiblyBattleROUTE_15_248_71(player, false) end)
function possiblyBattleROUTE_15_248_71(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_15_248_71", "BIKER", "biker", {{25, "KOFFING"}, {25, "KOFFING"}, {25, "WEEZING"}, {25, "KOFFING"}, {25, "GRIMER"}}, "Hey kid! C'mon!\nI just got these!", 'You only live\nonce, so I live\nas an outlaw!\nTEAM ROCKET RULES!', 'Why\nnot?')
end
map.createObject(246, 71).setSprite("biker").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_15_246_71(player, true) end)
map.createObject(246, 70).onTouch(function(player) possiblyBattleROUTE_15_246_71(player, false) end)
map.createObject(246, 69).onTouch(function(player) possiblyBattleROUTE_15_246_71(player, false) end)
map.createObject(246, 68).onTouch(function(player) possiblyBattleROUTE_15_246_71(player, false) end)
function possiblyBattleROUTE_15_246_71(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_15_246_71", "BIKER", "biker", {{28, "KOFFING"}, {28, "GRIMER"}, {28, "WEEZING"}}, 'Fork over all your\ncash when you\nlose to me, kid!', 'I was just joking\nabout the money!', "That\ncan't be true!")
end
map.createObject(237, 76).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_15_237_76(player, true) end)
map.createObject(238, 76).onTouch(function(player) possiblyBattleROUTE_15_237_76(player, false) end)
map.createObject(239, 76).onTouch(function(player) possiblyBattleROUTE_15_237_76(player, false) end)
map.createObject(240, 76).onTouch(function(player) possiblyBattleROUTE_15_237_76(player, false) end)
function possiblyBattleROUTE_15_237_76(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_15_237_76", "JR.TRAINER#FEMALE", "jr.trainerf", {{33, "CLEFAIRY"}}, "What's cool?\nTrading POKEMON!", 'I trade POKEMON\nwith my friends!', 'I\nsaid trade!')
end
map.createObject(218, 68).setSprite("lass").setDirection("UP").onUse(function(player) possiblyBattleROUTE_15_218_68(player, true) end)
map.createObject(218, 69).onTouch(function(player) possiblyBattleROUTE_15_218_68(player, false) end)
map.createObject(218, 70).onTouch(function(player) possiblyBattleROUTE_15_218_68(player, false) end)
map.createObject(218, 71).onTouch(function(player) possiblyBattleROUTE_15_218_68(player, false) end)
function possiblyBattleROUTE_15_218_68(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_15_218_68", "JR.TRAINER#FEMALE", "jr.trainerf", {{29, "BELLSPROUT"}, {29, "ODDISH"}, {29, "TANGELA"}}, 'Want to play with\nmy POKEMON?', "I'll go train with\nweaker people.@@", 'I was\ntoo impatient!')
end
map.createObject(218, 76).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "ROUTE_15_218_76", "TM 20") end)
map.setWildPokemon({200, 64}, {259, 81}, 0.0588235).type("LAND").mode("RED").add(51, 24, "ODDISH").add(51, 26, "DITTO").add(39, 23, "PIDGEY").add(25, 26, "VENONAT").add(25, 22, "ODDISH").add(25, 28, "VENONAT").add(13, 26, "ODDISH").add(13, 30, "GLOOM").add(11, 28, "PIDGEOTTO").add(3, 30, "PIDGEOTTO")
map.setWildPokemon({200, 64}, {259, 81}, 0.0588235).type("LAND").mode("BLUE").add(51, 24, "BELLSPROUT").add(51, 26, "DITTO").add(39, 23, "PIDGEY").add(25, 26, "VENONAT").add(25, 22, "BELLSPROUT").add(25, 28, "VENONAT").add(13, 26, "BELLSPROUT").add(13, 30, "WEEPINBELL").add(11, 28, "PIDGEOTTO").add(3, 30, "PIDGEOTTO")
--map: ROUTE_16
map.createObject(127, 231).setSprite("biker").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_16_127_231(player, true) end)
map.createObject(126, 231).onTouch(function(player) possiblyBattleROUTE_16_127_231(player, false) end)
map.createObject(125, 231).onTouch(function(player) possiblyBattleROUTE_16_127_231(player, false) end)
map.createObject(124, 231).onTouch(function(player) possiblyBattleROUTE_16_127_231(player, false) end)
function possiblyBattleROUTE_16_127_231(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_16_127_231", "BIKER", "biker", {{29, "GRIMER"}, {29, "KOFFING"}}, 'What do you want?', "We like just\nhanging here,\nwhat's it to you?", "Don't you\ndare laugh!")
end
map.createObject(124, 230).setSprite("biker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_16_124_230(player, true) end)
map.createObject(125, 230).onTouch(function(player) possiblyBattleROUTE_16_124_230(player, false) end)
map.createObject(126, 230).onTouch(function(player) possiblyBattleROUTE_16_124_230(player, false) end)
function possiblyBattleROUTE_16_124_230(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_16_124_230", "CUE BALL", "cueball", {{28, "MACHOP"}, {28, "MANKEY"}, {28, "MACHOP"}}, 'Nice BIKE!\nHand it over!', 'Forget it, who\nneeds your BIKE!', 'Knock\nout!')
end
map.createObject(121, 231).setSprite("biker").setDirection("UP").onUse(function(player) possiblyBattleROUTE_16_121_231(player, true) end)
map.createObject(121, 232).onTouch(function(player) possiblyBattleROUTE_16_121_231(player, false) end)
map.createObject(121, 233).onTouch(function(player) possiblyBattleROUTE_16_121_231(player, false) end)
function possiblyBattleROUTE_16_121_231(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_16_121_231", "CUE BALL", "cueball", {{29, "MANKEY"}, {29, "MACHOP"}}, 'Come out and play,\nlittle mouse!', 'I hate losing!\nGet away from me!', 'You\nlittle rat!')
end
map.createObject(119, 232).setSprite("biker").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_16_119_232(player, true) end)
map.createObject(118, 232).onTouch(function(player) possiblyBattleROUTE_16_119_232(player, false) end)
map.createObject(117, 232).onTouch(function(player) possiblyBattleROUTE_16_119_232(player, false) end)
function possiblyBattleROUTE_16_119_232(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_16_119_232", "BIKER", "biker", {{33, "WEEZING"}}, 'Hey, you just\nbumped me!', 'You can also get\nto FUCHSIA from\nVERMILION using a\ncoastal road.', 'Kaboom!')
end
map.createObject(116, 233).setSprite("biker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_16_116_233(player, true) end)
map.createObject(117, 233).onTouch(function(player) possiblyBattleROUTE_16_116_233(player, false) end)
map.createObject(118, 233).onTouch(function(player) possiblyBattleROUTE_16_116_233(player, false) end)
function possiblyBattleROUTE_16_116_233(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_16_116_233", "CUE BALL", "cueball", {{33, "MACHOP"}}, "I'm feeling\nhungry and mean!", 'I like my POKEMON\nferocious! They\ntear up enemies!', 'Bad,\nbad, bad!')
end
map.createObject(113, 231).setSprite("biker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_16_113_231(player, true) end)
map.createObject(114, 231).onTouch(function(player) possiblyBattleROUTE_16_113_231(player, false) end)
map.createObject(115, 231).onTouch(function(player) possiblyBattleROUTE_16_113_231(player, false) end)
map.createObject(116, 231).onTouch(function(player) possiblyBattleROUTE_16_113_231(player, false) end)
map.createObject(117, 231).onTouch(function(player) possiblyBattleROUTE_16_113_231(player, false) end)
function possiblyBattleROUTE_16_113_231(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_16_113_231", "BIKER", "biker", {{26, "GRIMER"}, {26, "GRIMER"}, {26, "GRIMER"}, {26, "GRIMER"}}, "Sure, I'll go!", 'I like harassing\npeople with my\nvicious POKEMON!', "Don't make\nme mad!")
end
map.createObject(136, 233).setSprite("snorlax").setDirection("DOWN")--[[['7 ; person']--]]
map.setWildPokemon({110, 226}, {149, 243}, 0.0980392).type("LAND").add(51, 20, "SPEAROW").add(51, 22, "SPEAROW").add(39, 18, "RATTATA").add(25, 20, "DODUO").add(25, 20, "RATTATA").add(25, 18, "DODUO").add(13, 22, "DODUO").add(13, 22, "RATTATA").add(11, 23, "RATICATE").add(3, 25, "RATICATE")
--map: ROUTE_17
map.createObject(122, 206).setSprite("biker").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_17_122_206(player, true) end)
map.createObject(121, 206).onTouch(function(player) possiblyBattleROUTE_17_122_206(player, false) end)
map.createObject(120, 206).onTouch(function(player) possiblyBattleROUTE_17_122_206(player, false) end)
map.createObject(119, 206).onTouch(function(player) possiblyBattleROUTE_17_122_206(player, false) end)
function possiblyBattleROUTE_17_122_206(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_17_122_206", "CUE BALL", "cueball", {{29, "MANKEY"}, {29, "PRIMEAPE"}}, "There's no money\nin fighting kids!", 'Good stuff is\nlying around on\nCYCLING ROAD!', 'Burned\nout!')
end
map.createObject(121, 209).setSprite("biker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_17_121_209(player, true) end)
map.createObject(122, 209).onTouch(function(player) possiblyBattleROUTE_17_121_209(player, false) end)
map.createObject(123, 209).onTouch(function(player) possiblyBattleROUTE_17_121_209(player, false) end)
map.createObject(124, 209).onTouch(function(player) possiblyBattleROUTE_17_121_209(player, false) end)
map.createObject(125, 209).onTouch(function(player) possiblyBattleROUTE_17_121_209(player, false) end)
function possiblyBattleROUTE_17_121_209(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_17_121_209", "CUE BALL", "cueball", {{29, "MACHOP"}, {29, "MACHOKE"}}, 'What do you want,\nkiddo?', 'I could belly-\nbump you outta\nhere!', 'Whoo!')
end
map.createObject(114, 207).setSprite("biker").setDirection("UP").onUse(function(player) possiblyBattleROUTE_17_114_207(player, true) end)
map.createObject(114, 208).onTouch(function(player) possiblyBattleROUTE_17_114_207(player, false) end)
map.createObject(114, 209).onTouch(function(player) possiblyBattleROUTE_17_114_207(player, false) end)
map.createObject(114, 210).onTouch(function(player) possiblyBattleROUTE_17_114_207(player, false) end)
map.createObject(114, 211).onTouch(function(player) possiblyBattleROUTE_17_114_207(player, false) end)
function possiblyBattleROUTE_17_114_207(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_17_114_207", "BIKER", "biker", {{28, "WEEZING"}, {28, "KOFFING"}, {28, "WEEZING"}}, 'You heading to\nFUCHSIA?', 'I love racing\ndownhill!', 'Crash and\nburn!')
end
map.createObject(117, 193).setSprite("biker").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_17_117_193(player, true) end)
map.createObject(116, 193).onTouch(function(player) possiblyBattleROUTE_17_117_193(player, false) end)
map.createObject(115, 193).onTouch(function(player) possiblyBattleROUTE_17_117_193(player, false) end)
map.createObject(114, 193).onTouch(function(player) possiblyBattleROUTE_17_117_193(player, false) end)
map.createObject(113, 193).onTouch(function(player) possiblyBattleROUTE_17_117_193(player, false) end)
function possiblyBattleROUTE_17_117_193(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_17_117_193", "BIKER", "biker", {{33, "MUK"}}, "We're BIKERs!\nHighway stars!", 'Are you looking\nfor adventure?', 'Smoked!')
end
map.createObject(124, 191).setSprite("biker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_17_124_191(player, true) end)
map.createObject(125, 191).onTouch(function(player) possiblyBattleROUTE_17_124_191(player, false) end)
map.createObject(126, 191).onTouch(function(player) possiblyBattleROUTE_17_124_191(player, false) end)
map.createObject(127, 191).onTouch(function(player) possiblyBattleROUTE_17_124_191(player, false) end)
function possiblyBattleROUTE_17_124_191(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_17_124_191", "BIKER", "biker", {{29, "VOLTORB"}, {29, "VOLTORB"}}, 'Let VOLTORB\nelectrify you!', 'I got my VOLTORB\nat the abandoned\nPOWER PLANT.', 'Grounded\nout!')
end
map.createObject(127, 167).setSprite("biker").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_17_127_167(player, true) end)
map.createObject(126, 167).onTouch(function(player) possiblyBattleROUTE_17_127_167(player, false) end)
map.createObject(125, 167).onTouch(function(player) possiblyBattleROUTE_17_127_167(player, false) end)
function possiblyBattleROUTE_17_127_167(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_17_127_167", "CUE BALL", "cueball", {{33, "MACHOKE"}}, "My POKEMON won't\nevolve! Why?", 'Maybe some POKEMON\nneed element\nSTONEs to evolve.', 'Why,\nyou!')
end
map.createObject(112, 157).setSprite("biker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_17_112_157(player, true) end)
map.createObject(113, 157).onTouch(function(player) possiblyBattleROUTE_17_112_157(player, false) end)
map.createObject(114, 157).onTouch(function(player) possiblyBattleROUTE_17_112_157(player, false) end)
map.createObject(115, 157).onTouch(function(player) possiblyBattleROUTE_17_112_157(player, false) end)
map.createObject(116, 157).onTouch(function(player) possiblyBattleROUTE_17_112_157(player, false) end)
function possiblyBattleROUTE_17_112_157(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_17_112_157", "CUE BALL", "cueball", {{26, "MANKEY"}, {26, "MANKEY"}, {26, "MACHOKE"}, {26, "MACHOP"}}, 'I need a little\nexercise!', "I'm sure I lost\nweight there!", 'Whew!\nGood workout!')
end
map.createObject(124, 127).setSprite("biker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_17_124_127(player, true) end)
map.createObject(125, 127).onTouch(function(player) possiblyBattleROUTE_17_124_127(player, false) end)
map.createObject(126, 127).onTouch(function(player) possiblyBattleROUTE_17_124_127(player, false) end)
function possiblyBattleROUTE_17_124_127(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_17_124_127", "CUE BALL", "cueball", {{29, "PRIMEAPE"}, {29, "MACHOKE"}}, 'Be a rebel!', 'Be ready to fight\nfor your beliefs!', 'Aaaargh!')
end
map.createObject(115, 127).setSprite("biker").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_17_115_127(player, true) end)
map.createObject(114, 127).onTouch(function(player) possiblyBattleROUTE_17_115_127(player, false) end)
map.createObject(113, 127).onTouch(function(player) possiblyBattleROUTE_17_115_127(player, false) end)
map.createObject(112, 127).onTouch(function(player) possiblyBattleROUTE_17_115_127(player, false) end)
function possiblyBattleROUTE_17_115_127(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_17_115_127", "BIKER", "biker", {{29, "WEEZING"}, {29, "MUK"}}, "Nice BIKE!\nHow's it handle?", 'The slope makes\nit hard to steer!', 'Shoot!')
end
map.createObject(120, 107).setSprite("biker").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_17_120_107(player, true) end)
map.createObject(120, 106).onTouch(function(player) possiblyBattleROUTE_17_120_107(player, false) end)
map.createObject(120, 105).onTouch(function(player) possiblyBattleROUTE_17_120_107(player, false) end)
map.createObject(120, 104).onTouch(function(player) possiblyBattleROUTE_17_120_107(player, false) end)
map.createObject(120, 103).onTouch(function(player) possiblyBattleROUTE_17_120_107(player, false) end)
function possiblyBattleROUTE_17_120_107(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_17_120_107", "BIKER", "biker", {{25, "KOFFING"}, {25, "WEEZING"}, {25, "KOFFING"}, {25, "KOFFING"}, {25, "WEEZING"}}, "Get lost kid!\nI'm bushed!", 'I need to catch\na few Zs!', 'Are you\nsatisfied?')
end
map.setWildPokemon({110, 82}, {129, 225}, 0.0980392).type("LAND").add(51, 20, "SPEAROW").add(51, 22, "SPEAROW").add(39, 25, "RATICATE").add(25, 24, "DODUO").add(25, 27, "RATICATE").add(25, 26, "DODUO").add(13, 28, "DODUO").add(13, 29, "RATICATE").add(11, 25, "FEAROW").add(3, 27, "FEAROW")
--map: ROUTE_18
map.createObject(146, 70).setSprite("black_hair_boy_1").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_18_146_70(player, true) end)
map.createObject(147, 70).onTouch(function(player) possiblyBattleROUTE_18_146_70(player, false) end)
map.createObject(148, 70).onTouch(function(player) possiblyBattleROUTE_18_146_70(player, false) end)
map.createObject(149, 70).onTouch(function(player) possiblyBattleROUTE_18_146_70(player, false) end)
function possiblyBattleROUTE_18_146_70(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_18_146_70", "BIRD KEEPER", "birdkeeper", {{29, "SPEAROW"}, {29, "FEAROW"}}, 'I always check\nevery grassy area\nfor new POKEMON.', 'I wish I had a\nBIKE!', 'Tch!')
end
map.createObject(150, 66).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_18_150_66(player, true) end)
map.createObject(149, 66).onTouch(function(player) possiblyBattleROUTE_18_150_66(player, false) end)
map.createObject(148, 66).onTouch(function(player) possiblyBattleROUTE_18_150_66(player, false) end)
map.createObject(147, 66).onTouch(function(player) possiblyBattleROUTE_18_150_66(player, false) end)
function possiblyBattleROUTE_18_150_66(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_18_150_66", "BIRD KEEPER", "birdkeeper", {{34, "DODRIO"}}, 'Kurukkoo!\nHow do you like\nmy bird call?', 'I also collect sea\nPOKEMON on\nweekends!', 'I\nhad to bug you!')
end
map.createObject(152, 68).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_18_152_68(player, true) end)
map.createObject(151, 68).onTouch(function(player) possiblyBattleROUTE_18_152_68(player, false) end)
map.createObject(150, 68).onTouch(function(player) possiblyBattleROUTE_18_152_68(player, false) end)
map.createObject(149, 68).onTouch(function(player) possiblyBattleROUTE_18_152_68(player, false) end)
map.createObject(148, 68).onTouch(function(player) possiblyBattleROUTE_18_152_68(player, false) end)
function possiblyBattleROUTE_18_152_68(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_18_152_68", "BIRD KEEPER", "birdkeeper", {{26, "SPEAROW"}, {26, "SPEAROW"}, {26, "FEAROW"}, {26, "SPEAROW"}}, 'This is my turf!\nGet out of here!', 'This is my fave\nPOKEMON hunting\narea!', 'Darn!')
end
map.setWildPokemon({110, 64}, {159, 81}, 0.0980392).type("LAND").add(51, 20, "SPEAROW").add(51, 22, "SPEAROW").add(39, 25, "RATICATE").add(25, 24, "DODUO").add(25, 25, "FEAROW").add(25, 26, "DODUO").add(13, 28, "DODUO").add(13, 29, "RATICATE").add(11, 27, "FEAROW").add(3, 29, "FEAROW")
--map: ROUTE_19
map.createObject(178, 46).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_19_178_46(player, true) end)
map.createObject(177, 46).onTouch(function(player) possiblyBattleROUTE_19_178_46(player, false) end)
map.createObject(176, 46).onTouch(function(player) possiblyBattleROUTE_19_178_46(player, false) end)
map.createObject(175, 46).onTouch(function(player) possiblyBattleROUTE_19_178_46(player, false) end)
map.createObject(174, 46).onTouch(function(player) possiblyBattleROUTE_19_178_46(player, false) end)
function possiblyBattleROUTE_19_178_46(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_19_178_46", "SWIMMER", "swimmer", {{30, "TENTACOOL"}, {30, "SHELLDER"}}, 'Have to warm up\nbefore my swim!', "Thanks, kid! I'm\nready for a swim!", 'All\nwarmed up!')
end
map.createObject(183, 46).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_19_183_46(player, true) end)
map.createObject(182, 46).onTouch(function(player) possiblyBattleROUTE_19_183_46(player, false) end)
map.createObject(181, 46).onTouch(function(player) possiblyBattleROUTE_19_183_46(player, false) end)
map.createObject(180, 46).onTouch(function(player) possiblyBattleROUTE_19_183_46(player, false) end)
function possiblyBattleROUTE_19_183_46(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_19_183_46", "SWIMMER", "swimmer", {{29, "GOLDEEN"}, {29, "HORSEA"}, {29, "STARYU"}}, "Wait! You'll have\na heart attack!", 'Watch out for\nTENTACOOL!', "Ooh!\nThat's chilly!")
end
map.createObject(183, 28).setSprite("swimmer").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_19_183_28(player, true) end)
map.createObject(182, 28).onTouch(function(player) possiblyBattleROUTE_19_183_28(player, false) end)
map.createObject(181, 28).onTouch(function(player) possiblyBattleROUTE_19_183_28(player, false) end)
map.createObject(180, 28).onTouch(function(player) possiblyBattleROUTE_19_183_28(player, false) end)
function possiblyBattleROUTE_19_183_28(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_19_183_28", "SWIMMER", "swimmer", {{30, "POLIWAG"}, {30, "POLIWHIRL"}}, 'I love swimming!\nWhat about you?', 'I can beat POKEMON\nat swimming!', 'Belly\nflop!')
end
map.createObject(174, 26).setSprite("swimmer").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_19_174_26(player, true) end)
map.createObject(175, 26).onTouch(function(player) possiblyBattleROUTE_19_174_26(player, false) end)
map.createObject(176, 26).onTouch(function(player) possiblyBattleROUTE_19_174_26(player, false) end)
map.createObject(177, 26).onTouch(function(player) possiblyBattleROUTE_19_174_26(player, false) end)
map.createObject(178, 26).onTouch(function(player) possiblyBattleROUTE_19_174_26(player, false) end)
function possiblyBattleROUTE_19_174_26(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_19_174_26", "SWIMMER", "swimmer", {{27, "HORSEA"}, {27, "TENTACOOL"}, {27, "TENTACOOL"}, {27, "GOLDEEN"}}, "What's beyond the\nhorizon?", 'I see a couple of\nislands!', 'Glub!')
end
map.createObject(186, 22).setSprite("swimmer").setDirection("UP").onUse(function(player) possiblyBattleROUTE_19_186_22(player, true) end)
map.createObject(186, 23).onTouch(function(player) possiblyBattleROUTE_19_186_22(player, false) end)
map.createObject(186, 24).onTouch(function(player) possiblyBattleROUTE_19_186_22(player, false) end)
map.createObject(186, 25).onTouch(function(player) possiblyBattleROUTE_19_186_22(player, false) end)
map.createObject(186, 26).onTouch(function(player) possiblyBattleROUTE_19_186_22(player, false) end)
function possiblyBattleROUTE_19_186_22(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_19_186_22", "SWIMMER", "swimmer", {{29, "GOLDEEN"}, {29, "SHELLDER"}, {29, "SEAKING"}}, 'I tried diving\nfor POKEMON, but\nit was a no go!', 'You have to fish\nfor sea POKEMON!', 'Help!')
end
map.createObject(179, 42).setSprite("swimmer").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_19_179_42(player, true) end)
map.createObject(179, 41).onTouch(function(player) possiblyBattleROUTE_19_179_42(player, false) end)
map.createObject(179, 40).onTouch(function(player) possiblyBattleROUTE_19_179_42(player, false) end)
map.createObject(179, 39).onTouch(function(player) possiblyBattleROUTE_19_179_42(player, false) end)
map.createObject(179, 38).onTouch(function(player) possiblyBattleROUTE_19_179_42(player, false) end)
function possiblyBattleROUTE_19_179_42(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_19_179_42", "SWIMMER", "swimmer", {{30, "HORSEA"}, {30, "HORSEA"}}, 'I look at the\nsea to forget!', "I'm looking at the\nsea to forget!", 'Ooh!\nTraumatic!')
end
map.createObject(178, 10).setSprite("swimmer").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_19_178_10(player, true) end)
map.createObject(177, 10).onTouch(function(player) possiblyBattleROUTE_19_178_10(player, false) end)
map.createObject(176, 10).onTouch(function(player) possiblyBattleROUTE_19_178_10(player, false) end)
map.createObject(175, 10).onTouch(function(player) possiblyBattleROUTE_19_178_10(player, false) end)
function possiblyBattleROUTE_19_178_10(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_19_178_10", "BEAUTY", "beauty", {{27, "POLIWAG"}, {27, "GOLDEEN"}, {27, "SEAKING"}, {27, "GOLDEEN"}, {27, "POLIWAG"}}, 'Oh, I just love\nyour ride! Can I\nhave it if I win?', "It's still a long\nway to go to\nSEAFOAM ISLANDS.", 'Oh!\nI lost!')
end
map.createObject(181, 10).setSprite("swimmer").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_19_181_10(player, true) end)
map.createObject(182, 10).onTouch(function(player) possiblyBattleROUTE_19_181_10(player, false) end)
map.createObject(183, 10).onTouch(function(player) possiblyBattleROUTE_19_181_10(player, false) end)
map.createObject(184, 10).onTouch(function(player) possiblyBattleROUTE_19_181_10(player, false) end)
map.createObject(185, 10).onTouch(function(player) possiblyBattleROUTE_19_181_10(player, false) end)
function possiblyBattleROUTE_19_181_10(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_19_181_10", "BEAUTY", "beauty", {{30, "GOLDEEN"}, {30, "SEAKING"}}, "Swimming's great!\nSunburns aren't!", 'My boy friend\nwanted to swim to\nSEAFOAM ISLANDS.', 'Shocker!')
end
map.createObject(179, 11).setSprite("swimmer").setDirection("UP").onUse(function(player) possiblyBattleROUTE_19_179_11(player, true) end)
map.createObject(179, 12).onTouch(function(player) possiblyBattleROUTE_19_179_11(player, false) end)
map.createObject(179, 13).onTouch(function(player) possiblyBattleROUTE_19_179_11(player, false) end)
map.createObject(179, 14).onTouch(function(player) possiblyBattleROUTE_19_179_11(player, false) end)
map.createObject(179, 15).onTouch(function(player) possiblyBattleROUTE_19_179_11(player, false) end)
function possiblyBattleROUTE_19_179_11(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_19_179_11", "SWIMMER", "swimmer", {{27, "TENTACOOL"}, {27, "TENTACOOL"}, {27, "STARYU"}, {27, "HORSEA"}, {27, "TENTACRUEL"}}, 'These waters are\ntreacherous!', 'I got a cramp!\nGlub, glub...', 'Ooh!\nDangerous!')
end
map.createObject(180, 9).setSprite("swimmer").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_19_180_9(player, true) end)
map.createObject(180, 8).onTouch(function(player) possiblyBattleROUTE_19_180_9(player, false) end)
map.createObject(180, 7).onTouch(function(player) possiblyBattleROUTE_19_180_9(player, false) end)
map.createObject(180, 6).onTouch(function(player) possiblyBattleROUTE_19_180_9(player, false) end)
map.createObject(180, 5).onTouch(function(player) possiblyBattleROUTE_19_180_9(player, false) end)
function possiblyBattleROUTE_19_180_9(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_19_180_9", "BEAUTY", "beauty", {{29, "STARYU"}, {29, "STARYU"}, {29, "STARYU"}}, "I swam here, but\nI'm tired.", 'LAPRAS is so big,\nit must keep you\ndry on water.', "I'm\nexhausted...")
end
map.setWildPokemon({170, 0}, {189, 53}, 0.0196078).type("WATER").add(51, 5, "TENTACOOL").add(51, 10, "TENTACOOL").add(39, 15, "TENTACOOL").add(25, 5, "TENTACOOL").add(25, 10, "TENTACOOL").add(25, 15, "TENTACOOL").add(13, 20, "TENTACOOL").add(13, 30, "TENTACOOL").add(11, 35, "TENTACOOL").add(3, 40, "TENTACOOL")
--map: ROUTE_2
map.createObject(63, 215).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "ROUTE_2_63_215", "MOON STONE") end)
map.createObject(63, 224).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "ROUTE_2_63_224", "HP UP") end)
map.setWildPokemon({50, 198}, {69, 269}, 0.0980392).type("LAND").mode("RED").add(51, 3, "RATTATA").add(51, 3, "PIDGEY").add(39, 4, "PIDGEY").add(25, 4, "RATTATA").add(25, 5, "PIDGEY").add(25, 3, "WEEDLE").add(13, 2, "RATTATA").add(13, 5, "RATTATA").add(11, 4, "WEEDLE").add(3, 5, "WEEDLE")
map.setWildPokemon({50, 198}, {69, 269}, 0.0980392).type("LAND").mode("BLUE").add(51, 3, "RATTATA").add(51, 3, "PIDGEY").add(39, 4, "PIDGEY").add(25, 4, "RATTATA").add(25, 5, "PIDGEY").add(25, 3, "CATERPIE").add(13, 2, "RATTATA").add(13, 5, "RATTATA").add(11, 4, "CATERPIE").add(3, 5, "CATERPIE")
--map: ROUTE_20
map.createObject(157, 9).setSprite("swimmer").setDirection("UP").onUse(function(player) possiblyBattleROUTE_20_157_9(player, true) end)
map.createObject(157, 10).onTouch(function(player) possiblyBattleROUTE_20_157_9(player, false) end)
map.createObject(157, 11).onTouch(function(player) possiblyBattleROUTE_20_157_9(player, false) end)
map.createObject(157, 12).onTouch(function(player) possiblyBattleROUTE_20_157_9(player, false) end)
map.createObject(157, 13).onTouch(function(player) possiblyBattleROUTE_20_157_9(player, false) end)
function possiblyBattleROUTE_20_157_9(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_20_157_9", "SWIMMER", "swimmer", {{31, "SHELLDER"}, {31, "CLOYSTER"}}, 'The water is\nshallow here.', 'I wish I could\nride my POKEMON.', 'Splash!')
end
map.createObject(138, 6).setSprite("swimmer").setDirection("UP").onUse(function(player) possiblyBattleROUTE_20_138_6(player, true) end)
map.createObject(138, 7).onTouch(function(player) possiblyBattleROUTE_20_138_6(player, false) end)
map.createObject(138, 8).onTouch(function(player) possiblyBattleROUTE_20_138_6(player, false) end)
map.createObject(138, 9).onTouch(function(player) possiblyBattleROUTE_20_138_6(player, false) end)
map.createObject(138, 10).onTouch(function(player) possiblyBattleROUTE_20_138_6(player, false) end)
function possiblyBattleROUTE_20_138_6(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_20_138_6", "BEAUTY", "beauty", {{30, "SEADRA"}, {30, "HORSEA"}, {30, "SEADRA"}}, 'SEAFOAM is a\nquiet getaway!', "There's a huge\ncavern underneath\nthis island.", 'Quit it!')
end
map.createObject(115, 7).setSprite("swimmer").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_20_115_7(player, true) end)
map.createObject(115, 6).onTouch(function(player) possiblyBattleROUTE_20_115_7(player, false) end)
map.createObject(115, 5).onTouch(function(player) possiblyBattleROUTE_20_115_7(player, false) end)
function possiblyBattleROUTE_20_115_7(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_20_115_7", "BEAUTY", "beauty", {{35, "SEAKING"}}, 'I love floating\nwith the fishes!', 'Want to float\nwith me?', 'Yowch!')
end
map.createObject(125, 3).setSprite("swimmer").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_20_125_3(player, true) end)
map.createObject(126, 3).onTouch(function(player) possiblyBattleROUTE_20_125_3(player, false) end)
map.createObject(127, 3).onTouch(function(player) possiblyBattleROUTE_20_125_3(player, false) end)
map.createObject(128, 3).onTouch(function(player) possiblyBattleROUTE_20_125_3(player, false) end)
map.createObject(129, 3).onTouch(function(player) possiblyBattleROUTE_20_125_3(player, false) end)
function possiblyBattleROUTE_20_125_3(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_20_125_3", "JR.TRAINER#FEMALE", "jr.trainerf", {{30, "TENTACOOL"}, {30, "HORSEA"}, {30, "SEEL"}}, 'Are you on\nvacation too?', 'SEAFOAM used to\nbe one island!', 'No\nmercy at all!')
end
map.createObject(108, 4).setSprite("swimmer").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_20_108_4(player, true) end)
map.createObject(108, 3).onTouch(function(player) possiblyBattleROUTE_20_108_4(player, false) end)
map.createObject(108, 2).onTouch(function(player) possiblyBattleROUTE_20_108_4(player, false) end)
map.createObject(108, 1).onTouch(function(player) possiblyBattleROUTE_20_108_4(player, false) end)
function possiblyBattleROUTE_20_108_4(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_20_108_4", "SWIMMER", "swimmer", {{35, "STARYU"}}, 'Check out my buff\nphysique!', "I should've been\nbuffing up my\nPOKEMON, not me!", 'Wimpy!')
end
map.createObject(157, 4).setSprite("swimmer").setDirection("UP").onUse(function(player) possiblyBattleROUTE_20_157_4(player, true) end)
map.createObject(157, 5).onTouch(function(player) possiblyBattleROUTE_20_157_4(player, false) end)
map.createObject(157, 6).onTouch(function(player) possiblyBattleROUTE_20_157_4(player, false) end)
map.createObject(157, 7).onTouch(function(player) possiblyBattleROUTE_20_157_4(player, false) end)
map.createObject(157, 8).onTouch(function(player) possiblyBattleROUTE_20_157_4(player, false) end)
function possiblyBattleROUTE_20_157_4(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_20_157_4", "SWIMMER", "swimmer", {{28, "HORSEA"}, {28, "HORSEA"}, {28, "SEADRA"}, {28, "HORSEA"}}, "Why are you\nriding a POKEMON?\nCan't you swim?", 'Riding a POKEMON\nsure looks fun!', 'Ouch!\nTorpedoed!')
end
map.createObject(104, 8).setSprite("black_hair_boy_1").setDirection("UP").onUse(function(player) possiblyBattleROUTE_20_104_8(player, true) end)
map.createObject(104, 9).onTouch(function(player) possiblyBattleROUTE_20_104_8(player, false) end)
map.createObject(104, 10).onTouch(function(player) possiblyBattleROUTE_20_104_8(player, false) end)
function possiblyBattleROUTE_20_104_8(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_20_104_8", "BIRD KEEPER", "birdkeeper", {{30, "FEAROW"}, {30, "FEAROW"}, {30, "PIDGEOTTO"}}, 'I rode my bird\nPOKEMON here!', "My birds can't\nFLY me back!", 'Oh\nno!')
end
map.createObject(95, 10).setSprite("swimmer").setDirection("UP").onUse(function(player) possiblyBattleROUTE_20_95_10(player, true) end)
map.createObject(95, 11).onTouch(function(player) possiblyBattleROUTE_20_95_10(player, false) end)
map.createObject(95, 12).onTouch(function(player) possiblyBattleROUTE_20_95_10(player, false) end)
map.createObject(95, 13).onTouch(function(player) possiblyBattleROUTE_20_95_10(player, false) end)
map.createObject(95, 14).onTouch(function(player) possiblyBattleROUTE_20_95_10(player, false) end)
function possiblyBattleROUTE_20_95_10(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_20_95_10", "BEAUTY", "beauty", {{30, "SHELLDER"}, {30, "SHELLDER"}, {30, "CLOYSTER"}}, 'My boy friend gave\nme big pearls!', 'Will my pearls\ngrow bigger\ninside CLOYSTER?', "Don't\ntouch my pearls!")
end
map.createObject(94, 5).setSprite("swimmer").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_20_94_5(player, true) end)
map.createObject(94, 4).onTouch(function(player) possiblyBattleROUTE_20_94_5(player, false) end)
map.createObject(94, 3).onTouch(function(player) possiblyBattleROUTE_20_94_5(player, false) end)
map.createObject(94, 2).onTouch(function(player) possiblyBattleROUTE_20_94_5(player, false) end)
function possiblyBattleROUTE_20_94_5(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_20_94_5", "JR.TRAINER#FEMALE", "jr.trainerf", {{31, "GOLDEEN"}, {31, "SEAKING"}}, 'I swam here from\nCINNABAR ISLAND!', 'POKEMON have\ntaken over an\nabandoned mansion\non CINNABAR!', "I'm\nso disappointed!")
end
map.createObject(85, 9).setSprite("swimmer").setDirection("UP").onUse(function(player) possiblyBattleROUTE_20_85_9(player, true) end)
map.createObject(85, 10).onTouch(function(player) possiblyBattleROUTE_20_85_9(player, false) end)
map.createObject(85, 11).onTouch(function(player) possiblyBattleROUTE_20_85_9(player, false) end)
map.createObject(85, 12).onTouch(function(player) possiblyBattleROUTE_20_85_9(player, false) end)
map.createObject(85, 13).onTouch(function(player) possiblyBattleROUTE_20_85_9(player, false) end)
function possiblyBattleROUTE_20_85_9(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_20_85_9", "BEAUTY", "beauty", {{31, "POLIWAG"}, {31, "SEAKING"}}, 'CINNABAR, in the\nwest, has a LAB\nfor POKEMON.', 'CINNABAR is a \nvolcanic island!', 'Wait!')
end
map.setWildPokemon({70, 0}, {169, 17}, 0.0196078).type("WATER").add(51, 5, "TENTACOOL").add(51, 10, "TENTACOOL").add(39, 15, "TENTACOOL").add(25, 5, "TENTACOOL").add(25, 10, "TENTACOOL").add(25, 15, "TENTACOOL").add(13, 20, "TENTACOOL").add(13, 30, "TENTACOOL").add(11, 35, "TENTACOOL").add(3, 40, "TENTACOOL")
--map: ROUTE_21
map.createObject(54, 83).setSprite("fisher2").setDirection("LEFT").onUse(function(player)
    checkForTrainerBattle(player, true, "ROUTE_21_54_83", "FISHER", "fisher", {{28, "SEAKING"}, {28, "GOLDEEN"}, {28, "SEAKING"}, {28, "SEAKING"}}, 'You want to know\nif the fish are\nbiting?', "I can't catch\nanything good!", 'Dang!')
end)
map.createObject(56, 82).setSprite("fisher2").setDirection("DOWN").onUse(function(player)
    checkForTrainerBattle(player, true, "ROUTE_21_56_82", "FISHER", "fisher", {{27, "MAGIKARP"}, {27, "MAGIKARP"}, {27, "MAGIKARP"}, {27, "MAGIKARP"}, {27, "MAGIKARP"}, {27, "MAGIKARP"}}, 'I got a big haul!\nWanna go for it?', 'I seem to only\ncatch MAGIKARP!', 'Darn\nMAGIKARP!')
end)
map.createObject(60, 76).setSprite("swimmer").setDirection("UP").onUse(function(player) possiblyBattleROUTE_21_60_76(player, true) end)
map.createObject(60, 77).onTouch(function(player) possiblyBattleROUTE_21_60_76(player, false) end)
map.createObject(60, 78).onTouch(function(player) possiblyBattleROUTE_21_60_76(player, false) end)
map.createObject(60, 79).onTouch(function(player) possiblyBattleROUTE_21_60_76(player, false) end)
map.createObject(60, 80).onTouch(function(player) possiblyBattleROUTE_21_60_76(player, false) end)
function possiblyBattleROUTE_21_60_76(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_21_60_76", "SWIMMER", "swimmer", {{33, "SEADRA"}, {33, "TENTACRUEL"}}, 'The sea cleanses\nmy body and soul!', 'I like the\nmountains too!', 'Ayah!')
end
map.createObject(62, 77).setSprite("swimmer").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_21_62_77(player, true) end)
map.createObject(63, 77).onTouch(function(player) possiblyBattleROUTE_21_62_77(player, false) end)
map.createObject(64, 77).onTouch(function(player) possiblyBattleROUTE_21_62_77(player, false) end)
map.createObject(65, 77).onTouch(function(player) possiblyBattleROUTE_21_62_77(player, false) end)
map.createObject(66, 77).onTouch(function(player) possiblyBattleROUTE_21_62_77(player, false) end)
function possiblyBattleROUTE_21_62_77(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_21_62_77", "CUE BALL", "cueball", {{31, "TENTACOOL"}, {31, "TENTACOOL"}, {31, "TENTACRUEL"}}, "What's wrong with\nme swimming?", 'I look like what?\nA studded inner\ntube? Get lost!', 'Cheap\nshot!')
end
map.createObject(66, 44).setSprite("swimmer").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_21_66_44(player, true) end)
map.createObject(66, 43).onTouch(function(player) possiblyBattleROUTE_21_66_44(player, false) end)
map.createObject(66, 42).onTouch(function(player) possiblyBattleROUTE_21_66_44(player, false) end)
map.createObject(66, 41).onTouch(function(player) possiblyBattleROUTE_21_66_44(player, false) end)
map.createObject(66, 40).onTouch(function(player) possiblyBattleROUTE_21_66_44(player, false) end)
function possiblyBattleROUTE_21_66_44(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_21_66_44", "SWIMMER", "swimmer", {{37, "STARMIE"}}, 'I caught all my\nPOKEMON at sea!', "Where'd you catch\nyour POKEMON?", 'Diver!!\nDown!!')
end
map.createObject(55, 36).setSprite("swimmer").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_21_55_36(player, true) end)
map.createObject(56, 36).onTouch(function(player) possiblyBattleROUTE_21_55_36(player, false) end)
map.createObject(57, 36).onTouch(function(player) possiblyBattleROUTE_21_55_36(player, false) end)
map.createObject(58, 36).onTouch(function(player) possiblyBattleROUTE_21_55_36(player, false) end)
map.createObject(59, 36).onTouch(function(player) possiblyBattleROUTE_21_55_36(player, false) end)
function possiblyBattleROUTE_21_55_36(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_21_55_36", "SWIMMER", "swimmer", {{33, "STARYU"}, {33, "WARTORTLE"}}, "Right now, I'm in\na triathlon meet!", "I'm beat!\nBut, I still have\nthe bike race and\nmarathon left!", 'Pant...\npant...pant...')
end
map.createObject(65, 36).setSprite("swimmer").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_21_65_36(player, true) end)
map.createObject(64, 36).onTouch(function(player) possiblyBattleROUTE_21_65_36(player, false) end)
map.createObject(63, 36).onTouch(function(player) possiblyBattleROUTE_21_65_36(player, false) end)
map.createObject(62, 36).onTouch(function(player) possiblyBattleROUTE_21_65_36(player, false) end)
function possiblyBattleROUTE_21_65_36(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_21_65_36", "SWIMMER", "swimmer", {{32, "POLIWHIRL"}, {32, "TENTACOOL"}, {32, "SEADRA"}}, 'Ahh! Feel the sun\nand the wind!', "I'm sunburnt to a\ncrisp!", 'Yow!\nI lost!')
end
map.createObject(64, 51).setSprite("fisher2").setDirection("LEFT").onUse(function(player)
    checkForTrainerBattle(player, true, "ROUTE_21_64_51", "FISHER", "fisher", {{31, "SHELLDER"}, {31, "CLOYSTER"}}, "Hey, don't scare\naway the fish!", "I was just angry\nthat I couldn't\ncatch anything.", "Sorry!\nI didn't mean it!")
end)
map.createObject(67, 50).setSprite("fisher2").setDirection("RIGHT").onUse(function(player)
    checkForTrainerBattle(player, true, "ROUTE_21_67_50", "FISHER", "fisher", {{33, "SEAKING"}, {33, "GOLDEEN"}}, "Keep me company\n'til I get a hit!", 'Oh wait! I got a\nbite! Yeah!', 'That\nburned some time.')
end)
map.setWildPokemon({50, 18}, {69, 107}, 0.0980392).type("LAND").add(51, 21, "RATTATA").add(51, 23, "PIDGEY").add(39, 30, "RATICATE").add(25, 23, "RATTATA").add(25, 21, "PIDGEY").add(25, 30, "PIDGEOTTO").add(13, 32, "PIDGEOTTO").add(13, 28, "TANGELA").add(11, 30, "TANGELA").add(3, 32, "TANGELA")
map.setWildPokemon({50, 18}, {69, 107}, 0.0196078).type("WATER").add(51, 5, "TENTACOOL").add(51, 10, "TENTACOOL").add(39, 15, "TENTACOOL").add(25, 5, "TENTACOOL").add(25, 10, "TENTACOOL").add(25, 15, "TENTACOOL").add(13, 20, "TENTACOOL").add(13, 30, "TENTACOOL").add(11, 35, "TENTACOOL").add(3, 40, "TENTACOOL")
--map: ROUTE_22
map.createObject(25, 184).setSprite("blue")--[[['1 ; person']--]]
map.createObject(25, 184).setSprite("blue")--[[['2 ; person']--]]
map.setWildPokemon({0, 172}, {39, 189}, 0.0980392).type("LAND").mode("RED").add(51, 3, "RATTATA").add(51, 3, "NIDORAN_M").add(39, 4, "RATTATA").add(25, 4, "NIDORAN_M").add(25, 2, "RATTATA").add(25, 2, "NIDORAN_M").add(13, 3, "SPEAROW").add(13, 5, "SPEAROW").add(11, 3, "NIDORAN_F").add(3, 4, "NIDORAN_F")
map.setWildPokemon({0, 172}, {39, 189}, 0.0980392).type("LAND").mode("BLUE").add(51, 3, "RATTATA").add(51, 3, "NIDORAN_F").add(39, 4, "RATTATA").add(25, 4, "NIDORAN_F").add(25, 2, "RATTATA").add(25, 2, "NIDORAN_F").add(13, 3, "SPEAROW").add(13, 5, "SPEAROW").add(11, 3, "NIDORAN_M").add(3, 4, "NIDORAN_M")
--map: ROUTE_23
map.createObject(4, 298).setSprite("guard").setDirection("DOWN")--[[['1 ; person']--]]
map.createObject(10, 277).setSprite("guard").setDirection("DOWN")--[[['2 ; person']--]]
map.createObject(8, 248).setSprite("swimmer").setDirection("DOWN")--[[['3 ; person']--]]
map.createObject(11, 237).setSprite("swimmer").setDirection("DOWN")--[[['4 ; person']--]]
map.createObject(12, 228).setSprite("guard").setDirection("DOWN")--[[['5 ; person']--]]
map.createObject(8, 214).setSprite("guard").setDirection("DOWN")--[[['6 ; person']--]]
map.createObject(8, 197).setSprite("guard").setDirection("DOWN")--[[['7 ; person']--]]
map.setWildPokemon({0, 190}, {19, 333}, 0.0392157).type("LAND").mode("RED").add(51, 26, "EKANS").add(51, 33, "DITTO").add(39, 26, "SPEAROW").add(25, 38, "FEAROW").add(25, 38, "DITTO").add(25, 38, "FEAROW").add(13, 41, "ARBOK").add(13, 43, "DITTO").add(11, 41, "FEAROW").add(3, 43, "FEAROW")
map.setWildPokemon({0, 190}, {19, 333}, 0.0392157).type("LAND").mode("BLUE").add(51, 26, "SANDSHREW").add(51, 33, "DITTO").add(39, 26, "SPEAROW").add(25, 38, "FEAROW").add(25, 38, "DITTO").add(25, 38, "FEAROW").add(13, 41, "SANDSLASH").add(13, 43, "DITTO").add(11, 41, "FEAROW").add(3, 43, "FEAROW")
--map: ROUTE_24
map.createObject(241, 344).setSprite("black_hair_boy_1").setDirection("LEFT")--[[NO HEADER: .onUse(function(player)
    checkForTrainerBattle(player, true, "ROUTE_24_241_344", "ROCKET", "rocket", {{15, "EKANS"}, {15, "ZUBAT"}}, '?', '?', '?')
end)--]]
map.createObject(235, 339).setSprite("black_hair_boy_1").setDirection("UP").onUse(function(player) possiblyBattleROUTE_24_235_339(player, true) end)
map.createObject(235, 340).onTouch(function(player) possiblyBattleROUTE_24_235_339(player, false) end)
map.createObject(235, 341).onTouch(function(player) possiblyBattleROUTE_24_235_339(player, false) end)
map.createObject(235, 342).onTouch(function(player) possiblyBattleROUTE_24_235_339(player, false) end)
map.createObject(235, 343).onTouch(function(player) possiblyBattleROUTE_24_235_339(player, false) end)
function possiblyBattleROUTE_24_235_339(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_24_235_339", "JR.TRAINER#MALE", "jr.trainerm", {{14, "RATTATA"}, {14, "EKANS"}}, 'I saw your feat\nfrom the grass!', 'I hid because the\npeople on the\nbridge scared me!', 'I\nthought not!')
end
map.createObject(241, 340).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_24_241_340(player, true) end)
map.createObject(240, 340).onTouch(function(player) possiblyBattleROUTE_24_241_340(player, false) end)
function possiblyBattleROUTE_24_241_340(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_24_241_340", "JR.TRAINER#MALE", "jr.trainerm", {{18, "MANKEY"}}, "OK! I'm No. 5!\nI'll stomp you!", 'I did my best, I\nhave no regrets!', 'Whoa!\nToo much!')
end
map.createObject(240, 337).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_24_240_337(player, true) end)
map.createObject(241, 337).onTouch(function(player) possiblyBattleROUTE_24_240_337(player, false) end)
function possiblyBattleROUTE_24_240_337(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_24_240_337", "LASS", "lass", {{16, "PIDGEY"}, {16, "NIDORAN_F"}}, "I'm No. 4!\nGetting tired?", "I did my best, so\nI've no regrets!", 'I lost\ntoo!')
end
map.createObject(241, 334).setSprite("bug_catcher").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_24_241_334(player, true) end)
map.createObject(240, 334).onTouch(function(player) possiblyBattleROUTE_24_241_334(player, false) end)
function possiblyBattleROUTE_24_241_334(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_24_241_334", "YOUNGSTER", "youngster", {{14, "RATTATA"}, {14, "EKANS"}, {14, "ZUBAT"}}, "Here's No. 3!\nI won't be easy!", 'I did my best, I\nhave no regrets!', 'Ow!\nStomped flat!')
end
map.createObject(240, 331).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_24_240_331(player, true) end)
map.createObject(241, 331).onTouch(function(player) possiblyBattleROUTE_24_240_331(player, false) end)
function possiblyBattleROUTE_24_240_331(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_24_240_331", "LASS", "lass", {{14, "PIDGEY"}, {14, "NIDORAN_F"}}, "I'm second!\nNow it's serious!", 'I did my best, I\nhave no regrets!', 'How could I\nlose?')
end
map.createObject(241, 328).setSprite("bug_catcher").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_24_241_328(player, true) end)
map.createObject(240, 328).onTouch(function(player) possiblyBattleROUTE_24_241_328(player, false) end)
function possiblyBattleROUTE_24_241_328(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_24_241_328", "BUG CATCHER", "bugcatcher", {{14, "CATERPIE"}, {14, "WEEDLE"}}, 'This is NUGGET\nBRIDGE! Beat us 5\ntrainers and win\na fabulous prize!', 'I did my best, I\nhave no regrets!', 'Whoo!\nGood stuff!')
end
map.createObject(240, 354).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "ROUTE_24_240_354", "TM 45") end)
map.setWildPokemon({230, 324}, {249, 359}, 0.0980392).type("LAND").mode("RED").add(51, 7, "WEEDLE").add(51, 8, "KAKUNA").add(39, 12, "PIDGEY").add(25, 12, "ODDISH").add(25, 13, "ODDISH").add(25, 10, "ABRA").add(13, 14, "ODDISH").add(13, 13, "PIDGEY").add(11, 8, "ABRA").add(3, 12, "ABRA")
map.setWildPokemon({230, 324}, {249, 359}, 0.0980392).type("LAND").mode("BLUE").add(51, 7, "CATERPIE").add(51, 8, "METAPOD").add(39, 12, "PIDGEY").add(25, 12, "BELLSPROUT").add(25, 13, "BELLSPROUT").add(25, 10, "ABRA").add(13, 14, "BELLSPROUT").add(13, 13, "PIDGEY").add(11, 8, "ABRA").add(3, 12, "ABRA")
--map: ROUTE_25
map.createObject(264, 357).setSprite("bug_catcher").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_25_264_357(player, true) end)
map.createObject(264, 356).onTouch(function(player) possiblyBattleROUTE_25_264_357(player, false) end)
map.createObject(264, 355).onTouch(function(player) possiblyBattleROUTE_25_264_357(player, false) end)
function possiblyBattleROUTE_25_264_357(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_25_264_357", "YOUNGSTER", "youngster", {{15, "RATTATA"}, {15, "SPEAROW"}}, 'Local trainers\ncome here to\npractice!', "All POKEMON have\nweaknesses. It's\nbest to raise\ndifferent kinds.", "You're\ndecent.")
end
map.createObject(268, 354).setSprite("bug_catcher").setDirection("UP").onUse(function(player) possiblyBattleROUTE_25_268_354(player, true) end)
map.createObject(268, 355).onTouch(function(player) possiblyBattleROUTE_25_268_354(player, false) end)
map.createObject(268, 356).onTouch(function(player) possiblyBattleROUTE_25_268_354(player, false) end)
map.createObject(268, 357).onTouch(function(player) possiblyBattleROUTE_25_268_354(player, false) end)
function possiblyBattleROUTE_25_268_354(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_25_268_354", "YOUNGSTER", "youngster", {{17, "SLOWPOKE"}}, 'Dad took me to a\ngreat party on\nS.S.ANNE at\nVERMILION CITY!', 'On S.S.ANNE, I\nsaw trainers from\naround the world.', "I'm\nnot mad!")
end
map.createObject(274, 355).setSprite("black_hair_boy_1").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_25_274_355(player, true) end)
map.createObject(274, 354).onTouch(function(player) possiblyBattleROUTE_25_274_355(player, false) end)
map.createObject(274, 353).onTouch(function(player) possiblyBattleROUTE_25_274_355(player, false) end)
map.createObject(274, 352).onTouch(function(player) possiblyBattleROUTE_25_274_355(player, false) end)
function possiblyBattleROUTE_25_274_355(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_25_274_355", "JR.TRAINER#MALE", "jr.trainerm", {{14, "RATTATA"}, {14, "EKANS"}}, "I'm a cool guy.\nI've got a girl\nfriend!", 'Oh well. My girl\nwill cheer me up.', 'Aww,\ndarn...')
end
map.createObject(268, 351).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_25_268_351(player, true) end)
map.createObject(269, 351).onTouch(function(player) possiblyBattleROUTE_25_268_351(player, false) end)
map.createObject(270, 351).onTouch(function(player) possiblyBattleROUTE_25_268_351(player, false) end)
function possiblyBattleROUTE_25_268_351(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_25_268_351", "LASS", "lass", {{15, "NIDORAN_M"}, {15, "NIDORAN_F"}}, 'Hi! My boy\nfriend is cool!', 'I wish my guy was\nas good as you!', 'I was in\nbad condition!')
end
map.createObject(282, 356).setSprite("bug_catcher").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_25_282_356(player, true) end)
map.createObject(281, 356).onTouch(function(player) possiblyBattleROUTE_25_282_356(player, false) end)
map.createObject(280, 356).onTouch(function(player) possiblyBattleROUTE_25_282_356(player, false) end)
map.createObject(279, 356).onTouch(function(player) possiblyBattleROUTE_25_282_356(player, false) end)
map.createObject(278, 356).onTouch(function(player) possiblyBattleROUTE_25_282_356(player, false) end)
function possiblyBattleROUTE_25_282_356(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_25_282_356", "YOUNGSTER", "youngster", {{14, "EKANS"}, {14, "SANDSHREW"}}, 'I knew I had to\nfight you!', 'If your POKEMON\ngets confused or\nfalls asleep,\nswitch it!', "I knew\nI'd lose too!")
end
map.createObject(287, 355).setSprite("lass").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_25_287_355(player, true) end)
map.createObject(287, 354).onTouch(function(player) possiblyBattleROUTE_25_287_355(player, false) end)
map.createObject(287, 353).onTouch(function(player) possiblyBattleROUTE_25_287_355(player, false) end)
map.createObject(287, 352).onTouch(function(player) possiblyBattleROUTE_25_287_355(player, false) end)
map.createObject(287, 351).onTouch(function(player) possiblyBattleROUTE_25_287_355(player, false) end)
function possiblyBattleROUTE_25_287_355(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_25_287_355", "LASS", "lass", {{13, "ODDISH"}, {13, "PIDGEY"}, {13, "ODDISH"}}, "My friend has a\ncute POKEMON.\nI'm so jealous!", 'You came from MT.\nMOON? May I have\na CLEFAIRY?', "I'm\nnot so jealous!")
end
map.createObject(258, 355).setSprite("hiker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_25_258_355(player, true) end)
map.createObject(259, 355).onTouch(function(player) possiblyBattleROUTE_25_258_355(player, false) end)
map.createObject(260, 355).onTouch(function(player) possiblyBattleROUTE_25_258_355(player, false) end)
map.createObject(261, 355).onTouch(function(player) possiblyBattleROUTE_25_258_355(player, false) end)
function possiblyBattleROUTE_25_258_355(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_25_258_355", "HIKER", "hiker", {{15, "MACHOP"}, {15, "GEODUDE"}}, "I just got down\nfrom MT.MOON,\nbut I'm ready!", 'Drat!\nA ZUBAT bit me\nback in there.', 'You\nworked hard!')
end
map.createObject(273, 350).setSprite("hiker").setDirection("UP").onUse(function(player) possiblyBattleROUTE_25_273_350(player, true) end)
map.createObject(273, 351).onTouch(function(player) possiblyBattleROUTE_25_273_350(player, false) end)
map.createObject(273, 352).onTouch(function(player) possiblyBattleROUTE_25_273_350(player, false) end)
function possiblyBattleROUTE_25_273_350(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_25_273_350", "HIKER", "hiker", {{13, "GEODUDE"}, {13, "GEODUDE"}, {13, "MACHOP"}, {13, "GEODUDE"}}, "I'm off to see a\nPOKEMON collector\nat the cape!", 'The collector has\nmany rare kinds\nof POKEMON.', 'You\ngot me.')
end
map.createObject(263, 352).setSprite("hiker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_25_263_352(player, true) end)
map.createObject(264, 352).onTouch(function(player) possiblyBattleROUTE_25_263_352(player, false) end)
map.createObject(265, 352).onTouch(function(player) possiblyBattleROUTE_25_263_352(player, false) end)
function possiblyBattleROUTE_25_263_352(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_25_263_352", "HIKER", "hiker", {{17, "ONIX"}}, "You're going to\nsee BILL? First,\nlet's fight!", 'The trail below\nis a shortcut to\nCERULEAN CITY.', "You're\nsomething.")
end
map.createObject(272, 357).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "ROUTE_25_272_357", "TM 19") end)
map.setWildPokemon({250, 342}, {309, 359}, 0.0588235).type("LAND").mode("RED").add(51, 8, "WEEDLE").add(51, 9, "KAKUNA").add(39, 13, "PIDGEY").add(25, 12, "ODDISH").add(25, 13, "ODDISH").add(25, 12, "ABRA").add(13, 14, "ODDISH").add(13, 10, "ABRA").add(11, 7, "METAPOD").add(3, 8, "CATERPIE")
map.setWildPokemon({250, 342}, {309, 359}, 0.0588235).type("LAND").mode("BLUE").add(51, 8, "CATERPIE").add(51, 9, "METAPOD").add(39, 13, "PIDGEY").add(25, 12, "BELLSPROUT").add(25, 13, "BELLSPROUT").add(25, 12, "ABRA").add(13, 14, "BELLSPROUT").add(13, 10, "ABRA").add(11, 7, "KAKUNA").add(3, 8, "WEEDLE")
--map: ROUTE_3
map.createObject(137, 286).setSprite("black_hair_boy_2")--[[['1 ; person']--]]
map.createObject(90, 291).setSprite("bug_catcher").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_3_90_291(player, true) end)
map.createObject(91, 291).onTouch(function(player) possiblyBattleROUTE_3_90_291(player, false) end)
map.createObject(92, 291).onTouch(function(player) possiblyBattleROUTE_3_90_291(player, false) end)
function possiblyBattleROUTE_3_90_291(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_3_90_291", "BUG CATCHER", "bugcatcher", {{10, "CATERPIE"}, {10, "WEEDLE"}, {10, "CATERPIE"}}, 'Hey! I met you in\nVIRIDIAN FOREST!', 'There are other\nkinds of POKEMON\nthan those found\nin the forest!', 'You\nbeat me again!')
end
map.createObject(94, 293).setSprite("bug_catcher").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_3_94_293(player, true) end)
map.createObject(94, 292).onTouch(function(player) possiblyBattleROUTE_3_94_293(player, false) end)
map.createObject(94, 291).onTouch(function(player) possiblyBattleROUTE_3_94_293(player, false) end)
map.createObject(94, 290).onTouch(function(player) possiblyBattleROUTE_3_94_293(player, false) end)
function possiblyBattleROUTE_3_94_293(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_3_94_293", "YOUNGSTER", "youngster", {{11, "RATTATA"}, {11, "EKANS"}}, "Hi! I like shorts!\nThey're comfy and\neasy to wear!", 'Are you storing\nyour POKEMON on\nPC? Each BOX can\nhold 20 POKEMON!', "I don't\nbelieve it!")
end
map.createObject(96, 288).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_3_96_288(player, true) end)
map.createObject(95, 288).onTouch(function(player) possiblyBattleROUTE_3_96_288(player, false) end)
map.createObject(94, 288).onTouch(function(player) possiblyBattleROUTE_3_96_288(player, false) end)
function possiblyBattleROUTE_3_96_288(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_3_96_288", "LASS", "lass", {{9, "PIDGEY"}, {9, "PIDGEY"}}, "You looked at me,\ndidn't you?", "Quit staring if\nyou don't want to\nfight!", "You're\nmean!")
end
map.createObject(99, 292).setSprite("bug_catcher").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_3_99_292(player, true) end)
map.createObject(99, 291).onTouch(function(player) possiblyBattleROUTE_3_99_292(player, false) end)
function possiblyBattleROUTE_3_99_292(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_3_99_292", "BUG CATCHER", "bugcatcher", {{9, "WEEDLE"}, {9, "KAKUNA"}, {9, "CATERPIE"}, {9, "METAPOD"}}, "Are you a trainer?\nLet's fight!", 'If a POKEMON BOX\non the PC gets\nfull, just switch\nto another BOX!', "If I\nhad new POKEMON I\nwould've won!")
end
map.createObject(103, 293).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_3_103_293(player, true) end)
map.createObject(102, 293).onTouch(function(player) possiblyBattleROUTE_3_103_293(player, false) end)
map.createObject(101, 293).onTouch(function(player) possiblyBattleROUTE_3_103_293(player, false) end)
map.createObject(100, 293).onTouch(function(player) possiblyBattleROUTE_3_103_293(player, false) end)
map.createObject(99, 293).onTouch(function(player) possiblyBattleROUTE_3_103_293(player, false) end)
function possiblyBattleROUTE_3_103_293(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_3_103_293", "LASS", "lass", {{10, "RATTATA"}, {10, "NIDORAN_M"}}, "That look you\ngave me, it's so\nintriguing!", 'Avoid fights by\nnot letting\npeople see you!', 'Be nice!')
end
map.createObject(102, 288).setSprite("bug_catcher").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_3_102_288(player, true) end)
map.createObject(101, 288).onTouch(function(player) possiblyBattleROUTE_3_102_288(player, false) end)
map.createObject(100, 288).onTouch(function(player) possiblyBattleROUTE_3_102_288(player, false) end)
map.createObject(99, 288).onTouch(function(player) possiblyBattleROUTE_3_102_288(player, false) end)
function possiblyBattleROUTE_3_102_288(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_3_102_288", "YOUNGSTER", "youngster", {{14, "SPEAROW"}}, "Hey! You're not\nwearing shorts!", 'I always wear\nshorts, even in\nwinter!', 'Lost!\nLost! Lost!')
end
map.createObject(104, 291).setSprite("bug_catcher").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_3_104_291(player, true) end)
map.createObject(105, 291).onTouch(function(player) possiblyBattleROUTE_3_104_291(player, false) end)
map.createObject(106, 291).onTouch(function(player) possiblyBattleROUTE_3_104_291(player, false) end)
map.createObject(107, 291).onTouch(function(player) possiblyBattleROUTE_3_104_291(player, false) end)
function possiblyBattleROUTE_3_104_291(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_3_104_291", "BUG CATCHER", "bugcatcher", {{11, "CATERPIE"}, {11, "METAPOD"}}, 'You can fight my\nnew POKEMON!', 'Trained POKEMON\nare stronger than\nthe wild ones!', 'Done\nlike dinner!')
end
map.createObject(113, 287).setSprite("lass").setDirection("UP").onUse(function(player) possiblyBattleROUTE_3_113_287(player, true) end)
map.createObject(113, 288).onTouch(function(player) possiblyBattleROUTE_3_113_287(player, false) end)
map.createObject(113, 289).onTouch(function(player) possiblyBattleROUTE_3_113_287(player, false) end)
function possiblyBattleROUTE_3_113_287(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_3_113_287", "LASS", "lass", {{14, "JIGGLYPUFF"}}, 'Eek! Did you\ntouch me?', 'ROUTE 4 is at the\nfoot of MT.MOON.', "That's it?")
end
map.setWildPokemon({80, 280}, {149, 297}, 0.0784314).type("LAND").add(51, 6, "PIDGEY").add(51, 5, "SPEAROW").add(39, 7, "PIDGEY").add(25, 6, "SPEAROW").add(25, 7, "SPEAROW").add(25, 8, "PIDGEY").add(13, 8, "SPEAROW").add(13, 3, "JIGGLYPUFF").add(11, 5, "JIGGLYPUFF").add(3, 7, "JIGGLYPUFF")
--map: ROUTE_4
map.createObject(139, 307).setSprite("lass")--[[.enableWander()--]]--[[['1 ; person']--]]
map.createObject(193, 312).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_4_193_312(player, true) end)
map.createObject(194, 312).onTouch(function(player) possiblyBattleROUTE_4_193_312(player, false) end)
map.createObject(195, 312).onTouch(function(player) possiblyBattleROUTE_4_193_312(player, false) end)
map.createObject(196, 312).onTouch(function(player) possiblyBattleROUTE_4_193_312(player, false) end)
function possiblyBattleROUTE_4_193_312(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_4_193_312", "LASS", "lass", {{31, "PARAS"}, {31, "PARAS"}, {31, "PARASECT"}}, 'I came to get my\nmushroom POKEMON!', 'There might not\nbe any more\nmushrooms here.', 'Oh! My cute\nmushroom POKEMON!')
end
map.createObject(187, 312).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "ROUTE_4_187_312", "TM 04") end)
map.setWildPokemon({130, 298}, {219, 315}, 0.0784314).type("LAND").mode("RED").add(51, 10, "RATTATA").add(51, 10, "SPEAROW").add(39, 8, "RATTATA").add(25, 6, "EKANS").add(25, 8, "SPEAROW").add(25, 10, "EKANS").add(13, 12, "RATTATA").add(13, 12, "SPEAROW").add(11, 8, "EKANS").add(3, 12, "EKANS")
map.setWildPokemon({130, 298}, {219, 315}, 0.0784314).type("LAND").mode("BLUE").add(51, 10, "RATTATA").add(51, 10, "SPEAROW").add(39, 8, "RATTATA").add(25, 6, "SANDSHREW").add(25, 8, "SPEAROW").add(25, 10, "SANDSHREW").add(13, 12, "RATTATA").add(13, 12, "SPEAROW").add(11, 8, "SANDSHREW").add(3, 12, "SANDSHREW")
--map: ROUTE_5
map.setWildPokemon({230, 252}, {249, 287}, 0.0588235).type("LAND").mode("RED").add(51, 13, "ODDISH").add(51, 13, "PIDGEY").add(39, 15, "PIDGEY").add(25, 10, "MANKEY").add(25, 12, "MANKEY").add(25, 15, "ODDISH").add(13, 16, "ODDISH").add(13, 16, "PIDGEY").add(11, 14, "MANKEY").add(3, 16, "MANKEY")
map.setWildPokemon({230, 252}, {249, 287}, 0.0588235).type("LAND").mode("BLUE").add(51, 13, "BELLSPROUT").add(51, 13, "PIDGEY").add(39, 15, "PIDGEY").add(25, 10, "MEOWTH").add(25, 12, "MEOWTH").add(25, 15, "BELLSPROUT").add(13, 16, "BELLSPROUT").add(13, 16, "PIDGEY").add(11, 14, "MEOWTH").add(3, 16, "MEOWTH")
--map: ROUTE_6
map.createObject(240, 194).setSprite("black_hair_boy_1").setDirection("RIGHT").onUse(function(player)
    checkForTrainerBattle(player, true, "ROUTE_6_240_194", "JR.TRAINER#MALE", "jr.trainerm", {{20, "SQUIRTLE"}}, "Who's there?\nQuit listening in\non us!", 'Whisper...\nwhisper...', "I\njust can't win!")
end)
map.createObject(241, 194).setSprite("lass").setDirection("LEFT").onUse(function(player)
    checkForTrainerBattle(player, true, "ROUTE_6_241_194", "JR.TRAINER#FEMALE", "jr.trainerf", {{16, "RATTATA"}, {16, "PIKACHU"}}, 'Excuse me! This\nis a private\nconversation!', 'Whisper...\nwhisper...', 'Ugh!\nI hate losing!')
end)
map.createObject(230, 200).setSprite("bug_catcher").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_6_230_200(player, true) end)
map.createObject(231, 200).onTouch(function(player) possiblyBattleROUTE_6_230_200(player, false) end)
map.createObject(232, 200).onTouch(function(player) possiblyBattleROUTE_6_230_200(player, false) end)
map.createObject(233, 200).onTouch(function(player) possiblyBattleROUTE_6_230_200(player, false) end)
map.createObject(234, 200).onTouch(function(player) possiblyBattleROUTE_6_230_200(player, false) end)
function possiblyBattleROUTE_6_230_200(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_6_230_200", "BUG CATCHER", "bugcatcher", {{16, "WEEDLE"}, {16, "CATERPIE"}, {16, "WEEDLE"}}, "There aren't many\nbugs out here.", "I like bugs, so\nI'm going back to\nVIRIDIAN FOREST.", "No!\nYou're kidding!")
end
map.createObject(241, 184).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_6_241_184(player, true) end)
map.createObject(240, 184).onTouch(function(player) possiblyBattleROUTE_6_241_184(player, false) end)
map.createObject(239, 184).onTouch(function(player) possiblyBattleROUTE_6_241_184(player, false) end)
map.createObject(238, 184).onTouch(function(player) possiblyBattleROUTE_6_241_184(player, false) end)
function possiblyBattleROUTE_6_241_184(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_6_241_184", "JR.TRAINER#MALE", "jr.trainerm", {{16, "SPEAROW"}, {16, "RATICATE"}}, 'Huh? You want\nto talk to me?', 'I should carry\nmore POKEMON with\nme for safety.', "I\ndidn't start it!")
end
map.createObject(241, 185).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_6_241_185(player, true) end)
map.createObject(240, 185).onTouch(function(player) possiblyBattleROUTE_6_241_185(player, false) end)
map.createObject(239, 185).onTouch(function(player) possiblyBattleROUTE_6_241_185(player, false) end)
map.createObject(238, 185).onTouch(function(player) possiblyBattleROUTE_6_241_185(player, false) end)
function possiblyBattleROUTE_6_241_185(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_6_241_185", "JR.TRAINER#FEMALE", "jr.trainerf", {{16, "PIDGEY"}, {16, "PIDGEY"}, {16, "PIDGEY"}}, "Me? Well, OK.\nI'll play!", "I want to get\nstronger! What's\nyour secret?", "Just\ndidn't work!")
end
map.createObject(249, 189).setSprite("bug_catcher").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_6_249_189(player, true) end)
map.createObject(248, 189).onTouch(function(player) possiblyBattleROUTE_6_249_189(player, false) end)
map.createObject(247, 189).onTouch(function(player) possiblyBattleROUTE_6_249_189(player, false) end)
map.createObject(246, 189).onTouch(function(player) possiblyBattleROUTE_6_249_189(player, false) end)
function possiblyBattleROUTE_6_249_189(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_6_249_189", "BUG CATCHER", "bugcatcher", {{20, "BUTTERFREE"}}, "I've never seen\nyou around!\nAre you good?", 'Are my POKEMON\nweak? Or, am I\njust bad?', 'You\nare too good!')
end
map.setWildPokemon({230, 180}, {249, 215}, 0.0588235).type("LAND").mode("RED").add(51, 13, "ODDISH").add(51, 13, "PIDGEY").add(39, 15, "PIDGEY").add(25, 10, "MANKEY").add(25, 12, "MANKEY").add(25, 15, "ODDISH").add(13, 16, "ODDISH").add(13, 16, "PIDGEY").add(11, 14, "MANKEY").add(3, 16, "MANKEY")
map.setWildPokemon({230, 180}, {249, 215}, 0.0588235).type("LAND").mode("BLUE").add(51, 13, "BELLSPROUT").add(51, 13, "PIDGEY").add(39, 15, "PIDGEY").add(25, 10, "MEOWTH").add(25, 12, "MEOWTH").add(25, 15, "BELLSPROUT").add(13, 16, "BELLSPROUT").add(13, 16, "PIDGEY").add(11, 14, "MEOWTH").add(3, 16, "MEOWTH")
--map: ROUTE_7
map.setWildPokemon({200, 226}, {219, 243}, 0.0588235).type("LAND").mode("RED").add(51, 19, "PIDGEY").add(51, 19, "ODDISH").add(39, 17, "MANKEY").add(25, 22, "ODDISH").add(25, 22, "PIDGEY").add(25, 18, "MANKEY").add(13, 18, "GROWLITHE").add(13, 20, "GROWLITHE").add(11, 19, "MANKEY").add(3, 20, "MANKEY")
map.setWildPokemon({200, 226}, {219, 243}, 0.0588235).type("LAND").mode("BLUE").add(51, 19, "PIDGEY").add(51, 19, "BELLSPROUT").add(39, 17, "MEOWTH").add(25, 22, "BELLSPROUT").add(25, 22, "PIDGEY").add(25, 18, "MEOWTH").add(13, 18, "VULPIX").add(13, 20, "VULPIX").add(11, 19, "MEOWTH").add(3, 20, "MEOWTH")
--map: ROUTE_8
map.createObject(268, 238).setSprite("black_hair_boy_2").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_8_268_238(player, true) end)
map.createObject(269, 238).onTouch(function(player) possiblyBattleROUTE_8_268_238(player, false) end)
map.createObject(270, 238).onTouch(function(player) possiblyBattleROUTE_8_268_238(player, false) end)
map.createObject(271, 238).onTouch(function(player) possiblyBattleROUTE_8_268_238(player, false) end)
map.createObject(272, 238).onTouch(function(player) possiblyBattleROUTE_8_268_238(player, false) end)
function possiblyBattleROUTE_8_268_238(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_8_268_238", "SUPER NERD", "supernerd", {{20, "VOLTORB"}, {20, "KOFFING"}, {20, "VOLTORB"}, {20, "MAGNEMITE"}}, "You look good at\nPOKEMON, but\nhow's your chem?", 'I am better at\nschool than this!', 'Ow!\nMeltdown!')
end
map.createObject(273, 234).setSprite("gambler").setDirection("UP").onUse(function(player) possiblyBattleROUTE_8_273_234(player, true) end)
map.createObject(273, 235).onTouch(function(player) possiblyBattleROUTE_8_273_234(player, false) end)
map.createObject(273, 236).onTouch(function(player) possiblyBattleROUTE_8_273_234(player, false) end)
map.createObject(273, 237).onTouch(function(player) possiblyBattleROUTE_8_273_234(player, false) end)
map.createObject(273, 238).onTouch(function(player) possiblyBattleROUTE_8_273_234(player, false) end)
function possiblyBattleROUTE_8_273_234(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_8_273_234", "GAMBLER", "gambler", {{22, "POLIWAG"}, {22, "POLIWAG"}, {22, "POLIWHIRL"}}, "All right! Let's\nroll the dice!", "Lady Luck's not\nwith me today!", 'Drat!\nCame up short!')
end
map.createObject(302, 237).setSprite("black_hair_boy_2").setDirection("UP").onUse(function(player) possiblyBattleROUTE_8_302_237(player, true) end)
map.createObject(302, 238).onTouch(function(player) possiblyBattleROUTE_8_302_237(player, false) end)
map.createObject(302, 239).onTouch(function(player) possiblyBattleROUTE_8_302_237(player, false) end)
map.createObject(302, 240).onTouch(function(player) possiblyBattleROUTE_8_302_237(player, false) end)
map.createObject(302, 241).onTouch(function(player) possiblyBattleROUTE_8_302_237(player, false) end)
function possiblyBattleROUTE_8_302_237(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_8_302_237", "SUPER NERD", "supernerd", {{22, "GRIMER"}, {22, "MUK"}, {22, "GRIMER"}}, 'You need strategy\nto win at this!', 'Go with GRIMER\nfirst...and...\n...and...then...', "It's\nnot logical!")
end
map.createObject(286, 240).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_8_286_240(player, true) end)
map.createObject(285, 240).onTouch(function(player) possiblyBattleROUTE_8_286_240(player, false) end)
map.createObject(284, 240).onTouch(function(player) possiblyBattleROUTE_8_286_240(player, false) end)
function possiblyBattleROUTE_8_286_240(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_8_286_240", "LASS", "lass", {{23, "NIDORAN_F"}, {23, "NIDORINA"}}, 'I like NIDORAN, so\nI collect them!', "When POKEMON grow\nup they get ugly!\nThey shouldn't\nevolve!", 'Why? Why??')
end
map.createObject(286, 239).setSprite("black_hair_boy_2").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_8_286_239(player, true) end)
map.createObject(287, 239).onTouch(function(player) possiblyBattleROUTE_8_286_239(player, false) end)
map.createObject(288, 239).onTouch(function(player) possiblyBattleROUTE_8_286_239(player, false) end)
map.createObject(289, 239).onTouch(function(player) possiblyBattleROUTE_8_286_239(player, false) end)
function possiblyBattleROUTE_8_286_239(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_8_286_239", "SUPER NERD", "supernerd", {{26, "KOFFING"}}, 'School is fun, but\nso are POKEMON.', "We're stuck here\nbecause of the\ngates at SAFFRON.", "I'll\nstay with school.")
end
map.createObject(286, 238).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_8_286_238(player, true) end)
map.createObject(285, 238).onTouch(function(player) possiblyBattleROUTE_8_286_238(player, false) end)
map.createObject(284, 238).onTouch(function(player) possiblyBattleROUTE_8_286_238(player, false) end)
map.createObject(283, 238).onTouch(function(player) possiblyBattleROUTE_8_286_238(player, false) end)
function possiblyBattleROUTE_8_286_238(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_8_286_238", "LASS", "lass", {{24, "MEOWTH"}, {24, "MEOWTH"}, {24, "MEOWTH"}}, 'MEOWTH is so cute,\nmeow, meow, meow!', 'I think PIDGEY\nand RATTATA\nare cute too!', 'Meow!')
end
map.createObject(286, 237).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_8_286_237(player, true) end)
map.createObject(287, 237).onTouch(function(player) possiblyBattleROUTE_8_286_237(player, false) end)
map.createObject(288, 237).onTouch(function(player) possiblyBattleROUTE_8_286_237(player, false) end)
function possiblyBattleROUTE_8_286_237(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_8_286_237", "LASS", "lass", {{19, "PIDGEY"}, {19, "RATTATA"}, {19, "NIDORAN_M"}, {19, "MEOWTH"}, {19, "PIKACHU"}}, 'We must look\nsilly standing\nhere like this!', "SAFFRON's gate\nkeeper won't let\nus through.\nHe's so mean!", 'Look what\nyou did!')
end
map.createObject(306, 230).setSprite("gambler").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_8_306_230(player, true) end)
map.createObject(306, 229).onTouch(function(player) possiblyBattleROUTE_8_306_230(player, false) end)
map.createObject(306, 228).onTouch(function(player) possiblyBattleROUTE_8_306_230(player, false) end)
function possiblyBattleROUTE_8_306_230(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_8_306_230", "GAMBLER", "gambler", {{24, "GROWLITHE"}, {24, "VULPIX"}}, "I'm a rambling,\ngambling dude!", "Gambling and\nPOKEMON are like\neating peanuts!\nJust can't stop!", 'Missed\nthe big score!')
end
map.createObject(311, 231).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_8_311_231(player, true) end)
map.createObject(310, 231).onTouch(function(player) possiblyBattleROUTE_8_311_231(player, false) end)
map.createObject(309, 231).onTouch(function(player) possiblyBattleROUTE_8_311_231(player, false) end)
map.createObject(308, 231).onTouch(function(player) possiblyBattleROUTE_8_311_231(player, false) end)
map.createObject(307, 231).onTouch(function(player) possiblyBattleROUTE_8_311_231(player, false) end)
function possiblyBattleROUTE_8_311_231(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_8_311_231", "LASS", "lass", {{22, "CLEFAIRY"}, {22, "CLEFAIRY"}}, "What's a cute,\nround and fluffy\nPOKEMON?", "I heard that\nCLEFAIRY evolves\nwhen it's exposed\nto a MOON STONE.", 'Stop!')
end
map.setWildPokemon({260, 226}, {319, 243}, 0.0588235).type("LAND").mode("RED").add(51, 18, "PIDGEY").add(51, 18, "MANKEY").add(39, 17, "EKANS").add(25, 16, "GROWLITHE").add(25, 20, "PIDGEY").add(25, 20, "MANKEY").add(13, 19, "EKANS").add(13, 17, "GROWLITHE").add(11, 15, "GROWLITHE").add(3, 18, "GROWLITHE")
map.setWildPokemon({260, 226}, {319, 243}, 0.0588235).type("LAND").mode("BLUE").add(51, 18, "PIDGEY").add(51, 18, "MEOWTH").add(39, 17, "SANDSHREW").add(25, 16, "VULPIX").add(25, 20, "PIDGEY").add(25, 20, "MEOWTH").add(13, 19, "SANDSHREW").add(13, 17, "VULPIX").add(11, 15, "VULPIX").add(3, 18, "VULPIX")
--map: ROUTE_9
map.createObject(273, 305).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_9_273_305(player, true) end)
map.createObject(272, 305).onTouch(function(player) possiblyBattleROUTE_9_273_305(player, false) end)
map.createObject(271, 305).onTouch(function(player) possiblyBattleROUTE_9_273_305(player, false) end)
map.createObject(270, 305).onTouch(function(player) possiblyBattleROUTE_9_273_305(player, false) end)
function possiblyBattleROUTE_9_273_305(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_9_273_305", "JR.TRAINER#FEMALE", "jr.trainerf", {{18, "ODDISH"}, {18, "BELLSPROUT"}, {18, "ODDISH"}, {18, "BELLSPROUT"}}, "You have POKEMON\nwith you!\nYou're mine!", 'You need light to\nget through that\ndark tunnel ahead.', 'You\ndeceived me!')
end
map.createObject(284, 308).setSprite("black_hair_boy_1").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_9_284_308(player, true) end)
map.createObject(283, 308).onTouch(function(player) possiblyBattleROUTE_9_284_308(player, false) end)
map.createObject(282, 308).onTouch(function(player) possiblyBattleROUTE_9_284_308(player, false) end)
function possiblyBattleROUTE_9_284_308(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_9_284_308", "JR.TRAINER#MALE", "jr.trainerm", {{21, "GROWLITHE"}, {21, "CHARMANDER"}}, "Who's that walking\nwith those good\nlooking POKEMON?", 'Keep walking!', 'Out\nlike a light!')
end
map.createObject(291, 308).setSprite("black_hair_boy_1").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_9_291_308(player, true) end)
map.createObject(292, 308).onTouch(function(player) possiblyBattleROUTE_9_291_308(player, false) end)
map.createObject(293, 308).onTouch(function(player) possiblyBattleROUTE_9_291_308(player, false) end)
map.createObject(294, 308).onTouch(function(player) possiblyBattleROUTE_9_291_308(player, false) end)
map.createObject(295, 308).onTouch(function(player) possiblyBattleROUTE_9_291_308(player, false) end)
function possiblyBattleROUTE_9_291_308(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_9_291_308", "JR.TRAINER#MALE", "jr.trainerm", {{19, "RATTATA"}, {19, "DIGLETT"}, {19, "EKANS"}, {19, "SANDSHREW"}}, "I'm taking ROCK\nTUNNEL to go to\nLAVENDER...", 'Are you off to\nROCK TUNNEL too?', "Can't\nmeasure up!")
end
map.createObject(308, 307).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_9_308_307(player, true) end)
map.createObject(309, 307).onTouch(function(player) possiblyBattleROUTE_9_308_307(player, false) end)
map.createObject(310, 307).onTouch(function(player) possiblyBattleROUTE_9_308_307(player, false) end)
function possiblyBattleROUTE_9_308_307(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_9_308_307", "JR.TRAINER#FEMALE", "jr.trainerf", {{23, "MEOWTH"}}, "Don't you dare\ncondescend me!", "You're obviously\ntalented! Good\nluck to you!", "No!\nYou're too much!")
end
map.createObject(276, 300).setSprite("hiker").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_9_276_300(player, true) end)
map.createObject(275, 300).onTouch(function(player) possiblyBattleROUTE_9_276_300(player, false) end)
map.createObject(274, 300).onTouch(function(player) possiblyBattleROUTE_9_276_300(player, false) end)
function possiblyBattleROUTE_9_276_300(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_9_276_300", "HIKER", "hiker", {{20, "MACHOP"}, {20, "ONIX"}}, 'Bwahaha!\nGreat! I was\nbored, eh!', 'You sure had guts\nstanding up to me\nthere, eh?', 'Keep it\ncoming, eh!')
end
map.createObject(303, 312).setSprite("hiker").setDirection("LEFT").onUse(function(player) possiblyBattleROUTE_9_303_312(player, true) end)
map.createObject(302, 312).onTouch(function(player) possiblyBattleROUTE_9_303_312(player, false) end)
map.createObject(301, 312).onTouch(function(player) possiblyBattleROUTE_9_303_312(player, false) end)
map.createObject(300, 312).onTouch(function(player) possiblyBattleROUTE_9_303_312(player, false) end)
function possiblyBattleROUTE_9_303_312(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_9_303_312", "HIKER", "hiker", {{20, "GEODUDE"}, {20, "MACHOP"}, {20, "GEODUDE"}}, "Hahaha!\nAren't you a\nlittle toughie!", 'Hahaha! Kids\nshould be tough!', "What's\nthat?")
end
map.createObject(282, 313).setSprite("bug_catcher").setDirection("DOWN").onUse(function(player) possiblyBattleROUTE_9_282_313(player, true) end)
map.createObject(282, 312).onTouch(function(player) possiblyBattleROUTE_9_282_313(player, false) end)
map.createObject(282, 311).onTouch(function(player) possiblyBattleROUTE_9_282_313(player, false) end)
map.createObject(282, 310).onTouch(function(player) possiblyBattleROUTE_9_282_313(player, false) end)
map.createObject(282, 309).onTouch(function(player) possiblyBattleROUTE_9_282_313(player, false) end)
function possiblyBattleROUTE_9_282_313(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_9_282_313", "BUG CATCHER", "bugcatcher", {{19, "BEEDRILL"}, {19, "BEEDRILL"}}, 'I got up early\nevery day to\nraise my POKEMON\nfrom cocoons!', 'I have to collect\nmore than bugs to\nget stronger...', 'WHAT?')
end
map.createObject(305, 300).setSprite("hiker").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_9_305_300(player, true) end)
map.createObject(306, 300).onTouch(function(player) possiblyBattleROUTE_9_305_300(player, false) end)
map.createObject(307, 300).onTouch(function(player) possiblyBattleROUTE_9_305_300(player, false) end)
function possiblyBattleROUTE_9_305_300(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_9_305_300", "HIKER", "hiker", {{21, "GEODUDE"}, {21, "ONIX"}}, 'Hahahaha!\nCome on, dude!', 'Hahahaha!\nUs hearty guys\nalways laugh!', 'Hahahaha!\nYou beat me fair!')
end
map.createObject(300, 307).setSprite("bug_catcher").setDirection("RIGHT").onUse(function(player) possiblyBattleROUTE_9_300_307(player, true) end)
map.createObject(301, 307).onTouch(function(player) possiblyBattleROUTE_9_300_307(player, false) end)
map.createObject(302, 307).onTouch(function(player) possiblyBattleROUTE_9_300_307(player, false) end)
function possiblyBattleROUTE_9_300_307(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "ROUTE_9_300_307", "BUG CATCHER", "bugcatcher", {{20, "CATERPIE"}, {20, "WEEDLE"}, {20, "VENONAT"}}, 'Go, my super bug\nPOKEMON!', "If you don't like\nbug POKEMON, you\nbug me!", 'My\nbugs...')
end
map.createObject(270, 300).setSprite("ball").onUse(function(player) attemptToPickupObject(player, "ROUTE_9_270_300", "TM 30") end)
map.setWildPokemon({260, 298}, {319, 315}, 0.0588235).type("LAND").mode("RED").add(51, 16, "RATTATA").add(51, 16, "SPEAROW").add(39, 14, "RATTATA").add(25, 11, "EKANS").add(25, 13, "SPEAROW").add(25, 15, "EKANS").add(13, 17, "RATTATA").add(13, 17, "SPEAROW").add(11, 13, "EKANS").add(3, 17, "EKANS")
map.setWildPokemon({260, 298}, {319, 315}, 0.0588235).type("LAND").mode("BLUE").add(51, 16, "RATTATA").add(51, 16, "SPEAROW").add(39, 14, "RATTATA").add(25, 11, "SANDSHREW").add(25, 13, "SPEAROW").add(25, 15, "SANDSHREW").add(13, 17, "RATTATA").add(13, 17, "SPEAROW").add(11, 13, "SANDSHREW").add(3, 17, "SANDSHREW")
--map: SAFFRON_CITY
--map.createObject(227, 245).setSprite("rocket") -- In front of COPYCAT house
map.createObject(240, 243).setSprite("rocket")--[[.enableWander()--]]--[[['2 ; person']--]]
--map.createObject(254, 247).setSprite("rocket") -- In front of GYM
--map.createObject(233, 239).setSprite("rocket") -- In front of SAFFRON_HOUSE_1
map.createObject(231, 226).setSprite("rocket")--[[.enableWander()--]]--[[['5 ; person']--]]
map.createObject(252, 238).setSprite("rocket")--[[.enableWander()--]]--[[['6 ; person']--]]
map.createObject(238, 221).setSprite("rocket")--[[.enableWander()--]]--[[['7 ; person']--]]
map.createObject(228, 237).setSprite("oak_aide")--[[.enableWander()--]]--[[['8 ; person']--]]
map.createObject(243, 228).setSprite("lapras_giver")--[[['9 ; person']--]]
map.createObject(237, 221).setSprite("erika")--[[.enableWander()--]]--[[['10 ; person']--]]
map.createObject(250, 239).setSprite("gentleman").setDirection("DOWN")--[[['11 ; person']--]]
map.createObject(251, 239).setSprite("bird").setDirection("DOWN")--[[['12 ; person']--]]
map.createObject(238, 243).setSprite("rocker").setDirection("UP")--[[['13 ; person']--]]
--map.createObject(238, 229).setSprite("rocket").setDirection("DOWN") -- In front of SILPH_CO building
map.createObject(239, 229).setSprite("rocket").setDirection("DOWN")--[[['15 ; person']--]]
--map: VERMILION_CITY
map.createObject(239, 172).setSprite("foulard_woman")--[[.enableWander()--]]--[[['1 ; person']--]]
map.createObject(234, 173).setSprite("gambler")--[[['2 ; person']--]]
map.createObject(239, 149).setSprite("sailor").setDirection("UP")--[[['3 ; person']--]]
map.createObject(250, 172).setSprite("gambler")--[[['4 ; person']--]]
map.createObject(249, 170).setSprite("slowbro")--[[.enableWander()--]]--[[['5 ; person']--]]
map.createObject(245, 152).setSprite("sailor")--[[.enableWander()--]]--[[['6 ; person']--]]
--map: VIRIDIAN_CITY
map.createObject(53, 177).setSprite("bug_catcher")--[[.enableWander()--]]--[[['1 ; person']--]]
map.createObject(70, 189).setSprite("gambler")--[[['2 ; person']--]]
map.createObject(70, 172).setSprite("bug_catcher")--[[.enableWander()--]]--[[['3 ; person']--]]
map.createObject(57, 188).setSprite("girl").setDirection("RIGHT")--[[['4 ; person']--]]
map.createObject(58, 188).setSprite("lying_old_man")--[[['5 ; person']--]]
map.createObject(46, 174).setSprite("fisher2").setDirection("DOWN")--[[['6 ; person']--]]
map.createObject(57, 192).setSprite("gambler")--[[.enableWander()--]]--[[['7 ; person']--]]
