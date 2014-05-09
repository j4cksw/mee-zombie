graphics = graphics or require("graphics")
PlayerImageSheetConfig = PlayerImageSheetConfig or require("config.PlayerImageSheetConfig")
PlayerSpriteSequenceData = PlayerSpriteSequenceData or require("config.PlayerSpriteSequenceData")

Player = {}

function Player:new()

  local playerImageSheet = graphics.newImageSheet(PlayerImageSheetConfig.path,
    PlayerImageSheetConfig.options)

  local playerSprite = display.newSprite(playerImageSheet,
    PlayerSpriteSequenceData)

  local self = {
    playerSprite = playerSprite
  }

  function self:setPosition(x, y)
    self.playerSprite.x = x
    self.playerSprite.y = y
  end

  function self:walk()
    self.playerSprite:setSequence("walk")
    self.playerSprite:play()
  end
  
  function self:run()
    self.playerSprite:setSequence("run")
    self.playerSprite:play()
  end
  return self
end

return Player