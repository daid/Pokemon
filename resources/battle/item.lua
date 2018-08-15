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
        return true
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
    return true
end

local function useHealItem(source, item_name, value)
    local pokemon_index = playerSelectPokemon(source.party)
    if pokemon_index == nil then return false end
    if pokemon_index == source.index then
        source.hp(source.hp() + value)
        updateHpBar(source)
    else
        local pokemon = source.party.get(pokemon_index)
        if pokemon.getHP() > 0 then
            pokemon.setHP(pokemon.getHP() + value)
        end
    end
    return true
end

local function useReviveItem(source, item_name, value)
    local pokemon_index = playerSelectPokemon(source.party, true)
    if pokemon_index == nil then return false end
    if pokemon_index == source.index then
        showMessage("No effect")
    else
        local pokemon = source.party.get(pokemon_index)
        if pokemon.getHP() > 0 then
            showMessage("No effect")
        else
            pokemon.setHP(pokemon.getMaxHP() * value)
        end
    end
    return true
end

function useItem(source, target, item_name)
    message_label.caption(source.name() .. " used\n" .. item_name .. "!")
    if item_name == "POKE BALL" or item_name == "GREAT BALL" or item_name == "ULTRA BALL" or item_name == "MASTER BALL" then
        return usePokeball(source, target, item_name)
    elseif item_name == "POTION" then
        return useHealItem(source, item_name, 20)
    elseif item_name == "FRESH WATER" then
        return useHealItem(source, item_name, 50)
    elseif item_name == "SODA POP" then
        return useHealItem(source, item_name, 60)
    elseif item_name == "SUPER POTION" then
        return useHealItem(source, item_name, 70)
    elseif item_name == "LEMONADE" then
        return useHealItem(source, item_name, 80)
    elseif item_name == "HYPER POTION" then
        return useHealItem(source, item_name, 200)
    elseif item_name == "MAX POTION" then
        return useHealItem(source, item_name, 999999)
    elseif item_name == "REVIVE" then
        return useReviveItem(source, item_name, 0.5)
    elseif item_name == "MAX REVIVE" then
        return useReviveItem(source, item_name, 0.5)
    else
        showMessage("Cannot use\n" .. item_name .. "\nin battle!")
        return false
    end
end

--[[
    Item TODO list: (for in battle items)
	dw ItemUseMedicine   ; ANTIDOTE
	dw ItemUseMedicine   ; BURN_HEAL
	dw ItemUseMedicine   ; ICE_HEAL
	dw ItemUseMedicine   ; AWAKENING
	dw ItemUseMedicine   ; PARLYZ_HEAL
	dw ItemUseMedicine   ; FULL_RESTORE
	dw ItemUseXAccuracy  ; X_ACCURACY
	dw ItemUsePokedoll   ; POKE_DOLL
	dw ItemUseMedicine   ; FULL_HEAL
	dw ItemUseGuardSpec  ; GUARD_SPEC
	dw ItemUseDireHit    ; DIRE_HIT
	dw ItemUseXStat      ; X_ATTACK
	dw ItemUseXStat      ; X_DEFEND
	dw ItemUseXStat      ; X_SPEED
	dw ItemUseXStat      ; X_SPECIAL
	dw ItemUsePPRestore  ; ETHER
	dw ItemUsePPRestore  ; MAX_ETHER
	dw ItemUsePPRestore  ; ELIXER
	dw ItemUsePPRestore  ; MAX_ELIXER
--]]
