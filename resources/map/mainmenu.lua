function selectPokemonMenu(player)
    local party = player.getParty()
    local ui = player.getWidget("SELECT_POKEMON")
    local index = 0
    ui.getWidget("CURSOR").setOffset(0, index * 16)
    local has_usable_pokemon = false
    for n=0, 5 do
        local row = ui.getWidget("ROW" .. n)
        local pokemon = party.get(n)
        if not pokemon then
            row.hide()
        else
            if pokemon.getHP() > 0 then has_usable_pokemon = true end
            row.getWidget("NAME").caption(pokemon.name())
            row.getWidget("HP").value(pokemon.getHP() / pokemon.getMaxHP())
            --row.getWidget("ICON").caption(pokemon.name())
            row.getWidget("LEVEL").caption("#LVL" .. pokemon.getLevel())
            row.getWidget("HP_LABEL").caption(pokemon.getHP() .. "/" .. pokemon.getMaxHP())
        end
    end
    if not has_usable_pokemon then return -1 end
    ui.show()
    
    yield()
    while true do
        yield()
        if player.keyUp() then
            index = index - 1 if index == -1 then index = 5 end
            ui.getWidget("CURSOR").setOffset(0, index * 16)
        end
        if player.keyDown() then
            index = index + 1 if index == 6 then index = 0 end
            ui.getWidget("CURSOR").setOffset(0, index * 16)
        end
        if player.keyConfirm() and party.get(index) then
            ui.hide()
            return index
        end
        if player.keyCancel() then
            ui.hide()
            return nil
        end
    end
end

function getPokemonStatusString(pokemon, default)
    if pokemon.isBurned() then
        return "BRN"
    elseif pokemon.isFrozen() then
        return "FRZ"
    elseif pokemon.isParalyzed() then
        return "PAR"
    elseif pokemon.isPoisoned() then
        return "PSN"
    elseif pokemon.getAsleepTurns() > 0 then
        return "SLP"
    end
    return default
end

function showPokemonStats(player, pokemon)
    local ui = player.getWidget("STATS_POKEMON")
    ui.getWidget("IMAGE").setImage("gfx/front/" .. pokemon.className() .. ".png")
    ui.getWidget("NO").caption("#NO." .. pokemon.pokedexIndex())
    ui.getWidget("NAME").caption(pokemon.name())
    ui.getWidget("LVL").caption("#LVL" .. pokemon.getLevel())
    ui.getWidget("HP").value(pokemon.getHP() / pokemon.getMaxHP())
    ui.getWidget("HP_LABEL").caption(pokemon.getHP() .. "/" .. pokemon.getMaxHP())
    ui.getWidget("STATUS_LABEL").caption("STATUS/" .. getPokemonStatusString(pokemon, "OK"))
    ui.getWidget("EXP_LABEL").caption(pokemon.getExp())
    ui.getWidget("EXP_TO_LVL_LABEL").caption((pokemon.getExpToNextLevel() - pokemon.getExp()) .. " #LVL" .. (pokemon.getLevel() + 1))
    ui.getWidget("ATTACK").caption(pokemon.getAttack())
    ui.getWidget("DEFENSE").caption(pokemon.getDefense())
    ui.getWidget("SPEED").caption(pokemon.getSpeed())
    ui.getWidget("SPECIAL").caption(pokemon.getSpecial())
    ui.getWidget("TYPE1").caption(pokemon.getType(0))
    ui.getWidget("TYPE2").caption(pokemon.getType(1))
    for n=0, 3 do
        ui.getWidget("MOVE" .. (n+1)).caption(pokemon.getMoveName(n))
        if pokemon.getMoveName(n) ~= "" then
            ui.getWidget("MOVE" .. (n+1) .. "_PP").caption("PP " .. pokemon.getMovePP(n) .. "/" .. pokemon.getMoveMaxPP(n))
        else
            ui.getWidget("MOVE" .. (n+1) .. "_PP").caption("")
        end
    end
    
    ui.show()
    ui.getWidget("A1").show()
    ui.getWidget("A2").show()
    ui.getWidget("A3").show()
    ui.getWidget("B1").hide()
    ui.getWidget("B2").hide()
    yield()
    while not player.keyConfirm() and not player.keyCancel() do
        yield()
    end
    ui.getWidget("A1").hide()
    ui.getWidget("A2").hide()
    ui.getWidget("A3").hide()
    ui.getWidget("B1").show()
    ui.getWidget("B2").show()
    yield()
    while not player.keyConfirm() and not player.keyCancel() do
        yield()
    end
    ui.hide()
end

local function pokemonMenu(player)
    local ui = player.getWidget("SELECT_POKEMON")
    displayMessage(player, "Choose a POKEMON")
    local pokemon_index = selectPokemonMenu(player)
    hideMessage(player)
    if pokemon_index == nil then return end
    
    ui.show()
    local option = choiceMenu(player, {"STATS", "SWITCH", "CANCEL"}) --TODO: Fly/Surf/Strength are also used from here.
    if option == 1 then
        ui.hide()
        showPokemonStats(player, player.getParty().get(pokemon_index))
    elseif option == 2 then
        displayMessage(player, "Move POKEMON\nwhere?")
        local pokemon_index2 = selectPokemonMenu(player)
        if pokemon_index2 ~= nil then
            player.getParty().swap(pokemon_index, pokemon_index2)
        end
        return pokemonMenu(player) --tail call
    end
    ui.hide()
    hideMessage(player)
end

local function pokedexMenu(player)
    showMessage(player, "Not implemented.")
end

local function itemMenu(player)
    local party = player.getParty()
    while true do
        local item_list = {}
        local idx = 0
        while party.getItemName(idx) ~= "" do
            item_list[#item_list + 1] = party.getItemName(idx) .. " *" .. party.getItemCount(idx)
            idx = idx + 1
        end
        if #item_list == 0 then
            showMessage(player, "You have no\n\nitems.");
            return
        else
            item_list[#item_list + 1] = "CANCEL"
            item_number = choiceMenu(player, item_list)
            if item_number == #item_list or item_number == nil then
                return
            end
            local option = choiceMenu(player, {"USE", "DROP", "CANCEL"})
            if option == 1 then
                showMessage(player, "Not implemented.")
            elseif option == 2 then
                showMessage(player, "Not implemented.")
            end
        end
    end
end

function openMainMenu(player)
    local option = choiceMenu(player, {"POKEMON", "POKEDEX", "ITEMS", "CANCEL"}, 88)
    
    if option == 1 then
        pokemonMenu(player)
    elseif option == 2 then
        pokedexMenu(player)
    elseif option == 3 then
        itemMenu(player)
    end
end
