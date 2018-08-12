map.createObject(5, 11).setSprite("black_hair_boy_2").setDirection("UP")--[[['1 ; person']--]]
map.createObject(4, 4).setSprite("sailor")--[[['2 ; person']--]]
map.createObject(7, 2).setSprite("black_hair_boy_1")--[[['3 ; person']--]]
map.createObject(4, 9).setSprite("sailor").setDirection("DOWN").onUse(function(player) possiblyBattleSS_ANNE_5_4_9(player, true) end)
map.createObject(4, 8).onTouch(function(player) possiblyBattleSS_ANNE_5_4_9(player, false) end)
map.createObject(4, 7).onTouch(function(player) possiblyBattleSS_ANNE_5_4_9(player, false) end)
map.createObject(4, 6).onTouch(function(player) possiblyBattleSS_ANNE_5_4_9(player, false) end)
function possiblyBattleSS_ANNE_5_4_9(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_5_4_9", "SAILOR", "sailor", {{18, "MACHOP"}, {18, "SHELLDER"}}, 'Hey matey!', 'How many kinds of\nPOKEMON do you\nthink there are?', "You're\nimpressive!")
end
map.createObject(10, 5).setSprite("sailor").setDirection("UP").onUse(function(player) possiblyBattleSS_ANNE_5_10_5(player, true) end)
map.createObject(10, 6).onTouch(function(player) possiblyBattleSS_ANNE_5_10_5(player, false) end)
map.createObject(10, 7).onTouch(function(player) possiblyBattleSS_ANNE_5_10_5(player, false) end)
map.createObject(10, 8).onTouch(function(player) possiblyBattleSS_ANNE_5_10_5(player, false) end)
function possiblyBattleSS_ANNE_5_10_5(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SS_ANNE_5_10_5", "SAILOR", "sailor", {{17, "MACHOP"}, {17, "TENTACOOL"}}, 'Ahoy there!\nAre you seasick?', 'My Pa said there\nare 100 kinds of\nPOKEMON. I think\nthere are more.', 'I was\njust careless!')
end
