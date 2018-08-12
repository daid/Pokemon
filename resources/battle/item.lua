local function cateRate(target, item_name)
    --Note, this is the Gen3 method, as Gen1 is seriously flawed.
    local ball_rating = 1
    if item_name == "POKE BALL" then ball_rating = 1 end
    if item_name == "GREAT BALL" then ball_rating = 1.5 end
    if item_name == "ULTRA BALL" then ball_rating = 2 end
    if item_name == "MASTER BALL" then return 256 end
    local rate = ((3 * target.maxHP() - 2 * target.hp()) * target.getCatchRating() * ball_rating) / (3 * target.maxHP())
    if target.isFrozen() or target.getAsleepTurns() > 0 then
        rate = rate * 2
    elseif target.isParalyzed() or target.isPoisoned() or target.isBurned() then
        rate = rate * 1.5
    end
    return rate
end

local function usePokeball(source, target, item_name)
    --TODO: Show pokeball throw animation
    if target.party.getTrainerImage() ~= "" then
        showMessage("The trainer\nblocked the BALL!")
        showMessage("Don't be a thief!")
        return
    end
    local capture_rate = cateRate(target, item_name)
    target.party.info.image.hide()
    --TODO: Wiggle the ball.
    for n=0,60 do yield() end
    
    if random(0, 255) < capture_rate then
        showMessage("All right!\n" .. target.name() .. " was\ncaught!")
        --TODO: Ask for nickname (we can just change the target name, as the target will be destroyed when the battle ends.
        if not source.party.copyPokemon(target._ref) then
            showMessage(target.name() .. " was\ntransferred to\nthe PC!")
        end
        --TODO? show new pokedex entry if not known yet.
        source.party.info.run_away = true --We just mark the player as fleeing, this ends the battle.
    else
        if random(0, 99) < 70 then
            showMessage("Darn! The " .. target.name() .. "\nbroke free!")
        else 
            showMessage("Aww! It appeared\nto be caught!")
        end
        target.party.info.image.show()
    end
end

function useItem(source, target, item_name)
    message_label.caption(source.name() .. " used\n" .. item_name .. "!")
    if item_name == "POKE BALL" or item_name == "GREAT BALL" or item_name == "ULTRA BALL" or item_name == "MASTER BALL" then
        usePokeball(source, target, item_name)
        return true
    else
        showMessage("Cannot use\n" .. item_name .. "\nin battle!")
        return false
    end
end
