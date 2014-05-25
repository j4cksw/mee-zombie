local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
physics = physics or require("physics")
FloorBuilder = FloorBuilder or require("scripts.FloorBuilder")
FloorRoller = FloorRoller or require("scripts.FloorRoller")
PlayerInitializer = PlayerInitializer or require("scripts.PlayerInitializer")
EnemyGenerateTimerInitializer = EnemyGenerateTimerInitializer or require("scripts.EnemyGenerateTimerInitializer")
FloorPhysicsInitializer = FloorPhysicsInitializer or require("scripts.FloorPhysicsInitializer")
EnemiesRoller = EnemiesRoller or require("scripts.EnemiesRoller")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor", "enemy", "bullet"})
  
  physics.start(false)
  physics.setDrawMode( "hybrid" )
  
  FloorPhysicsInitializer.initialize()
  FloorBuilder.build()
  
  PlayerInitializer.initialize()
  EnemyGenerateTimerInitializer.initialize()
  
  Runtime:addEventListener("enterFrame", FloorRoller.roll)
  Runtime:addEventListener("enterFrame", EnemiesRoller.roll)
end

return GameInitializer