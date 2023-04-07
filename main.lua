

local const = {}
const.pixel = 16
const.speed = 5

local directions = {}
directions.l = "left"
directions.r = "right"
directions.u = "up"
directions.d = "down"

-- Load some default values for our rectangle.
function love.load()
  Snake = require("snake")

  snake = Snake.new()
  timePassed = 0
  currentDirection = directions.r
end

-- Increase the size of the rectangle every frame.
function love.update(dt)
  timePassed = timePassed + dt
  if timePassed >=  1 / const.speed then
    snake:move()
    timePassed = 0
  end
end

-- Draw a coloured rectangle.
function love.draw()
  love.graphics.setColor(0, 0.4, 0.4)
  for position in snake:getIter() do
    love.graphics.rectangle("fill", const.pixel * position.x, const.pixel * position.y, const.pixel, const.pixel)
  end
end

function love.keypressed(key)
  if key == "d" then -- move right
    snake:changeDirectionRight()
  elseif key == "a" then -- move left
    snake:changeDirectionLeft()
  elseif key == "s" then -- move down
    snake:changeDirectionDown()
  elseif key == "w" then -- move up
    snake:changeDirectionUp()
 end
end