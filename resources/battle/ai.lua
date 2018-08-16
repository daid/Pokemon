
function aiGetNextAction(pokemon)
    local options = {}
    for n=0,3 do
        local move = pokemon.getMoveName(n)
        if move ~= "" then
            local priority = 0
            
            --If a move is running out of PP, reduce the chance that we pick it.
            if pokemon.getMovePP(n) < pokemon.getMoveMaxPP(n) / 2 then
                priority = priority - 5
            end
            if string.sub(getMoveEffect(move), 1, 1) == "_" then
                --Lower priority of not implemented effects.
                priority = priority - 1000
            end
            if getMovePower(move) < 1 then
                --A move without power is generally a stats modifying move.
                --Prefer those in the first 2 turns, but after that, the effectiveness isn't as good.
                if pokemon.turn_count < 2 then
                    priority = priority + 10 * (2 - pokemon.turn_count)
                else
                    priority = priority - 5 * pokemon.turn_count
                end
            else
                --Prefer stronger moves over weaker.
                priority = priority + getMovePower(move) * 0.1
                if getMoveEffect(move) ~= "NONE" then
                    --If an attack has a secondary effect, increase the priority on initial turns.
                    if pokemon.turn_count < 2 then
                        priority = priority + 5 * (2 - pokemon.turn_count)
                    end
                end
            end
            options[#options + 1] = {priority = priority, index = n}
        end
    end
    for n=1,#options - 1 do
        for m=1,#options - 1 do
            if options[m].priority < options[m + 1].priority then
                options[m], options[m + 1] = options[m + 1], options[m]
            end
        end
    end
    
    if #options > 1 then
        if random(0, 100) < 50 - (options[1].priority - options[2].priority) then
            if #options > 2 then
                if random(0, 100) < 50 - (options[2].priority - options[3].priority) then
                    return ACTION_MOVE | options[3].index
                end
            end
            return ACTION_MOVE | options[2].index
        end
    end
    return ACTION_MOVE | options[1].index
end
