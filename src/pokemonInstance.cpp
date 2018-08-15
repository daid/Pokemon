#include "pokemonInstance.h"
#include "move.h"
#include <cmath>

#include <sp2/logging.h>
#include <sp2/random.h>
#include <sp2/stringutil/convert.h>


PokemonInstance::PokemonInstance(sp::string type, int level, bool wild)
: stats(PokemonStats::get(type))
{
    exp = stats->expForLevel(level);
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
    for(auto& it : stats->moves_at_level)
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
    name = stats->name;
}

void PokemonInstance::setHP(int new_hp)
{
    hp = std::max(0, std::min(getMaxHP(), new_hp));
    if (hp == 0)
    {
        setBurned(false);
        setFrozen(false);
        setParalyzed(false);
        setPoisoned(false);
        setAsleep(0);
    }
}

int PokemonInstance::getMaxHP()
{
    int level = getLevel();
    return (((stats->base.hp + iv.hp) * 2 + std::sqrt(ev.hp) / 4) * level) / 100 + level + 10;
}

int PokemonInstance::attack()
{
    int level = getLevel();
    int attack = (((stats->base.attack + iv.attack) * 2 + std::sqrt(ev.attack) / 4) * level) / 100 + 5;
    if (burned)
        attack /= 2;
    return attack;
}

int PokemonInstance::defense()
{
    int level = getLevel();
    return (((stats->base.defense + iv.defense) * 2 + std::sqrt(ev.defense) / 4) * level) / 100 + 5;
}

int PokemonInstance::speed()
{
    int level = getLevel();
    int speed = (((stats->base.speed + iv.speed) * 2 + std::sqrt(ev.speed) / 4) * level) / 100 + 5;
    if (paralyzed)
        speed /= 4;
    return speed;
}

int PokemonInstance::special()
{
    int level = getLevel();
    return (((stats->base.special + iv.special) * 2 + std::sqrt(ev.special) / 4) * level) / 100 + 5;
}

bool PokemonInstance::hasType(sp::string type_name)
{
    Type type = toType(type_name);
    for(Type user_type : stats->types)
        if (type == user_type)
            return true;
    return false;
}

sp::string PokemonInstance::getType(int index)
{
    if (index >= int(stats->types.size()))
        index = 0;
    if (index >= int(stats->types.size()))
        return "NORMAL";
    return fromType(stats->types[index]);
}

float PokemonInstance::damageTypeModifier(sp::string type_name)
{
    Type type = toType(type_name);
    float type_modifier = 1.0;
    for(Type target_type : stats->types)
        type_modifier *= getTypeVsTypeModifier(type, target_type);
    return type_modifier;
}

int PokemonInstance::getLevel()
{
    int level = 2;
    while(stats->expForLevel(level) <= exp)
        level++;
    return level - 1;
}

int PokemonInstance::getExpToNextLevel()
{
    return stats->expForLevel(getLevel() + 1);
}

void PokemonInstance::addXP(int amount)
{
    exp += amount;
}

void PokemonInstance::addEV(sp::P<PokemonInstance> defeated_pokemon)
{
    int start_hp = getMaxHP();
    ev.hp = std::min(0xffff, ev.hp + defeated_pokemon->stats->base.hp);
    ev.attack = std::min(0xffff, ev.attack + defeated_pokemon->stats->base.attack);
    ev.defense = std::min(0xffff, ev.defense + defeated_pokemon->stats->base.defense);
    ev.speed = std::min(0xffff, ev.speed + defeated_pokemon->stats->base.speed);
    ev.special = std::min(0xffff, ev.speed + defeated_pokemon->stats->base.special);
    int end_hp = getMaxHP();
    
    hp += end_hp - start_hp; //Adding EV to the HP stat can increase our max HP, so give that HP to us.
}

sp::string PokemonInstance::evolveByLevelUpTarget()
{
    for(auto& evolution : stats->evolution)
    {
        if (evolution.type == PokemonStats::Evolution::Type::Level && getLevel() >= evolution.level)
            return evolution.target;
    }
    return "";
}

void PokemonInstance::evolveIntoClass(sp::string target_class)
{
    PokemonStats* new_stats = PokemonStats::get(target_class);
    if (new_stats)
    {
        if (name == stats->name)
            name = new_stats->name;
        stats = new_stats;
    }
}

sp::string PokemonInstance::getLearnedMoveAt(int level)
{
    for(auto& it : stats->moves_at_level)
        if (it.first == level)
            return it.second->name;
    return "";
}

int PokemonInstance::getExpForDefeat(bool from_trainer)
{
    float value = stats->base_exp * getLevel();
    if (from_trainer) value *= 1.5;
    return value / 7;
}

