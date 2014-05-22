RandomPickEnemyInitializer = {}

EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")

function RandomPickEnemyInitializer.initialize()
  local randomResult = math.random(1,4)
  print(randomResult)
  EnemyInitializer.initialize("enemy"..randomResult)
end

return RandomPickEnemyInitializer