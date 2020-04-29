#ifndef SCRIPTABLE_MAP_OBJECT_H
#define SCRIPTABLE_MAP_OBJECT_H

#include "mapObject.h"

class ScriptableMapObject : public MapObject
{
public:
    ScriptableMapObject(sp::P<sp::Node> parent);
    
    virtual void onRegisterScriptBindings(sp::script::BindingClass& script_binding_class) override;
    virtual void onTouch(sp::P<PlayerPawn> player) override;
    virtual void onUse(sp::P<PlayerPawn> player) override;

private:
    void setSprite(sp::string name);
    void setDirection(sp::string dir);
    
    sp::script::Callback on_touch_callback;
    sp::script::Callback on_use_callback;
};

#endif//SCRIPTABLE_MAP_OBJECT_H
