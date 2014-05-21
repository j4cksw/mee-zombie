local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
physics = physics or require("physics")
FloorBuilder = FloorBuilder or require("scripts.FloorBuilder")
FloorRoller = FloorRoller or require("scripts.FloorRoller")
PlayerInitializer = PlayerInitializer or require("scripts.PlayerInitializer")
EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor", "enemy"})
  
  physics.start()
  physics.setDrawMode( "hybrid" )
  
  FloorBuilder.build()
  PlayerInitializer.initialize()
  EnemyInitializer.initialize()
  
  Runtime:addEventListener("enterFrame", FloorRoller.roll)
end

return GameInitializer