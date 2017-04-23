#pragma once

#include "base/util.h"
#include "base/scene.h"
#include "game/entity.h"
#include "game/models.h"

struct Sign : Entity
{
  Sign()
  {
    size = Size2f(4, 2);
    solid = 0;
    collisionGroup = 0;
    collidesWith = 0;
  }

  virtual Actor getActor() const override
  {
    auto r = Actor(pos, MDL_SIGN);
    r.scale = size;
    r.ratio = 0;

    return r;
  }
};

