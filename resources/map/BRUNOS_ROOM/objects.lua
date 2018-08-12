map.createObject(5, 9).setSprite("bruno").setDirection("DOWN").onUse(function(player)
    checkForTrainerBattle(player, true, "BRUNOS_ROOM_5_9", "BRUNO", "bruno", {{53, "ONIX"}, {55, "HITMONCHAN"}, {55, "HITMONLEE"}, {56, "ONIX"}, {58, "MACHAMP"}}, 'I am BRUNO of\nthe ELITE FOUR!', 'My job is done!\nGo face your next\nchallenge!', 'Why?\nHow could I lose?')
end)
