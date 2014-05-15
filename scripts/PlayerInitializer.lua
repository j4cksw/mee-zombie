local PlayerInitializer = {}

SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")
SpritePositioner = SpritePositioner or require("scripts.SpritePositioner")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
SpriteSequenceData = SpriteSequenceData or require("config.SpriteSequenceData")

local PLAYER_SPRITE = "bear_zombie"

function PlayerInitializer.initialize()
  local playerSprite = SpriteFactory.createFromImageSheetName(PLAYER_SPRITE)
  
  SpritePositioner.setPosition(playerSprite,
    display.contentCenterX,
    display.contentCenterY)
    
  SpriteSequenceTransition.toSequence(playerSprite, "walk")
end

return PlayerInitializer