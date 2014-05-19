describe("FloorChunkSlipDetector", function()
  local FloorChunkSlipDetector
  
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
    FloorChunkSlipDetector = require("scripts.FloorChunkSlipDetector")
  end)
  
  
  it("should remove the group when slip from screen", function()
    setupFloorData()
    
    local firstChunkBefore = Floor[1]
    
    FloorChunkSlipDetector.detect()
    
    assert.are_not.equal(firstChunkBefore, Floor[1])
  end)
  
  it("should add new chunk to floor")
  
  
end)