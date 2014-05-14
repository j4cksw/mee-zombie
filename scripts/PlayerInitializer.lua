local PlayerInitializer = {}

SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")

local PLAYER_SPRITE = "bear_zombie"

function PlayerInitializer.initialize()
  SpriteFactory.createFromImageSheet(ImageSheetsTable[PLAYER_SPRITE],
    SpriteSequenceData[PLAYER_SPRITE])
end

return PlayerInitializer