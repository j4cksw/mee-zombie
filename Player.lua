graphics = graphics or require("graphics")
PlayerImageSheetConfig = PlayerImageSheetConfig or require("config.PlayerImageSheetConfig")
PlayerSpriteSequenceData = PlayerSpriteSequenceData or require("config.PlayerSpriteSequenceData")

Player = {
  new = function()
    local playerImageSheet = graphics.newImageSheet(PlayerImageSheetConfig.path, 
      PlayerImageSheetConfig.options)
      
    local playerSprite = display.newSprite(playerImageSheet,
      PlayerSpriteSequenceData)
      
    return playerSprite
  end
}

return Player