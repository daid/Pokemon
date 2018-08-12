#ifndef DIRECTION_H
#define DIRECTION_H

#include <sp2/string.h>
#include <sp2/math/vector.h>

enum class Direction
{
    Up,
    Down,
    Left,
    Right
};
sp::Vector2d toOffset(Direction dir);
sp::string toString(Direction dir);
Direction toDirection(sp::string);

#endif//DIRECTION_H
