describe("FloorRoller", function()
  local FloorRoller

  local Floor
  
    local function addSamples(numberOfSamples)
    for i = 1, numberOfSamples do
      table.insert(Floor, {
        {x=10},
        {x=10},
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
    
    FloorChunkSlipDetector = {}
    stub(FloorChunkSlipDetector, "detect")

    FloorRoller = require("scripts.FloorRoller")
  end)

  it("should acquire every floor piece from Repository ", function()
    setupFloorData()

    FloorRoller.roll()

    assert.stub(FloorRepository.getFloorGroup).was_called(1)
  end)

  it("should move every floor piece -8 pixels", function()
    setupFloorData()

    FloorRoller.roll()

    for i=1,5 do
      for j=1,2 do
        assert.are.equal(Floor[i][j].x, 2)
      end
    end
  end)

  it("should detect chunk which slip off the screen", function()
    setupFloorData()

    FloorRoller.roll()

    assert.stub(FloorChunkSlipDetector.detect).was_called()
  end)

end)
