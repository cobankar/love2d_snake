require("params")

function love.conf(t)
  t.modules.joystick = false

  t.window.title = "LÖVE snake"

  t.window.width = (PARAMS.pixelSize * PARAMS.pixelCountX)
  t.window.height = (PARAMS.pixelSize * PARAMS.pixelCountY)
end