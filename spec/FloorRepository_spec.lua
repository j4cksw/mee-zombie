describe("FloorRepository", function()
  local FloorRepository
  
  local fakeFloorGroup = {}
  
  setup(function()
    FloorRepository = require("scripts.FloorRepository")
  end)
  
  it("should return FloorGroup when call getFloorGroup", function()
    FloorRepository.setFloorGroup(fakeFloorGroup)
    
    local floorGroup = FloorRepository.getFloorGroup()
    
    assert.are.equal(floorGroup, fakeFloorGroup)
  end)
end)