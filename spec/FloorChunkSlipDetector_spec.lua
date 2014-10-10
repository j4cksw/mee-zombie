describe("FloorChunkSlipDetector", function()
  local FloorChunkSlipDetector

  local FloorDataGenerator = require("spec.lib.FloorDataGenerator")

  setup(function()
    _G.FloorRepository = {
      getFloorGroup = function()
        return Floor
      end
    }
    spy.on(FloorRepository, "getFloorGroup")

    _G.FloorAppender = {}
    stub(FloorAppender, "append")

    FloorChunkSlipDetector = require("scripts.FloorChunkSlipDetector")
  end)

  it("should acquire Floor from FloorRepository", function()
    FloorDataGenerator.setupFloorData(5)
    stub(Floor, "remove")

    FloorChunkSlipDetector.detect()

    assert.stub(FloorRepository.getFloorGroup).was_called()
  end)

  it("should not remove the first chunk when slip still appear on screen", function()
    FloorDataGenerator.setupFloorData(5)
    Floor[1][1].x = -5
    Floor[1][2].x = -5
    stub(Floor, "remove")

    FloorChunkSlipDetector.detect()

    assert.stub(Floor.remove).was_not_called_with(Floor, 1)
  end)

  it("should remove the first chunk when slip from screen", function()
    FloorDataGenerator.setupFloorData(5)
    Floor[1][1].x = -810
    Floor[1][2].x = -810
    stub(Floor, "remove")

    FloorChunkSlipDetector.detect()

    assert.stub(Floor.remove).was_called_with(Floor, 1)
  end)

  it("should append floor when the first chunk slip from screen", function()
    FloorDataGenerator.setupFloorData(5)
    Floor[1][1].x = -810
    Floor[1][2].x = -810
    stub(Floor, "remove")

    FloorChunkSlipDetector.detect()

    assert.stub(FloorAppender.append).was_called()
  end)

end)
