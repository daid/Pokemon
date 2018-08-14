#ifndef PLAYER_PARTY_H
#define PLAYER_PARTY_H

#include "pokemonParty.h"
#include "inputController.h"

#include <sp2/keyValueTree.h>


class PlayerParty : public PokemonParty
{
public:
    PlayerParty(InputController& controller);

    InputController& controller;

    int getFlag(sp::string name) { auto it = stored_flags.find(name); if (it != stored_flags.end()) return it->second; return 0; }
    void setFlag(sp::string name, int value) { stored_flags[name] = value; }
    
    virtual void markAsSeen(sp::string name) override { if (pokedex_flags.find(name) == pokedex_flags.end()) pokedex_flags[name] = 1; pokedex_flags[name] |= 1; }
    virtual void markAsOwned(sp::string name) override { if (pokedex_flags.find(name) == pokedex_flags.end()) pokedex_flags[name] = 3; pokedex_flags[name] |= 3; }
    int getPokedexFlags(sp::string name) { if (pokedex_flags.find(name) != pokedex_flags.end()) return pokedex_flags[name]; return 0; }

    void saveGame(sp::KeyValueTreeNode& node);
    void loadGame(const sp::KeyValueTreeNode& node);
    
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
    
    std::unordered_map<sp::string, int> stored_flags;   //General script flags, used to indicate battles done, and items picked up.
    std::unordered_map<sp::string, int> pokedex_flags;  //Used to keep track on which pokemons you have seen, and owned.
};

#endif//PLAYER_PARTY_H
