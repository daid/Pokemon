#include "pokemonInstance.h"
#include "move.h"
#include <cmath>

#include <sp2/logging.h>
#include <sp2/random.h>

PokemonInstance::PokemonInstance(sp::string type, int level, bool wild)
: stats(*PokemonStats::get(type))
{
    exp = stats.expForLevel(level);
    level = getLevel();
    if (wild)
    {
        //Wild pokemon get random IVs
        iv.hp = sp::irandom(0, 15);
        iv.attack = sp::irandom(0, 15);
        iv.defense = sp::irandom(0, 15);
        iv.speed = sp::irandom(0, 15);
        iv.special = sp::irandom(0, 15);
    }
    else
    {
        //Trainer pokemon get fixed IVs
        iv.hp = 1;
        iv.attack = 9;
        iv.defense = 8;
        iv.speed = 8;
        iv.special = 8;
    }

    int index = 0;
    for(auto& it : stats.moves_at_level)
    {
        if (it.first > level)
            break;
        if (!hasMove(it.second))
        {
            moves[index].move = it.second;
            moves[index].pp = it.second->pp;
            index = (index + 1) % max_moves;
        }
    }
    
    hp = getMaxHP();
    name = stats.name;
}

int PokemonInstance::getMaxHP()
{
    int level = getLevel();
    return (((stats.base.hp + iv.hp) * 2 + std::sqrt(ev.hp) / 4) * level) / 100 + level + 10;
}

int PokemonInstance::attack()
{
    int level = getLevel();
    int attack = (((stats.base.attack + iv.attack) * 2 + std::sqrt(ev.attack) / 4) * level) / 100 + 5;
    if (burned)
        attack /= 2;
    return attack;
}

int PokemonInstance::defense()
{
    int level = getLevel();
    return (((stats.base.defense + iv.defense) * 2 + std::sqrt(ev.defense) / 4) * level) / 100 + 5;
}

int PokemonInstance::speed()
{
    int level = getLevel();
    int speed = (((stats.base.speed + iv.speed) * 2 + std::sqrt(ev.speed) / 4) * level) / 100 + 5;
    if (paralyzed)
        speed /= 4;
    return speed;
}

int PokemonInstance::special()
{
    int level = getLevel();
    return (((stats.base.special + iv.special) * 2 + std::sqrt(ev.special) / 4) * level) / 100 + 5;
}

bool PokemonInstance::hasType(sp::string type_name)
{
    Type type = toType(type_name);
    for(Type user_type : stats.types)
        if (type == user_type)
            return true;
    return false;
}

float PokemonInstance::damageTypeModifier(sp::string type_name)
{
    Type type = toType(type_name);
    float type_modifier = 1.0;
    for(Type target_type : stats.types)
        type_modifier *= getTypeVsTypeModifier(type, target_type);
    return type_modifier;
}

int PokemonInstance::getLevel()
{
    int level = 2;
    while(stats.expForLevel(level) <= exp)
        level++;
    return level - 1;
}

int PokemonInstance::getExpToNextLevel()
{
    return stats.expForLevel(getLevel() + 1);
}

void PokemonInstance::addXP(int amount)
{
    exp += amount;
}

void PokemonInstance::addEV(sp::P<PokemonInstance> defeated_pokemon)
{
    int start_hp = getMaxHP();
    ev.hp = std::min(0xffff, ev.hp + defeated_pokemon->stats.base.hp);
    ev.attack = std::min(0xffff, ev.attack + defeated_pokemon->stats.base.attack);
    ev.defense = std::min(0xffff, ev.defense + defeated_pokemon->stats.base.defense);
    ev.speed = std::min(0xffff, ev.speed + defeated_pokemon->stats.base.speed);
    ev.special = std::min(0xffff, ev.speed + defeated_pokemon->stats.base.special);
    int end_hp = getMaxHP();
    
    hp += end_hp - start_hp; //Adding EV to the HP stat can increase our max HP, so give that HP to us.
}

sp::string PokemonInstance::getLearnedMoveAt(int level)
{
    for(auto& it : stats.moves_at_level)
        if (it.first == level)
            return it.second->name;
    return "";
}

int PokemonInstance::getExpForDefeat(bool from_trainer)
{
    float value = stats.base_exp * getLevel();
    if (from_trainer) value *= 1.5;
    return value / 7;
}

int PokemonInstance::getCatchRating()
{
    return stats.catch_rate;
}

sp::string PokemonInstance::getMoveName(int index)
{
    if (index < 0 || index > max_moves || !moves[index].move)
        return "";
    return moves[index].move->name;
}

