ui = {
}

function ui.drawStatusScreen()
  love.graphics.setColor(160, 107, 0)
  love.graphics.rectangle("fill", 0, 0, 250, 500)
  --TODO: Have player stats ready for use
  love.graphics.print("Attack: " .. player.attack, 10, 10)
  love.grpahics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 25, 225, 200, 25)
  love.graphics.setColor(44, 193, 36)
  love.graphics.rectangle("fill", 25, 225, 100, 25)
end
