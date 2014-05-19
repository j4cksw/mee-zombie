describe("FloorAppender", function()
  local FloorAppender
  
  setup(function()
    FloorAppender = require("scripts.FloorAppender")
  end)
  
  it("should append new floor chunk to the floor", function()
    FloorAppender.append()
    
    assert.stub(Floor.insert).was_called_with(Floor, fakeCreatedFloorChunk)
  end)
end)