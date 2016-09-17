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

function love.keypressed(key)
  inventory.keypressed(key)
end

function love.draw()
  map.draw(map.testMap, 6, 6)
  player.draw()
  if inventory.display then
    inventory.draw()
  end
  enemy.drawAll()
end
