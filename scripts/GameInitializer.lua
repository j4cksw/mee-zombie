local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
physics = physics or require("physics")
FloorPhysicsInitializer = FloorPhysicsInitializer or require("scripts.FloorPhysicsInitializer")
BackgroundInitializer = BackgroundInitializer or require("scripts.BackgroundInitializer")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor", "enemy", "bullet", "item", "background", "chairs"})

  physics.start(false)
  physics.setDrawMode("normal")

  FloorPhysicsInitializer.initialize()
  
  BackgroundInitializer.initialize()
end

return GameInitializer