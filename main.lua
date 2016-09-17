require('settings')
require('util')
require('actor')
require('player')
require('map')
--TODO: Create map.lua
--TODO: create player.lua

function love.load()
  map.init()
end

function love.update(dt)
  player.update(dt)
end

function love.draw()
  map.draw(testMap, 6, 6)
  player.draw()
end
