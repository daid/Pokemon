
function earnExperience(info, amount)
    local count = 0
    for n=0,5 do
        local pokemon = info.party.get(n)
        if (info.party_member_used_flags & (1 << n)) ~= 0 and pokemon and pokemon.getHP() > 0 then
            count = count + 1
        end
    end

    if count == 0 then return end
    amount = math.floor(amount / count)
    
    for n=0,5 do
        local pokemon = info.party.get(n)
        if (info.party_member_used_flags & (1 << n)) ~= 0 and pokemon and pokemon.getHP() > 0 then
            showMessage(pokemon.name() .. " gained\n\n" .. amount  .. " EXP. Points!")
            local start_level = pokemon.getLevel()
            local start_max_hp = pokemon.getMaxHP()
            pokemon.addXP(amount)
            local end_level = pokemon.getLevel()
            local end_max_hp = pokemon.getMaxHP()
            if end_level > start_level then
                pokemon.setHP(pokemon.getHP() + end_max_hp - start_max_hp)
                local ui = gui.getWidget("STATS_BOX")
                ui.show()
                info.image.setImage("gfx/back/" .. pokemon.className() .. ".png")
                ui.getWidget("ATTACK").caption(pokemon.getAttack())
                ui.getWidget("DEFENSE").caption(pokemon.getDefense())
                ui.getWidget("SPEED").caption(pokemon.getAttack())
                ui.getWidget("SPECIAL").caption(pokemon.getSpecial())
                showMessage(pokemon.name() .. " grew\n\nto level " .. end_level .. "!")
                ui.hide()
                info.image.setImage("gfx/back/" .. info.pokemon.className() .. ".png")
                
                for level=start_level+1, end_level do
                    --Note, this does not account for learning more then 1 move at a level. Which never happens in the normal game.
                    --But the backend does account for it.
                    local new_move = pokemon.getLearnedMoveAt(level)
                    if new_move ~= "" then
                        earnNewMove(info, pokemon, new_move)
                    end
                end
                --TODO If level up evolution, display evolution animation (and allow user to cancel this)
            end
        end
    end
end

function earnEV(info, defeated_pokemon)
    for n=0,5 do
        local pokemon = info.party.get(n)
        if (info.party_member_used_flags & (1 << n)) ~= 0 and pokemon and pokemon.getHP() > 0 then
            pokemon.addEV(defeated_pokemon._ref)
        end
    end
end

function earnNewMove(info, pokemon, move)
    local selected_slot = nil
    for n=0, 3 do
        if pokemon.getMoveName(n) == move then
            return false --move already known
        end
        if pokemon.getMoveName(n) == "" and selected_slot == nil then
            selected_slot = n
        end
    end
    if selected_slot == nil then
        showMessage(pokemon.name() .. " is\ntrying to learn\n" .. move .. "!")
        showMessage("But, " .. pokemon.name() .. "\ncan't learn more\nthan 4 moves!")
        if not playerQuestion(info.party, "Delete an older\nmove to make room\nfor" .. move .. "?") then
            showMessage(pokemon.name() .. " did not learn\n\n" .. move .. "!")
            return false
        end
        selected_slot = playerSelectMove(pokemon, false)
        if selected_slot == nil then
            showMessage(pokemon.name() .. " did not learn\n\n" .. move .. "!")
            return false
        end
        showMessage("1, 2 and...\n\nPoof!")
        showMessage(pokemon.name() .. " forgot\n\n" .. pokemon.getMoveName(selected_slot) .. "!")
    end
    pokemon.setMove(selected_slot, move)
    showMessage(pokemon.name() .. " learned\n\n" .. move .. "!")
    return true
end
