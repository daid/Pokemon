#ifndef MAP_SCENE_H
#define MAP_SCENE_H

#include <sp2/scene/scene.h>
#include <sp2/scene/tilemap.h>
#include <sp2/script/environment.h>


class MapObject;
class ScriptableMapObject;
class WildPokemonArea;
class PlayerPawn;
class MapScene : public sp::Scene
{
public:
    enum class TileType
    {
        Open,
        Grass,
        Water,
        Blocked,
        Ledge,
        TopBlocked,
    };
    
    TileType getTile(sp::Vector2d v);
    sp::P<MapObject> getObjectAt(sp::Vector2d v);
    TileType getTile(int x, int y);
    sp::P<MapObject> getObjectAt(int x, int y);
    sp::P<WildPokemonArea> getWildPokemonArea(sp::Vector2i position, TileType type, sp::string mode);
    bool isAlwaysWild() { return always_wild_encounters; }
    
    sp::script::CoroutinePtr runGlobalFunctionForPlayer(sp::string function_name, sp::P<PlayerPawn> player);
private:
    MapScene(sp::string name);

    virtual void onRegisterScriptBindings(sp::script::BindingClass& script_binding_class) override;
    sp::P<ScriptableMapObject> createObject(int x, int y);
    sp::P<WildPokemonArea> setWildPokemon(sp::Vector2i start, sp::Vector2i end, float encounter_rate);
    void setAlwaysWildEncounters() { always_wild_encounters = true; }

    sp::Vector2i size;
    int tilemap_rows;
    bool always_wild_encounters = false;
    std::vector<sp::Tilemap*> tilemaps;
    std::vector<TileType> tile_types;
    std::unordered_map<sp::Vector2i, sp::P<MapObject>> map_objects;
    
    sp::P<sp::script::Environment> script_environment;
    sp::PList<WildPokemonArea> wildpokemon_areas;

public:
    static sp::P<MapScene> get(sp::string name);
private:
    static std::unordered_map<sp::string, sp::P<MapScene>> maps;
};

#endif//MAP_SCENE_H
