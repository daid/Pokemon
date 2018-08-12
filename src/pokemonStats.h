#ifndef POKEMON_STATS_H
#define POKEMON_STATS_H

#include "TypeData.h"

#include <sp2/nonCopyable.h>
#include <unordered_map>
#include <unordered_set>

/**
    Static data of a pokemon.
    These are loaded from data files and remain the same troughout the game.
 */
class BaseStats
{
public:
    int hp = 0;
    int attack = 0;
    int defense = 0;
    int speed = 0;
    int special = 0;
};

class Move;
class PokemonStats : sp::NonCopyable
{
public:
    sp::string name;
    BaseStats base;
    std::vector<Type> types;
    int catch_rate;
    int base_exp;
    int exp_table;
    
    std::vector<std::pair<int, Move*>> moves_at_level;
    std::unordered_set<int> allowed_tm;
    
    class Evolution
    {
    public:
        enum class Type
        {
            Level,
            Item,
            Trade
        } type;
        sp::string target;
        sp::string item;
        int level;
    };
    std::vector<Evolution> evolution;

    int expForLevel(int level) const;
    bool hasType(Type type) const;
public:
    static PokemonStats* get(sp::string name);
    static void loadData();

private:
    static std::unordered_map<sp::string, PokemonStats*> data;
};

#endif//POKEMON_STATS_H
