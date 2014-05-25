PlayerInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
PlayerWalkCommand = PlayerWalkCommand or require("scripts.PlayerWalkCommand")
physics = physics or require("physics")
PhysicsData = PhysicsData or require("config.PhysicsData")

function PlayerInitializer.initialize()
  local playerSprite = SpriteInitializer.initializeByData(GameInitializeData["bear_zombie"])
  playerSprite.type = "player"

  local playerPhysicsData = PhysicsData["player"]
  physics.addBody(playerSprite,
    playerPhysicsData.type,
    playerPhysicsData.options)

  PlayerRepository.setPlayerSprite(playerSprite)
  PlayerWalkCommand.execute()
end

return PlayerInitializer