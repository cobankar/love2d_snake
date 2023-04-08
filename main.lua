require("params")
require("utilities/collision")
require("utilities/findIndex")

function love.load()
  require("snake")
  require("food")

  Snake:load()
  Food:load()

  math.randomseed(os.time())
end

function moveFood()
  local possibleCoordinates = {}
  for i=0, PARAMS.pixelCountX - 1 do
    for j=0, PARAMS.pixelCountY - 1 do
      table.insert(possibleCoordinates, {x=i, y=j})
    end
  end
  for coordinates in Snake:getIter() do
    print(coordinates.x, coordinates.y)
    local i = findIndex(possibleCoordinates, coordinates)
    if i then table.remove(possibleCoordinates, i) end
  end
  local newCoordinates = possibleCoordinates[math.random(table.getn(possibleCoordinates))]
  Food:setCoordinates(newCoordinates.x, newCoordinates.y)
end

function love.update(dt)
  Snake:update(dt)
  if checkCollision(Snake:getHead(), Food) then
    Snake:eat()
    moveFood()
  end
end

function love.draw()
  Food:draw()
  Snake:draw()
end

function love.keypressed(key)
  Snake:keypressed(key)
end