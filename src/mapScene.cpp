#include "mapScene.h"
#include "scriptableMapObject.h"
#include "playerPawn.h"
#include "pokemonParty.h"
#include "wildpokemonArea.h"

#include <sp2/scene/tilemap.h>
#include <sp2/scene/camera.h>
#include <sp2/stringutil/convert.h>

std::unordered_map<sp::string, sp::P<MapScene>> MapScene::maps;

static int luaf_yield(lua_State* L)
{
    return lua_yield(L, 0);
}

static sp::P<PokemonParty> luaf_createParty(sp::string trainer_name, sp::string trainer_image)
{
    sp::P<PokemonParty> party = new PokemonParty();
    party->trainer_name = trainer_name;
    party->trainer_image = trainer_image;
    return party;
}

static sp::string luaf_getPokedexData(int index, int type)
{
    PokemonStats* s = PokemonStats::get(index);
    if (!s)
        return "";
    switch(type)
    {
    case 0: return s->name;
    case 1: return s->species;
    case 2: return s->pokedex;
    case 3: return s->height;
    case 4: return s->weight;
    }
    return "?";
}

sp::P<MapScene> MapScene::get(sp::string name)
{
    auto it = maps.find(name);
    if (it != maps.end())
        return it->second;
    sp::P<MapScene> ms = new MapScene(name);
    maps[name] = ms;
    return ms;
}

MapScene::MapScene(sp::string name)
: sp::Scene(name)
{
    sp::io::ResourceStreamPtr stream = sp::io::ResourceProvider::get("tilecollision.txt");
    while(stream->tell() < stream->getSize())
    {
        sp::string line = stream->readLine();
        std::vector<int> parts = sp::stringutil::convert::toIntArray(line);
        for(int n : parts)
            tile_types.push_back(TileType(n));
    }

    stream = sp::io::ResourceProvider::get("map/" + name + "/tilemap.txt");
    size = sp::stringutil::convert::toVector2i(stream->readLine());
    
    for(int y=0; y<size.y / 100 + 1; y++)
    {
        for(int x=0; x<size.x / 100 + 1; x++)
        {
            sp::Tilemap* tilemap = new sp::Tilemap(getRoot(), "tiles.png", 1, 32);
            tilemap->setPosition(sp::Vector3d(x * 100, y * 100, -1));
            tilemaps.push_back(tilemap);
        }
    }

    tilemap_rows = size.x / 100 + 1;
    for(int y=0; y<size.y; y++)
    {
        std::vector<int> tiles = sp::stringutil::convert::toIntArray(stream->readLine());
        for(int x=0; x<size.x; x++)
        {
            double z_offset = 0.0;
            if (tile_types[tiles[x]] == TileType::Grass)
                z_offset = 0.9955;
            tilemaps[x / 100 + y / 100 * tilemap_rows]->setTile({x % 100, y % 100}, tiles[x], z_offset);
        }
    }
    
    script_environment = new sp::script::Environment();
    script_environment->setGlobal("map", this);
    script_environment->setGlobal("yield", luaf_yield);
    script_environment->setGlobal("createParty", luaf_createParty);
    script_environment->setGlobal("getPokedexData", luaf_getPokedexData);
    script_environment->load("map/utils.lua");
    script_environment->load("map/mainmenu.lua");
    script_environment->load("map/" + name + "/warps.lua");
    script_environment->load("map/" + name + "/objects.lua");
}

sp::script::CoroutinePtr MapScene::runGlobalFunctionForPlayer(sp::string function_name, sp::P<PlayerPawn> player)
{
    return script_environment->callCoroutine(function_name, player).value();
}

MapScene::TileType MapScene::getTile(sp::Vector2d v)
{
    return getTile(int(v.x + 1.0) - 1, int(v.y + 1.0) - 1);
}

sp::P<MapObject> MapScene::getObjectAt(sp::Vector2d v)
{
    return getObjectAt(int(v.x + 1.0) - 1, int(v.y + 1.0) - 1);
}

sp::P<WildPokemonArea> MapScene::getWildPokemonArea(sp::Vector2i position, TileType type, sp::string mode)
{
    for(sp::P<WildPokemonArea> area : wildpokemon_areas)
    {
        if (area->getType() == type && area->contains(position))
        {
            if (area->getMode() == "" || area->getMode() == mode)
                return area;
        }
    }
    return nullptr;
}

MapScene::TileType MapScene::getTile(int x, int y)
{
    if (x < 0 || x >= size.x)
        return TileType::Blocked;
    if (y < 0 || y >= size.y)
        return TileType::Blocked;
    
    int tilemap_x = x / 100;
    int tilemap_y = y / 100;
    int tile_index = tilemaps[tilemap_x + tilemap_y * tilemap_rows]->getTileIndex({x - tilemap_x * 100, y - tilemap_y * 100});
    if (tile_index < 0)
        return TileType::Blocked;
    return tile_types[tile_index];
}

sp::P<MapObject> MapScene::getObjectAt(int x, int y)
{
    auto it = map_objects.find(sp::Vector2i(x, y));
    if (it == map_objects.end())
        return nullptr;
    return it->second;
}

void MapScene::onRegisterScriptBindings(sp::script::BindingClass& script_binding_class)
{
    script_binding_class.bind("createObject", &MapScene::createObject);
    script_binding_class.bind("setWildPokemon", &MapScene::setWildPokemon);
    script_binding_class.bind("setAlwaysWildEncounters", &MapScene::setAlwaysWildEncounters);
}

sp::P<ScriptableMapObject> MapScene::createObject(int x, int y)
{
    sp::P<ScriptableMapObject> ptr = new ScriptableMapObject(getRoot());
    ptr->setPosition(sp::Vector2i(x, y));
    map_objects[sp::Vector2i(x, y)] = ptr;
    return ptr;
}

sp::P<WildPokemonArea> MapScene::setWildPokemon(sp::Vector2i start, sp::Vector2i end, float encounter_rate)
{
    sp::P<WildPokemonArea> map_area = new WildPokemonArea(start, end, encounter_rate);
    wildpokemon_areas.add(map_area);
    return map_area;
}
