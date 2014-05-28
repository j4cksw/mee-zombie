GameDestroyer = {}

EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")
FloorRepository = FloorRepository or require("scripts.FloorRepository")
SwatShootTimerRepository = SwatShootTimerRepository or require("scripts.SwatShootRepository")
BulletRepository = BulletRepository or require("scripts.BulletRepository")
ItemRepository = ItemRepository or require("scripts.ItemRepository")

function GameDestroyer.destroy()
  EnemyRepository.getEnemyGroup():removeSelf()
  FloorRepository.getFloorGroup():removeSelf()
  BulletRepository.removeAll()
  ItemRepository.removeAll()
  
  local swatShootTimers = SwatShootTimerRepository.getAll()

  for key, timerId in pairs(swatShootTimers) do
    timer.cancel(timerId)
    swatShootTimers[key] = nil
  end
  
  timer.cancel(EnemyGenerateTimer)
  
  Runtime:removeEventListener("enterFrame", FloorRoller.roll)
  Runtime:removeEventListener("enterFrame", EnemiesRoller.roll)
end

return GameDestroyer