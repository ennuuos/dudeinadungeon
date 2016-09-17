items = {
  ["sword"] = {love.graphics.newImage("assets/sword.png")},
}

items["sword"].attack = function()
    modulus = 60    --how far the swing will reach
    deviation = 25  --angle of deviation allowed from the angle of the swing
    damage = 35
end
