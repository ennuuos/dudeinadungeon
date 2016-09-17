actor = {
  collide = function(a, b)
    if util.intersect(a, b) then
      si = util.smallestIntersect(a, b)
      local offsets = {
        {x = b.x - a.width, y = a.y},
        {x = b.x + b.width, y = a.y},
        {x = a.x, y = b.y - a.height},
        {x = a.x, y = b.y + b.height},
      }
      return offsets[si].x, offsets[si].y
    end
    return a.x, a.y
  end,
  toTiler = function(a)
    return{x = a.x, y = a.y, width = a.size, height = a.size}
  end,
  collideWithMap = function(a, m)
    xa = math.floor(a.x / settings.grid.size) + 1
    ya = math.floor(a.y / settings.grid.size) + 1
    actor.collideWithTile(a, m, xa + 1, ya)
    actor.collideWithTile(a, m, xa, ya + 1)
    actor.collideWithTile(a, m, xa + 1, ya + 1)
    actor.collideWithTile(a, m, xa, ya)



  end,
  collideWithTile = function(a, m, xi, yi)
    if m[xi] then
      if m[xi][yi] then
        a.x, a.y = actor.collide(actor.toTiler(a), {x = (xi - 1) * settings.grid.size, y = (yi - 1) * settings.grid.size, width = settings.grid.size, height = settings.grid.size})
      end
    end
  end,
}
