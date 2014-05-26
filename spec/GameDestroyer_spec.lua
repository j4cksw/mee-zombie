describe("GameDestroyer", function()
  it("should remove enemies", function()
    local fakeEnemyGroup = {}
    stub(fakeEnemyGroup, "removeSelf")
    
    EnemyRepository = {
      getEnemyGroup = function()
        return fakeEnemyGroup
      end
    }
    spy.on(EnemyRepository, "getEnemyGroup")
    
    GameDestroyer = require("scripts.GameDestroyer")
    
    GameDestroyer.destroy()
    
    assert.stub(fakeEnemyGroup.removeSelf).was_called_with(fakeEnemyGroup)
  end)
  
  it("should remove floor")
end)