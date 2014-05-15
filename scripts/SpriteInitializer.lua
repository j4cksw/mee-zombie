SpriteInitializer = {}

SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")
SpritePositioner = SpritePositioner or require("scripts.SpritePositioner")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function SpriteInitializer.initializeByData(initializeData)
  local sprite = SpriteFactory.createFromImageSheetName(initializeData.name)
  SpritePositioner.setPosition(sprite, initializeData.x, initializeData.y)
  SpriteSequenceTransition.toSequence(sprite, initializeData.sequence)
  return sprite
end

return SpriteInitializer