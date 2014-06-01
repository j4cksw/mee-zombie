describe("FloorGapRemoveCommand", function()

  local FloorGapRemoveCommand
  
  setup(function()
    FloorRepository = {}
    stub(FloorRepository, "getFloorGroup")
    
    FloorGapRemoveCommand = require("scripts.FloorGapRemoveCommand")
  end)
  
  it("should get floor group from repository", function()
    FloorGapRemoveCommand.execute()
    
    assert.stub(FloorRepository.getFloorGroup).was_called()
  end)
  
  it("should move lacked floor piece to close to previous piece when gap detected", function()
    

    local floor = {
      { { x = 10, width=20} },
      { { x = 35, width=20} }
    }

    FloorGapRemoveCommand.execute()

    assert.are.equal(floor, {
      { { x = 10, width=20} },
      { { x = 30, width=20} }
    })

  end)
end)