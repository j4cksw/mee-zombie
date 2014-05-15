local FloorInitializer = {}

SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")
SpritePositioner = SpritePositioner or require("scripts.SpritePositioner")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function FloorInitializer.initialize()
  local floorSprite = SpriteFactory.createFromImageSheetName("floor")
  SpritePositioner.setPosition(floorSprite, 10, 1364)
  SpriteSequenceTransition.toSequence(floorSprite, "top")
end

return FloorInitializer