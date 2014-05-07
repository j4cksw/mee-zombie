describe("Player", function()
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
  
  local playerImageSheet = {}
  
  display = {
    newImageSheet = function()
      return playerImageSheet
    end
  }
  spy.on(display, "newImageSheet")
  stub(display, "newSprite")
  
  it("should create Player's image sheet.", function()
    Player:new()
    
    assert.stub(display.newImageSheet).was_called_with("img/player.png")
  end)
  
  it("should create Player's sprite.", function()
    Player:new()
    
    assert.stub(display.newSprite)
      .was_called_with(playerImageSheet,
       {
        {name="run",
         start=1,
         count=1,
        }
       })
  end)
  
end)