local GameInitializer = {}

ImageSheetFactory = ImageSheetFactory or require("scripts.ImageSheetFactory")
SpriteFactory = SpriteFactory or require("scripts.SpriteFactory")
PlayerImageSheetConfig = PlayerImageSheetConfig or require("config.PlayerImageSheetConfig")
PlayerSpriteSequenceData = PlayerSpriteSequenceData or require("config.PlayerSpriteSequenceData")
SpritePositioner = SpritePositioner or require("scripts.SpritePositioner")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function GameInitializer.initialize()
  local playerImageSheet = ImageSheetFactory.createFromImageSheetData(PlayerImageSheetConfig)
  local playerSprite = SpriteFactory.createFromImageSheet(playerImageSheet, PlayerSpriteSequenceData)
  SpritePositioner.setPosition(playerSprite, display.contentCenterX, display.contentCenterY)
  SpriteSequenceTransition.toSequence(playerSprite, "walk")
  
  ImageSheetFactory.createFromImageSheetData("img/sprite/floor.png", {
    width=128,
    height=128,
    numFrames=2
  })
end

return GameInitializer