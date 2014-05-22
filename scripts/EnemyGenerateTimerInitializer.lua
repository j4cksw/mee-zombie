EnemyGenerateTimerInitializer = {}

EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")
EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")

function EnemyGenerateTimerInitializer.initialize()
  local enemyGroup = display.newGroup()
  EnemyRepository.setEnemyGroup(enemyGroup)
  
  timer.performWithDelay(500, EnemyInitializer.initialize, 0)
end

return EnemyGenerateTimerInitializer