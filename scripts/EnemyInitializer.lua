EnemyInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
physics = physics or require("physics")
EnemySpriteCollisionListener = EnemySpriteCollisionListener or require("scripts.EnemySpriteCollisionListener")
EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")

function EnemyInitializer.initialize()
  local enemySprite = SpriteInitializer.initializeByData(GameInitializeData["enemy"])
  
  physics.addBody(enemySprite, "dynamic")
  enemySprite.isSleepingAllowed = false
  
  enemySprite:addEventListener("collision", EnemySpriteCollisionListener.actionPerformed)
  
  local enemyGroup = display.newGroup()
  enemyGroup:insert(enemySprite)
  
  EnemyRepository.setEnemyGroup(enemyGroup)
end

return EnemyInitializer