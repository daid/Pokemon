include("pokemon.lua")
include("gui.lua")
include("move.lua")
include("ai.lua")
include("experience.lua")
include("item.lua")


function findUsablePokemonIndex(party)
    for n=0,5 do
        if party.get(n) ~= nil then
            return n
        end
    end
end

player = {
    image = gui.getWidget("PLAYER_IMAGE"),
    info_box = gui.getWidget("PLAYER_INFO_BOX"),
    pokemon = createPokemon(player_party, findUsablePokemonIndex(player_party)),
    party = player_party,
    party_member_used_flags = 0,
    run_away = false,
}
enemy = {
    image = gui.getWidget("ENEMY_IMAGE"),
    info_box = gui.getWidget("ENEMY_INFO_BOX"),
    pokemon = createPokemon(enemy_party, findUsablePokemonIndex(player_party)),
    party = enemy_party,
    party_member_used_flags = 0,
    run_away = false,
}
player_party.info = player
enemy_party.info = enemy

function runBattle()
    player.image.setImage("gfx/trainer/" .. player_party.getTrainerImage() .. "b.png")
    player.info_box.hide()
    enemy.info_box.hide()
    if enemy_party.getTrainerImage() ~= "" then
        enemy.image.setImage("gfx/trainer/" .. enemy_party.getTrainerImage() .. ".png")
        initialMovePlayersIntoView()
        showPokeballs(player_party)
        showPokeballs(enemy_party)
        showMessage(enemy_party.getTrainerName() .. " wants\n\nto fight!")
        moveEnemyOutOfView()
        popPokemonInView(enemy.pokemon, enemy_party.getTrainerName() .. " send\n\nout " .. enemy.pokemon.name())
    else
        enemy.image.setImage("gfx/front/" .. enemy.pokemon.className() .. ".png")
        initialMovePlayersIntoView()
        showPokeballs(player_party)
        showMessage("Wild " .. enemy.pokemon.name() .. "\n\nappeared!")
    end
    updateStats(enemy.pokemon)
    movePlayerOutOfView()
    popPokemonInView(player.pokemon, "Go! " .. player.pokemon.name() .. "!")
    
    player.party_member_used_flags = 1 << player.pokemon.index
    enemy.party_member_used_flags = 1 << enemy.pokemon.index

    local action = ACTION_MOVE | 0
    local enemy_action = ACTION_MOVE | 0
    while true do
        player_party.markAsSeen(enemy.pokemon.className())
        enemy_party.markAsSeen(player.pokemon.className())

        if player.pokemon.charge_move == nil then
            action = playerSelectAction(player.pokemon)
        end
        if enemy.pokemon.charge_move == nil then
            enemy_action = aiGetNextAction(enemy.pokemon)
        end
        player.pokemon.turn_count = player.pokemon.turn_count + 1
        enemy.pokemon.turn_count = enemy.pokemon.turn_count + 1
        
        local player_first = true
        --Decide who goes first. This depends on a few things:
        if (action & ACTION_MASK) ~= ACTION_MOVE then
            player_first = true
        elseif (enemy_action & ACTION_MASK) ~= ACTION_MOVE then
            player_first = false
        else
            local priority_player = getMovePriority(player.pokemon.getMoveName(action & ACTION_PARAM))
            local priority_enemy = getMovePriority(enemy.pokemon.getMoveName(enemy_action & ACTION_PARAM))
            --The move with a higher priority always goes first (only QUICK_ATTACK and COUNTER use this)
            if priority_player > priority_enemy then
                player_first = true
            elseif priority_player < priority_enemy then
                player_first = false
            else
                --On the same priority, the pokemon with the highest speed goes first.
                --On equal speed, random who goes first.
                if player.pokemon.speed() > enemy.pokemon.speed() then
                    player_first = true
                elseif player.pokemon.speed() < enemy.pokemon.speed() then
                    player_first = false
                else
                    player_first = random(0, 99) < 50
                end
            end
        end

        if player_first then
            executeAction(player.pokemon, enemy.pokemon, action)
            executeAction(enemy.pokemon, player.pokemon, enemy_action)
            if player.run_away or enemy.run_away then return end
            executePostRoundEffects(player.pokemon)
            executePostRoundEffects(enemy.pokemon)
        else
            executeAction(enemy.pokemon, player.pokemon, enemy_action)
            executeAction(player.pokemon, enemy.pokemon, action)
            if player.run_away or enemy.run_away then return end
            executePostRoundEffects(player.pokemon)
            executePostRoundEffects(enemy.pokemon)
        end
        updateStats(player.pokemon)
        updateStats(enemy.pokemon)
        
        if player.pokemon.hp() < 1 then
            player.image.hide()
            showMessage(player.pokemon.name() .. "\n\nfainted!")
            --TODO faint player pokemon animation
            --TODO wait for message confirm
            local new_index = nil
            while new_index == nil do new_index = playerSelectPokemon(player_party) end
            if new_index == -1 then
                showMessage(player_party.getTrainerName() .. " is out of\n\nuseable POKEMON!")
                showMessage(player_party.getTrainerName() .. " blacked\n\nout!")
                return
            end
            player.pokemon = createPokemon(player_party, new_index)
            enemy.party_member_used_flags = 1 << enemy.pokemon.index
            player.party_member_used_flags = player.party_member_used_flags | (1 << player.pokemon.index)
            popPokemonInView(player.pokemon, "Go! " .. player.pokemon.name() .. "!") --Apparently, this message should depend on the amount of HP the enemy has left, "Go!" "Do it!" "Get'm!" "The enemy's weak!"
        end
        
        if enemy.pokemon.hp() < 1 then
            enemy.info_box.hide()
            enemy.image.hide()
            --TODO faint enemy animation
            showMessage("Enemy ".. enemy.pokemon.name() .. "\n\nfainted!")
            
            earnEV(player, enemy.pokemon)
            earnExperience(player, enemy.pokemon.getExpForDefeat(enemy_party.getTrainerImage() ~= ""))
            updateStats(player.pokemon)

            local new_index = nil
            for n=0,5 do
                if new_index == nil and enemy_party.get(n) and enemy_party.get(n).getHP() > 0 then
                    new_index = n
                end
            end
            if new_index == nil then
                --TODO: Trainers pop back in and still have something to say.
                if enemy_party.getTrainerImage() ~= "" then
                    local highest_level = 1
                    for n=0, 5 do
                        if enemy_party.get(n) ~= nil and enemy_party.get(n).getLevel() > highest_level then
                            highest_level = enemy_party.get(n).getLevel()
                        end
                    end
                    local win_money = 50 --TODO: Depends on the trainer image see "TrainerPicAndMoneyPointers"
                    win_money = win_money * highest_level
                    showMessage(player_party.getTrainerName() .. " got $" .. win_money .. "\n\nfor winning!")
                    player_party.setMoney(player_party.getMoney() + win_money)
                end
                return
            end
            enemy.pokemon = createPokemon(enemy_party, new_index)
            enemy.party_member_used_flags = enemy.party_member_used_flags | (1 << enemy.pokemon.index)
            showMessage(enemy_party.getTrainerName() .. " is\nabout to use\n" .. enemy.pokemon.name() .. "!")
            showPokeballs(enemy_party)
            
            local new_index = nil
            if playerQuestion(player_party, "Will " .. player_party.getTrainerName() .. "\n\nchange POKEMON?", false) then
                new_index = playerSelectPokemon(player_party)
            end
            popPokemonInView(enemy.pokemon, enemy_party.getTrainerName() .. " send\n\nout " .. enemy.pokemon.name())
            if new_index ~= nil and new_index ~= player.pokemon.index then
                showMessage(player.pokemon.name() .. " enough!\n\nCome back!")
                --TODO: hide player pokemon animation
                player.pokemon = createPokemon(player_party, new_index)
                popPokemonInView(player.pokemon, "Go! " .. player.pokemon.name() .. "!")
                enemy.party_member_used_flags = 1 << enemy.pokemon.index
            end
            player.party_member_used_flags = 1 << player.pokemon.index
        end
    end
