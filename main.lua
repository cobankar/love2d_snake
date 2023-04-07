require("utilities/collision")

function love.load()
  require("snake")
  require("food")

  Snake:load()
  Food:load()
end

function love.update(dt)
  Snake:update(dt)
  if checkCollision(Snake:getHead(), Food) then
    print("collision")
  end
end

function love.draw()
  Food:draw()
  Snake:draw()
end

function love.keypressed(key)
  Snake:keypressed(key)
end