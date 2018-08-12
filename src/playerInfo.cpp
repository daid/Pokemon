#include "playerInfo.h"
#include "playerParty.h"
#include "playerPawn.h"
#include "mapScene.h"
#include "battle.h"
#include "playerParty.h"

#include <sp2/scene/camera.h>

PlayerInfo::PlayerInfo(sp::P<sp::Window> window, int index, InputController& input)
: sp::Scene("PLAYER_INFO_" + sp::string(index)), input(input)
{
    //Setup rendering information
    gui_scene = new sp::gui::Scene(sp::Vector2d(160, 144), sp::gui::Scene::Direction::Horizontal, "GUI_" + sp::string(index));

    graphics_layer = new sp::SceneGraphicsLayer(1);
    render_pass = new sp::BasicNodeRenderPass(gui_scene->getCamera());
    graphics_layer->addRenderPass(render_pass);
    window->addLayer(graphics_layer);
    
    //Construct default objects for the player.
    party = new PlayerParty(input);
    party->trainer_image = "red";
    party->trainer_name = "RED";
    if (index == 1)
    {
        party->trainer_name = "BLUE";
        party->game_type = "BLUE";
    }

    //Creating the pawn that walks the world, always exists.
    sp::P<MapScene> scene = MapScene::get(party->restart_map);
    if (index == 1)
        pawn = new PlayerPawn(scene->getRoot(), this, input, "red.alt", gui_scene->getRootWidget());
    else
        pawn = new PlayerPawn(scene->getRoot(), this, input, "red", gui_scene->getRootWidget());
    pawn->setPosition(party->restart_position);
    createPawnCamera();
}

void PlayerInfo::startBattle(sp::P<PokemonParty> enemy_party)
{
    pawn_camera.destroy();
    battle.destroy();
    
    battle = new Battle(party, enemy_party, gui_scene->getRootWidget());
    pawn->active = false;
}

void PlayerInfo::createPawnCamera()
{
    pawn_camera = new sp::Camera(pawn);
    pawn_camera->setOrtographic(5, sp::Camera::Direction::Horizontal);
    pawn_camera->setPosition(sp::Vector3d(0, 0, 1));
    render_pass->addCamera(pawn_camera);
    
    pawn->active = true;
}

void PlayerInfo::setViewport(sp::Rect2d rect)
{
    graphics_layer->setViewport(rect);
}

void PlayerInfo::onFixedUpdate()
{
    if (battle)
    {
        if (!battle->update())
        {
            battle.destroy();
            if (!party->hasAlivePokemon() && !pawn->active_coroutine)
            {
                //Wild pokemon battle, lost.
                sp::P<MapScene> scene = pawn->getScene();
                pawn->active_coroutine = scene->runGlobalFunctionForPlayer("basicPlayerDefeatedResult", pawn);
            }
            else
            {
                //Script started pokemon battle.
                if (pawn->active_coroutine)
                    pawn->active_coroutine->resume(party->hasAlivePokemon());
            }
            createPawnCamera();
        }
    }
}
