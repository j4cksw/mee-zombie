GameUIInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")

function GameUIInitializer.initialize()
  SpriteInitializer.initializeByData(GameInitializeData["rave_level"])
  CurrentScore = 0
  ScoreText = display.newText(CurrentScore, -300, 128, "Bookshelf", 72)
end

return GameUIInitializer