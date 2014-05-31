ItemInitializer = {}

SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
ItemRepository = ItemRepository or require("scripts.ItemRepository")
physics = physics or require("physics")
ItemHitFloorListener = ItemHitFloorListener or require("scripts.ItemHitFloorListener")
ItemHitPlayerListener = ItemHitPlayerListener or require("scripts.ItemHitPlayerListener")

function ItemInitializer.initialize(sourceSprite)
  local itemSprite = SpriteInitializer.initializeByData({
    name="item",
    x=sourceSprite.x,
    y=sourceSprite.y-100,
    sequence="item"
  })
  
  ItemRepository.insert(itemSprite)
  
  physics.addBody(itemSprite, "dynamic", {filter={groupIndex=-1}, bounce=0.0, friction=0.0, density=0.0})
  itemSprite:setLinearVelocity(250,-600)
  
  itemSprite:addEventListener("collision", ItemHitFloorListener.actionPerformed)
  itemSprite:addEventListener("collision", ItemHitPlayerListener.actionPerformed)
end

return ItemInitializer