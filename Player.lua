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
    self:changeSpriteSequence("walk")
  end
  
  function self:run()
    self:changeSpriteSequence("run")
  end
  
  function self:changeSpriteSequence(sequenceName)
    self.playerSprite:setSequence(sequenceName)
    self.playerSprite:play()
  end
  return self
end

return Player