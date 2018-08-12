map.createObject(1, 12).setSprite("lapras_giver")--[[['1 ; person']--]]
map.createObject(13, 4).setSprite("lapras_giver").setDirection("UP")--[[['2 ; person']--]]
map.createObject(7, 7).setSprite("lapras_giver")--[[['3 ; person']--]]
map.createObject(10, 9).setSprite("erika")--[[['4 ; person']--]]
map.createObject(13, 16).setSprite("rocket").setDirection("DOWN").onUse(function(player) possiblyBattleSILPH_CO_7F_13_16(player, true) end)
map.createObject(13, 15).onTouch(function(player) possiblyBattleSILPH_CO_7F_13_16(player, false) end)
map.createObject(13, 14).onTouch(function(player) possiblyBattleSILPH_CO_7F_13_16(player, false) end)
function possiblyBattleSILPH_CO_7F_13_16(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_7F_13_16", "ROCKET", "rocket", {{26, "RATICATE"}, {26, "ARBOK"}, {26, "KOFFING"}, {26, "GOLBAT"}}, 'Oh ho! I smell a\nlittle rat!', "You won't find my\nBOSS by just\nscurrying around!", 'Lights\nout!')
end
map.createObject(2, 4).setSprite("oak_aide").setDirection("DOWN").onUse(function(player) possiblyBattleSILPH_CO_7F_2_4(player, true) end)
map.createObject(2, 3).onTouch(function(player) possiblyBattleSILPH_CO_7F_2_4(player, false) end)
map.createObject(2, 2).onTouch(function(player) possiblyBattleSILPH_CO_7F_2_4(player, false) end)
map.createObject(2, 1).onTouch(function(player) possiblyBattleSILPH_CO_7F_2_4(player, false) end)
function possiblyBattleSILPH_CO_7F_2_4(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_7F_2_4", "SCIENTIST", "scientist", {{29, "ELECTRODE"}, {29, "MUK"}}, 'Heheh!', 'Despite your age,\nyou are a skilled\ntrainer!', "I'm\ndone!")
end
map.createObject(20, 15).setSprite("rocket").setDirection("LEFT").onUse(function(player) possiblyBattleSILPH_CO_7F_20_15(player, true) end)
map.createObject(19, 15).onTouch(function(player) possiblyBattleSILPH_CO_7F_20_15(player, false) end)
map.createObject(18, 15).onTouch(function(player) possiblyBattleSILPH_CO_7F_20_15(player, false) end)
map.createObject(17, 15).onTouch(function(player) possiblyBattleSILPH_CO_7F_20_15(player, false) end)
function possiblyBattleSILPH_CO_7F_20_15(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_7F_20_15", "ROCKET", "rocket", {{29, "CUBONE"}, {29, "CUBONE"}}, 'I am one of the 4\nROCKET BROTHERS!', "Doesn't matter.\nMy brothers will\nrepay the favor!", 'Aack!\nBrothers, I lost!')
end
map.createObject(19, 3).setSprite("rocket").setDirection("RIGHT").onUse(function(player) possiblyBattleSILPH_CO_7F_19_3(player, true) end)
map.createObject(20, 3).onTouch(function(player) possiblyBattleSILPH_CO_7F_19_3(player, false) end)
map.createObject(21, 3).onTouch(function(player) possiblyBattleSILPH_CO_7F_19_3(player, false) end)
map.createObject(22, 3).onTouch(function(player) possiblyBattleSILPH_CO_7F_19_3(player, false) end)
map.createObject(23, 3).onTouch(function(player) possiblyBattleSILPH_CO_7F_19_3(player, false) end)
function possiblyBattleSILPH_CO_7F_19_3(player, is_talked_to)
    checkForTrainerBattle(player, is_talked_to, "SILPH_CO_7F_19_3", "ROCKET", "rocket", {{29, "SANDSHREW"}, {29, "SANDSLASH"}}, 'A child intruder?\nThat must be you!', 'Go on home\nbefore my BOSS\ngets ticked off!', 'Fine!\nI lost!')
end
map.createObject(3, 10).setSprite("blue").setDirection("UP")--[[['9 ; person']--]]
map.createObject(1, 8).setSprite("ball").onUse(function(player) attemptToPickupObject("SILPH_CO_7F_1_8", "CALCIUM") end)
map.createObject(24, 6).setSprite("ball").onUse(function(player) attemptToPickupObject("SILPH_CO_7F_24_6", "TM 03") end)
