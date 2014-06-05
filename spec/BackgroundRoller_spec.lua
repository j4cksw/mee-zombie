describe("BackgroundRoller", function()
  local BackgroundRoller
  
  
  setup(function()
    BackgroundRepository = {}
    stub(BackgroundRepository, "getBackgroundGroup")
    
    BackgroundRoller = require("scripts.BackgroundRoller")
  end)
  
  it("should get background from BackgroundRepository", function()
    BackgroundRoller.roll()
    
    assert.stub(BackgroundRepository.getBackgroundGroup).was_called()
  end)
  
  it("should move background sprite with constant speed", function()
    BackgroundRoller.roll()
    
    assert.are.equal(fakeBackgroundSprite.x, -8)
  end)
end)