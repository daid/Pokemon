local function calculateModifierRatio(modifier)
    if modifier < 0 then
        return 2.0 / (2-modifier)
    end
    return (2+modifier) / 2.0
end

function createPokemon(party, index)
    local self = {}
    self.index = index
    self.party = party
    self._ref = party.get(index)

    function self.hp(new_amount)
        if new_amount ~= nil then
            self._ref.setHP(new_amount)
        end
        return self._ref.getHP()
    end
    function self.name() return self._ref.name() end
    function self.className() return self._ref.className() end
    function self.level() return self._ref.getLevel() end
    function self.maxHP() return self._ref.getMaxHP() end
    
    function self.isBurned() return self._ref.isBurned() end
    function self.isFrozen() return self._ref.isFrozen() end
    function self.isParalyzed() return self._ref.isParalyzed() end
    function self.isPoisoned() return self._ref.isPoisoned() end
    function self.getAsleepTurns() return self._ref.getAsleepTurns() end

    function self.setBurned(flag) return self._ref.setBurned(flag) end
    function self.setFrozen(flag) return self._ref.setFrozen(flag) end
    function self.setParalyzed(flag) return self._ref.setParalyzed(flag) end
    function self.setPoisoned(flag) return self._ref.setPoisoned(flag) end
    function self.setAsleep(turns) return self._ref.setAsleep(turns) end

    function self.hasType(name) return self._ref.hasType(name) end
    function self.damageTypeModifier(name) return self._ref.damageTypeModifier(name) end
    function self.getExpForDefeat(is_trainer_battle) return self._ref.getExpForDefeat(is_trainer_battle) end
    function self.getCatchRating() return self._ref.getCatchRating() end
    
    function self.takeDamage(amount)
        if amount > self.hp() then amount = self.hp() end
        self.hp(self.hp() - amount)
        return amount
    end
    function self.attack()
        return math.floor(self._ref.getAttack() * calculateModifierRatio(self._attack_modifier))
    end
    function self.defense()
        return math.floor(self._ref.getDefense() * calculateModifierRatio(self._defense_modifier))
    end
    function self.speed()
        return math.floor(self._ref.getSpeed() * calculateModifierRatio(self._speed_modifier))
    end
    function self.special()
        return math.floor(self._ref.getSpecial() * calculateModifierRatio(self._special_modifier))
    end
    function self.accuracy()
        return math.floor(100 * calculateModifierRatio(self._accuracy_modifier))
    end
    function self.evasion()
        return math.floor(100 * calculateModifierRatio(self._evasion_modifier))
    end
    
    function self.critModifier()
        return self._crit_modifier
    end

    function self.modify(stat_type, amount)
        local stat_key = nil
        if stat_type == "ATTACK" then stat_key = "_attack_modifier"
        elseif stat_type == "DEFENSE" then stat_key = "_defense_modifier"
        elseif stat_type == "SPEED" then stat_key = "_speed_modifier"
        elseif stat_type == "SPECIAL" then stat_key = "_special_modifier"
        elseif stat_type == "ACCURACY" then stat_key = "_accuracy_modifier"
        elseif stat_type == "EVASION" then stat_key = "_evasion_modifier"
        elseif stat_type == "CRIT" then
            if self._crit_modifier + amount < 0 then
                amount = -self._crit_modifier
            end
            if self._crit_modifier + amount < 0 then
                amount = -self._crit_modifier
            end
            if self._crit_modifier + amount > 4 then
                amount = 4 - self._crit_modifier
            end
            self._crit_modifier = self._crit_modifier + amount
            return amount
        else
            print("Warning tried to modify unknown stat:", stat_type)
        end
        if stat_key ~= nil then
            if self[stat_key] + amount < -6 then
                amount = -6 - self[stat_key]
            end
            if self[stat_key] + amount > 6 then
                amount = 6 - self[stat_key]
            end
            self[stat_key] = self[stat_key] + amount
            return amount
        end
        return 0
    end
    
    function self.isProtectedFromDamage()
        return self.charge_move == "FLY" or self.charge_move == "DIG"
    end
    
    self.confusion_turns = 0
    self.flinched = false
    
    self._attack_modifier = 0
    self._defense_modifier = 0
    self._speed_modifier = 0
    self._special_modifier = 0
    self._accuracy_modifier = 0
    self._evasion_modifier = 0
    self._crit_modifier = 1
    
    self.charge_move = nil
    self.escape_try_counter = 0 --Amount of attempts at running
    self.turn_count = 0 --Amount of turns played.
    
    function self.getMoveName(index) return self._ref.getMoveName(index) end
    function self.getMoveType(index) return self._ref.getMoveType(index) end
    function self.getMovePP(index) return self._ref.getMovePP(index) end
    function self.modifyMovePP(index, amount) return self._ref.modifyMovePP(index, amount) end
    function self.getMoveMaxPP(index) return self._ref.getMoveMaxPP(index) end
    function self.getMovePriority(index) return self._ref.getMovePriority(index) end
    
    return self
end
