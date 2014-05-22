EnemiesRoller = {}

EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")

function EnemiesRoller.roll()
  local enemyGroup = EnemyRepository.getEnemyGroup()
  enemyGroup[1].x = enemyGroup[1].x - 7
end

return EnemiesRoller