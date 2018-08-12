#ifndef MOVE_H
#define MOVE_H

#include "TypeData.h"

#include <unordered_map>
#include <unordered_set>

class Battle;
class PokemonBattle;
class Move
{
public:

    sp::string name;
    Type type;
    int power;
    int accuracy;
    int pp;
    int priority;
    int attack_count;
    int crit_rate;
    sp::string effect;
    StatType effect_stat;
    int effect_power;
public:
    static Move* get(sp::string name);
    static void loadData();

private:
    static std::unordered_map<sp::string, Move*> data;
};

#endif//MOVE_H
