local FloorInitializer = {}

SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")

function FloorInitializer.initialize()
  SpriteFactory.createFromImageSheet(ImageSheetsTable["floor"],
    SpriteSequenceData["floor"])
end

return FloorInitializer