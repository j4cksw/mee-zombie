FloorPhysicsInitializer = {}

physics = physics or require("physics")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")

function FloorPhysicsInitializer.initialize()
  local floorRect = display.newRect(display.contentCenterX,
   GameInitializeData["floor_physics"].y,
   display.viewableContentWidth, 
   GameInitializeData["floor_physics"].height)
  physics.addBody(floorRect, "static")
end

return FloorPhysicsInitializer