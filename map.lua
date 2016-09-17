map = {
  testMap = {
    { true,  true,  true,  true,  true, true},
    { true, false, false, false, false, true},
    { true, false, true, false, false, true},
    { true, false, false, true, false, true},
    { true, false, false, false,  false, true},
    { true,  true,  true,  true,  true, true}
  }
}

function map.init()
end

function map.draw(m)
  for x = 1, #m do
    for y = 1, #m[x] do
      if m[x][y] then
        love.graphics.setColor(100, 100, 100, 255)
      else
        love.graphics.setColor(200, 200, 200, 255)
      end
      love.graphics.rectangle("fill", (x - 1) * settings.grid.size, (y - 1) * settings.grid.size, settings.grid.size, settings.grid.size)
    end
  end
end
