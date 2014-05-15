local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor"})
  SpriteInitializer.initializeByData(GameInitializeData["bear_zombie"])
  SpriteInitializer.initializeByData(GameInitializeData["floor"])
end

return GameInitializer