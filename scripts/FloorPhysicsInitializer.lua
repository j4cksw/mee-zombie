FloorPhysicsInitializer = {}

physics = physics or require("physics")

function FloorPhysicsInitializer.initialize()
  local floorRect = display.newRect(display.contentCenterX, 1460, display.viewableContentWidth, 152)
  physics.addBody(floorRect, "static")
end

return FloorPhysicsInitializer