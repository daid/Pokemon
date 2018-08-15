#include "pokemonInstance.h"
#include "move.h"
#include "playerInfo.h"
#include "pokemonParty.h"
#include "inputController.h"

#include <sp2/engine.h>
#include <sp2/window.h>
#include <sp2/logging.h>
#include <sp2/graphics/renderTexture.h>
#include <sp2/graphics/meshData.h>
#include <sp2/graphics/gui/theme.h>
#include <sp2/graphics/gui/scene.h>
#include <sp2/graphics/scene/graphicslayer.h>
#include <sp2/graphics/scene/basicnoderenderpass.h>
#include <sp2/graphics/scene/collisionrenderpass.h>
#include <sp2/io/directoryResourceProvider.h>
#include <sp2/graphics/textureManager.h>
#include <sp2/scene/camera.h>
#include <sp2/updatable.h>


class MultiplePlayerController : public sp::Updatable
{
public:
    virtual void onUpdate(float delta)
    {
    }
};


int main(int argc, char** argv)
{
    sp::P<sp::Window> window = new sp::Window(160.0/144);
    window->setClearColor(sp::Color(1,1,1));
    sp::P<sp::Engine> engine = new sp::Engine();

    new sp::io::DirectoryResourceProvider("resources");
    new sp::io::DirectoryResourceProvider("saves");
    sp::texture_manager.setDefaultSmoothFiltering(false);

    sp::gui::Theme::loadTheme("default", "gui/theme/basic.theme.txt");

    loadTypeData();
    Move::loadData();
    PokemonStats::loadData();

    InputController controller0(0);
    InputController controller1(1);
    
    sp::P<PlayerInfo> player_info0 = new PlayerInfo(window, 0, controller0);
    player_info0->loadGame("RED.save");

#define ENABLE_PLAYER_2 0
#if ENABLE_PLAYER_2
    player_info0->setViewport(sp::Rect2d(0, 0, 0.5, 1.0));
    sp::P<PlayerInfo> player_info1 = new PlayerInfo(window, 1, controller1);
    player_info1->setViewport(sp::Rect2d(0.5, 0, 0.5, 1.0));
    player_info1->loadGame("BLUE.save");
#endif
    engine->run();
    //player_info0->saveGame("saves/RED.save");
#if ENABLE_PLAYER_2
    player_info1->saveGame("saves/BLUE.save");
#endif
}
