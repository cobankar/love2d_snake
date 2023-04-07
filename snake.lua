dll = require("doublylinkedlist")

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

local Snake = {
  new = function()
    s = dll.new()
    for _, v in ipairs(const.start_coordinates) do
      s:insertHead({x = v.x, y = v.y})
    end

    function moveRight(l)
      l:insertHead({x = l.head.value.x + 1, y = l.head.value.y})
      l:deleteTail()
    end

    function moveLeft(l)
      return function()
        l:insertHead({x = l.head.value.x - 1, y = l.head.value.y})
        l:deleteTail()
      end
    end

    return {
      snake = s,

      currentDirection = directions.r,

      move = function(self)
        self.snake:insertHead({x = self.snake.head.value.x + self.currentDirection.x, y = self.snake.head.value.y + self.currentDirection.y})
        self.snake:deleteTail()
      end,

      changeDirectionLeft = function(self)
        self.currentDirection = directions.l
      end,

      changeDirectionRight = function(self)
        self.currentDirection = directions.r
      end,

      changeDirectionUp = function(self)
        self.currentDirection = directions.u
      end,

      changeDirectionDown = function(self)
        self.currentDirection = directions.d
      end,

      getIter = function(self)
        return self.snake:getIter()
      end,

      print = function(self)
        self.snake:print()
      end,
    }
  end,
}

return Snake