describe("FloorBuilder", function()
  local FloorBuilder

  setup(function()
    display = {
      newGroup = function()
      return fakeFloorGroup
      end
    }
    spy.on(display, "newGroup")
    
    FloorChunkBuilder = {}
    stub(FloorChunkBuilder, "buildFromPatternAndVerticalOffset")

    FloorPatterns = {
      {"body", "top"}
    }

    FloorBuilder = require("scripts.FloorBuilder")
  end)
  
  it("should create a floor group", function()
    FloorBuilder.build()
    
    assert.stub(display.newGroup).was_called()
  end)
  
  it("should create floor chunk for 16 times", function()
    FloorBuilder.build()

    for expectedOffset = 1,16 do
      FloorChunkBuilder.buildFromPatternAndVerticalOffset({"body", "top"}, expectedOffset)
    end
  end)
end)