GameUIInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")

function GameUIInitializer.initialize()
  SpriteInitializer.initializeByData({
      name="rave_level",
      x=-192,
      y=148,
      sequence="rave_level_5"
    })
  CurrentScore = 0
  ScoreText = display.newText(CurrentScore, -300, 128, "Bookshelf", 72)
end

return GameUIInitializer