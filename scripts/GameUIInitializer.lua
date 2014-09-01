GameUIInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")
ScoreInitializer = ScoreInitializer or require("scripts.ScoreInitializer")

function GameUIInitializer.initialize()
  RaveLevelSprite = SpriteInitializer.initializeByData(GameInitializeData["rave_level"])
  ScoreInitializer.initialize()
end

return GameUIInitializer
