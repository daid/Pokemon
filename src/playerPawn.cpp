#include "playerPawn.h"
#include "mapScene.h"
#include "wildpokemonArea.h"
#include "playerInfo.h"
#include "pokemonParty.h"
#include "playerParty.h"
#include "guiWrapper.h"

#include <sp2/stringutil/convert.h>
#include <sp2/graphics/gui/loader.h>
#include <sp2/graphics/spriteAnimation.h>
#include <sp2/graphics/gui/widget/root.h>


PlayerPawn::PlayerPawn(sp::P<sp::Node> parent, sp::P<PlayerInfo> player_info, InputController& controller, sp::string sprite, sp::P<sp::gui::RootWidget> root_widget)
: MapObject(parent), controller(controller), player_info(player_info)
{
    setAnimation(sp::SpriteAnimation::load("gfx/sprite/" + sprite + ".txt"));
    animationPlay("Stand_down");
    
    map_gui = new GuiWrapper(sp::gui::Loader::load("gui/map.gui", "GUI", root_widget));
}

void PlayerPawn::onFixedUpdate()
{
    if (!active)
        return;
    if (active_coroutine)
    {
        if (!active_coroutine->resume())
            active_coroutine = nullptr;
        return;
    }
    
    if (controller.down.get())
        move(Direction::Down);
    if (controller.up.get())
        move(Direction::Up);
    if (controller.left.get())
        move(Direction::Left);
    if (controller.right.get())
        move(Direction::Right);
    
    if (walking > 0)
    {
        sp::Node::setPosition(getPosition2D() + toOffset(direction) / double(walking_ticks));
        walking--;
        if (walking < 1)
        {
            sp::P<MapScene> scene = getScene();
            sp::P<MapObject> obj = scene->getObjectAt(getPosition2D());
            if (obj)
            {
                obj->onTouch(this);
                if (active_coroutine)
                {
                    //Prevent wild pokemon triggers when a script is started and still running.
                    animationPlay("Stand_" + toString(direction));
                    return;
                }
            }

            if (scene->isAlwaysWild() || scene->getTile(getPosition2D()) == MapScene::TileType::Grass)
            {
                if (wildpokemon_area && !wildpokemon_area->contains(sp::Vector2i(getPosition2D())))
                    wildpokemon_area = nullptr;
                if (!wildpokemon_area)
                    wildpokemon_area = scene->getWildPokemonArea(sp::Vector2i(getPosition2D()), MapScene::TileType::Grass, player_info->getParty()->game_type);
                if (wildpokemon_area)
                {
                    if (sp::random(0, 1) < wildpokemon_area->getEncounterRate())
                    {
                        WildPokemonArea::Encounter encounter = wildpokemon_area->getRandomEncounter();
                        
                        sp::P<PokemonParty> wild_party = new PokemonParty();
                        wild_party->party[0] = new PokemonInstance(encounter.name, encounter.level, true);
                        player_info->startBattle(wild_party);
                    }
                }
            }
            
            if (!controller.down.get() && !controller.up.get() && !controller.left.get() && !controller.right.get())
                animationPlay("Stand_" + toString(direction));
        }
    }
    else
    {
        if (controller.confirm.getDown())
        {
            sp::P<MapScene> scene = getScene();
            sp::P<MapObject> obj = scene->getObjectAt(getPosition2D() + toOffset(direction));
            if (obj)
                obj->onUse(this);
        }
        if (!active_coroutine && controller.menu.getDown())
        {
            sp::P<MapScene> scene = getScene();
            active_coroutine = scene->runGlobalFunctionForPlayer("openMainMenu", this);
        }
    }
}

