#include "direction.h"

sp::Vector2d toOffset(Direction dir)
{
    switch(dir)
    {
    case Direction::Up:
        return sp::Vector2d(0, 1);
    case Direction::Down:
        return sp::Vector2d(0, -1);
    case Direction::Left:
        return sp::Vector2d(-1, 0);
    case Direction::Right:
        return sp::Vector2d(1, 0);
    }
    return sp::Vector2d(0, 0);
}

sp::string toString(Direction dir)
{
    switch(dir)
    {
    case Direction::Up:
        return "up";
    case Direction::Down:
        return "down";
    case Direction::Left:
        return "left";
    case Direction::Right:
        return "right";
    }
    return "unknown";
}

Direction toDirection(sp::string str)
{
    str = str.lower();
    if (str == "up") return Direction::Up;
    if (str == "down") return Direction::Down;
    if (str == "left") return Direction::Left;
    if (str == "right") return Direction::Right;
    return Direction::Down;
}
