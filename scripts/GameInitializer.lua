local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
FloorChunkBuilder = FloorChunkBuilder or require("scripts.FloorChunkBuilder")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor"})
  
  for verticalOffset=1,16 do
    FloorChunkBuilder.buildFromPatternAndVerticalOffset({"body", "top"}, verticalOffset)
  end
  
  SpriteInitializer.initializeByData(GameInitializeData["bear_zombie"])
end

return GameInitializer