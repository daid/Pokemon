#include "pokemonParty.h"

PokemonParty::PokemonParty()
{
    for(int n=0; n<party_size; n++)
        party[n] = nullptr;
}

PokemonParty::~PokemonParty()
{
    for(int n=0; n<party_size; n++)
        party[n].destroy();
    for(sp::P<PokemonInstance> instance : backup_list)
        instance.destroy();
}

bool PokemonParty::hasAlivePokemon()
{
    for(int n=0; n<party_size; n++)
        if (party[n] && party[n]->getHP() > 0)
            return true;
    return false;
}

sp::P<PokemonInstance> PokemonParty::getPartyMember(int index)
{
    if (index < 0 || index >= party_size)
        return nullptr;
    return party[index];
}

sp::P<PokemonInstance> PokemonParty::getBackupEntry(int index)
{
    if (index < 0 || index >= backup_list.size())
        return nullptr;
    
    auto it = backup_list.begin();
    for(int m=0; m<index; m++)
        ++it;
    return *it;
}

bool PokemonParty::copyPokemon(sp::P<PokemonInstance> instance)
{
    sp::P<PokemonInstance> new_instance = new PokemonInstance(instance->stats->name, instance->getLevel(), false);
    
    new_instance->name = instance->name;
    new_instance->hp = instance->hp;
    new_instance->exp = instance->exp;
    new_instance->asleep = instance->asleep;
    new_instance->poisoned = instance->poisoned;
    new_instance->burned = instance->burned;
    new_instance->frozen = instance->frozen;
    new_instance->paralyzed = instance->paralyzed;
    new_instance->iv = instance->iv;
    new_instance->ev = instance->ev;

    markAsOwned(new_instance->stats->name);
    
    for(int n=0; n<party_size; n++)
    {
        if (!party[n])
        {
            party[n] = new_instance;
            return true;
        }
    }
    backup_list.add(new_instance);
    return false;
}

sp::P<PokemonInstance> PokemonParty::createPokemon(sp::string name, int level)
{
    sp::P<PokemonInstance> new_instance = new PokemonInstance(name, level, false);
    markAsOwned(new_instance->stats->name);
    for(int n=0; n<party_size; n++)
    {
        if (!party[n])
        {
            party[n] = new_instance;
            return new_instance;
        }
    }
    backup_list.add(new_instance);
    return new_instance;
}

void PokemonParty::swapPokemon(int index_a, int index_b)
{
    if (index_a < 0 || index_a > party_size)
        return;
    if (index_b < 0 || index_b > party_size)
        return;
    if (index_a == index_b)
        return;
    std::swap(party[index_a], party[index_b]);
}

void PokemonParty::transferToBackup(int index)
{
    if (index < 0 || index >= party_size)
        return;
    if (!party[index])
        return;
    backup_list.add(party[index]);
    party[index] = nullptr;
}

void PokemonParty::transferFromBackup(int index)
{
    int n=0;
    for(n=0; n<party_size; n++)
        if (!party[n])
            break;
    if (n == party_size)
        return;
    auto it = backup_list.begin();
    for(int m=0; m<index; m++)
        ++it;
    sp::P<PokemonInstance> i = *it;
    backup_list.remove(i);
    party[n] = i;
}

void PokemonParty::addItem(sp::string name)
{
    for(unsigned int n=0; n<items.size(); n++)
    {
        if (items[n].second == name)
        {
            items[n].first += 1;
            return;
        }
    }
    items.emplace_back(1, name);
}

void PokemonParty::removeItem(int index)
{
    if (index < 0 || index >= int(items.size()))
        return;
    
    items[index].first -= 1;
    if (items[index].first < 1)
    {
        items.erase(items.begin() + index);
    }
}

void PokemonParty::onRegisterScriptBindings(sp::ScriptBindingClass& script_binding_class)
{
    script_binding_class.bind("getTrainerName", &PokemonParty::getTrainerName);
    script_binding_class.bind("getTrainerImage", &PokemonParty::getTrainerImage);
    script_binding_class.bind("isPlayer", &PokemonParty::isPlayer);

    script_binding_class.bind("getItemName", &PokemonParty::getItemName);
    script_binding_class.bind("getItemCount", &PokemonParty::getItemCount);
    script_binding_class.bind("removeItem", &PokemonParty::removeItem);
    script_binding_class.bind("addItem", &PokemonParty::addItem);

    script_binding_class.bind("get", &PokemonParty::getPartyMember);
    script_binding_class.bind("getBackup", &PokemonParty::getBackupEntry);
    script_binding_class.bind("copyPokemon", &PokemonParty::copyPokemon);
    script_binding_class.bind("createPokemon", &PokemonParty::createPokemon);
    script_binding_class.bind("swap", &PokemonParty::swapPokemon);
    script_binding_class.bind("transferToBackup", &PokemonParty::transferToBackup);
    script_binding_class.bind("transferFromBackup", &PokemonParty::transferFromBackup);

    script_binding_class.bind("markAsSeen", &PokemonParty::markAsSeen);
    script_binding_class.bind("markAsOwned", &PokemonParty::markAsOwned);
}
