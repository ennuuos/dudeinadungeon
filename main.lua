require('settings')
require('util')
require('actor')
require('player')
require('enemy')
require('map')
require('inventory')
require('equipment')
require('ui')
require('items')

debugMain = {"temp"}

function love.load()
  map.init()
  enemy.new('dumb', 100, 100)
  items.new('hurtPotion', 180, 100)
end

function love.update(dt)
  player.update(dt)
  inventory.update(dt)
  ui.update(dt)
  equipment.update(dt)
end

function love.keypressed(key)
  inventory.keypressed(key)
  ui.keypressed(key)
  equipment.keypressed(key)
end

arcQueue = {}   --stores sword slash arcs
function love.draw()
  map.draw(map.testMap, 6, 6)
  if arcQueue[1] then
      love.graphics.setColor(arcQueue[1], arcQueue[2], arcQueue[3], arcQueue[4])
      love.graphics.arc(arcQueue[5], arcQueue[6], arcQueue[7], arcQueue[8], arcQueue[9], arcQueue[10])
      arcQueue = {}
  end
  items.drawAll()
  enemy.drawAll()
  player.draw()
  if inventory.display then
    inventory.draw()
  end
  if ui.statDisplay then
    ui.drawStatusScreen()
  end
  if equipment.display then
    equipment.draw()
  end
  util.debugTable(debugMain)
end


function love.mousepressed(x, y, button, istouch)
    player.attack(x, y)
    inventory.mousepressed(x, y, button)
    ui.mousepressed(x, y, button)
    equipment.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
  inventory.mousereleased(x, y, button)
  ui.mousereleased(x, y, button)
  equipment.mousereleased(x, y, button)
end
