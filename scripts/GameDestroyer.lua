GameDestroyer = {}

EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")
FloorRepository = FloorRepository or require("scripts.FloorRepository")

function GameDestroyer.destroy()
  EnemyRepository.getEnemyGroup():removeSelf()
  FloorRepository.getFloorGroup():removeSelf()
end

return GameDestroyer