end

function executeAction(source, target, action)
    if source.hp() < 1 or source.party.info.run_away then return end
    if target.hp() < 1 or target.party.info.run_away then return end

    if source.flinched then
        showMessage(source.name() .. "\n\nflinched!")
        return
    end
    if source.isFrozen() then
        showMessage(source.name() .. "\n\nis frozen solid!")
        return
    end
    if source.getAsleepTurns() > 0 then
        source.setAsleep(source.getAsleepTurns() - 1)
        if source.getAsleepTurns() > 0 then
            showMessage(source.name() .. "\n\nis fast asleep!")
            return
        end
        showMessage(source.name() .. "\n\nwoke up!")
        updateStats(source)
    end
    if source.isParalyzed() then
        if random(0, 99) < 25 then
            showMessage(source.name() .. "'s\n\nfully paralyzed!")
            return
        end
    end

    if action == ACTION_RUN then
        if target.party.getTrainerImage() ~= "" then
            showMessage("No! There's no\nrunning from a\ntrainer battle!")
        else
            if executeRunAction(source, target) then
                source.party.info.run_away = true
            end
        end
    elseif (action & ACTION_MASK) == ACTION_POKEMON then
        showMessage(source.name() .. " enough!\n\nCome back!")
        --TODO: hide player pokemon animation
        source = createPokemon(source.party, action & ACTION_PARAM)
        source.party.info.pokemon = source
        source.party.info.party_member_used_flags = source.party.info.party_member_used_flags | (1 << source.index)
        popPokemonInView(source, "Go! " .. source.name() .. "!")
    elseif (action & ACTION_MASK) == ACTION_ITEM then
        if useItem(source, target, source.party.getItemName(action & ACTION_PARAM)) then
            source.party.removeItem(action & ACTION_PARAM)
        end
    elseif (action & ACTION_MASK) == ACTION_MOVE then
        source.escape_try_counter = 0

        if source.confusion_turns > 0 then
            source.confusion_turns = source.confusion_turns - 1
            if random(0, 99) < 25 then
                local damage = math.floor((((2*source.getLevel())/5+2) * 40.0 * source.attack() / source.defense()) / 50 + 2)
                source.takeDamage(damage);
                showMessage(source.name() + "\n\nis confused!")
                --TODO: Animation
                showMessage("It hurt itself in\nits confusion!")
                --TODO: Basic attack animation
                updateHpBar(pokemon)
                return
            end
        end
        
        if source.charge_move ~= nil then
            executeMove(source, target, source.charge_move)
        else
            if action == ACTION_MOVE_STRUGGLE then
                executeMove(source, target, "STRUGGLE")
            else
                source.modifyMovePP(action & ACTION_PARAM, -1)
                executeMove(source, target, source.getMoveName(action & ACTION_PARAM))
            end
        end
    end
