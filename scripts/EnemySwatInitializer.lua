EnemySwatInitializer = {}

EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")

function EnemySwatInitializer.initialize()
  EnemyInitializer.initialize("swat")
end

return EnemySwatInitializer