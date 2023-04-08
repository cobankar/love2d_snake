Food = {}

function Food:load()
  self.x = 5
  self.y = 12

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
