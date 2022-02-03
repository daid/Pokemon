#include "battle.h"
#include "move.h"
#include "guiWrapper.h"

#include <sp2/random.h>
#include <sp2/graphics/gui/loader.h>
#include <sp2/graphics/gui/widget/root.h>
#include <sp2/graphics/gui/widget/progressbar.h>

static int luaf_yield(lua_State* L)
{
    return lua_yield(L, 0);
}

static int luaf_include(lua_State* lua)
{
    sp::string filename = luaL_checkstring(lua, 1);

    auto resource = sp::io::ResourceProvider::get("battle/" + filename);
    if (!resource)
    {
        return luaL_error(lua, "Failed to find %s", filename.c_str());
    }

    sp::string filecontents = resource->readAll();

    if (luaL_loadbuffer(lua, filecontents.c_str(), filecontents.length(), filename.c_str()))
    {
        return lua_error(lua);
    }
    
    //set the environment table it as 1st upvalue for the loaded chunk, else it works in a different environment then where this function was called from.
    lua_pushvalue(lua, lua_upvalueindex(1));
    lua_setupvalue(lua, -2, 1);

    lua_call(lua, 0, 0);
    return 0;
}

static int luaf_getMovePriority(sp::string name)
{
    Move* move = Move::get(name);
    if (!move) return 0;
    return move->priority;
}

static int luaf_getMovePower(sp::string name)
{
    Move* move = Move::get(name);
    if (!move) return 0;
    return move->power;
}

static int luaf_getMoveAccuracy(sp::string name)
{
    Move* move = Move::get(name);
    if (!move) return 0;
    return move->accuracy;
}

static sp::string luaf_getMoveType(sp::string name)
{
    Move* move = Move::get(name);
    if (!move) return "";
    return fromType(move->type);
}

static int luaf_getMoveAttackCount(sp::string name)
{
    Move* move = Move::get(name);
    if (!move) return 0;
    return move->attack_count;
}

static int luaf_getMoveCritRate(sp::string name)
{
    Move* move = Move::get(name);
    if (!move) return 0;
    return move->crit_rate;
}

static sp::string luaf_getMoveEffect(sp::string name)
{
    Move* move = Move::get(name);
    if (!move) return "";
    return move->effect;
}

static sp::string luaf_getMoveEffectStat(sp::string name)
{
    Move* move = Move::get(name);
    if (!move) return "";
    return fromType(move->effect_stat);
}

static int luaf_getMoveEffectPower(sp::string name)
{
    Move* move = Move::get(name);
    if (!move) return 0;
    return move->effect_power;
}

Battle::Battle(sp::P<PlayerParty> player_party, sp::P<PokemonParty> enemy_party, sp::P<sp::gui::Widget> root_widget)
: player_party(player_party), enemy_party(enemy_party)
{
    battle_gui = new GuiWrapper(sp::gui::Loader::load("gui/battle.gui", "BATTLE", root_widget));

    setGlobal("gui", battle_gui);
    
    setGlobal("player_party", player_party);
    setGlobal("enemy_party", enemy_party);

    setGlobal("random", sp::irandom);
    setGlobal("yield", luaf_yield);
    setGlobal("include", luaf_include);
    
    setGlobal("getMovePriority", luaf_getMovePriority);
    setGlobal("getMovePower", luaf_getMovePower);
    setGlobal("getMoveAccuracy", luaf_getMoveAccuracy);
    setGlobal("getMoveType", luaf_getMoveType);
    setGlobal("getMoveAttackCount", luaf_getMoveAttackCount);
    setGlobal("getMoveCritRate", luaf_getMoveCritRate);
    setGlobal("getMoveEffect", luaf_getMoveEffect);
    setGlobal("getMoveEffectStat", luaf_getMoveEffectStat);
    setGlobal("getMoveEffectPower", luaf_getMoveEffectPower);
    
    load("battle/script.lua");
    battle_coroutine = callCoroutine("runBattle").value();
}

Battle::~Battle()
{
    delete battle_gui;
    battle_coroutine = nullptr;
    enemy_party.destroy(); //TODO: Only destroy if this isn't a player party, for PvP battles.
}

bool Battle::update()
{
    if (!battle_coroutine)
        return false;
    if (!battle_coroutine->resume().value())
    {
        LOG(Info, "Battle ended!");
        battle_coroutine = nullptr;
    }
    return true;
}
