local function pokemonMenu(player)
    local party = player.getParty()
    local ui = gui.getWidget("SELECT_POKEMON")
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
