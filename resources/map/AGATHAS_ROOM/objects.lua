map.createObject(5, 9).setSprite("agatha").setDirection("DOWN").onUse(function(player)
    checkForTrainerBattle(player, true, "AGATHAS_ROOM_5_9", "AGATHA", "agatha", {{56, "GENGAR"}, {56, "GOLBAT"}, {55, "HAUNTER"}, {58, "ARBOK"}, {60, "GENGAR"}}, 'I am AGATHA of\nthe ELITE FOUR!', 'You win! I see\nwhat the old duff\nsees in you now!', "Oh ho!\nYou're something\nspecial, child!")
end)
