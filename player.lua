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
    weaponCooldown = 0
    --TODO: player stats #craig
}

function player.update(dt)
    if not player.dead then
        player.move(dt)
        if player.weaponCooldown > 0 then
            player.weaponCooldown = player.weaponCooldown - dt
        end
        player.pickupItems()
    end
    if player.XP >= player.XPToLevel then
      player.levelUp()
    end
    actor.collideWithMap(player, map.testMap)
end

function player.move(dt)
    moveSpeed = settings.player.baseSpeed --TODO: replace with value calculated from speed/agility stat #craig
    moveX = 0
    moveY = 0
    if love.keyboard.isDown(settings.controls.move.right) then
        moveX = moveX + 1
    end
    if love.keyboard.isDown(settings.controls.move.left) then
        moveX = moveX - 1
    end
    if love.keyboard.isDown(settings.controls.move.down) then
        moveY = moveY + 1
    end
    if love.keyboard.isDown(settings.controls.move.up) then
        moveY = moveY - 1
    end
    if moveX * moveY ~= 0 then
        player.x = player.x + moveX * 0.707 * moveSpeed * dt
        player.y = player.y + moveY * 0.707 * moveSpeed * dt
    else
        player.x = player.x + moveX * moveSpeed * dt
        player.y = player.y + moveY * moveSpeed * dt
    end
end

function player.damage(damage)
    player.health = player.health - damage
    if player.health <= 0 then
        player.health = 0
        player.dead = true
    end
end

function player.attack(x, y)
    if player.weaponCooldown <= 0  and not player.dead then
        --TODO: replace this with attack for player's equipped weapon
        items["sword"].attack(x,y)
        player.weaponCooldown = items["sword"].cooldown
    end
end

function player.levelUp()
  player.XP = player.XP - player.XPToLevel
  player.level = player.level + 1
  --TODO: edit the leveling algorithm
  player.XPToLevel = (100 * 1.5) * player.level
end

function player.pickupItems()
    for i = 1, #items do
        a = {
            x = player.x,
            y = player.y,
            width = player.size,
            height = player.size
        }
        b = {
            x = items[i].x,
            y = items[i].y,
            width = items.size,
            height = items.size
        }
        if util.intersect(a, b) then
            x, y = inventory.nextSlot()
            if x ~= false then
                settings.inventory.contents[x][y] = items[i].type
                items.destroy(i)
            end
        end
    end
end

function player.draw()
    if not player.dead then
        love.graphics.setColor(0, 255, 0)
        love.graphics.rectangle('fill', player.x, player.y, player.size, player.size)
    end
end

function player.center()
    return player.x + player.size / 2, player.y + player.size / 2
end
