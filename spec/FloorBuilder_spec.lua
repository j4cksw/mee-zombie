describe("FloorBuilder", function()
  local FloorBuilder
  
  setup(function()
    SpriteInitializer = {}
    stub(SpriteInitializer, "initializeByData")
    
    FloorBuilder = require("scripts.FloorBuilder")
  end)
  
  it("should create the first floor", function()
    FloorBuilder.build()
    
    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="floor",
      x=10,
      y=1364,
      sequence="top"
    })
  end)
  
  it("should create the second floor", function()
    FloorBuilder.build()
    
    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="floor",
      x=10,
      y=1492,
      sequence="body"
    })
  end)
end)