items = {
  ["sword"] = {
      love.graphics.newImage("assets/sword.png"),
      cooldown = 0.5
  },
  size = 10,
  color = {r = 0, g = 255, b = 255}
}

items["sword"].attack = function(x, y)
    modulus = 60    --how far the swing will reach
    deviation = 3.14/8  --angle of deviation allowed from the angle of the swing
    damage = 35

    playerX, playerY = player.center()
    aimAngle = util.angle(playerX, playerY, x, y)

    arcQueue = {255, 255, 255, 175, 'fill', playerX, playerY, modulus, aimAngle - deviation, aimAngle + deviation}
    for i = 1, #enemy do
        enemyX, enemyY = enemy.center(i)
        if util.distance(playerX, playerY, enemyX, enemyY) < modulus then
            angle = util.angle(playerX, playerY, enemyX, enemyY)
            if aimAngle - deviation < angle and angle < aimAngle + deviation then
                enemy.damage(i, damage)
            end
        end
    end
end

function items.new(itemType, xPos, yPos)
    i = #items + 1
    items[i] = {
        type = itemType,
        x = xPos,
        y = yPos
    }
end

function items.destroy(i)
    table.remove(items, i)
end

function items.draw(i)
    love.graphics.setColor(items.color.r, items.color.g, items.color.b)
    love.graphics.rectangle("fill", items[i].x, items[i].y, items.size, items.size)
end
function items.drawAll()
    for i = 1, #items do
        items.draw(i)
    end
end
