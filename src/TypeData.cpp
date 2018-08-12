#include "TypeData.h"

#include <sp2/io/resourceProvider.h>
#include <sp2/stringutil/convert.h>
#include <sp2/logging.h>

static std::unordered_map<Type, std::unordered_map<Type, float>> type_vs_type_modifiers;

void loadTypeData()
{
    sp::io::ResourceStreamPtr stream = sp::io::ResourceProvider::get("types.txt");
    for(sp::string line = stream->readLine(); line.length() > 0; line = stream->readLine())
    {
        auto parts = line.split(",");
        if (parts.size() == 3)
        {
            Type type1 = toType(parts[0]);
            Type type2 = toType(parts[1]);
            float modifier = sp::stringutil::convert::toFloat(parts[2]);
            
            type_vs_type_modifiers[type1][type2] = modifier;
        }
    }
}

float getTypeVsTypeModifier(Type attack_type, Type defense_type)
{
    if (type_vs_type_modifiers.find(attack_type) == type_vs_type_modifiers.end())
        return 1.0;
    if (type_vs_type_modifiers[attack_type].find(defense_type) == type_vs_type_modifiers[attack_type].end())
        return 1.0;
    return type_vs_type_modifiers[attack_type][defense_type];
}

Type toType(const sp::string& str)
{
    if (str == "NORMAL") return Type::Normal;
	if (str == "FIGHTING") return Type::Fighting;
	if (str == "FLYING") return Type::Flying;
	if (str == "POISON") return Type::Poison;
	if (str == "GROUND") return Type::Ground;
	if (str == "ROCK") return Type::Rock;
	if (str == "BIRD") return Type::Bird;
	if (str == "BUG") return Type::Bug;
	if (str == "GHOST") return Type::Ghost;
	if (str == "FIRE") return Type::Fire;
	if (str == "WATER") return Type::Water;
	if (str == "GRASS") return Type::Grass;
	if (str == "ELECTRIC") return Type::Electric;
	if (str == "PSYCHIC") return Type::Psychic;
	if (str == "ICE") return Type::Ice;
	if (str == "DRAGON") return Type::Dragon;
    LOG(Warning, "Unknown type:", str);
    return Type::Normal;
}

sp::string fromType(Type type)
{
    switch(type)
    {
    case Type::Normal: return "NORMAL";
	case Type::Fighting: return "FIGHTING";
	case Type::Flying: return "FLYING";
	case Type::Poison: return "POISON";
	case Type::Ground: return "GROUND";
	case Type::Rock: return "ROCK";
	case Type::Bird: return "BIRD";
	case Type::Bug: return "BUG";
	case Type::Ghost: return "GHOST";
	case Type::Fire: return "FIRE";
	case Type::Water: return "WATER";
	case Type::Grass: return "GRASS";
	case Type::Electric: return "ELECTRIC";
	case Type::Psychic: return "PSYCHIC";
	case Type::Ice: return "ICE";
	case Type::Dragon: return "DRAGON";
    }
    return "UNKNOWN";
}

sp::string fromType(StatType type)
{
    switch(type)
    {
    case StatType::None: return "NONE";
    case StatType::HP: return "HP";
    case StatType::Attack: return "ATTACK";
    case StatType::Defense: return "DEFENSE";
    case StatType::Speed: return "SPEED";
    case StatType::Special: return "SPECIAL";
    case StatType::Crit: return "CRIT";
    case StatType::Accuracy: return "ACCURACY";
    case StatType::Evasion: return "EVASION";
    }
    return "UNKNOWN";
}

StatType toStatType(const sp::string& str)
{
    if (str == "HP") return StatType::HP;
    if (str == "ATTACK") return StatType::Attack;
    if (str == "DEFENSE") return StatType::Defense;
    if (str == "SPEED") return StatType::Speed;
    if (str == "SPECIAL") return StatType::Special;
    if (str == "CRIT") return StatType::Crit;
    if (str == "ACCURACY") return StatType::Accuracy;
    if (str == "EVASION") return StatType::Evasion;
    LOG(Warning, "Unknown stat type:", str);
    return StatType::None;
}
