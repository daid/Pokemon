#ifndef PLAYER_PARTY_H
#define PLAYER_PARTY_H

#include "pokemonParty.h"
#include "inputController.h"

class PlayerParty : public PokemonParty
{
public:
    PlayerParty(InputController& controller);

    InputController& controller;

    int getFlag(sp::string name) { auto it = stored_flags.find(name); if (it != stored_flags.end()) return it->second; return 0; }
    void setFlag(sp::string name, int value) { stored_flags[name] = value; }
    
    sp::string restart_map;
    sp::Vector2i restart_position;
    int money;
    
    sp::string game_type; //RED or BLUE

    virtual bool isPlayer() override { return true; }
    
protected:
    virtual void onRegisterScriptBindings(sp::ScriptBindingClass& script_binding_class) override;

private:
    bool keyUp() { return controller.up.getDown(); }
    bool keyDown() { return controller.down.getDown(); }
    bool keyLeft() { return controller.left.getDown(); }
    bool keyRight() { return controller.right.getDown(); }
    bool keyConfirm() { return controller.confirm.getDown(); }
    bool keyCancel() { return controller.cancel.getDown(); }
    
    int getMoney() { return money; }
    void setMoney(int amount) { money = amount; }
    
    std::unordered_map<sp::string, int> stored_flags;
};

#endif//PLAYER_PARTY_H
