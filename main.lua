require('settings')
require('util')
require('actor')
require('player')
require('enemy')
require('map')
require('inventory')

debugMain = {"temp"}

function love.load()
  map.init()
  enemy.new('dumb', 100, 100)
end

function love.update(dt)
  player.update(dt)
end

arcQueue = {}   --stores sword slash arcs
function love.draw()
  map.draw(map.testMap, 6, 6)
  if arcQueue[1] then
      love.graphics.setColor(arcQueue[1], arcQueue[2], arcQueue[3], arcQueue[4])
      love.graphics.arc(arcQueue[5], arcQueue[6], arcQueue[7], arcQueue[8], arcQueue[9], arcQueue[10])
      arcQueue = {}
  end
  player.draw()
  if love.keyboard.isDown("e") then
    inventory.draw()
  end
  enemy.drawAll()
  util.debugTable(debugMain)
end


function love.mousepressed(x, y, button, istouch)
    player.attack(x, y)
end
