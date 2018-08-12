map.createObject(2, 12).setSprite("gentleman").setDirection("LEFT").onUse(function(player) possiblyBattleSS_ANNE_8_2_12(player, true) end)
map.createObject(1, 12).onTouch(function(player) possiblyBattleSS_ANNE_8_2_12(player, false) end)
map.createObject(0, 12).onTouch(function(player) possiblyBattleSS_ANNE_8_2_12(player, false) end)
function possiblyBattleSS_ANNE_8_2_12(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_8_2_12", "GENTLEMAN", "gentleman", {{18, "GROWLITHE"}, {18, "GROWLITHE"}}, 'I travel alone\non my journeys!', 'You should be\nnice to friends!', 'My, my\nfriends...')
end
map.createObject(11, 11).setSprite("gentleman").setDirection("UP").onUse(function(player) possiblyBattleSS_ANNE_8_11_11(player, true) end)
map.createObject(11, 12).onTouch(function(player) possiblyBattleSS_ANNE_8_11_11(player, false) end)
map.createObject(11, 13).onTouch(function(player) possiblyBattleSS_ANNE_8_11_11(player, false) end)
map.createObject(11, 14).onTouch(function(player) possiblyBattleSS_ANNE_8_11_11(player, false) end)
function possiblyBattleSS_ANNE_8_11_11(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_8_11_11", "GENTLEMAN", "gentleman", {{19, "NIDORAN_M"}, {19, "NIDORAN_F"}}, 'You pup! How dare\nyou barge in!', 'I wish to be left\nalone! Get out!', 'Humph!\nYou rude child!')
end
map.createObject(11, 1).setSprite("bug_catcher").setDirection("UP").onUse(function(player) possiblyBattleSS_ANNE_8_11_1(player, true) end)
map.createObject(11, 2).onTouch(function(player) possiblyBattleSS_ANNE_8_11_1(player, false) end)
map.createObject(11, 3).onTouch(function(player) possiblyBattleSS_ANNE_8_11_1(player, false) end)
function possiblyBattleSS_ANNE_8_11_1(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_8_11_1", "YOUNGSTER", "youngster", {{21, "NIDORAN_M"}}, 'I love POKEMON!\nDo you?', 'Let me be your\nfriend, OK?', "Wow! \nYou're great!")
end
map.createObject(13, 4).setSprite("lass").setDirection("LEFT").onUse(function(player) possiblyBattleSS_ANNE_8_13_4(player, true) end)
map.createObject(12, 4).onTouch(function(player) possiblyBattleSS_ANNE_8_13_4(player, false) end)
map.createObject(11, 4).onTouch(function(player) possiblyBattleSS_ANNE_8_13_4(player, false) end)
function possiblyBattleSS_ANNE_8_13_4(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_8_13_4", "LASS", "lass", {{18, "PIDGEY"}, {18, "NIDORAN_F"}}, 'I collected these\nPOKEMON from all\naround the world!', 'You hurt my poor\nworldly POKEMON!', 'Oh no!\nI went around the\nworld for these!')
end
map.createObject(22, 12).setSprite("girl")--[[.enableWander()--]]--[[['5 ; person']--]]
map.createObject(0, 1).setSprite("fat_bald_guy")--[[['6 ; person']--]]
map.createObject(2, 4).setSprite("little_girl").setDirection("DOWN")--[[['7 ; person']--]]
map.createObject(3, 4).setSprite("clefairy").setDirection("DOWN")--[[['8 ; person']--]]
map.createObject(10, 2).setSprite("girl").setDirection("RIGHT")--[[['9 ; person']--]]
map.createObject(12, 0).setSprite("ball").onUse(function(player) attemptToPickupObject("SS_ANNE_8_12_0", "TM 08") end)
map.createObject(21, 2).setSprite("gentleman")--[[.enableWander()--]]--[[['11 ; person']--]]
