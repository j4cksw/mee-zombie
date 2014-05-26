GameStarter = {}

FloorBuilder = FloorBuilder or require("scripts.FloorBuilder")
FloorRoller = FloorRoller or require("scripts.FloorRoller")
PlayerInitializer = PlayerInitializer or require("scripts.PlayerInitializer")
EnemyGenerateTimerInitializer = EnemyGenerateTimerInitializer or require("scripts.EnemyGenerateTimerInitializer")
FloorPhysicsInitializer = FloorPhysicsInitializer or require("scripts.FloorPhysicsInitializer")
EnemiesRoller = EnemiesRoller or require("scripts.EnemiesRoller")

function GameStarter.start()
print("Game start")
  FloorPhysicsInitializer.initialize()
  FloorBuilder.build()

  PlayerInitializer.initialize()
  EnemyGenerateTimerInitializer.initialize()

  Runtime:addEventListener("enterFrame", FloorRoller.roll)
  Runtime:addEventListener("enterFrame", EnemiesRoller.roll)
end

return GameStarter