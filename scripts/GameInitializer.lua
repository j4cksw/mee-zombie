local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
FloorBuilder = FloorBuilder or require("scripts.FloorBuilder")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor"})
  SpriteInitializer.initializeByData(GameInitializeData["bear_zombie"])
  FloorBuilder.build()
end

return GameInitializer