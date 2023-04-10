require("params")
require("utilities/collision")
require("utilities/findIndex")

function love.load()
  require("snake")
  require("food")

  music = {}
  music.bg = love.audio.newSource("assets/audio/POL-sunset-route-short.wav", "stream")
  music.bg:setLooping(true)
  music.bg:setVolume(0.1)
  music.bg:play()

  Snake:load()
  Food:load()

  math.randomseed(os.time())

  menu = {}
  menu.active = true
  menu.font = love.graphics.newFont(16)
  menu.text = love.graphics.newText(menu.font, string.upper("press any key to start"))
  menu.x = PARAMS.pixelCountX * PARAMS.pixelSize / 2
  menu.xo = menu.text:getWidth() / 2 
  menu.y = PARAMS.pixelSize / 2
  menu.yo = menu.text:getHeight() / 2
end

function moveFood()
  local possibleCoordinates = {}
  for i=0, PARAMS.pixelCountX - 1 do
    for j=0, PARAMS.pixelCountY - 1 do
      table.insert(possibleCoordinates, {x=i, y=j})
    end
  end
  for coordinates in Snake:getIter() do
    local i = findIndex(possibleCoordinates, coordinates)
    if i then table.remove(possibleCoordinates, i) end
  end
  local newCoordinates = possibleCoordinates[math.random(table.getn(possibleCoordinates))]
  Food:setCoordinates(newCoordinates.x, newCoordinates.y)
end

function love.update(dt)
  if menu.active then
    return
  else
    Snake:update(dt)
    if checkCollision(Snake:getHead(), Food) then
      Snake:eat()
      moveFood()
    end
  end
end

function love.draw()
  if menu.active then
    love.graphics.draw(menu.text, menu.x, menu.y, nil, nil, nil, menu.xo, menu.yo)
  end
  Food:draw()
  Snake:draw()
end

function love.keypressed(key)
  if key == "z" then
    resetGame()
    return
  end
  menu.active = false
  Snake:keypressed(key)
end

function resetGame()
  Snake:load()
  Food:load()

  menu.active = true
end