GameDestroyer = {}

EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")

function GameDestroyer.destroy()
  EnemyRepository.getEnemyGroup():removeSelf()
end

return GameDestroyer