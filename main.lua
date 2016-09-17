require('settings')
require('util')
require('actor')
require('player')
require('map')
require('inventory')
--TODO: Create map.lua
--TODO: create player.lua

debugMain = {"temp"}

function love.load()
  map.init()
end

function love.update(dt)
  player.update(dt)
end

function love.draw()
  map.draw(map.testMap, 6, 6)
  player.draw()
  if love.keyboard.isDown("e") then
    inventory.draw()
  end
  util.debugTable(debugMain)
end
