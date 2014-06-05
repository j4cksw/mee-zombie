describe("BackgroundInitializer", function()
  local BackgroundInitializer
  
  it("should create sprite of background", function()
    display = {
      contentCenterX = 500,
      contentCenterY = 600
    }
    
    SpriteInitializer = {}
    stub(SpriteInitializer, "initializeByData")
    
    BackgroundInitializer = require("scripts.BackgroundInitializer")
    
    BackgroundInitializer.initialize()
    
    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="background",
      x=500,
      y=600,
      sequence="background"})
  end)
end)