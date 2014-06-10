GameUIInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")

function GameUIInitializer.initialize()
  SpriteInitializer.initializeByData({
      name="rave_level",
      x=-500,
      y=48,
      sequence="rave_level_1"
    })
  display.newText("0", -500, 48, "boon-500", 72)
end

return GameUIInitializer