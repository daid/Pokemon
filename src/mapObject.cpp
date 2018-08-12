#include "mapObject.h"

#include <sp2/graphics/spriteAnimation.h>

MapObject::MapObject(sp::P<sp::Node> parent)
: sp::Node(parent)
{
    //We slightly tilt the sprite so we can put the bottom part below grass.
    setRotation(sp::Quaterniond::fromAxisAngle(sp::Vector3d(1, 0, 0), 1));
}

void MapObject::setPosition(sp::Vector2i position)
{
    sp::Node::setPosition(sp::Vector2d(position) + sp::Vector2d(0.5, 0.75));
}

void MapObject::onTouch(sp::P<PlayerPawn> player)
{
}

void MapObject::onUse(sp::P<PlayerPawn> player)
{
}
