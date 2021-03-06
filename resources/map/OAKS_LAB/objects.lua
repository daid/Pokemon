function takePokemon(player, pokemon, type, starter_index)
    if hasPokemon(player) then
        showMessage(player, "Don't be greedy.\n\nCapture your own.")
        return
    end

    if confirmQuestion(player, "So! You want the\n" .. type .. " POKEMON,\n" .. pokemon .. "?") then
    	showMessage(player, "This POKEMON is\n\nreally energetic!")
        showMessage(player, player.name() .. " received\n\na " .. pokemon .. "!")
        --TODO: Give a nickname to the pokemon
        player.getParty().createPokemon(pokemon, 5)
        player.setFlag("starter_index", starter_index)
        player.setRestartPosition() --We fix our restart position here, so you need to defeat the rival before you can continue.
    end
end

function handleRivalBattle(player, is_talked_to)
    if not hasPokemon(player) then
        if is_talked_to then showMessage(player, "Go ahead and\n\nchoose, " .. player.name() .. "!") end
        return
    end
    local party = nil
    if player.getFlag("starter_index") == 1 then party = {{5, "SQUIRTLE"}} end
    if player.getFlag("starter_index") == 2 then party = {{5, "BULBASAUR"}} end
    if player.getFlag("starter_index") == 3 then party = {{5, "CHARMANDER"}} end
    if player.getFlag("starter_index") == 4 then party = {{5, "EEVEE"}} end --Pokemon yellow
    if party == nil then return showMessage(player, "Uh? Unknown starter pokemon...") end
    checkForTrainerBattle(player, is_talked_to, "RIVAL_BATTLE_1", "RIVAL", "rival1", party, "Let's check out\nour POKEMON!", "Unbelievable!\nI picked the\nwrong POKEMON!", "I'll make my\nPOKEMON fight to\ntoughen it up!")
end

--Note: Moved rival to allow a battle before exiting.
map.createObject(4, 5).setSprite("blue").setDirection("RIGHT").onUse(function(player) handleRivalBattle(player, true) end)
map.createObject(5, 5).onTouch(function(player) handleRivalBattle(player, false) end)
map.createObject(6, 8).setSprite("ball").onUse(function(player) takePokemon(player, "CHARMANDER", "fire", 1) end)
map.createObject(7, 8).setSprite("ball").onUse(function(player) takePokemon(player, "SQUIRTLE", "water", 2) end)
map.createObject(8, 8).setSprite("ball").onUse(function(player) takePokemon(player, "BULBASAUR", "plant", 3) end)
map.createObject(5, 9).setSprite("oak").setDirection("DOWN").onUse(function(player)
    if not hasPokemon(player) then
        return showMessage(player, "Just pick your\n\nPOKEMON man!")
    end
    showMessage(player, "Raise your young\nPOKEMON by making\nit fight!")
    showMessage(player, "This is totally\nlegal.\nTrust me.")
end)
map.createObject(2, 10).setSprite("book_map_dex").onUse(function(player) showMessage(player, "Old school!\nYour POKEDEX is\nmuch better!") end)
map.createObject(3, 10).setSprite("book_map_dex").onUse(function(player) showMessage(player, "Old school!\nYour POKEDEX is\nmuch better!") end)
map.createObject(1, 2).setSprite("girl").onUse(function(player) showMessage(player, "I don't want\n\nmy POKEMON") showMessage(player, "to fight\n\nto their death...") showMessage(player, "But OAK makes\n\nme do it.") end)--[[.enableWander()--]]
map.createObject(2, 1).setSprite("oak_aide").setDirection("RIGHT").onUse(function(player) if confirmQuestion(player, "Do you want\n\na PIKACHU?") then showMessage(player, "Then find it!") end end)
map.createObject(8, 1).setSprite("oak_aide").setDirection("LEFT").onUse(function(player) if confirmQuestion(player, "Do you want\n\na MEW?") then showMessage(player, "You won't\n\nfind it!") end end)

--Computer
map.createObject(0, 10).onUse(function(player) showMessage(player, "Animated POKEMON\n\nporn...") end)
--Posters on the wall
map.createObject(4, 11).onUse(function(player) showMessage(player, "A revoked POKEMON\n\nbreeder license.") end)
map.createObject(5, 11).onUse(function(player) showMessage(player, "A warrent\n\nfor OAKS arrest.") end)
