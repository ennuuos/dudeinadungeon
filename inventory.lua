require('items')
inventory = {
  display = false
}

function inventory.keypressed(key)
  if key == settings.inventory.toggle then
    if inventory.display then
      inventory.display = false
    else
      inventory.display = true
    end
  end
end

function inventory.draw()
  --TODO: Get textures for items
  for x = 1, settings.inventory.width do
    for y = 1, settings.inventory.height do
      if settings.inventory.contents[x][y] ~= nil then
        love.graphics.setColor(255, 255, 255)
        love.graphics.draw(
          items[settings.inventory.contents[x][y]][1],
          x * (settings.inventory.tileSize + settings.inventory.border),
          y * (settings.inventory.tileSize + settings.inventory.border),
          0,
          0.5,
          0.5
        )
      else
        love.graphics.setColor(160, 107, 0)
        love.graphics.rectangle(
          "fill",
          x * (settings.inventory.tileSize + settings.inventory.border),
          y * (settings.inventory.tileSize + settings.inventory.border),
          settings.inventory.tileSize,
          settings.inventory.tileSize
        )
      end
    end
  end
end
