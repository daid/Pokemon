#ifndef PLAYER_INFO_H
#define PLAYER_INFO_H

#include <sp2/window.h>
#include <sp2/math/rect.h>
#include <sp2/scene/scene.h>
#include <sp2/graphics/gui/scene.h>
#include <sp2/graphics/scene/graphicslayer.h>
#include <sp2/graphics/scene/basicnoderenderpass.h>

class InputController;
class PlayerPawn;
class PlayerParty;
class Battle;
class PokemonParty;
class PlayerInfo : public sp::Scene // this is a scene to get onFixedUpdate calls
{
public:
    PlayerInfo(sp::P<sp::Window> window, int index, InputController& input);
    
    void startBattle(sp::P<PokemonParty> enemy_party);
    
    void setViewport(sp::Rect2d rect);
    sp::P<PlayerParty> getParty() { return party; }

    virtual void onFixedUpdate() override;

    void saveGame(sp::string filename);
    void loadGame(sp::string filename);
protected:
    void createPawnCamera();
private:
    InputController& input;

    sp::P<sp::gui::Scene> gui_scene;
    sp::P<PlayerPawn> pawn;
    sp::P<PlayerParty> party;
    sp::P<sp::Camera> pawn_camera;
    sp::P<sp::SceneGraphicsLayer> graphics_layer;
    sp::P<sp::BasicNodeRenderPass> render_pass;
    sp::P<Battle> battle;
};

#endif//PLAYER_INFO_H
