util = {
  intersect = function(a, b)
    return a.x + a.w > a.b and a.x < a.b + a.w and a.y + a.h > b.y and a.y < b.y + b.h
  end,

}


--TODO: Add smallestIntersect function
