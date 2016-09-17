map = {
}

function map.init()
  testMap = {{ true,  true,  true,  true,  true, true},
             { true, false, false, false, false, true},
             { true, false, false, false, false, true},
             { true, false, false, false, false, true},
             { true, false, false, false, false, true},
             { true,  true,  true,  true,  true, true}
  }
  draw(testMap, 6, 6)
end

function map.draw(map, width, height)
  for x = 1, width do
    for y = 1, height do
      if map[x][y] then
        love.graphics.setColor(100, 100, 100, 255)
      else
        love.graphics.setColor(200, 200, 200, 255)
      end
      love.graphics.rectangle("fill", x * settings.grid.size, y * settings.grid.size, width, height)
    end
  end
end
