graphics = graphics or require("graphics")
PlayerImageSheetConfig = PlayerImageSheetConfig or require("config.PlayerImageSheetConfig")

Player = {
  new = function()
    local playerImageSheet = graphics.newImageSheet(PlayerImageSheetConfig.path, 
      PlayerImageSheetConfig.options)
      
    local playerSprite = display.newSprite(playerImageSheet, {
      {name="run",
        start=1,
        count=1,
      }
    })
    return playerSprite
  end
}

return Player