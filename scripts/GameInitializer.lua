local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
FloorBuilder = FloorBuilder or require("scripts.FloorBuilder")
FloorRoller = FloorRoller or require("scripts.FloorRoller")
PlayerInitializer = PlayerInitializer or require("scripts.PlayerInitializer")
EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor", "enemy"})
  
  FloorBuilder.build()
  PlayerInitializer.initialize()
  EnemyInitializer.initialize()
  
  Runtime:addEventListener("enterFrame", FloorRoller.roll)
end

return GameInitializer