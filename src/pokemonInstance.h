#ifndef POKEMON_INSTANCE_H
#define POKEMON_INSTANCE_H

#include "PokemonStats.h"

#include <sp2/script/bindingObject.h>

/**
    An instance of a Pokemon.
    Any pokemon kept in a party, in a box, a or random encounter needs one of these.
    Keeps track of current stats.
    These are stored to disk when the game is saved by the player (at least, for played based pokemon)
 */
class PokemonInstance : public sp::ScriptBindingObject
{
public:
    PokemonInstance(sp::string type, int level, bool wild);
    
    sp::string getName() { return name; }
    void setName(sp::string new_name) { name = new_name; }
    sp::string getClassName() { return stats.name; }
    int getHP() { return hp; }
    void setHP(int new_hp) { hp = std::max(0, std::min(getMaxHP(), new_hp)); }

    bool isBurned() { return burned; }
    bool isFrozen() { return frozen; }
    bool isParalyzed() { return paralyzed; }
    bool isPoisoned() { return poisoned; }
    int getAsleepTurns() { return asleep; }

    void setBurned(bool flag) { burned = flag; }
    void setFrozen(bool flag) { frozen = flag; }
    void setParalyzed(bool flag) { paralyzed = flag; }
    void setPoisoned(bool flag) { poisoned = flag; }
    void setAsleep(int turns) { asleep = turns; }
    
    sp::string getMoveName(int index);
    void setMove(int index, sp::string name);
    sp::string getMoveType(int index);
    int getMovePP(int index);
    void modifyMovePP(int index, int amount);
    int getMoveMaxPP(int index);
    int getMovePriority(int index);
    sp::string getMoveEffect(int index);
    sp::string getMoveEffectStat(int index);
    int getMovePower(int index);

    const PokemonStats& stats;
    
    sp::string name;
    int hp = 0;
    int exp = 0;    //Level can be calculated from this
    int asleep = 0; //Number of turns asleep counter
    bool poisoned = false;
    bool burned = false;
    bool frozen = false;
    bool paralyzed = false;
    
    BaseStats ev;   //Effort values, increase on defeating monsters
    BaseStats iv;   //Individual values, set on creation and never changed (have been compared to genes, range 0-15)
    
    static constexpr int max_moves = 4;
    class MoveData
    {
    public:
        int pp = 0;
        int pp_up = 0;
        Move* move = nullptr;
        
        int getMaxPP();
    } moves[max_moves];
    
    int getMaxHP();
    int attack();
    int defense();
    int speed();
    int special();
    
    bool hasType(sp::string type);
    float damageTypeModifier(sp::string type);

    int getLevel();
    int getExpToNextLevel();
    void addXP(int amount);
    void addEV(sp::P<PokemonInstance> defeated_pokemon);
    sp::string getLearnedMoveAt(int level);
    
    int getExpForDefeat(bool from_trainer);
    int getCatchRating();
    
    bool hasMove(Move* move) const;
    
    virtual void onRegisterScriptBindings(sp::ScriptBindingClass& script_binding_class) override;
};

#endif//POKEMON_INSTANCE_H
