local PlayerInitializer = {}

SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")

function PlayerInitializer.initialize()
  SpriteFactory.createFromImageSheet(ImageSheetsTable["bear_zombie"],
    SpriteSequenceData["bear_zombie"])
end

return PlayerInitializer