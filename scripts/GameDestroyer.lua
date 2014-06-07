GameDestroyer = {}

EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")
FloorRepository = FloorRepository or require("scripts.FloorRepository")
SwatShootTimerRepository = SwatShootTimerRepository or require("scripts.SwatShootRepository")
BulletRepository = BulletRepository or require("scripts.BulletRepository")
ItemRoller = ItemRoller or require("scripts.ItemRoller")
BackgroundRoller = BackgroundRoller or require("scripts.BackgroundRoller")

function GameDestroyer.destroy()
  local swatShootTimers = SwatShootTimerRepository.getAll()

  for key, timerId in pairs(swatShootTimers) do
    timer.cancel(timerId)
    swatShootTimers[key] = nil
  end
  
  timer.cancel(EnemyGenerateTimer)
  
  EnemyRepository.getEnemyGroup():removeSelf()
  FloorRepository.getFloorGroup():removeSelf()
  BulletRepository.removeAll()
  ItemRepository.removeAll()
  
  Runtime:removeEventListener("enterFrame", FloorRoller.roll)
  Runtime:removeEventListener("enterFrame", EnemiesRoller.roll)
  Runtime:removeEventListener("enterFrame", ItemRoller.roll)
  Runtime:removeEventListener("enterFrame", BackgroundRoller.roll)
end

return GameDestroyer