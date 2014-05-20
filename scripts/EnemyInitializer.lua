EnemyInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")

function EnemyInitializer.initialize()
  SpriteInitializer.initializeByData(GameInitializeData["enemy"])
end

return EnemyInitializer