dll = require("utilities/doublylinkedlist")

local const = {
  start_coordinates = {
    {
      x = 0,
      y = 1,
    },
    {
      x = 1,
      y = 1,
    },
    {
      x = 2,
      y = 1,
    },
  }
}

local directions = {}
directions.l = {x = -1, y = 0}
directions.r = {x = 1, y = 0}
directions.u = {x = 0, y = -1}
directions.d = {x = 0, y = 1}

function allowedDirectionChange(old, new)
  if old == directions.l then
    return new ~= directions.r
  elseif old == directions.r then
    return new ~= directions.l
  elseif old == directions.u then
    return new ~= directions.d
  elseif old == directions.d then
    return new ~= directions.u
  else
    return false
  end
end

Snake = {}

function Snake:load()
  require("params")

  ps = PARAMS.pixelSize

  self.snake = dll.new()
  for _, v in ipairs(const.start_coordinates) do
    self.snake:insertHead({x = v.x, y = v.y})
  end

  self.currentDirection = directions.r

  self.lastStep = self.currentDirection

  self.rate = 1 / PARAMS.speed

  self.timer = 0
end

function Snake:move()
  self.snake:insertHead({x = self.snake.head.value.x + self.currentDirection.x, y = self.snake.head.value.y + self.currentDirection.y})
  self.lastStep = self.currentDirection
  if not self.grow then
    self.snake:deleteTail()
  else
    self.grow = false
  end
end

function Snake:update(dt)
    self.timer = self.timer + dt
    if self.timer >= self.rate then
      self.timer = 0
      self:move()
  end
end

function Snake:getIter()
  return self.snake:getIter()
end

function Snake:draw()
  love.graphics.setColor(0, 0.4, 0.4)
  for position in self.snake:getIter() do
    love.graphics.rectangle("fill", ps * position.x, ps * position.y, ps, ps)
  end
end

function Snake:changeDirectionLeft()
  if allowedDirectionChange(self.lastStep, directions.l) then
    self.currentDirection = directions.l
  end
end

function Snake:changeDirectionRight()
  if allowedDirectionChange(self.lastStep, directions.r) then
    self.currentDirection = directions.r
  end
end

function Snake:changeDirectionUp()
  if allowedDirectionChange(self.lastStep, directions.u) then
    self.currentDirection = directions.u
  end
end

function Snake:changeDirectionDown()
  if allowedDirectionChange(self.lastStep, directions.d) then
    self.currentDirection = directions.d
  end
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

function Snake:getHead()
  return self.snake.head.value
end

function Snake:eat()
  self.grow = true
end