#include "playerParty.h"

PlayerParty::PlayerParty(InputController& controller)
: controller(controller)
{
    restart_map = "OVERWORLD";
    restart_position = sp::Vector2i(55, 120);
    game_type = "RED";

    restart_map = "VIRIDIAN_POKECENTER";
    restart_position = sp::Vector2i(4, 3);
    createPokemon("PIKACHU", 30);
    addItem("POKE BALL");
    addItem("POKE BALL");
    addItem("POKE BALL");
    addItem("POTION");

    money = 3000;
}

void PlayerParty::onRegisterScriptBindings(sp::ScriptBindingClass& script_binding_class)
{
    PokemonParty::onRegisterScriptBindings(script_binding_class);
    
    script_binding_class.bind("keyUp", &PlayerParty::keyUp);
    script_binding_class.bind("keyDown", &PlayerParty::keyDown);
    script_binding_class.bind("keyLeft", &PlayerParty::keyLeft);
    script_binding_class.bind("keyRight", &PlayerParty::keyRight);
    script_binding_class.bind("keyConfirm", &PlayerParty::keyConfirm);
    script_binding_class.bind("keyCancel", &PlayerParty::keyCancel);

    script_binding_class.bind("getMoney", &PlayerParty::getMoney);
    script_binding_class.bind("setMoney", &PlayerParty::setMoney);

    script_binding_class.bind("getFlag", &PlayerParty::getFlag);
    script_binding_class.bind("setFlag", &PlayerParty::setFlag);
}
