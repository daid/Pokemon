item_value = {
	["ULTRA BALL"] = 1200,
	["GREAT BALL"] = 600,
	["POKE BALL"] = 200,
	["SAFARI BALL"] = 1000,
	["ANTIDOTE"] = 100,
	["BURN HEAL"] = 250,
	["ICE HEAL"] = 250,
	["AWAKENING"] = 200,
	["PARLYZ HEAL"] = 200,
	["FULL RESTORE"] = 3000,
	["MAX POTION"] = 2500,
	["HYPER POTION"] = 1500,
	["SUPER POTION"] = 700,
	["POTION"] = 300,
	["ESCAPE ROPE"] = 550,
	["REPEL"] = 350,
	["FIRE STONE"] = 2100,
	["THUNDER STONE"] = 2100,
	["WATER STONE"] = 2100,
	["HP UP"] = 9800,
	["PROTEIN"] = 9800,
	["IRON"] = 9800,
	["CARBOS"] = 9800,
	["CALCIUM"] = 9800,
	["RARE CANDY"] = 4800,
	["X ACCURACY"] = 950,
	["LEAF STONE"] = 2100,
	["NUGGET"] = 10000,
	["POKE DOLL"] = 1000,
	["FULL HEAL"] = 600,
	["REVIVE"] = 1500,
	["MAX REVIVE"] = 4000,
	["GUARD SPEC"] = 700,
	["SUPER REPEL"] = 500,
	["MAX REPEL"] = 700,
	["DIRE HIT"] = 650,
	["COIN"] = 10,
	["FRESH WATER"] = 200,
	["SODA POP"] = 300,
	["LEMONADE"] = 350,
	["X ATTACK"] = 500,
	["X DEFEND"] = 550,
	["X SPEED"] = 350,
	["X SPECIAL"] = 350,
}

function showMessage(player, message)
    player.getWidget("MESSAGE_BOX").show()
    player.getWidget("MESSAGE_BOX_LABEL").caption(message)
    yield()
    while not player.keyConfirm() do
        yield()
    end
    player.getWidget("MESSAGE_BOX").hide()
end

function displayMessage(player, message)
    player.getWidget("MESSAGE_BOX").show()
    player.getWidget("MESSAGE_BOX_LABEL").caption(message)
end

function hideMessage(player)
    player.getWidget("MESSAGE_BOX").hide()
end

function confirmQuestion(player, question)
    displayMessage(player, question)
    player.getWidget("CONFIRM_BOX").show()
    local selection = true
    local cursor = player.getWidget("CONFIRM_CURSOR")
    cursor.setOffset(0, 0)
    yield()
    while true do
        if player.keyUp() or player.keyDown() then
            selection = not selection
            if selection then cursor.setOffset(0, 0) else cursor.setOffset(0, 16) end
        end
        if player.keyConfirm() then
            player.getWidget("CONFIRM_BOX").hide()
            player.getWidget("MESSAGE_BOX").hide()
            return selection
        end
        if player.keyCancel() then
            player.getWidget("CONFIRM_BOX").hide()
            player.getWidget("MESSAGE_BOX").hide()
            return false
        end
        yield()
    end
end

