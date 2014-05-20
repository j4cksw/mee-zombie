PlayerInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
PlayerWalkCommand = PlayerWalkCommand or require("scripts.PlayerWalkCommand")

function PlayerInitializer.initialize()
  local playerSprite = SpriteInitializer.initializeByData(GameInitializeData["bear_zombie"])
  PlayerRepository.setPlayerSprite(playerSprite)
  PlayerWalkCommand.execute()
end

return PlayerInitializer