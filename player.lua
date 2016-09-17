player = {
    dead = false,
    health = 100,
    maxHealth = 100,
    level = 1,
    XP = 0,
    XPToLevel = 100,
    x = 205,
    y = 205,
    size = 40,
    --TODO: player stats #craig
}

function player.update(dt)
    moveX = 0
    moveY = 0
    if love.keyboard.isDown("d") then
        moveX = moveX + 1
    end
    if love.keyboard.isDown("a") then
        moveX = moveX - 1
    end
    if love.keyboard.isDown("s") then
        moveY = moveY + 1
    end
    if love.keyboard.isDown("w") then
        moveY = moveY - 1
    end
    player.move(moveX, moveY, dt)
    tx, ty = actor.collideWithMap(player, map.testMap)
end

function player.move(moveX, moveY, dt)
    moveSpeed = settings.player.baseSpeed --TODO: replace with value calculated from speed/agility stat #craig
    if moveX * moveY ~= 0 then
        player.x = player.x + moveX * 1.41 * moveSpeed * dt
        player.y = player.y + moveY * 1.41 * moveSpeed * dt
    else
        player.x = player.x + moveX * moveSpeed * dt
        player.y = player.y + moveY * moveSpeed * dt
    end
end

function player.damage(damage)
    player.health = player.health - damage
    if player.health < 0 then
        player.health = 0
        player.dead = true
    end
end

function player.level()
    --TODO: player levelling algorithm
end

function player.draw()
    love.graphics.setColor(0, 255, 0)
    love.graphics.rectangle('fill', player.x, player.y, player.size, player.size)
end
