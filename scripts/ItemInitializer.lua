ItemInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")

function ItemInitializer.initialize(sourceSprite)
  SpriteInitializer.initializeByData({
    name="item",
    x=sourceSprite.x,
    y=sourceSprite.y-250,
    sequence="item"
  })
end

return ItemInitializer