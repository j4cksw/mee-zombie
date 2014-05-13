local GameInitializer = {}

ImageSheetFactory = ImageSheetFactory or require("scripts.ImageSheetFactory")
SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")
PlayerImageSheetConfig = PlayerImageSheetConfig or require("config.PlayerImageSheetConfig")
PlayerSpriteSequenceData = PlayerImageSheetConfig or require("config.PlayerSpriteSequenceData")
SpritePositioner = SpritePositioner or require("scripts.SpritePositioner")

function GameInitializer.initialize()
  local playerImageSheet = ImageSheetFactory.createFromImageSheetData(PlayerImageSheetConfig)
  local playerSprite = SpriteFactory.createFromImageSheet(playerImageSheet, PlayerSpriteSequenceData)
  SpritePositioner.setPosition(playerSprite, display.contentCenterX, display.contentCenterY)
end

return GameInitializer