local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
physics = physics or require("physics")
FloorPhysicsInitializer = FloorPhysicsInitializer or require("scripts.FloorPhysicsInitializer")
BackgroundInitializer = BackgroundInitializer or require("scripts.BackgroundInitializer")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor", "enemy", "bullet", "item", "background"})

  physics.start(false)
  physics.setDrawMode("hybrid")

  FloorPhysicsInitializer.initialize()
  
  BackgroundInitializer.initialize()
end

return GameInitializer