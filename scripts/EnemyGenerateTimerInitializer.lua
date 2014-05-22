EnemyGenerateTimerInitializer = {}

RandomChanceRandomChanceEnemyInitializer = RandomChanceEnemyInitializer or require("scripts.RandomChanceEnemyInitializer")
EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")

function EnemyGenerateTimerInitializer.initialize()
  local enemyGroup = display.newGroup()
  EnemyRepository.setEnemyGroup(enemyGroup)
  
  timer.performWithDelay(1000, RandomChanceEnemyInitializer.initialize, 0)
end

return EnemyGenerateTimerInitializer