GameStarter = {}

FloorBuilder = FloorBuilder or require("scripts.FloorBuilder")
FloorRoller = FloorRoller or require("scripts.FloorRoller")
PlayerInitializer = PlayerInitializer or require("scripts.PlayerInitializer")
EnemyGenerateTimerInitializer = EnemyGenerateTimerInitializer or require("scripts.EnemyGenerateTimerInitializer")
EnemiesRoller = EnemiesRoller or require("scripts.EnemiesRoller")

function GameStarter.start()
  FloorBuilder.build()

  PlayerInitializer.initialize()
  EnemyGenerateTimerInitializer.initialize()

  Runtime:addEventListener("enterFrame", FloorRoller.roll)
  Runtime:addEventListener("enterFrame", EnemiesRoller.roll)
end

return GameStarter