RandomChanceEnemyInitializer = {}

EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")

function RandomChanceEnemyInitializer.initialize()
  local randomedResult = math.random(0, 100)

  if randomedResult <= 30 then
    EnemyInitializer.initialize()
  end
end

return RandomChanceEnemyInitializer