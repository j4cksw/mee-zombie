describe("FloorAppender", function()
  local FloorAppender

  local FloorDataGenerator = require("spec.lib.FloorDataGenerator")

  local fakeCreatedFloorChunk = {}

  setup(function()
    _G.FloorRepository = {
      getFloorGroup = function()
        return Floor
      end
    }
    spy.on(FloorRepository, "getFloorGroup")

    _G.FloorChunkBuilder = {
      buildFromPatternAndVerticalOffset = function(...)
        return fakeCreatedFloorChunk
      end
    }
    spy.on(FloorChunkBuilder, "buildFromPatternAndVerticalOffset")

    _G.FloorPatterns = {
      {"body", "top"}
    }

    FloorAppender = require("scripts.FloorAppender")
  end)

  it("should acquire floor group from FloorRepository", function()
    FloorDataGenerator.setupFloorData(5)
    stub(Floor, "insert")

    FloorAppender.append()

    assert.stub(FloorRepository.getFloorGroup).was_called()
  end)

  it("should create new Floor chunk", function()
    FloorDataGenerator.setupFloorData(5)
    stub(Floor, "insert")

    FloorAppender.append()

    assert.stub(FloorChunkBuilder.buildFromPatternAndVerticalOffset).was_called_with({"body", "top"}, 6)
  end)

  it("should append new floor chunk to the floor", function()
    FloorDataGenerator.setupFloorData(5)
    stub(Floor, "insert")

    FloorAppender.append()

    assert.stub(Floor.insert).was_called_with(Floor, fakeCreatedFloorChunk)
  end)
end)
