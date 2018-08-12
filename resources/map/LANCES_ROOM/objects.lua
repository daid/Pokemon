map.createObject(6, 24).setSprite("lance").setDirection("DOWN").onUse(function(player)
    checkForTrainerBattle(player, true, "LANCES_ROOM_6_24", "LANCE", "lance", {{58, "GYARADOS"}, {56, "DRAGONAIR"}, {56, "DRAGONAIR"}, {60, "AERODACTYL"}, {62, "DRAGONITE"}}, 'Ah! I heard about\nyou <PLAYER>!', "I still can't\nbelieve my\ndragons lost to\nyou, <PLAYER>!", "That's it!")
end)
