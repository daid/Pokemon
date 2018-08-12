#ifndef MAP_OBJECT_H
#define MAP_OBJECT_H

#include <sp2/scene/node.h>
#include "mapScene.h"
#include "direction.h"


class PlayerPawn;
class MapObject : public sp::Node
{
public:
    MapObject(sp::P<sp::Node> parent);

    void setPosition(sp::Vector2i position);
    bool isSolid() { return solid; }
    
    virtual void onTouch(sp::P<PlayerPawn> player);
    virtual void onUse(sp::P<PlayerPawn> player);

protected:
    bool solid = false;
    Direction direction = Direction::Down;
};

#endif//MAP_OBJECT_H
