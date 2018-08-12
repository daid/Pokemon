map.createObject(4, 14).setSprite("erika").setDirection("DOWN")--[[NO HEADER: .onUse(function(player)
    checkForTrainerBattle(player, true, "CELADON_GYM_4_14", "ERIKA", "erika", {{29, "VICTREEBEL"}, {24, "TANGELA"}, {29, "VILEPLUME"}}, '?', '?', '?')
end)--]]
map.createObject(2, 6).setSprite("lass").setDirection("RIGHT").onUse(function(player) possiblyBattleCELADON_GYM_2_6(player, true) end)
map.createObject(3, 6).onTouch(function(player) possiblyBattleCELADON_GYM_2_6(player, false) end)
map.createObject(4, 6).onTouch(function(player) possiblyBattleCELADON_GYM_2_6(player, false) end)
function possiblyBattleCELADON_GYM_2_6(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "CELADON_GYM_2_6", "LASS", "lass", {{23, "BELLSPROUT"}, {23, "WEEPINBELL"}}, 'Hey!', 'Bleaah!\nI hope ERIKA\nwipes you out!', "You're\ntoo rough!")
end
map.createObject(7, 7).setSprite("foulard_woman").setDirection("LEFT").onUse(function(player) possiblyBattleCELADON_GYM_7_7(player, true) end)
map.createObject(6, 7).onTouch(function(player) possiblyBattleCELADON_GYM_7_7(player, false) end)
map.createObject(5, 7).onTouch(function(player) possiblyBattleCELADON_GYM_7_7(player, false) end)
function possiblyBattleCELADON_GYM_7_7(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "CELADON_GYM_7_7", "BEAUTY", "beauty", {{21, "ODDISH"}, {21, "BELLSPROUT"}, {21, "ODDISH"}, {21, "BELLSPROUT"}}, 'I was getting\nbored.', 'Grass-type POKEMON\nare tough against\nthe water-type!', 'My\nmakeup!')
end
map.createObject(9, 12).setSprite("lass").setDirection("DOWN").onUse(function(player) possiblyBattleCELADON_GYM_9_12(player, true) end)
map.createObject(9, 11).onTouch(function(player) possiblyBattleCELADON_GYM_9_12(player, false) end)
map.createObject(9, 10).onTouch(function(player) possiblyBattleCELADON_GYM_9_12(player, false) end)
map.createObject(9, 9).onTouch(function(player) possiblyBattleCELADON_GYM_9_12(player, false) end)
map.createObject(9, 8).onTouch(function(player) possiblyBattleCELADON_GYM_9_12(player, false) end)
function possiblyBattleCELADON_GYM_9_12(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "CELADON_GYM_9_12", "JR.TRAINER#FEMALE", "jr.trainerf", {{24, "BULBASAUR"}, {24, "IVYSAUR"}}, "Aren't you the\npeeping Tom?", "Oh, you weren't\npeeping? We get a\nlot of gawkers!", "I'm\nin shock!")
end
map.createObject(1, 12).setSprite("foulard_woman").setDirection("DOWN").onUse(function(player) possiblyBattleCELADON_GYM_1_12(player, true) end)
map.createObject(1, 11).onTouch(function(player) possiblyBattleCELADON_GYM_1_12(player, false) end)
map.createObject(1, 10).onTouch(function(player) possiblyBattleCELADON_GYM_1_12(player, false) end)
map.createObject(1, 9).onTouch(function(player) possiblyBattleCELADON_GYM_1_12(player, false) end)
map.createObject(1, 8).onTouch(function(player) possiblyBattleCELADON_GYM_1_12(player, false) end)
function possiblyBattleCELADON_GYM_1_12(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "CELADON_GYM_1_12", "BEAUTY", "beauty", {{24, "BELLSPROUT"}, {24, "BELLSPROUT"}}, 'Look at my grass\nPOKEMON!', 'We only use grass-\ntype POKEMON at\nour GYM!', 'No!')
end
map.createObject(6, 14).setSprite("lass").setDirection("DOWN").onUse(function(player) possiblyBattleCELADON_GYM_6_14(player, true) end)
map.createObject(6, 13).onTouch(function(player) possiblyBattleCELADON_GYM_6_14(player, false) end)
map.createObject(6, 12).onTouch(function(player) possiblyBattleCELADON_GYM_6_14(player, false) end)
function possiblyBattleCELADON_GYM_6_14(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "CELADON_GYM_6_14", "LASS", "lass", {{23, "ODDISH"}, {23, "GLOOM"}}, "Don't bring any\nbugs or fire\nPOKEMON in here!", "Our LEADER, ERIKA,\nmight be quiet,\nbut she's also\nvery skilled!", 'Oh!\nYou!')
end
map.createObject(3, 14).setSprite("foulard_woman").setDirection("DOWN").onUse(function(player) possiblyBattleCELADON_GYM_3_14(player, true) end)
map.createObject(3, 13).onTouch(function(player) possiblyBattleCELADON_GYM_3_14(player, false) end)
map.createObject(3, 12).onTouch(function(player) possiblyBattleCELADON_GYM_3_14(player, false) end)
function possiblyBattleCELADON_GYM_3_14(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "CELADON_GYM_3_14", "BEAUTY", "beauty", {{26, "EXEGGCUTE"}}, 'Pleased to meet\nyou. My hobby is\nPOKEMON training.', 'I have a blind\ndate coming up.\nI have to learn\nto be polite.', 'Oh!\nSplendid!')
end
map.createObject(5, 14).setSprite("lass").setDirection("DOWN").onUse(function(player) possiblyBattleCELADON_GYM_5_14(player, true) end)
map.createObject(5, 13).onTouch(function(player) possiblyBattleCELADON_GYM_5_14(player, false) end)
map.createObject(5, 12).onTouch(function(player) possiblyBattleCELADON_GYM_5_14(player, false) end)
map.createObject(5, 11).onTouch(function(player) possiblyBattleCELADON_GYM_5_14(player, false) end)
function possiblyBattleCELADON_GYM_5_14(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "CELADON_GYM_5_14", "COOLTRAINER#FEMALE", "cooltrainerf", {{24, "WEEPINBELL"}, {24, "GLOOM"}, {24, "IVYSAUR"}}, 'Welcome to\nCELADON GYM!', "I didn't bring my\nbest POKEMON!", 'Oh!\nBeaten!')
end