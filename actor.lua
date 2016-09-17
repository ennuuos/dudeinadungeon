actor = {
  collide = function(a, b)
    a = actor.toTiler(a)
    b = actor.toTiler(b)
    if util.intersect(a, b) then
      si = utilsmallestIntersect(a, b)
      local offsets = {
        {x = b.x - a.width, y = nil},
        {x = b.x + b.width, y = nil},
        {x = nil, y = b.y - a.height},
        {x = nil, y = b.y + b.height},
      }
      a.x = offsets[si].x or a.x
      a.y = offsets[si].y or a.y
    end
  end,
  toTiler = function(a)
    return{x = a.x, y = a.y, width = a.size, height = a.size}
  end,
}
