ACTION_MOVE = 0x1000
ACTION_ITEM = 0x2000
ACTION_POKEMON = 0x3000
ACTION_RUN = 0x4000

ACTION_MASK = 0xf000
ACTION_PARAM = 0x0fff

ACTION_MOVE_STRUGGLE = ACTION_MOVE | 0x100

message_label = gui.getWidget("MESSAGE_BOX_LABEL")
message_label.caption("")

function initialMovePlayersIntoView()
    for n=170,0,-2 do
        player.image.setOffset(n, 0)
        enemy.image.setOffset(-n, 0)
        yield()
    end
    player.image.setOffset(0, 0)
    enemy.image.setOffset(0, 0)
end

function movePlayerOutOfView()
    for n=0,-70,-2 do
        player.image.setOffset(n, 0)
        yield()
    end
end

function moveEnemyOutOfView()
    for n=0,70,2 do
        enemy.image.setOffset(n, 0)
        yield()
    end
end

function popPokemonInView(pokemon, message)
    updateStats(pokemon)
    local image = pokemon.party.info.image
    if pokemon.party == player_party then
        image.setImage("gfx/back/" .. pokemon.className() .. ".png")
    else
        image.setImage("gfx/front/" .. pokemon.className() .. ".png")
    end
    image.show()
    image.setOffset(0, 0)
    showMessage(message)
    --TODO: pop pokemon in view
    message_label.caption("")
end


function updateHpBar(pokemon)
    local info_box = pokemon.party.info.info_box

    local source = info_box.getWidget("HP").current_value
    local target = pokemon.hp() / pokemon.maxHP()
    if source <= target then
        while source < target do
            if pokemon.party == player_party then
                info_box.getWidget("INFO_LABEL").caption(math.floor(pokemon.maxHP() * source) .. "/" .. pokemon.maxHP())
            end
            info_box.getWidget("HP").value(source)
            yield()
            source = source + 0.02
        end
    else
        while source > target do
            if pokemon.party == player_party then
                info_box.getWidget("INFO_LABEL").caption(math.floor(pokemon.maxHP() * source) .. "/" .. pokemon.maxHP())
            end
            info_box.getWidget("HP").value(source)
            yield()
            source = source - 0.02
        end
    end
    
    if pokemon.party == player_party then
        info_box.getWidget("INFO_LABEL").caption(pokemon.hp() .. "/" .. pokemon.maxHP())
    end
    info_box.getWidget("HP").value(target)
    info_box.getWidget("HP").current_value = target
end

function showMessage(message)
    message_label.caption(message)
    waitForConfirmPress()
    message_label.caption("")
end

function waitForConfirmPress()
    while not player_party.keyConfirm() do --TODO: need to fix this for PVP battles.
        yield()
    end
    yield()
end

function showPokeballs(party)
    local info_box = party.info.info_box
    info_box.show()
    info_box.getWidget("HP").hide()
    info_box.getWidget("NAME").hide()
    info_box.getWidget("LEVEL").hide()
    local balls = " "
    for n=0,5 do
        local pokemon = party.get(n)
        if pokemon and pokemon.getHP() > 0 then
            if pokemon.isBurned() or pokemon.isFrozen() or pokemon.isParalyzed() or pokemon.isPoisoned() or pokemon.getAsleepTurns() > 0 then
                balls = balls .. "#STATUS"
            else
                balls = balls .. "#BALL"
            end
        elseif pokemon then
            balls = balls .."#DEATH"
        else
            balls = balls .."#NOBALL"
        end
    end
    info_box.getWidget("INFO_LABEL").caption(balls)
end

