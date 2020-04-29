#include "scriptableMapObject.h"
#include "playerPawn.h"

#include <sp2/graphics/spriteAnimation.h>


ScriptableMapObject::ScriptableMapObject(sp::P<sp::Node> parent)
: MapObject(parent)
{
    //animation = sp::SpriteAnimation::load("gfx/sprite/ball.txt");
    //animation->play("Stand_down");
}

void ScriptableMapObject::onRegisterScriptBindings(sp::script::BindingClass& script_binding_class)
{
    script_binding_class.bind("onTouch", on_touch_callback);
    script_binding_class.bind("onUse", on_use_callback);
    script_binding_class.bind("setSprite", &ScriptableMapObject::setSprite);
    script_binding_class.bind("setDirection", &ScriptableMapObject::setDirection);
}

void ScriptableMapObject::onTouch(sp::P<PlayerPawn> player)
{
    player->active_coroutine = on_touch_callback.callCoroutine(player);
}

void ScriptableMapObject::onUse(sp::P<PlayerPawn> player)
{
    player->active_coroutine = on_use_callback.callCoroutine(player);
}

void ScriptableMapObject::setSprite(sp::string name)
{
    setAnimation(sp::SpriteAnimation::load("gfx/sprite/" + name + ".txt"));
    animationPlay("Stand_" + toString(direction));
    
    solid = true;
}

void ScriptableMapObject::setDirection(sp::string dir)
{
    direction = toDirection(dir);
    animationPlay("Stand_" + toString(direction));
}
