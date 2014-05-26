EnemiesRoller = {}

EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")

function EnemiesRoller.roll()
  local enemyGroup = EnemyRepository.getEnemyGroup()

  if not enemyGroup.numChildren then
    return
  end

  for i = 1,enemyGroup.numChildren do
    enemyGroup[i].x = enemyGroup[i].x - 7
  end
end

return EnemiesRoller