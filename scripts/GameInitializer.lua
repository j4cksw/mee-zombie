local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
PlayerInitializer = PlayerInitializer or require("scripts.PlayerInitializer")
FloorInitializer = FloorInitializer or require("scripts.FloorInitializer")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor"})
  PlayerInitializer.initialize()
  FloorInitializer.initialize()
end

return GameInitializer