function updateStats(pokemon)
    local info_box = pokemon.party.info.info_box
    info_box.show()

    if pokemon.party == player_party then
        info_box.getWidget("INFO_LABEL").caption(pokemon.hp() .. "/" .. pokemon.maxHP())
    else
        info_box.getWidget("INFO_LABEL").caption("#HP")
    end
    info_box.getWidget("HP").show()
    info_box.getWidget("HP").value(pokemon.hp() / pokemon.maxHP())
    info_box.getWidget("HP").current_value = pokemon.hp() / pokemon.maxHP()
    info_box.getWidget("NAME").show()
    info_box.getWidget("NAME").caption(pokemon.name())
    info_box.getWidget("LEVEL").show()

    if pokemon.isBurned() then
        info_box.getWidget("LEVEL").caption("BRN")
    elseif pokemon.isFrozen() then
        info_box.getWidget("LEVEL").caption("FRZ")
    elseif pokemon.isParalyzed() then
        info_box.getWidget("LEVEL").caption("PAR")
    elseif pokemon.isPoisoned() then
        info_box.getWidget("LEVEL").caption("PSN")
    elseif pokemon.getAsleepTurns() > 0 then
        info_box.getWidget("LEVEL").caption("SLP")
    else
        info_box.getWidget("LEVEL").caption("#LVL" .. pokemon.level())    
    end
end

function playerSelectAction(pokemon)
    message_label.caption("")
    gui.getWidget("COMMAND_BOX").show()
    local x = 0
    local y = 0
    gui.getWidget("COMMAND_CURSOR").setOffset(x, y)
    while true do
        if pokemon.party.keyUp() then
            y = 0
            gui.getWidget("COMMAND_CURSOR").setOffset(x, y)
        end
        if pokemon.party.keyDown() then
            y = 16
            gui.getWidget("COMMAND_CURSOR").setOffset(x, y)
        end
        if pokemon.party.keyLeft() then
            x = 0
            gui.getWidget("COMMAND_CURSOR").setOffset(x, y)
        end
        if pokemon.party.keyRight() then
            x = 48
            gui.getWidget("COMMAND_CURSOR").setOffset(x, y)
        end
        if pokemon.party.keyConfirm() then
            yield()--ensure we enter other menus without confirm still down.
            if x == 0 and y == 0 then
                local result = playerSelectMove(pokemon, true)
                if result ~= nil then
                    gui.getWidget("COMMAND_BOX").hide()
                    return result | ACTION_MOVE
                end
            end
            if x ~= 0 and y == 0 then
                local result = playerSelectPokemon(pokemon.party)
                if result ~= nil then
                    gui.getWidget("COMMAND_BOX").hide()
                    return result | ACTION_POKEMON
                end
            end
            if x == 0 and y ~= 0 then
                gui.getWidget("COMMAND_BOX").hide()
                local result = playerSelectItem(pokemon.party)
                if result ~= nil then
                    return result | ACTION_ITEM
                end
                gui.getWidget("COMMAND_BOX").show()
            end
            if x ~= 0 and y ~= 0 then
                gui.getWidget("COMMAND_BOX").hide()
                return ACTION_RUN
            end
        end
        yield()
    end
end

function playerSelectMove(pokemon, requires_pp)
    gui.getWidget("MOVES_BOX").show()
    local index = 0
    gui.getWidget("MOVE_CURSOR").setOffset(0, index * 8)

    local moves = ""
    local has_move_with_pp = false
    for n=0,3 do
        local move = pokemon.getMoveName(n)
        if move == "" then
            move = "-"
        elseif pokemon.getMovePP(n) > 0 then
            has_move_with_pp = true
        end
        moves = moves .. move .. "\n"
    end
    if not has_move_with_pp and requires_pp then
        return ACTION_MOVE_STRUGGLE
    end

    gui.getWidget("MOVES").caption(moves)
    while true do
        if pokemon.getMoveName(index) ~= "" then
            gui.getWidget("MOVE_INFO_TYPE_LABEL").caption(pokemon.getMoveType(index))
            gui.getWidget("MOVE_INFO_PP_LABEL").caption(pokemon.getMovePP(index) .. "/" .. pokemon.getMoveMaxPP(index))
        else
            gui.getWidget("MOVE_INFO_TYPE_LABEL").caption("NONE")
            gui.getWidget("MOVE_INFO_PP_LABEL").caption("")
        end
        if pokemon.party.keyUp() then
            index = index - 1 if index == -1 then index = 3 end
            gui.getWidget("MOVE_CURSOR").setOffset(0, index * 8)
        end
        if pokemon.party.keyDown() then
            index = index + 1 if index == 4 then index = 0 end
            gui.getWidget("MOVE_CURSOR").setOffset(0, index * 8)
        end
        if pokemon.party.keyConfirm() and pokemon.getMoveName(index) ~= "" and (pokemon.getMovePP(index) > 0 or not requires_pp) then
            gui.getWidget("MOVES_BOX").hide()
            yield()
            return index
        end
        if pokemon.party.keyCancel() then
            gui.getWidget("MOVES_BOX").hide()
            yield()
            return nil
        end
        yield()
    end
