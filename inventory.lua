inventory = {
}

function inventory.draw()
  --TODO: Get textures for items
  love.graphics.setColor(0, 0, 0)
  for x = 0, settings.inventory.width do
    for y = 0, settings.inventory.height do
      if settings.contents[x][y] ~= nil then
        love.graphics.draw(
          items[settings.contents[x][y]][1],
          x * (settings.inventory.tileSize + settings.inventory.border),
          y * (settings.inventory.tileSize + settings.inventory.border)
        )
      else
        love.grahpics.rectangle(
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
