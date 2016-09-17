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
  player.draw()
end
