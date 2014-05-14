local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")
PlayerImageSheetConfig = PlayerImageSheetConfig or require("config.PlayerImageSheetConfig")
PlayerSpriteSequenceData = PlayerSpriteSequenceData or require("config.PlayerSpriteSequenceData")
SpritePositioner = SpritePositioner or require("scripts.SpritePositioner")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames({"bear_zombie", "floor"})
  local playerSprite = SpriteFactory.createFromImageSheet(playerImageSheet, PlayerSpriteSequenceData)
  SpritePositioner.setPosition(playerSprite, display.contentCenterX, display.contentCenterY)
  SpriteSequenceTransition.toSequence(playerSprite, "walk")
end

return GameInitializer