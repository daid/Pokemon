#ifndef WILD_POKEMON_AREA_H
#define WILD_POKEMON_AREA_H

#include "mapScene.h"

#include <sp2/random.h>

class WildPokemonArea : public sp::script::BindingObject
{
public:
    struct Encounter
    {
        float chance;
        int level;
        sp::string name;
    };

    WildPokemonArea(sp::Vector2i start, sp::Vector2i end, float encounter_rate)
    : start(start), end(end), encounter_rate(encounter_rate)
    {
        encounter_chance_total = 0;
        type = MapScene::TileType::Grass;
    }

    bool contains(sp::Vector2i position)
    {
        if (position.x < start.x || position.x > end.x)
            return false;
        if (position.y < start.y || position.y > end.y)
            return false;
        return true;
    }
    
    MapScene::TileType getType()
    {
        return type;
    }
    
    sp::string getMode()
    {
        return mode;
    }
    
    float getEncounterRate()
    {
        return encounter_rate;
    }

    const Encounter& getRandomEncounter()
    {
        float f = sp::random(0, encounter_chance_total);
        for(auto& e : encounters)
        {
            if (f < e.chance)
                return e;
            f -= e.chance;
        }
        return encounters[0];
    }
private:
    void setType(sp::string type)
    {
        if (type == "LAND")
            this->type = MapScene::TileType::Grass;
        else if (type == "WATER")
            this->type = MapScene::TileType::Water;
    }
    
    void setMode(sp::string mode)
    {
        this->mode = mode;
    }
    
    void addEncounter(float chance, int level, sp::string name)
    {
        encounters.emplace_back();
        encounter_chance_total += chance;
        encounters.back().chance = chance;
        encounters.back().level = level;
        encounters.back().name = name;
    }

    virtual void onRegisterScriptBindings(sp::script::BindingClass& script_binding_class) override
    {
        script_binding_class.bind("type", &WildPokemonArea::setType);
        script_binding_class.bind("mode", &WildPokemonArea::setMode);
        script_binding_class.bind("add", &WildPokemonArea::addEncounter);
    }

    MapScene::TileType type;
    sp::string mode;
    
    float encounter_chance_total;
    std::vector<Encounter> encounters;
    
    sp::Vector2i start;
    sp::Vector2i end;
    float encounter_rate;
};

#endif//WILD_POKEMON_AREA_H
