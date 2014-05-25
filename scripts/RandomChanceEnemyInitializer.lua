RandomChanceRandomPickEnemyInitializer = {}

RandomPickEnemyInitializer = RandomPickEnemyInitializer or require("scripts.RandomPickEnemyInitializer")
EnemySwatInitializer = EnemySwatInitializer or require("scripts.EnemySwatInitializer")

function RandomChanceRandomPickEnemyInitializer.initialize()
  local randomedResult = math.random(0, 100)

  if randomedResult <= 30 then
    RandomPickEnemyInitializer.initialize()
  elseif randomedResult <= 40 then
    EnemySwatInitializer.initialize()
  end
end

return RandomChanceRandomPickEnemyInitializer