local PlayerInitializer = {}

SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")
SpritePositioner = SpritePositioner or require("scripts.SpritePositioner")
SpriteSequenceData = SpriteSequenceData or require("scripts.SpriteSequenceData")

local PLAYER_SPRITE = "bear_zombie"

function PlayerInitializer.initialize()
  local playerSprite = SpriteFactory.createFromImageSheet(ImageSheetsTable[PLAYER_SPRITE],
    SpriteSequenceData[PLAYER_SPRITE])
  
  SpritePositioner.setPosition(playerSprite,
    display.contentCenterX,
    display.contentCenterY)
    
  SpriteSequenceTransition.toSequence(playerSprite, "walk")
end

return PlayerInitializer