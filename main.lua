

local const = {}
const.pixel = 16


-- Load some default values for our rectangle.
function love.load()
  require("snake")

  Snake:load()
end

-- Increase the size of the rectangle every frame.
function love.update(dt)
  Snake:update(dt)
end

-- Draw a coloured rectangle.
function love.draw()
  Snake:draw()
end

function love.keypressed(key)
  Snake:keypressed(key)
end