function choiceMenu(player, options, menu_width)
    menu_width = menu_width or 144
    local ui = player.getWidget("CHOICE_MENU")
    ui.show()
    local options_text = ""
    for n=1,#options do options_text = options_text .. options[n] .. "\n" end
    ui.getWidget("LABEL").caption(options_text)
    ui.size(menu_width, #options * 8 + 16)
    local index = 1
    local cursor = ui.getWidget("CURSOR")
    cursor.setOffset(0, (index - 1) * 8)
    yield()
    while true do
        if player.keyUp() then
            index = index - 1
            if index == 0 then index = #options end
            cursor.setOffset(0, (index - 1) * 8)
        end
        if player.keyDown() then
            index = index + 1
            if index == #options + 1 then index = 1 end
            cursor.setOffset(0, (index - 1) * 8)
        end
        if player.keyConfirm() then
            ui.hide()
            return index
        end
        if player.keyCancel() then
            ui.hide()
            return nil
        end
        yield()
    end
end

function hasPokemon(player)
    for n=0,5 do
        if player.getParty().get(n) ~= nil then
            return true
        end
    end
    return false
end

function healAllPokemon(player)
    for n=0,5 do
        local pokemon = player.getParty().get(n)
        if pokemon ~= nil then
            pokemon.setHP(pokemon.getMaxHP())
            pokemon.setBurned(false)
            pokemon.setFrozen(false)
            pokemon.setParalyzed(false)
            pokemon.setPoisoned(false)
            pokemon.setAsleep(0)
            for move=0, 3 do
                pokemon.modifyMovePP(move, pokemon.getMoveMaxPP(move))
            end
        end
    end
end

function checkForTrainerBattle(player, is_talked_to, flag_name, trainer_name, trainer_image, pokemon_list, pre_battle_text, post_battle_text, done_battle_text)
    local flag = player.getFlag(flag_name)
    if flag ~= 0 then
        if is_talked_to then
            showMessage(player, done_battle_text)
            if not confirmQuestion(player, "Want a rematch?\nI have been\ntraining!") then
                return
            end
        else
            return
        end
    else
        showMessage(player, pre_battle_text)
    end
    
    local enemy_party = createParty(trainer_name, trainer_image) --NOTE this creates a new object in memory. startBattle() will take over ownership and needs to handle destruction.
    for index=1, #pokemon_list do
        enemy_party.createPokemon(pokemon_list[index][2], pokemon_list[index][1] + (10 * flag))
    end
    --Directly after starting a battle, we need to yield.
    --This yield will return true if we won, false if not.
    --TODO: post_battle_text needs to be shown inside the battle, when you won.
    player.startBattle(enemy_party)
    if yield() then
        player.setFlag(flag_name, flag + 1)
        showMessage(player, done_battle_text)
        return true
    else
        basicPlayerDefeatedResult(player)
        return false
    end
end

function basicPlayerDefeatedResult(player)
    healAllPokemon(player)
    player.getParty().setMoney(math.ceil(player.getParty().getMoney() / 2))
    player.teleportToRestartPosition()
end

function pokecenterNurse(player)
    showMessage(player, "Welcome to our\n\nPOKEMON CENTER!")
    showMessage(player, "We heal your\nPOKEMONMON back to\nperfect health!")
    if confirmQuestion(player, "Shall we heal your\n\nPOKEMON?") then
        showMessage(player, "OK. We'll need\n\nyour POKEMON.")
        
        displayMessage(player, ".")
        for n=0,60 do yield() end
        displayMessage(player, "..")
        for n=0,60 do yield() end
        displayMessage(player, "...")
        for n=0,60 do yield() end
        displayMessage(player, "....")
        for n=0,60 do yield() end

        healAllPokemon(player)
        player.setRestartPosition()

        showMessage(player, "Thank you!\nYour POKEMON are\nfighting fit!")
    end
    showMessage(player, "We hope to see\n\nyou again!")
end

function shopkeeper(player, items)
    local party = player.getParty()
    local buy_list = {}
    for idx=1,#items do
        buy_list[#buy_list + 1] = items[idx] .. string.rep(" ", 11 - #items[idx]) .. "$" .. item_value[items[idx]]
    end
    buy_list[#buy_list + 1] = "CANCEL"
    while true do
        local option = choiceMenu(player, {"BUY", "SELL", "QUIT"})
        if option == 1 then
            showMessage(player, "Take your time.")
            displayMessage(player, "$" .. party.getMoney())
            option = choiceMenu(player, buy_list)
            if option and option < #buy_list then
                if item_value[items[option]] > party.getMoney() then
                    showMessage(player, "Not enough money.")
                else
                    showMessage(player, "Bought 1*" .. items[option])
                    party.addItem(items[option])
                    party.setMoney(party.getMoney() - item_value[items[option]])
                end
            end
            hideMessage(player)
        elseif option == 2 then
            showMessage(player, "What would you\n\nlike to sell?")
            local sell_list = {}
            local idx = 0
            while party.getItemName(idx) ~= "" do
                sell_list[#sell_list + 1] = party.getItemName(idx) .. " *" .. party.getItemCount(idx)
                idx = idx + 1
            end
            if #sell_list == 0 then
                showMessage(player, "You have no\n\nitems to sell");
            else
                sell_list[#sell_list + 1] = "CANCEL"
                option = choiceMenu(player, sell_list)
                if option and option < #sell_list then
                    local sell_value = item_value[party.getItemName(option - 1)]
                    if item_value == nil then
                        showMessage(player, "I am not interrested\nin " .. party.getItemName(option - 1))
                    else
                        if confirmQuestion(player, "Sell 1*" .. party.getItemName(option - 1) .. "\nfor $" .. sell_value .. "?") then
                            showMessage(player, "Sold 1*" .. party.getItemName(option - 1))
                            party.setMoney(party.getMoney() + sell_value)
                            party.removeItem(option - 1)
                        end
                    end
                end
            end
        else
            showMessage(player, "Thank you!")
            return
        end
    end
end

function attemptToPickupObject(player, flag_name, item_name)
    if player.getFlag(flag_name) > 0 then
        showMessage(player, "You search, but\n\nno item was found.")
    else
        showMessage(player, "Found: " .. item_name)
        player.setFlag(flag_name, 1)
        player.getParty().addItem(item_name)
    end
end
