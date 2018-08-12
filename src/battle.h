#ifndef BATTLE_H
#define BATTLE_H

#include "playerParty.h"
#include "inputController.h"

#include <sp2/string.h>
#include <sp2/scene/scene.h>
#include <sp2/graphics/gui/scene.h>
#include <sp2/graphics/gui/widget/widget.h>
#include <sp2/script/environment.h>
#include <list>

class Battle;
class PokemonBattle;
class GuiWrapper;
class Battle : public sp::script::Environment
{
public:
    Battle(sp::P<PlayerParty> player_party, sp::P<PokemonParty> enemy_party, sp::P<sp::gui::RootWidget> root_widget);
    ~Battle();

    bool update();
private:
    sp::P<PlayerParty> player_party;
    sp::P<PokemonParty> enemy_party;

    GuiWrapper* battle_gui;
    sp::script::CoroutinePtr battle_coroutine;
};

#endif//BATTLE_H
