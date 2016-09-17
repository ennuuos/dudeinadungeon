util = {
  intersect = function(a, b)
    return a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height
  end,
  smallestIntersect = function(a, b)
    local checks = {
      a.x + a.width - b.x,
      b.x + b.width - a.x,
      a.y + a.height - b.y,
      b.y + b.height - a.y,
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
