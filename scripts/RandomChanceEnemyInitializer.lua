RandomChanceRandomPickEnemyInitializer = {}

RandomPickEnemyInitializer = RandomPickEnemyInitializer or require("scripts.RandomPickEnemyInitializer")

function RandomChanceRandomPickEnemyInitializer.initialize()
  local randomedResult = math.random(0, 100)

  if randomedResult <= 30 then
    RandomPickEnemyInitializer.initialize()
  end
end

return RandomChanceRandomPickEnemyInitializer