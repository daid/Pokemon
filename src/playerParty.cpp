#include "playerParty.h"

#include <sp2/stringutil/convert.h>

PlayerParty::PlayerParty(InputController& controller)
: controller(controller)
{
    restart_map = "REDS_HOUSE_2F";
    restart_position = sp::Vector2i(3, 1);
    game_type = "RED";

    addItem("POKE BALL");
    addItem("POKE BALL");
    addItem("POKE BALL");
    addItem("POTION ");
    
    money = 3000;
}

void PlayerParty::saveGame(sp::KeyValueTreeNode& node)
{
    node.items["trainer_name"] = trainer_name;
    node.items["trainer_image"] = trainer_image;
    
    node.child_nodes.emplace_back("members");
    sp::KeyValueTreeNode& party_node = node.child_nodes.back();
    for(int n=0; n<party_size; n++)
    {
        if (!party[n])
            continue;
        party_node.child_nodes.emplace_back();
        party[n]->saveGame(party_node.child_nodes.back());
    }

    node.child_nodes.emplace_back("backup");
    sp::KeyValueTreeNode& backup_node = node.child_nodes.back();
    for(auto pokemon : backup_list)
    {
        backup_node.child_nodes.emplace_back();
        pokemon->saveGame(backup_node.child_nodes.back());
    }

    node.child_nodes.emplace_back("items");
    sp::KeyValueTreeNode& items_node = node.child_nodes.back();
    for(auto item : items)
    {
        items_node.child_nodes.emplace_back();
        sp::KeyValueTreeNode& i = items_node.child_nodes.back();
        i.items["type"] = item.second;
        i.items["count"] = sp::string(item.first);
    }

    node.items["restart_map"] = restart_map;
    node.items["restart_position"] = sp::string(restart_position.x) + "," + sp::string(restart_position.y);
    node.items["money"] = sp::string(money);
    node.items["game_type"] = game_type;

    node.child_nodes.emplace_back("flags");
    sp::KeyValueTreeNode& flags_node = node.child_nodes.back();
    for(auto it : stored_flags)
        flags_node.items[it.first] = sp::string(it.second);

    node.child_nodes.emplace_back("pokedex");
    sp::KeyValueTreeNode& pokedex_node = node.child_nodes.back();
    for(auto it : pokedex_flags)
        pokedex_node.items[it.first] = sp::string(it.second);
}

void PlayerParty::loadGame(const sp::KeyValueTreeNode& node)
{
    trainer_name = node.items.at("trainer_name");
    trainer_image = node.items.at("trainer_image");
    
    const sp::KeyValueTreeNode* party_node = node.findId("members");
    for(int n=0; n<party_size; n++)
        party[n].destroy();
    int index = 0;
    for(const auto& pokemon_node : party_node->child_nodes)
    {
        party[index] = new PokemonInstance(pokemon_node.items.at("type"), 1, false);
        party[index]->loadGame(pokemon_node);
        index++;
    }

    while(!backup_list.empty())
        delete *backup_list.begin();
    const sp::KeyValueTreeNode* backup_node = node.findId("backup");
    for(auto& pokemon_node : backup_node->child_nodes)
    {
        sp::P<PokemonInstance> p = new PokemonInstance(pokemon_node.items.at("type"), 1, false);
        p->loadGame(pokemon_node);
        backup_list.add(p);
    }
    
    items.clear();
    const sp::KeyValueTreeNode* items_node = node.findId("items");
    for(auto& node : items_node->child_nodes)
    {
        items.emplace_back(sp::stringutil::convert::toInt(node.items.at("count")), node.items.at("type"));
    }
    
    restart_map = node.items.at("restart_map");
    restart_position = sp::stringutil::convert::toVector2i(node.items.at("restart_position"));
    money = sp::stringutil::convert::toInt(node.items.at("money"));
    game_type = node.items.at("game_type");
    
    stored_flags.clear();
    const sp::KeyValueTreeNode* flags_node = node.findId("flags");
    for(auto it : flags_node->items)
        stored_flags[it.first] = sp::stringutil::convert::toInt(it.second);

    pokedex_flags.clear();
    const sp::KeyValueTreeNode* pokedex_node = node.findId("pokedex");
    for(auto it : pokedex_node->items)
        pokedex_flags[it.first] = sp::stringutil::convert::toInt(it.second);
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
    
    script_binding_class.bind("getPokedexFlags", &PlayerParty::getPokedexFlags);
}
