local FloorInitializer = {}

SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")
SpritePositioner = SpritePositioner or require("scripts.SpritePositioner")

function FloorInitializer.initialize()
  local floorSprite = SpriteFactory.createFromImageSheet(ImageSheetsTable["floor"],
    SpriteSequenceData["floor"])
  SpritePositioner.setPosition(floorSprite, 10, 1364)
end

return FloorInitializer