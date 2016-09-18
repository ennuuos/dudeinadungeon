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
            },
            drops = {
                --must sum to less than one
                --if for some reason you really need to, ["nil"] = 0.5 will work
                ["sword"] = 0.1,
                ["hurtPotion"] = 0.4
            }
        }
    }
}

function enemy.new(enemyType, xPos, yPos)
    i = #enemy + 1

    enemy[i] = {
        x = xPos,
        y = yPos,
        health = enemy.types[enemyType].health,
        type = enemyType
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
    player.XP = player.XP + enemy.types[enemy[i].type].XPYield
    enemy.dropLoot(i)
    table.remove(enemy, i)
end
function enemy.dropLoot(i)
    rand = math.random()
    minRange = 0
    for k, v in pairs(enemy.types[enemy[i].type].drops) do
        if minRange < rand and rand < v then
            if k ~= "nil" then
                items.new(k, enemy.center(i))
            end
            return
        end
        minRange = minRange + v
    end
end

function enemy.update(dt, i)
    --TODO: enemy update
end
function enemy.updateAll(dt)
end

function enemy.draw(i)
    love.graphics.setColor(enemy.types[enemy[i].type].color.r, enemy.types[enemy[i].type].color.g, enemy.types[enemy[i].type].color.b)
    love.graphics.rectangle('fill', enemy[i].x, enemy[i].y, enemy.types[enemy[i].type].size, enemy.types[enemy[i].type].size)
end
function enemy.drawAll()
    for i = 1, #enemy do
        enemy.draw(i)
    end
end

function enemy.center(i)
    return enemy[i].x + enemy.types[enemy[i].type].size / 2, enemy[i].y + enemy.types[enemy[i].type].size / 2
end
