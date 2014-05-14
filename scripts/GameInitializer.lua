local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
PlayerInitializer = PlayerInitializer or require("scripts.PlayerInitializer")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor"})
  PlayerInitializer.initialize()
end

return GameInitializer