void PlayerPawn::move(Direction direction)
{
    if (walking)
        return;

    this->direction = direction;

    sp::P<MapScene> scene = getScene();
    MapScene::TileType source_tile_type = scene->getTile(getPosition2D());
    MapScene::TileType target_tile_type = scene->getTile(getPosition2D() + toOffset(direction));
    sp::P<MapObject> obj = scene->getObjectAt(getPosition2D() + toOffset(direction));
    if (obj && obj->isSolid())
    {
        animationPlay("Stand_" + toString(direction));
        return;
    }

    if (target_tile_type == MapScene::TileType::Ledge && direction == Direction::Down && canWalkOn(scene->getTile(getPosition2D() + toOffset(direction) * 2.0)))
    {
        obj = scene->getObjectAt(getPosition2D() + toOffset(direction) * 2.0);
        if (obj && obj->isSolid())
        {
            animationPlay("Stand_" + toString(direction));
            return;
        }
        animationPlay("Walk_" + toString(direction));
        walking = walking_ticks * 2;
        return;
    }
    bool can_walk = canWalkOn(target_tile_type);
    
    if (target_tile_type == MapScene::TileType::TopBlocked && direction == Direction::Down)
        can_walk = false;
    if (source_tile_type == MapScene::TileType::TopBlocked && direction == Direction::Up)
        can_walk = false;

    if (!can_walk)
    {
        animationPlay("Stand_" + toString(direction));
        if (obj)
            obj->onTouch(this);
        return;
    }

    animationPlay("Walk_" + toString(direction));
    walking = walking_ticks;
}

bool PlayerPawn::canWalkOn(MapScene::TileType tile_type)
{
    return tile_type == MapScene::TileType::Open || tile_type == MapScene::TileType::Grass || tile_type == MapScene::TileType::TopBlocked;
}

void PlayerPawn::teleportTo(sp::string map_name, int x, int y)
{
    setParent(MapScene::get(map_name)->getRoot());
    setPosition(sp::Vector2i(x, y));

    wildpokemon_area = nullptr;
}

void PlayerPawn::setRestartPosition()
{
    player_info->getParty()->restart_map = getScene()->getName();
    player_info->getParty()->restart_position = sp::Vector2i(getPosition2D());
}

void PlayerPawn::teleportToRestartPosition()
{
    teleportTo(player_info->getParty()->restart_map, player_info->getParty()->restart_position.x, player_info->getParty()->restart_position.y);
}

void PlayerPawn::startBattle(sp::P<PokemonParty> enemy_party)
{
    player_info->startBattle(enemy_party);
}

sp::string PlayerPawn::getName()
{
    return player_info->getParty()->trainer_name;
}

int PlayerPawn::getFlag(sp::string name)
{
    return player_info->getParty()->getFlag(name);
}

void PlayerPawn::setFlag(sp::string name, int value)
{
    player_info->getParty()->setFlag(name, value);
}

sp::P<GuiWrapper> PlayerPawn::getWidget(sp::string name)
{
    return map_gui->getWidget(name);
}

sp::P<PlayerParty> PlayerPawn::getParty()
{
    return player_info->getParty();
}

void PlayerPawn::saveGame(sp::KeyValueTreeNode& node)
{
    node.items["x"] = sp::string(int(getPosition2D().x));
    node.items["y"] = sp::string(int(getPosition2D().y));
    node.items["map"] = getScene()->getName();
}

void PlayerPawn::loadGame(sp::KeyValueTreeNode& node)
{
    teleportTo(node.items["map"], sp::stringutil::convert::toInt(node.items["x"]), sp::stringutil::convert::toInt(node.items["y"]));
}

void PlayerPawn::onRegisterScriptBindings(sp::ScriptBindingClass& script_binding_class)
{
    script_binding_class.bind("keyUp", &PlayerPawn::keyUp);
    script_binding_class.bind("keyDown", &PlayerPawn::keyDown);
    script_binding_class.bind("keyLeft", &PlayerPawn::keyLeft);
    script_binding_class.bind("keyRight", &PlayerPawn::keyRight);
    script_binding_class.bind("keyConfirm", &PlayerPawn::keyConfirm);
    script_binding_class.bind("keyCancel", &PlayerPawn::keyCancel);
    
    script_binding_class.bind("name", &PlayerPawn::getName);
    script_binding_class.bind("getFlag", &PlayerPawn::getFlag);
    script_binding_class.bind("setFlag", &PlayerPawn::setFlag);

    script_binding_class.bind("teleportTo", &PlayerPawn::teleportTo);
    script_binding_class.bind("setRestartPosition", &PlayerPawn::setRestartPosition);
    script_binding_class.bind("teleportToRestartPosition", &PlayerPawn::teleportToRestartPosition);
    script_binding_class.bind("startBattle", &PlayerPawn::startBattle);

    script_binding_class.bind("getWidget", &PlayerPawn::getWidget);
    script_binding_class.bind("getParty", &PlayerPawn::getParty);
}
