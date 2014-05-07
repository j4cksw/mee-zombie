describe("Player", function()
  
  local playerImageSheet = {}
  
  graphics = {
    newImageSheet = function()
      return playerImageSheet
    end
  }
  spy.on(graphics, "newImageSheet")
  
  display = {}
  stub(display, "newSprite")
  
  Player = require("Player")
  
  it("should create Player's image sheet.", function()
    Player:new()
    
    assert.stub(graphics.newImageSheet).was_called_with("img/player.png")
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