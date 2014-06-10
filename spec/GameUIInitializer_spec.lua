describe("GameUIInitializer", function()
  local GameUIInitializer
  
  it("should create score", function()
    display = {}
    stub(display, "newText")
    
    GameUIInitializer = require("scripts.GameUIInitializer")
    
    GameUIInitializer.initialize()
    
    assert.stub(display.newText).was_called_with("0", -500, 48, "boon-500", 72)
  end)
end)