end

function executeRunAction(source, target)
    local my_speed = source.speed()
    local other_speed = target.speed()
    
    source.escape_try_counter = source.escape_try_counter + 1
    local chance = ((my_speed * 32) / (other_speed / 4)) + 30 * source.escape_try_counter
    if random(0, 255) < chance then
        showMessage("Got away safely!")
        return true
    end
    showMessage("Can't escape!")
    return false
end

function executePostRoundEffects(pokemon)
    if pokemon.hp() < 1 then return end

    pokemon.flinched = false
    if pokemon.isBurned() then
        local damage = math.floor(pokemon.hp() / 16)
        if damage < 1 then damage = 1 end
        pokemon.takeDamage(damage)
        showMessage(pokemon.name() .. "'s\n\nhurt by the burn!")
        --TODO ShowEffect(pokemon.battle_target, "burn"),
        updateHpBar(pokemon)
        if pokemon.hp() < 1 then return end
    end
    if pokemon.isPoisoned() then
        local damage = math.floor(pokemon.hp() / 16)
        if damage < 1 then damage = 1 end
        pokemon.takeDamage(damage)
        showMessage(pokemon.name() .. "'s\n\nhurt by the poison!")
        --TODO ShowEffect(pokemon.battle_target, "poisoned"),
        updateHpBar(pokemon)
        if pokemon.hp() < 1 then return end
    end
end
