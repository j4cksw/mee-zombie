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
    
    FloorRepository = {}
    stub(FloorRepository, "setFloorGroup")
    
    FloorAppender = {}
    stub(FloorAppender, "append")

    FloorBuilder = require("scripts.FloorBuilder")
  end)

  it("should create a floor group", function()
    FloorBuilder.build()

    assert.stub(display.newGroup).was_called()
  end)

  it("should append floor for configured initialize times", function()
    stub(FloorAppender, "append")
    
    FloorBuilder.build()

    assert.stub(FloorAppender.append).was_called(18)
  end)
  
  it("should set floor group to FloorRepository", function()
    FloorBuilder.build()
    
    assert.stub(FloorRepository.setFloorGroup).was_called_with(fakeFloorGroup)
  end)
end)