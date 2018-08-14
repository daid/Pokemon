#ifndef POKEMON_PARTY_H
#define POKEMON_PARTY_H

#include "pokemonInstance.h"

#include <sp2/script/bindingObject.h>


class PokemonParty : public sp::ScriptBindingObject
{
public:
    static constexpr int party_size = 6;

    PokemonParty();
    ~PokemonParty();
    
    virtual void onRegisterScriptBindings(sp::ScriptBindingClass& script_binding_class) override;
    
    sp::string getTrainerName() { return trainer_name; }
    sp::string getTrainerImage() { return trainer_image; }
    virtual bool isPlayer() { return false; }
    
    sp::string getItemName(int index) { if (index < 0 || index >= int(items.size())) return ""; return items[index].second; }
    int getItemCount(int index) { if (index < 0 || index >= int(items.size())) return 0; return items[index].first; }
    void addItem(sp::string name);
    void removeItem(int index);

    virtual void markAsSeen(sp::string name) { }
    virtual void markAsOwned(sp::string name) { }
    
    bool hasAlivePokemon();
    
    sp::P<PokemonInstance> getPartyMember(int index);
    sp::P<PokemonInstance> createPokemon(sp::string name, int level);
    bool copyPokemon(sp::P<PokemonInstance> instance); //Returns true if placed in the party, false if placed in the backup list.

    sp::string trainer_name;
    sp::string trainer_image;
    
    sp::P<PokemonInstance> party[party_size];
    sp::PList<PokemonInstance> backup_list;
    std::vector<std::pair<int, sp::string>> items;
};

#endif//POKEMON_PARTY_H
