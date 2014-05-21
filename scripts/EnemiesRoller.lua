EnemiesRoller = {}

EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")

function EnemiesRoller.roll()
  local enemyGroup = EnemyRepository.getEnemyGroup()
  enemyGroup[1].x = enemyGroup[1].x - 1
end

return EnemiesRoller