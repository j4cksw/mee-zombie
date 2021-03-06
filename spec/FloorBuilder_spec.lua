describe("FloorBuilder", function()
  local FloorBuilder

  local fakeFloorGroup = {}

  local fakeCreatedFloorChunk = {}

  setup(function()

    stub(fakeFloorGroup, "insert")

    _G.display = {
      newGroup = function()
        return fakeFloorGroup
      end
    }
    spy.on(display, "newGroup")

    _G.FloorRepository = {}
    stub(FloorRepository, "setFloorGroup")

    _G.FloorAppender = {}
    stub(FloorAppender, "append")

    _G.GameInitializeData = {
      ["floor"] = {
        initializeChunks = 18
      }
    }

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
