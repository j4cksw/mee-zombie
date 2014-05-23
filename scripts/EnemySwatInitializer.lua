EnemySwatInitializer = {}

EnemyInitializer = EnemyInitializer or require("scripts.EnemyInitializer")
SwatShootCommand = SwatShootCommand or require("scripts.SwatShootCommand")

function EnemySwatInitializer.initialize()
  local swatSprite = EnemyInitializer.initialize("swat")
  
  local swatShootTimer = timer.performWithDelay(500, SwatShootCommand.execute, 1)
  
  swatShootTimer.params = {
    swatSprite=swatSprite
  }
end

return EnemySwatInitializer