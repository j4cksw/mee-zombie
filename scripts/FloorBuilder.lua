local FloorBuilder = {}

SpriteInitializer = SpriteInitializer or require("scripts.Spriteinitializer")

function FloorBuilder.build()
  SpriteInitializer.initializeByData({
    name="floor",
    x=10,
    y=1364,
    sequence="top"
  })
end

return FloorBuilder