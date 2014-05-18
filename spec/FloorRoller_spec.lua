describe("FloorRoller", function()
  local FloorRoller
  
  local Floor 
  
  setup(function()
    FloorRepository = {
      getChunkByIndex = function(index)
        return Floor[index]
      end
    }
    spy.on(FloorRepository, "getChunkByIndex")
    
    FloorRoller = require("scripts.FloorRoller")
  end)
  
  function setupFloorData()
    Floor = {
      {
        {x=10}
      }
    }
  end
  
  it("should acquire floor piece from FloorRepository", function()
    setupFloorData()
    
    FloorRoller.roll()
    
    assert.stub(FloorRepository.getChunkByIndex).was_called_with(1)
  end)
  
  it("should move floor piece -5 pixels", function()
    setupFloorData()
    
    FloorRoller.roll()
    
    assert.are.equal(Floor[1][1].x, 5)
  end)
  
  it("should remove floor piece when roll out of screen")
  
  it("should add new floor piece")
end)
