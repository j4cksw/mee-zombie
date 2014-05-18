describe("FloorBuilder", function()
  local FloorBuilder

  local fakeFloorGroup = {}

  local fakeCreatedFloorChunk = {}

  setup(function()
    
    stub(fakeFloorGroup, "insert")
    
    display = {
      newGroup = function()
        return fakeFloorGroup
      end
    }
    spy.on(display, "newGroup")

    FloorChunkBuilder = {
      buildFromPatternAndVerticalOffset = function()
        return fakeCreatedFloorChunk
      end
    }
    spy.on(FloorChunkBuilder, "buildFromPatternAndVerticalOffset")

    FloorPatterns = {
      {"body", "top"}
    }
    
    FloorRepository = {}
    stub(FloorRepository, "setFloorGroup")

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

  it("should insert created floor chunk into floor group", function()
    FloorBuilder.build()

    assert.stub(fakeFloorGroup.insert).was_called_with(fakeFloorGroup, fakeCreatedFloorChunk)
  end)
  
  it("should set floor group to FloorRepository", function()
    FloorBuilder.build()
    
    assert.stub(FloorRepository.setFloorGroup).was_called_with(fakeFloorGroup)
  end)
end)