enemy = {
    types = {
        ['dumb'] = {
            health = 40,
            size = 30,
            speed = 0,
            XPYield = 10,
            color = {
                r = 255,
                g = 0,
                b = 0
            }
        }
    }
}

function enemy.new(type, xPos, yPos)
    i = #enemy + 1

    enemy[i] = {
        x = xPos,
        y = yPos,
        health = enemy.types[type].health,
        size = enemy.types[type].size,
        speed = enemy.types[type].speed,
        XPYield = enemy.types[type].XPYield,
        color = enemy.types[type].color
    }
end

function enemy.damage(i, damage)
    enemy[i].health = enemy[i].health - damage
    if enemy[i].health <= 0 then
        enemy.destroy(i)
    end
end

function enemy.destroy(i)
    --TODO: death functions, e.g loot drops
    player.XP = player.XP + enemy[i].XPYield
    table.remove(enemy, i)
end

function enemy.draw(i)
    love.graphics.setColor(enemy[i].color.r, enemy[i]color.g, enemy[i]color.b)
    love.graphics.rectangle('fill', enemy[i].x, enemy[i].y, enemy[i].size, enemy[i].size)
end
function enemy.drawAll()
    for i, #enemy do
        enemy.draw(i)
    end
end
