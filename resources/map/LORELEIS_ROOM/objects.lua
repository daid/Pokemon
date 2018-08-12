map.createObject(5, 9).setSprite("lorelei").setDirection("DOWN").onUse(function(player)
    checkForTrainerBattle(player, true, "LORELEIS_ROOM_5_9", "LORELEI", "lorelei", {{54, "DEWGONG"}, {53, "CLOYSTER"}, {54, "SLOWBRO"}, {56, "JYNX"}, {56, "LAPRAS"}}, 'Welcome to\nPOKEMON LEAGUE!', "You're better\nthan I thought!\nGo on ahead!", 'How\ndare you!')
end)
