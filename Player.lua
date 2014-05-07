Player = {
  new = function()
    local playerImageSheet = display.newImageSheet("img/player.png")
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