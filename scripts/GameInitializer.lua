local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
FloorBuilder = FloorBuilder or require("scripts.FloorBuilder")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")
FloorRoller = FloorRoller or require("scripts.FloorRoller")
PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
PlayerWalkCommand = PlayerWalkCommand or require("scripts.PlayerWalkCommand")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor"})
  
  FloorBuilder.build()
  local playerSprite = SpriteInitializer.initializeByData(GameInitializeData["bear_zombie"])
  PlayerRepository.setPlayerSprite(playerSprite)
  PlayerWalkCommand.execute()
  
  Runtime:addEventListener("enterFrame", FloorRoller.roll)
end

return GameInitializer