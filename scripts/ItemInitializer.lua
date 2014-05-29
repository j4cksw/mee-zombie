ItemInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
ItemRepository = ItemRepository or require("scripts.ItemRepository")
physics = physics or require("physics")

function ItemInitializer.initialize(sourceSprite)
  local itemSprite = SpriteInitializer.initializeByData({
    name="item",
    x=sourceSprite.x,
    y=sourceSprite.y-100,
    sequence="item"
  })
  
  ItemRepository.insert(itemSprite)
  
  physics.addBody(itemSprite, "dynamic")
end

return ItemInitializer