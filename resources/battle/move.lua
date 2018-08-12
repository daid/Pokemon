function executeMove(source, target, move)
    showMessage(source.name() .. "\n\nused " .. move .. "!")--TODO: This shouldn't wait for confirmation. But till we have all animations in, we better wait.

    local power = getMovePower(move)
    local accuracy = getMoveAccuracy(move)
    local move_type = getMoveType(move)
    local crit_rate = getMoveCritRate(move)
    local effect = getMoveEffect(move)
    local effect_stat = getMoveEffectStat(move)
    local effect_power = getMoveEffectPower(move)    
    local attack_count = getMoveAttackCount(move)
    local damage = 0

    if effect == "CHARGE" then
        if source.charge_move == nil then
            source.charge_move = move
            if move == "RAZOR_WIND" then showMessage(source.name() .. "\n\nmade a whirlwind!")
            elseif move == "SOLARBEAM" then showMessage(source.name() .. "\n\ntook in sunlight!")
            elseif move == "SKULL_BASH" then showMessage(source.name() .. "\n\nlowered its head!")
            elseif move == "SKY_ATTACK" then showMessage(source.name() .. "\n\nis glowing!")
            elseif move == "FLY" then source.party.info.image.hide() showMessage(source.name() .. "\n\nflew up high!")
            elseif move == "DIG" then source.party.info.image.hide() showMessage(source.name() .. "\n\ndug a hole!")
            else showMessage(source.name() .. "\n\ncharged up!") --unknown charge move
            end
            return
        end
        source.party.info.image.show()--unhide from dig/fly
        source.charge_move = nil
    end
    if effect == "POST_CHARGE" then
        if source.charge_move ~= nil then
            showMessage(source.name() .. "\n\nmust recharge!")
            return
        end
        source.charge_move = move
    end
    
    if effect == "TWO_TO_FIVE_ATTACKS" then
        local n = random(0, 7)
        if n < 3 then attack_count = 2
        elseif n < 6 then attack_count = 3
        elseif n < 7 then attack_count = 4
        else attack_count = 5
        end
    end
    
    if power > 0 then
        local attack = source.attack()
        local defense = target.defense()
        
        if move_type == "FIRE" or move_type == "WATER" or move_type == "GRASS" or move_type == "ELECTRIC" or move_type == "PSYCHIC" or move_type == "ICE" or move_type == "DRAGON" then
            --Any move of these types is classified as a special move, and thus uses the special stats instead of attack/defense.
            attack = source.special()
            defense = target.special()
        end
        
        --[[GEN1: This is considered pretty much broken by design, and thus we use the GEN2 version.
        local crit_chance = source.speed() / 2 * crit_rate * source.critModifier() --TODO: This should use base stat speed, not modified speed.
        if crit_chance > 255 then crit_chance = 255 end
        --]]
        ---[[GEN2-5:
        local crit_chance = 1/16
        if source.critModifier() == 1 then crit_chance = 1/8 end
        if source.critModifier() == 2 then crit_chance = 1/4 end
        if source.critModifier() == 3 then crit_chance = 1/3 end
        if source.critModifier() == 4 then crit_chance = 1/2 end
        crit_chance = crit_chance * 255 * crit_rate
        --]]
        local is_crit = random(0, 255) < crit_chance
        if is_crit then
            attack = attack * 2
        end
        damage = math.floor((((2*source.level())/5+2) * power * attack / defense) / 50 + 2)

        --Apply SameTypeAttackBonus (STAB)
        if source.hasType(move_type) then
            damage = math.floor(damage * 1.5)
        end

        --Apply type modifiers
        local type_modifier = target.damageTypeModifier(move_type)
        damage = damage * type_modifier
        --Normal damage randomization
        damage = damage * random(85, 100) / 100
        if damage < 0 then damage = 0 end

        if effect == "COUNTER" then
            --TODO: Handle COUNTER move, this should do double the amount of damage back to what we recevied, if the damage was NORMAL or FIGHTING type.
            --      STAB and crits to nothing. If the last move was not of the proper type, or not a damage move, then this attack misses.
            showMessage("TODO, counter damage!")
        end
        if effect == "FIXED_DAMAGE" and type_modifier ~= 0 then
            damage = effect_power
            is_crit = false
            type_modifier = 1.0
        end
        if effect == "DAMAGE_EQUALS_LEVEL" and type_modifier ~= 0 then
            damage = source.getLevel() * effect_power / 100
            is_crit = false
            type_modifier = 1.0
        end
        if effect == "DAMAGE_EQUALS_TARGET_HP" and type_modifier ~= 0 then
            damage = target.hp() * effect_power / 100
            is_crit = false
            type_modifier = 1.0
        end
        if effect == "DAMAGE_RANDOM_TO_LEVEL" and type_modifier ~= 0 then
            damage = random(1, source.getLevel() * effect_power / 100)
            is_crit = false
            type_modifier = 1.0
        end
        if effect == "OHKO" and type_modifier ~= 0 then
            damage = target.hp()
            is_crit = false
            type_modifier = 1.0
        end
        damage = math.floor(damage)

        --Check if we actually hit.
        if effect ~= "SWIFT" then
            if random(0, 99) >= accuracy * source.accuracy() / target.evasion() then
                if effect == "CRASH_DAMAGE" and damage > 0 then
                    showMessage(source.name() .. "'s\nkept going and\ncrashed!")
                    source.takeDamage(math.ceil(damage * effect_power / 100))
                    updateHpBar(target)
                    return
                end
                damage = 0
            end
            if target.isProtectedFromDamage() then
                damage = 0
            end
        end

        if damage == 0 then
            showMessage(source.name() .. "'s\n\nattack missed!")
            return
        end
        
        for n=1,attack_count do
            --TODO attack animation
            target.takeDamage(damage)
            updateHpBar(target)
        end

        if is_crit then
            showMessage("Critical hit!")
        end

        if type_modifier == 0.0 then
            showMessage("It's not\n\neffective...")
        elseif type_modifier < 1.0 then
            showMessage("It's not very\n\neffective...")
        elseif type_modifier > 1.0 then
            showMessage("It's super\n\neffective!")
        end
        if attack_count > 1 then
            showMessage("Hit " .. attack_count .. " times!")
        end
    elseif accuracy < 100 then
        --Check if we actually hit. (For moves that do no damage, but still can miss)
        if random(0, 99) >= accuracy * source.accuracy() / target.evasion() then
            showMessage(source.name() .. "'s\n\nattack missed!")
            return
        end
    end

    if effect == "NONE" then
    elseif effect == "SPLASH" then
        showMessage("No effect!")
    elseif effect == "STAT_UP" then
        --battle.addSequence({new ScreenShake(4)});
        if source.modify(effect_stat, effect_power) ~= 0 then
            if effect_stat == "CRIT" then
                showMessage(source.name() .. "'s\n\ngetting pumped!")
            elseif effect_power > 1 then
                showMessage(source.name() .. "'s\n" .. effect_stat .. "\ngreatly rose!")
            else
                showMessage(source.name() .. "'s\n\n" .. effect_stat .. " rose!")
            end
        elseif power < 1 then --only show nothing happen message if it's not a side effect
            showMessage("Nothing happened!")
        end
    elseif effect == "STAT_DOWN" then
        if power > 0 and random(0, 100) < 33 then --As side effect, there is a 33% chance of success.
            return
        end
        --TODO: Oddly enough, enemies should have a 25% miss chance, while players always hit. (If it's not a side effect)
        --battle.addSequence({new ScreenShake(4)});
        if target.modify(effect_stat, -effect_power) ~= 0 then
            if effect_power > 1 then
                showMessage(target.name() .. "'s\n" .. effect_stat .. "\ngreatly fell!")
            else
                showMessage(target.name() .. "'s\n\n" .. effect_stat .. " fell!")
            end
        elseif power < 1 then --only show nothing happen message if it's not a side effect
            showMessage("Nothing happened!")
        end
    elseif effect == "BURN" then
        if random(0, 99) < effect_power and not target.isBurned() and not target.hasType("FIRE") then
            showMessage(target.name() .. "\n\nwas burned!")
            target.setBurned(true)
            target.setFrozen(false)
        end
    elseif effect == "FREEZE" then
        if random(0, 99) < effect_power and not target.isFrozen() and not target.hasType("ICE") then
            showMessage(target.name() .. "\n\nwas frozen solid!")
            target.setBurned(false)
            target.setFrozen(true)
        end
    elseif effect == "PARALYZE" then
        if random(0, 99) < effect_power and not target.isParalyzed() then
            showMessage(target.name() .. "'s\nparalyzed! It may\nnot attack!")
            target.setParalyzed(true)
        elseif power < 1 then
            showMessage("Nothing happened!")
        end
    elseif effect == "POISON" then
        if random(0, 99) < effect_power and not target.isPoisoned() and not target.hasType("POISON") then
            showMessage(target.name() .. "\n\nwas poisoned!")
            target.setPoisoned(true)
        elseif power < 1 then
            showMessage("Nothing happened!")
        end
    elseif effect == "SLEEP" then
        if random(0, 99) < effect_power and target.getAsleepTurns() < 1 then
            showMessage(target.name() .. "\n\nfell asleep!")
            target.setAsleep(irandom(1, 7))
        elseif power < 1 then
            showMessage("Nothing happened!")
        end
    elseif effect == "CONFUSION" then
        if random(0, 99) < effect_power and target.confusion_turns < 1 then
            showMessage(target.name() .. "\n\nbecame confused!")
            target.confusion_turns = random(1, 4)
        elseif power < 1 then
            showMessage("Nothing happened!")
        end
    elseif effect == "FLINCH" then
        if random(0, 99) < effect_power and not target.flinched then
            target.flinched = true;
        elseif power < 1 then
            showMessage("Nothing happened!")
        end
    elseif effect == "HEAL" then
        if source.hp() == source.getMaxHP() then
            showMessage("But, it failed!")
        else
            if move_type == "PSYCHIC" then --REST move.
                showMessage(source.name() .. "\nfell asleep and\nbecame healthy!")
                source.hp(source.getMaxHP())
                source.setAsleep(2)
            else
                showMessage(source.name() .. "\n\nregained health!")
                source.hp(source.hp() + math.floor(source.getMaxHP() / 2))
            end
            updateHpBar(source)
        end
    elseif effect == "DRAIN_HP" then
        source.hp(source.hp() + math.ceil(damage * effect_power / 100))
        updateHpBar(source)
        showMessage("Sucked health from\n" .. target.name())
    elseif effect == "RECOIL" then
        --TODO: Apply (damage * effect_power / 100) to source
        showMessage("TODO, recoil damage!")
    elseif effect == "TELEPORT_OUT_OF_BATTLE" then
        if target.party.getTrainerImage() == "" then
            --TODO: This should fail if user level is lower then target level, with chance (FLOOR(target.getLevel() / 4) / (target.getLevel() + source.getLevel() + 1))
            source.party.info.run_away = true
            showMessage(source.name() .. "\nran from battle!")
        else
            showMessage("But, it failed!")
        end
    elseif effect == "OHKO" or effect == "ATTACK_TWICE" then
        --Effect already handled
    elseif effect == "CHARGE" or effect == "TWO_TO_FIVE_ATTACKS" or effect == "FIXED_DAMAGE" or effect == "DAMAGE_EQUALS_LEVEL" or effect == "DAMAGE_RANDOM_TO_LEVEL" or effect == "SWIFT" then
        --Effect already handled
    else
        showMessage("Unknown move\neffect:\n" .. effect)
    end
end
