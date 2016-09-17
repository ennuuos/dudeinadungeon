map = {
}

function map.init()
  testMap = {
    { true,  true,  true,  true,  true, true},
    { true, false, false, false, false, true},
    { true, false, false, false, false, true},
    { true, false, false, false, false, true},
    { true, false, false, false, false, true},
    { true,  true,  true,  true,  true, true}
  }
end

function map.draw(map)
  for x = 1, #map do
    for y = 1, #map[x] do
      if map[x][y] then
        love.graphics.setColor(100, 100, 100, 255)
      else
        love.graphics.setColor(200, 200, 200, 255)
      end
      love.graphics.rectangle("fill", (x - 1) * settings.grid.size, (y - 1) * settings.grid.size, settings.grid.size, settings.grid.size)
    end
  end
end
