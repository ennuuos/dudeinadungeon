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
    return si
  end,
  debugTable = function(t)
    y = 0
    for k, v in pairs(t) do
      love.graphics.setColor(200, 200, 0, 255)
      love.graphics.print(k.." : "..v, 10, y)
      y = y + 12
    end
  end,
  distance = function (ax, ay, bx, by)
    return math.sqrt((ax - bx)^2 + (ay- by)^2)
  end,
  angle = function (ax, ay, bx, by) --angle of b from a, in radians
    if bx < ax then
        atan = math.atan((by - ay)/(bx - ax))
        if atan <= 0 then
            return atan - 3.14
        else
            return atan + 3.14
        end
    else
        return math.atan((by - ay)/(bx - ax))
    end
  end
}
