local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
physics = physics or require("physics")
FloorPhysicsInitializer = FloorPhysicsInitializer or require("scripts.FloorPhysicsInitializer")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor", "enemy", "bullet"})
  
  physics.start(false)
  physics.setDrawMode( "hybrid" )
  
    FloorPhysicsInitializer.initialize()
end

return GameInitializer