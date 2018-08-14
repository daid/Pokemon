map.createObject(5, 3).setSprite("mom").setDirection("LEFT").onUse(function(player)
    if hasPokemon(player) then
        showMessage(player, "All boys leave\nhome some day.\nIt said so on TV.")
        return
    end

    if confirmQuestion(player, "You should take a\nquick rest.") then
        healAllPokemon(player)
        player.setRestartPosition()
        
        player.getWidget("MESSAGE_BOX").show()
        player.getWidget("MESSAGE_BOX_LABEL").caption(".")
        for n=0,60 do yield() end
        player.getWidget("MESSAGE_BOX_LABEL").caption("..")
        for n=0,60 do yield() end
        player.getWidget("MESSAGE_BOX_LABEL").caption("...")
        for n=0,60 do yield() end
        player.getWidget("MESSAGE_BOX_LABEL").caption("....")
        for n=0,60 do yield() end

        showMessage(player, "You and your\nPOKEMON are\nlooking great!")
        showMessage(player, "Take care now!")
    end
end)
