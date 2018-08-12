#include "pokemonStats.h"
#include "move.h"

#include <sp2/io/keyValueTreeLoader.h>
#include <sp2/stringutil/convert.h>

int PokemonStats::expForLevel(int level) const
{
    //As some formulas produce negative numbers, ensure that level 1 isn't a negative exp requirement.
	if (level < 2)
        return 0;
    
    //For each level above 100, we need the total exp again for each level.
    //Meaning that going from level 100 to 101 requires just as much exp as from 1 to 100.
    //As normally, lvl100 is the level cap, and this requires about 30x as much work to go from 100 to 101 as from 99 to 100.
    if (level > 100)
        return expForLevel(100) * (level - 99);

    //exp = d * n^3 + c*n^2 + b*n + a
    float a = 0, b = 0, c = 0, d = 0;

    //exp_table:
	//0: medium fast      n^3
	//1: (unused?)    3/4 n^3 + 10 n^2         - 30
	//2: (unused?)    3/4 n^3 + 20 n^2         - 70
	//3: medium slow: 6/5 n^3 - 15 n^2 + 100 n - 140
	//4: fast:        4/5 n^3
	//5: slow:        5/4 n^3
	switch(exp_table)
	{
	case 0: d = 1.0; break;
	case 1: d = 3.0/4.0; c = 10; a = -30; break;
	case 2: d = 3.0/4.0; c = 20; a = -70; break;
	case 3: d = 6.0/5.0; c =-15; b = 100; a = -140; break;
	case 4: d = 4.0/5.0; break;
	case 5: d = 5.0/4.0; break;
	}
    return (level*level*level)*d + (level*level)*c + level*b + a;
}

bool PokemonStats::hasType(Type type) const
{
    for(Type t : types)
        if (t == type)
            return true;
    return false;
}

std::unordered_map<sp::string, PokemonStats*> PokemonStats::data;
std::unordered_map<int, PokemonStats*> PokemonStats::by_index;

PokemonStats* PokemonStats::get(sp::string name)
{
    return data[name];
}

void PokemonStats::loadData()
{
    for(auto& it : sp::io::KeyValueTreeLoader::load("stats.txt")->getFlattenNodesByIds())
    {
        PokemonStats* pokemon_stats = new PokemonStats();
        pokemon_stats->name = it.first;
        pokemon_stats->base.hp = sp::stringutil::convert::toInt(it.second["hp"]);
        pokemon_stats->base.attack = sp::stringutil::convert::toInt(it.second["attack"]);
        pokemon_stats->base.defense = sp::stringutil::convert::toInt(it.second["defense"]);
        pokemon_stats->base.speed = sp::stringutil::convert::toInt(it.second["speed"]);
        pokemon_stats->base.special = sp::stringutil::convert::toInt(it.second["special"]);
        for(auto& type : it.second["type"].split(","))
        {
            pokemon_stats->types.push_back(toType(type.strip()));
        }
        pokemon_stats->catch_rate = sp::stringutil::convert::toInt(it.second["catch_rate"]);
        pokemon_stats->base_exp = sp::stringutil::convert::toInt(it.second["base_exp"]);
        pokemon_stats->exp_table = sp::stringutil::convert::toInt(it.second["exp_table"]);

        pokemon_stats->pokedex = it.second["pokedex"];
        pokemon_stats->species = it.second["species"];
        pokemon_stats->height = it.second["height"];
        pokemon_stats->weight = it.second["weight"];

        for(int n=0; n<100; n++)
        {
            if (it.second.find("moves_" + sp::string(n)) != it.second.end())
            {
                for(auto& move : it.second["moves_" + sp::string(n)].split(","))
                {
                    pokemon_stats->moves_at_level.emplace_back(n, Move::get(move.strip()));
                }
            }
        }
        for(auto& allowed_tm : it.second["tm"].split(","))
        {
            pokemon_stats->allowed_tm.insert(sp::stringutil::convert::toInt(allowed_tm.strip()));
        }
        //TODO: Evolution

        data[it.first] = pokemon_stats;
        by_index[sp::stringutil::convert::toInt(it.second["index"])] = pokemon_stats;
    }
}
