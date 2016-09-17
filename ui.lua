require('player')

ui = {
  statDisplay = false,
  statXOff = 0,
  statYOff = 0,
  statDrag = false,
  statMouseX = 0,
  statMouseY = 0,
  statWidth = 250,
  statHeight = 500
}

function ui.keypressed(key)
  if key == settings.controls.ui.stats then
    if ui.statDisplay then
      ui.statDisplay = false
    else
      ui.statDisplay = true
    end
  end
end

function ui.mousepressed(x, y, button)
  if button == 1 then
    if ui.statDisplay and
    x >= ui.statXOff and x <= ui.statXOff + ui.statWidth and
    y >= ui.statYOff and y <= ui.statYOff + ui.statHeight then
      ui.statDrag = true
      ui.statMouseX = x - ui.statXOff
      ui.statMouseY = y - ui.statYOff
    end
  end
end

function ui.mousereleased(x, y, button)
  if button == 1 then
    ui.statDrag = false
  end
end

function ui.drawStatusScreen()
  love.graphics.setColor(160, 107, 0)
  love.graphics.rectangle("fill", ui.statXOff, ui.statYOff, ui.statWidth, ui.statHeight)
  --TODO: Have player stats ready for use
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Health: " .. player.health .. "/" .. player.maxHealth, ui.statXOff + 10, ui.statYOff + 10)
  love.graphics.rectangle("fill", ui.statXOff + 25, ui.statYOff + 470, 200, 25)
  love.graphics.setColor(44, 193, 36)
  love.graphics.rectangle("fill", ui.statXOff + 25, ui.statYOff + 470, player.XP / player.XPToLevel * 200, 25)
end

function ui.update(dt)
  if ui.statDrag then
    ui.statXOff = love.mouse.getX() - ui.statMouseX
    ui.statYOff = love.mouse.getY() - ui.statMouseY
  end
end
