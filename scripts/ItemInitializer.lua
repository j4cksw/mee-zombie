ItemInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
ItemRepository = ItemRepository or require("scripts.ItemRepository")

function ItemInitializer.initialize(sourceSprite)
  local itemSprite = SpriteInitializer.initializeByData({
    name="item",
    x=sourceSprite.x,
    y=sourceSprite.y-250,
    sequence="item"
  })
  
  ItemRepository.insert(itemSprite)
end

return ItemInitializer