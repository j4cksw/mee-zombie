EnemyInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
physics = physics or require("physics")

function EnemyInitializer.initialize()
  local enemySprite = SpriteInitializer.initializeByData(GameInitializeData["enemy"])
  
  physics.addBody(enemySprite, "dynamic")
  enemySprite.isSleepingAllowed = false
end

return EnemyInitializer