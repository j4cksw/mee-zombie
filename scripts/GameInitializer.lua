local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
FloorBuilder = FloorBuilder or require("scripts.FloorBuilder")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")
FloorRoller = FloorRoller or require("scripts.FloorRoller")
PlayerAttackCommand = PlayerAttackCommand or require("scripts.PlayerAttackCommand")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor"})
  
  FloorBuilder.build()
  SpriteInitializer.initializeByData(GameInitializeData["bear_zombie"])
  
  Runtime:addEventListener("enterFrame", FloorRoller.roll)
  Runtime:addEventListener("tap", PlayerAttackCommand.execute)
end

return GameInitializer