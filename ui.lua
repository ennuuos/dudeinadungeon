require('player')

ui = {
  statDisplay = false
}

function ui.keypressed(key)
  if key == settings.status.toggle then
    if ui.statDisplay then
      ui.statDisplay = false
    else
      ui.statDisplay = true
    end
  end
end

function ui.drawStatusScreen()
  love.graphics.setColor(160, 107, 0)
  love.graphics.rectangle("fill", 0, 0, 250, 500)
  --TODO: Have player stats ready for use
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Health: " .. player.health .. "/" .. player.maxHealth, 10, 10)
  love.graphics.rectangle("fill", 25, 470, 200, 25)
  love.graphics.setColor(44, 193, 36)
  love.graphics.rectangle("fill", 25, 470, player.XP / player.XPToLevel * 200, 25)
end
