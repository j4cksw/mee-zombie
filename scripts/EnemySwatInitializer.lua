EnemySwatInitializer = {}

EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")
SwatShootCommand = SwatShootCommand or require("scripts.SwatShootCommand")

function EnemySwatInitializer.initialize()  
  
  local swatSprite = EnemyInitializer.initialize("swat")
  
  local swatShootTimer = timer.performWithDelay(1500, SwatShootCommand.execute, 0)  
  swatShootTimer.params = {
    swatSprite=swatSprite
  }
  
  swatSprite.shootTimer = swatShootTimer
end

return EnemySwatInitializer