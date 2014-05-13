local GameInitializer = {}

ImageSheetFactory = ImageSheetFactory or require("scripts.ImageSheetFactory")
SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")
PlayerImageSheetConfig = PlayerImageSheetConfig or require("config.PlayerImageSheetConfig")
PlayerSpriteSequenceData = PlayerImageSheetConfig or require("config.PlayerSpriteSequenceData")

function GameInitializer.initialize()
  local playerImageSheet = ImageSheetFactory.createFromImageSheetData(PlayerImageSheetConfig)
  local playerSprite = SpriteFactory.createFromImageSheet(playerImageSheet, PlayerSpriteSequenceData)
end

return GameInitializer