end

function playerSelectPokemon(party)
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

    gui.getWidget("PLAYER_INFO_BOX").hide()
    gui.getWidget("ENEMY_INFO_BOX").hide()
    gui.getWidget("PLAYER_IMAGE").hide()
    gui.getWidget("ENEMY_IMAGE").hide()
    ui.show()
    while true do
        if party.keyUp() then
            index = index - 1 if index == -1 then index = 5 end
            ui.getWidget("CURSOR").setOffset(0, index * 16)
        end
        if party.keyDown() then
            index = index + 1 if index == 6 then index = 0 end
            ui.getWidget("CURSOR").setOffset(0, index * 16)
        end
        if party.keyConfirm() and party.get(index) and party.get(index).getHP() > 0 then
            ui.hide()
            gui.getWidget("PLAYER_INFO_BOX").show()
            gui.getWidget("ENEMY_INFO_BOX").show()
            gui.getWidget("PLAYER_IMAGE").show()
            gui.getWidget("ENEMY_IMAGE").show()
            yield()
            return index
        end
        if party.keyCancel() then
            ui.hide()
            gui.getWidget("PLAYER_INFO_BOX").show()
            gui.getWidget("ENEMY_INFO_BOX").show()
            gui.getWidget("PLAYER_IMAGE").show()
            gui.getWidget("ENEMY_IMAGE").show()
            yield()
            return nil
        end
        yield()
    end
end

function playerSelectItem(party)
    local ui = gui.getWidget("ITEM_SELECTION")
    local index = 0
    ui.getWidget("CURSOR").setOffset(0, index * 8)
    local items = ""
    while party.getItemCount(index) > 0 do
        local count = party.getItemCount(index)
        local name = party.getItemName(index)
        items = items .. name
        if count > 1 and count < 10 then items = items .. string.rep(" ", 12 - name:len()) .. "* " .. count end
        if count > 9 then items = items .. string.rep(" ", 12 - name:len()) .. "*" .. count end
        items = items .. "\n"
        index = index + 1
    end
    if index == 0 then
        showMessage("Got no items\n\nto use!")
        return nil
    end
    ui.getWidget("ITEMS").caption(items)
    index = 0
    ui.show()
    while true do
        if party.keyUp() then
            index = index - 1 if index == -1 then while party.getItemCount(index + 1) > 0 do index = index + 1 end end
            ui.getWidget("CURSOR").setOffset(0, index * 8)
        end
        if party.keyDown() then
            index = index + 1 if party.getItemCount(index) == 0 then index = 0 end
            ui.getWidget("CURSOR").setOffset(0, index * 8)
        end
        if party.keyConfirm() then
            ui.hide()
            yield()
            return index
        end
        if party.keyCancel() then
            ui.hide()
            yield()
            return nil
        end
        yield()
    end
end

function playerQuestion(party, message, default)
    message_label.caption(message)
    gui.getWidget("CONFIRM_BOX").show()
    selection = true
    if default ~= nil then selection = default end
    if selection then gui.getWidget("CONFIRM_CURSOR").setOffset(0, 0) else gui.getWidget("CONFIRM_CURSOR").setOffset(0, 16) end
    while true do
        if party.keyUp() or party.keyDown() then
            selection = not selection
            if selection then gui.getWidget("CONFIRM_CURSOR").setOffset(0, 0) else gui.getWidget("CONFIRM_CURSOR").setOffset(0, 16) end
        end
        if party.keyConfirm() then
            gui.getWidget("CONFIRM_BOX").hide()
            yield()
            return selection
        end
        if party.keyCancel() then
            gui.getWidget("CONFIRM_BOX").hide()
            yield()
            return false
        end
        yield()
    end
end
