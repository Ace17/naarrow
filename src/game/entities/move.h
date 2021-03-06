#pragma once

#include "game/entity.h"

struct Trace
{
  bool horz;
  bool vert;
};

inline
Trace slideMove(Entity* ent, Vector vel)
{
  Trace r;

  r.horz = ent->physics->moveBody(ent, Vector(vel.x, 0));
  r.vert = ent->physics->moveBody(ent, Vector(0, vel.y));

  return r;
}

