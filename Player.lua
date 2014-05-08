graphics = graphics or require("graphics")

Player = {
  new = function()
    local playerImageSheet = graphics.newImageSheet("img/sprite/bz_sprite.png", 
    {
      width=400,
      height=400,
      numFrames=1
    })
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