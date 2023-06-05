#include "move.h"
#include "battle.h"

#include <sp2/io/keyValueTreeLoader.h>
#include <sp2/stringutil/convert.h>
#include <sp2/random.h>

std::unordered_map<sp::string, Move*> Move::data;


Move* Move::get(sp::string name)
{
    if (data.find(name) == data.end())
        LOG(Error, "Failed to find move:", name);
    return data[name];
}

void Move::loadData()
{
    for(auto& it : sp::io::KeyValueTreeLoader::loadResource("moves.txt")->getFlattenNodesByIds())
    {
        Move* move = new Move();
        move->name = it.first;
        move->type = toType(it.second["type"]);
        move->power = sp::stringutil::convert::toInt(it.second["power"]);
        move->accuracy = sp::stringutil::convert::toInt(it.second["accuracy"]);
        move->pp = sp::stringutil::convert::toInt(it.second["pp"]);
        move->effect = "NONE";
        move->effect_stat = StatType::None;
        move->effect_power = 0;
        move->priority = sp::stringutil::convert::toInt(it.second["priority"]);
        move->attack_count = 1;
        move->crit_rate = 1;
        if (it.second.find("crit_rate") != it.second.end())
            move->crit_rate = sp::stringutil::convert::toInt(it.second["crit_rate"]);
        if (it.second.find("attack_count") != it.second.end())
            move->attack_count = sp::stringutil::convert::toInt(it.second["attack_count"]);
        if (it.second.find("effect") != it.second.end())
        {
            move->effect = it.second["effect"];
            
            if (it.second.find("effect_stat") != it.second.end())
                move->effect_stat = toStatType(it.second["effect_stat"]);
            move->effect_power = sp::stringutil::convert::toInt(it.second["effect_power"]);;
        }
        data[move->name] = move;
    }
}
