inventory = {
}

function inventory.draw()
  --TODO: Have the inventory take in and display items from id's
  love.graphics.setColor(0, 0, 0)
  for x = 0, settings.inventory.width do
    for y = 0, settings.inventory.height do
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
