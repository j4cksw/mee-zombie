BackgroundInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
GameInitializeData = GameInitializeData or require("config.GameInitializer")
BackgroundRepository = BackgroundRepository or require("scripts.BackgroundRepository")

function BackgroundInitializer.initialize()
  for index, name in pairs({"background", "chairs"}) do
    for i = 1,2 do
      local backgroundSprite = SpriteInitializer.initializeByData(GameInitializeData["background"])

      backgroundSprite.anchorX = 0
      backgroundSprite.anchorY = 0
      backgroundSprite.x = 0 + ((i-1)*backgroundSprite.width)
      backgroundSprite.y = 0

      BackgroundRepository.insert(backgroundSprite)
    end
  end
end

return BackgroundInitializer