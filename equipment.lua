equipment = {
  display = false,
  dragging = false,
  xOff = 0,
  yOff = 0,
  mouseX = 0,
  mouseY = 0
}

function equipment.mousepressed(x, y, button)
end

function equipment.mousereleased(x, y, button)
end

function equipment.keypressed(key)
  if key == settings.controls.ui.equip then
    if equipment.display then
      equipment.display = false
    else
      equipment.display = true
    end
  end
end

function equipment.update()
end

function equipment.draw()
  love.graphics.setColor(160, 107, 0)
  love.graphics.rectangle("fill", 10, 10, 100, 100)
end
