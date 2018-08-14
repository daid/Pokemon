#ifndef PLAYER_PAWN_H
#define PLAYER_PAWN_H

#include "mapObject.h"
#include "inputController.h"
#include "direction.h"

#include <sp2/keyValueTree.h>
#include <sp2/graphics/gui/scene.h>


class WildPokemonArea;
class PlayerInfo;
class GuiWrapper;
class PlayerParty;
class PokemonParty;
class PlayerPawn : public MapObject
{
public:
    PlayerPawn(sp::P<sp::Node> parent, sp::P<PlayerInfo> player_info, InputController& controller, sp::string sprite, sp::P<sp::gui::RootWidget> root_widget);

    virtual void onFixedUpdate() override;
    
    void saveGame(sp::KeyValueTreeNode& node);
    void loadGame(sp::KeyValueTreeNode& node);

    bool active = true;
    sp::script::CoroutinePtr active_coroutine;
private:
    void move(Direction direction);
    bool canWalkOn(MapScene::TileType tile_type);
    void teleportTo(sp::string map_name, int x, int y);
    void setRestartPosition();
    void teleportToRestartPosition();
    void startBattle(sp::P<PokemonParty> enemy_party);

    bool keyUp() { return controller.up.getDown(); }
    bool keyDown() { return controller.down.getDown(); }
    bool keyLeft() { return controller.left.getDown(); }
    bool keyRight() { return controller.right.getDown(); }
    bool keyConfirm() { return controller.confirm.getDown(); }
    bool keyCancel() { return controller.cancel.getDown(); }
    
    sp::string getName();
    int getFlag(sp::string name);
    void setFlag(sp::string name, int value);
    
    sp::P<GuiWrapper> getWidget(sp::string name);
    sp::P<PlayerParty> getParty();
    
    virtual void onRegisterScriptBindings(sp::ScriptBindingClass& script_binding_class) override;

    InputController& controller;
    sp::P<PlayerInfo> player_info;
    sp::P<GuiWrapper> map_gui;
    
    sp::Vector2d offset;
    int walking = 0;
    sp::P<WildPokemonArea> wildpokemon_area;

#ifdef DEBUG
    static constexpr int walking_ticks = 5;
#else
    static constexpr int walking_ticks = 15;
#endif
};

#endif//PLAYER_PAWN_H
