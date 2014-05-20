local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
FloorBuilder = FloorBuilder or require("scripts.FloorBuilder")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")
FloorRoller = FloorRoller or require("scripts.FloorRoller")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor"})
  
  FloorBuilder.build()
  PlayerInitializer.initialize()
  
  Runtime:addEventListener("enterFrame", FloorRoller.roll)
end

return GameInitializer