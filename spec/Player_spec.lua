describe("Player", function()
  Player = require("Player")
  
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