void PokemonInstance::setMove(int index, sp::string name)
{
    if (index < 0 || index > max_moves)
        return;
    Move* new_move = Move::get(name);
    if (!new_move)
        return;
    moves[index].move = new_move;
    moves[index].pp_up = 0;
    moves[index].pp = moves[index].getMaxPP();
}

sp::string PokemonInstance::getMoveType(int index)
{
    if (index < 0 || index > max_moves || !moves[index].move)
        return "";
    return fromType(moves[index].move->type);
}

int PokemonInstance::getMovePP(int index)
{
    if (index < 0 || index > max_moves || !moves[index].move)
        return 0;
    return moves[index].pp;
}

void PokemonInstance::modifyMovePP(int index, int amount)
{
    if (index < 0 || index > max_moves || !moves[index].move)
        return;
    moves[index].pp += amount;
    moves[index].pp = std::max(0, moves[index].pp);
    moves[index].pp = std::min(moves[index].getMaxPP(), moves[index].pp);
}

int PokemonInstance::getMoveMaxPP(int index)
{
    if (index < 0 || index > max_moves || !moves[index].move)
        return 0;
    return moves[index].getMaxPP();
}

bool PokemonInstance::hasMove(Move* move) const
{
    for(int n=0; n<max_moves; n++)
        if (moves[n].move == move)
            return true;
    return false;
}

int PokemonInstance::MoveData::getMaxPP()
{
    if (!move)
        return 0;
    return move->pp + (move->pp * pp_up / 5);
}

void PokemonInstance::onRegisterScriptBindings(sp::ScriptBindingClass& script_binding_class)
{
    script_binding_class.bind("name", &PokemonInstance::getName);
    script_binding_class.bind("setName", &PokemonInstance::setName);
    script_binding_class.bind("className", &PokemonInstance::getClassName);

    script_binding_class.bind("getHP", &PokemonInstance::getHP);
    script_binding_class.bind("setHP", &PokemonInstance::setHP);

    script_binding_class.bind("getMaxHP", &PokemonInstance::getMaxHP);
    script_binding_class.bind("getLevel", &PokemonInstance::getLevel);
    script_binding_class.bind("addXP", &PokemonInstance::addXP);
    script_binding_class.bind("addEV", &PokemonInstance::addEV);
    script_binding_class.bind("getLearnedMoveAt", &PokemonInstance::getLearnedMoveAt);

    script_binding_class.bind("getAttack", &PokemonInstance::attack);
    script_binding_class.bind("getDefense", &PokemonInstance::defense);
    script_binding_class.bind("getSpeed", &PokemonInstance::speed);
    script_binding_class.bind("getSpecial", &PokemonInstance::special);

    script_binding_class.bind("hasType", &PokemonInstance::hasType);
    script_binding_class.bind("damageTypeModifier", &PokemonInstance::damageTypeModifier);
    
    script_binding_class.bind("isBurned", &PokemonInstance::isBurned);
    script_binding_class.bind("isFrozen", &PokemonInstance::isFrozen);
    script_binding_class.bind("isParalyzed", &PokemonInstance::isParalyzed);
    script_binding_class.bind("isPoisoned", &PokemonInstance::isPoisoned);
    script_binding_class.bind("getAsleepTurns", &PokemonInstance::getAsleepTurns);

    script_binding_class.bind("setBurned", &PokemonInstance::setBurned);
    script_binding_class.bind("setFrozen", &PokemonInstance::setFrozen);
    script_binding_class.bind("setParalyzed", &PokemonInstance::setParalyzed);
    script_binding_class.bind("setPoisoned", &PokemonInstance::setPoisoned);
    script_binding_class.bind("setAsleep", &PokemonInstance::setAsleep);
    
    script_binding_class.bind("getMoveName", &PokemonInstance::getMoveName);
    script_binding_class.bind("setMove", &PokemonInstance::setMove);
    script_binding_class.bind("getMoveType", &PokemonInstance::getMoveType);
    script_binding_class.bind("getMovePP", &PokemonInstance::getMovePP);
    script_binding_class.bind("modifyMovePP", &PokemonInstance::modifyMovePP);
    script_binding_class.bind("getMoveMaxPP", &PokemonInstance::getMoveMaxPP);
    
    script_binding_class.bind("getExpForDefeat", &PokemonInstance::getExpForDefeat);
    script_binding_class.bind("getCatchRating", &PokemonInstance::getCatchRating);
}
