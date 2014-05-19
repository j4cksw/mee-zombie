describe("FloorChunkSlipDetector", function()
  local FloorChunkSlipDetector

  local function addSamples(numberOfSamples)
    for i = 1, numberOfSamples do
      table.insert(Floor, {
        {x=10, width=20},
        {x=10, width=20},
        numChildren=2
      })
    end
  end

  local function setupFloorData()
    Floor = {
      numChildren=5
    }
    addSamples(5)
  end


  setup(function()
    FloorRepository = {
      getFloorGroup = function()
        return Floor
      end
    }
    spy.on(FloorRepository, "getFloorGroup")

    FloorChunkSlipDetector = require("scripts.FloorChunkSlipDetector")
  end)

  it("should acquire Floor from FloorRepository", function()
    setupFloorData()
    stub(Floor, "remove")
    
    FloorChunkSlipDetector.detect()

    assert.stub(FloorRepository.getFloorGroup).was_called()
  end)
  
  it("should not remove the group when slip still appear on screen", function()
    setupFloorData()
    Floor[1][1].x = -5
    Floor[1][2].x = -5
    stub(Floor, "remove")

    FloorChunkSlipDetector.detect()

    assert.stub(Floor.remove).was_not_called_with(Floor, 1)
  end)
  
  it("should remove the group when slip from screen", function()
    setupFloorData()
    Floor[1][1].x = -10
    Floor[1][2].x = -10
    stub(Floor, "remove")

    FloorChunkSlipDetector.detect()

    assert.stub(Floor.remove).was_called_with(Floor, 1)
  end)

end)