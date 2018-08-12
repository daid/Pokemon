#ifndef TYPE_DATA_H
#define TYPE_DATA_H

#include <sp2/string.h>

enum class Type
{
	Normal,
	Fighting,
	Flying,
	Poison,
	Ground,
	Rock,
	Bird,
	Bug,
	Ghost,
	Fire,
	Water,
	Grass,
	Electric,
	Psychic,
	Ice,
	Dragon
};
enum class StatType
{
    None,
    HP,
    Attack,
    Defense,
    Speed,
    Special,
    Crit,
    Accuracy,
    Evasion,
};

void loadTypeData();

float getTypeVsTypeModifier(Type attack_type, Type defense_type);

Type toType(const sp::string& str);
sp::string fromType(Type type);

sp::string fromType(StatType type);
StatType toStatType(const sp::string& str);

#endif//TYPE_DATA_H
