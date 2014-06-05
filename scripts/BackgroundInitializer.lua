BackgroundInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")

function BackgroundInitializer.initialize()
  SpriteInitializer.initializeByData({
    name="background",
    x=500,
    y=600,
    sequence="background"
  })
end

return BackgroundInitializer