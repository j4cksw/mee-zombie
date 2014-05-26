describe("GameDestroyer", function()
  local fakeEnemyGroup = {}
  local fakeFloorGroup = {}
  
  setup(function()
    stub(fakeEnemyGroup, "removeSelf")
    
    EnemyRepository = {
      getEnemyGroup = function()
        return fakeEnemyGroup
      end
    }
    spy.on(EnemyRepository, "getEnemyGroup")
    
    stub(fakeFloorGroup, "removeSelf")
    
    FloorRepository = {
      getFloorGroup = function()
      return fakeFloorGroup
      end
    }
    spy.on(FloorRepository, "getFloorGroup")
    
    GameDestroyer = require("scripts.GameDestroyer")
  end)
  
  it("should remove enemies", function()
    GameDestroyer.destroy()
    
    assert.stub(fakeEnemyGroup.removeSelf).was_called_with(fakeEnemyGroup)
  end)
  
  it("should remove floor", function()
     GameDestroyer.destroy()
    
    assert.stub(fakeFloorGroup.removeSelf).was_called_with(fakeFloorGroup)
  end)
end)