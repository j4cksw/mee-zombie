describe("FloorRoller", function()
  local FloorRoller
  
  local Floor = {
    {{},{}}
  }
  
  setup(function()
    FloorRepositiory = {
      getChunkByIndex = function(index)
        return Floor[1]
      end
    }
    spy.on(FloorRepositiory, "getChunkByIndex")
    
    FloorRoller = require("scripts.FloorRoller")
  end)
  
  it("should acquire floor piece from FloorRepository", function()
    FloorRoller.roll()
    
    assert.stub(FloorRepositiory.getChunkByIndex).was_called_with(1)
  end)
  
  it("should move floor piece -5 pixels", function()
    Floor[1][1].x = 10
    
    FloorRoller.roll()
    
    FloorRepository.get[1][1].x = 5
  end)
  
  it("should remove floor piece when roll out of screen")
  
  it("should add new floor piece")
end)
