EnemySwatInitializer = {}

EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")
SwatShootCommand = SwatShootCommand or require("scripts.SwatShootCommand")
SwatShootTimerRepository = SwatShootTimerRepository or require("scripts.SwatShootTimerRepository")
timer = timer

function EnemySwatInitializer.initialize()  
  
  local swatSprite = EnemyInitializer.initialize("swat")
  
  local swatShootTimer = timer.performWithDelay(1500, SwatShootCommand.execute, 0)  
  swatShootTimer.params = {
    swatSprite=swatSprite
  }
  
  swatSprite.shootTimer = swatShootTimer
  
  SwatShootTimerRepository.insert(swatShootTimer)
end

return EnemySwatInitializer