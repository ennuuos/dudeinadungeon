util = {
  intersect = function(a, b)
    return a.x + a.w > b.x and a.x < b.x + b.w and a.y + a.h > b.y and a.y < b.y + b.h
  end,
  smallestIntersect = function(a, b)
    local checks = {
      a.x + a.w - b.x,
      b.x + b.w - a.x,
      a.y + a.h - b.y,
      b.y + b.h - a.y,
    }
    si = 1
    for i = 2, 4 do
      if checks[i] < checks[si] then
        si = i
      end
    end
    return i
  end,
}
