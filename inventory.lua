require('items')
inventory = {
  display = false,
  xOff = 0,
  yOff = 0,
  dragging = false,
  mouseXOff = 0,
  mouseYOff = 0
}

function inventory.keypressed(key)
  if key == settings.controls.ui.inv then
    if inventory.display then
      inventory.display = false
    else
      inventory.display = true
    end
  end
end

function inventory.mousepressed(x, y, button)
  if button == 1 and inventory.display then
    if x >= inventory.xOff and x <= settings.inventory.height * (settings.inventory.tileSize + settings.inventory.border) + inventory.xOff
    and y >= inventory.yOff and y <= settings.inventory.width * (settings.inventory.tileSize + settings.inventory.border) + inventory.yOff then
      inventory.dragging = true
      inventory.mouseXOff = x - inventory.xOff
      inventory.mouseYOff = y - inventory.yOff
    end
  end
end

function inventory.mousereleased(x, y, button)
  if button == 1 then
    inventory.dragging = false
  end
end

function inventory.update(dt)
  --TODO: Make items interactable in inventory
  if inventory.dragging then
    inventory.xOff = love.mouse.getX() - inventory.mouseXOff
    inventory.yOff = love.mouse.getY() - inventory.mouseYOff
  end
end

function inventory.draw()
  for x = 1, settings.inventory.width do
    for y = 1, settings.inventory.height do
      if settings.inventory.contents[x][y] ~= nil then
        love.graphics.setColor(255, 255, 255)
        love.graphics.draw(
          items[settings.inventory.contents[x][y]][1],
          (y - 1) * (settings.inventory.tileSize + settings.inventory.border) + inventory.xOff,
          (x - 1) * (settings.inventory.tileSize + settings.inventory.border) + inventory.yOff,
          0,
          0.5,
          0.5
        )
      else
        love.graphics.setColor(160, 107, 0)
        love.graphics.rectangle(
          "fill",
          (y - 1) * (settings.inventory.tileSize + settings.inventory.border) + inventory.xOff,
          (x - 1) * (settings.inventory.tileSize + settings.inventory.border) + inventory.yOff,
          settings.inventory.tileSize,
          settings.inventory.tileSize
        )
      end
    end
  end
end

function inventory.nextSlot()
    for x = 1, settings.inventory.width do
        for y = 1, settings.inventory.height do
            if settings.inventory.contents[x][y] == nil then
                return x, y
            end
        end
    end
    return false, false
end
