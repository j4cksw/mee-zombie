EnemyGenerateTimerInitializer = {}

EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")

function EnemyGenerateTimerInitializer.initialize()
  timer.performWithDelay(500, EnemyInitializer.initialize, 0)
end

return EnemyGenerateTimerInitializer