local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
physics = physics or require("physics")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor", "enemy", "bullet"})
  
  physics.start(false)
  physics.setDrawMode( "hybrid" )
end

return GameInitializer