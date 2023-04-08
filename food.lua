Food = {}

function Food:load()
  require("params")

  math.randomseed(os.time())

  self.x = math.random(5, PARAMS.pixelCountX - 1)
  self.y = math.random(3, PARAMS.pixelCountY - 1)

  ps = PARAMS.pixelSize
end

function Food:draw()
  love.graphics.setColor(0.5, 0.4, 0.4)
  love.graphics.rectangle("fill", ps * self.x, ps * self.y, ps, ps)
end

function Food:setCoordinates(x, y)
  self.x = x
  self.y = y
end
