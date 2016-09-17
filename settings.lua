settings = {
  controls = {
      move = {
          up = "w",
          left = "a",
          down = "s",
          right = "d"
      }
  },
  grid = {
    size = 50,
  },
  player = {
    baseSpeed = 100,
  },
  status = {
    toggle = "q",
  },
  inventory = {
    toggle = "e",
    tileSize = 32,
    width = 10,
    height = 10,
    border = 1,
    contents = {
      {"sword", "sword", nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
    },
  },
}