int PokemonInstance::getCatchRating()
{
    return stats->catch_rate;
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

void PokemonInstance::saveGame(sp::KeyValueTreeNode& node)
{
    node.items["type"] = stats->name;
    
    node.items["name"] = name;
    node.items["hp"] = sp::string(hp);
    node.items["exp"] = sp::string(exp);
    node.items["asleep"] = sp::string(asleep);
    node.items["poisoned"] = poisoned ? "true" : "false";
    node.items["burned"] = burned ? "true" : "false";
    node.items["frozen"] = frozen ? "true" : "false";
    node.items["paralyzed"] = paralyzed ? "true" : "false";
    
    node.items["ev_hp"] = sp::string(ev.hp);
    node.items["ev_attack"] = sp::string(ev.attack);
    node.items["ev_defense"] = sp::string(ev.defense);
    node.items["ev_speed"] = sp::string(ev.speed);
    node.items["ev_special"] = sp::string(ev.special);

    node.items["iv_hp"] = sp::string(iv.hp);
    node.items["iv_attack"] = sp::string(iv.attack);
    node.items["iv_defense"] = sp::string(iv.defense);
    node.items["iv_speed"] = sp::string(iv.speed);
    node.items["iv_special"] = sp::string(iv.special);
    
    node.child_nodes.emplace_back("moves");
    sp::KeyValueTreeNode& moves_node = node.child_nodes.back();
    for(int n=0; n<max_moves; n++)
    {
        if (!moves[n].move)
            continue;
        moves_node.child_nodes.emplace_back();
        sp::KeyValueTreeNode& i = moves_node.child_nodes.back();
        i.items["move"] = sp::string(moves[n].move->name);
        i.items["pp"] = sp::string(moves[n].pp);
        i.items["pp_up"] = sp::string(moves[n].pp_up);
    }
}

void PokemonInstance::loadGame(const sp::KeyValueTreeNode& node)
{
    name = node.items.at("name");
    hp = sp::stringutil::convert::toInt(node.items.at("hp"));
    exp = sp::stringutil::convert::toInt(node.items.at("exp"));
    asleep = sp::stringutil::convert::toInt(node.items.at("asleep"));
    poisoned = sp::stringutil::convert::toBool(node.items.at("poisoned"));
    burned = sp::stringutil::convert::toBool(node.items.at("burned"));
    frozen = sp::stringutil::convert::toBool(node.items.at("frozen"));
    paralyzed = sp::stringutil::convert::toBool(node.items.at("paralyzed"));
    
    ev.hp = sp::stringutil::convert::toInt(node.items.at("ev_hp"));
    ev.attack = sp::stringutil::convert::toInt(node.items.at("ev_attack"));
    ev.defense = sp::stringutil::convert::toInt(node.items.at("ev_defense"));
    ev.speed = sp::stringutil::convert::toInt(node.items.at("ev_speed"));
    ev.special = sp::stringutil::convert::toInt(node.items.at("ev_special"));

    iv.hp = sp::stringutil::convert::toInt(node.items.at("iv_hp"));
    iv.attack = sp::stringutil::convert::toInt(node.items.at("iv_attack"));
    iv.defense = sp::stringutil::convert::toInt(node.items.at("iv_defense"));
    iv.speed = sp::stringutil::convert::toInt(node.items.at("iv_speed"));
    iv.special = sp::stringutil::convert::toInt(node.items.at("iv_special"));
    
    for(int n=0; n<max_moves; n++)
        moves[n].move = nullptr;
    const sp::KeyValueTreeNode* moves_node = node.findId("moves");
    int index = 0;
    for(auto& node : moves_node->child_nodes)
    {
        moves[index].move = Move::get(node.items.at("move"));
        moves[index].pp = sp::stringutil::convert::toInt(node.items.at("pp"));
        moves[index].pp_up = sp::stringutil::convert::toInt(node.items.at("pp_up"));
        index++;
    }
}

void PokemonInstance::onRegisterScriptBindings(sp::ScriptBindingClass& script_binding_class)
{
    script_binding_class.bind("name", &PokemonInstance::getName);
    script_binding_class.bind("setName", &PokemonInstance::setName);
    script_binding_class.bind("className", &PokemonInstance::getClassName);
    script_binding_class.bind("pokedexIndex", &PokemonInstance::getPokedexIndex);

    script_binding_class.bind("getHP", &PokemonInstance::getHP);
    script_binding_class.bind("setHP", &PokemonInstance::setHP);

    script_binding_class.bind("getMaxHP", &PokemonInstance::getMaxHP);
    script_binding_class.bind("getLevel", &PokemonInstance::getLevel);
    script_binding_class.bind("getExp", &PokemonInstance::getExp);
    script_binding_class.bind("getExpToNextLevel", &PokemonInstance::getExpToNextLevel);
    script_binding_class.bind("addXP", &PokemonInstance::addXP);
    script_binding_class.bind("addEV", &PokemonInstance::addEV);
    script_binding_class.bind("evolveByLevelUpTarget", &PokemonInstance::evolveByLevelUpTarget);
    script_binding_class.bind("evolveIntoClass", &PokemonInstance::evolveIntoClass);
    script_binding_class.bind("getLearnedMoveAt", &PokemonInstance::getLearnedMoveAt);

    script_binding_class.bind("getAttack", &PokemonInstance::attack);
    script_binding_class.bind("getDefense", &PokemonInstance::defense);
    script_binding_class.bind("getSpeed", &PokemonInstance::speed);
    script_binding_class.bind("getSpecial", &PokemonInstance::special);

    script_binding_class.bind("hasType", &PokemonInstance::hasType);
    script_binding_class.bind("getType", &PokemonInstance::getType);
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
