dll = require("utilities/doublylinkedlist")

local const = {
  start_coordinates = {
    {
      x = 1,
      y = 1,
    },
    {
      x = 2,
      y = 1,
    },
    {
      x = 3,
      y = 1,
    },
  }
}

local directions = {}
directions.l = {x = -1, y = 0}
directions.r = {x = 1, y = 0}
directions.u = {x = 0, y = -1}
directions.d = {x = 0, y = 1}

Snake = {}

function Snake:load()
  require("params")

  ps = PARAMS.pixelSize

  self.snake = dll.new()
  for _, v in ipairs(const.start_coordinates) do
    self.snake:insertHead({x = v.x, y = v.y})
  end

  self.currentDirection = directions.r

  self.rate = 0.1

  self.timer = 0
end

function Snake:move()
  self.snake:insertHead({x = self.snake.head.value.x + self.currentDirection.x, y = self.snake.head.value.y + self.currentDirection.y})
  self.snake:deleteTail()
end

function Snake:update(dt)
    self.timer = self.timer + dt
    if self.timer >= self.rate then
      self.timer = 0
      self:move()
  end
end

function Snake:getIter(self)
  return self.snake:getIter()
end

function Snake:draw()
  love.graphics.setColor(0, 0.4, 0.4)
  for position in self.snake:getIter() do
    love.graphics.rectangle("fill", ps * position.x, ps * position.y, ps, ps)
  end
end

function Snake:changeDirectionLeft()
  self.currentDirection = directions.l
end

function Snake:changeDirectionRight()
  self.currentDirection = directions.r
end

function Snake:changeDirectionUp()
  self.currentDirection = directions.u
end

function Snake:changeDirectionDown()
  self.currentDirection = directions.d
end

function Snake:keypressed(key)
  if key == "d" then -- move right
    self:changeDirectionRight()
  elseif key == "a" then -- move left
    self:changeDirectionLeft()
  elseif key == "s" then -- move down
    self:changeDirectionDown()
  elseif key == "w" then -- move up
    self:changeDirectionUp()
 end
end

function Snake:print()
  self.snake:print()
end