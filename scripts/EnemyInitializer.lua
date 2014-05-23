EnemyInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
physics = physics or require("physics")
EnemySpriteCollisionListener = EnemySpriteCollisionListener or require("scripts.EnemySpriteCollisionListener")
EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")

function EnemyInitializer.initialize(enemyName)
  local enemySprite = SpriteInitializer.initializeByData(GameInitializeData[enemyName])
  
  physics.addBody(enemySprite, "static")
  enemySprite.isSleepingAllowed = false
  
  enemySprite:addEventListener("collision", EnemySpriteCollisionListener.actionPerformed)
  
  local enemyGroup = EnemyRepository.getEnemyGroup()
  enemyGroup:insert(enemySprite)
  
  return enemySprite
end

return EnemyInitializer