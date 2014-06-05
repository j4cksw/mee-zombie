BackgroundInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
GameInitializeData = GameInitializeData or require("config.GameInitializer")
BackgroundRepository = BackgroundRepository or require("scripts.BackgroundRepository")

function BackgroundInitializer.initialize()
  local backgroundSprite = SpriteInitializer.initializeByData(GameInitializeData["background"])
  
  backgroundSprite.anchorX = 0
  backgroundSprite.anchorY = 0
  backgroundSprite.x = 0
  backgroundSprite.y = 0
  
  BackgroundRepository.insert(backgroundSprite)
end

return BackgroundInitializer