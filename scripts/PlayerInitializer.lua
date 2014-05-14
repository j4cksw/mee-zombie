local PlayerInitializer = {}

SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")
SpritePositioner = SpritePositioner or require("scripts.SpritePositioner")

local PLAYER_SPRITE = "bear_zombie"

function PlayerInitializer.initialize()
  local playerSprite = SpriteFactory.createFromImageSheet(ImageSheetsTable[PLAYER_SPRITE],
    SpriteSequenceData[PLAYER_SPRITE])
  SpritePositioner.setPosition(playerSprite,
    display.contentCenterX,
    display.contentCenterY)
end

return PlayerInitializer