function love.load()
  require("snake")

  Snake:load()
end

function love.update(dt)
  Snake:update(dt)
end

function love.draw()
  Snake:draw()
end

function love.keypressed(key)
  Snake:keypressed(key)
end