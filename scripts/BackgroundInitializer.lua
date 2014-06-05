BackgroundInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
GameInitializeData = GameInitializeData or require("config.GameInitializer")

function BackgroundInitializer.initialize()
  SpriteInitializer.initializeByData(GameInitializeData["background"])
end

return BackgroundInitializer