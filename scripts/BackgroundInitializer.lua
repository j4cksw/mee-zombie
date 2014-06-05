BackgroundInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")

function BackgroundInitializer.initialize()
  SpriteInitializer.initializeByData({
    name="background",
    x=display.contentCenterX,
    y=display.contentCenterY,
    sequence="background"
  })
end

return BackgroundInitializer