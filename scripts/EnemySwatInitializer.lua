EnemySwatInitializer = {}

EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")
SwatShootCommand = SwatShootCommand or require("scripts.SwatShootCommand")
--SwatTimerTable = SwatTimerTable or require("scripts.SwatTimerTable")

EnemyRepository = EnemyRepository or require("scripts.EnemyRepository")

function EnemySwatInitializer.initialize()  
  EnemyRepository.setEnemyGroup(display.newGroup())
  
  local swatSprite = EnemyInitializer.initialize("swat")
  
  local swatShootTimer = timer.performWithDelay(1500, SwatShootCommand.execute, 0)  
  swatShootTimer.params = {
    swatSprite=swatSprite
  }
  
  swatSprite.shootTimer = swatShootTimer
end

return EnemySwatInitializer