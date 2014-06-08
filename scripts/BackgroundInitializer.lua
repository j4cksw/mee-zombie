BackgroundInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
GameInitializeData = GameInitializeData or require("config.GameInitializer")
BackgroundRepository = BackgroundRepository or require("scripts.BackgroundRepository")

function BackgroundInitializer.initialize()
  for index, name in pairs({"background", "chairs"}) do
    for i = 1,2 do
      local backgroundSprite = SpriteInitializer.initializeByData(GameInitializeData[name])
      BackgroundRepository.insert(backgroundSprite)
      
      backgroundSprite.x = (backgroundSprite.width/2) + (backgroundSprite.width*(i-1)) - 800
    end
  end
end

return BackgroundInitializer