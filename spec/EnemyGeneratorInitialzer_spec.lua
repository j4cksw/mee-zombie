describe("EnemyGenerateTimerInitializer", function()
  it("should start timer for generating enemies", function()
    timer = {}
    stub(timer, "performWithDelay")
    
    EnemyInitializer = {
      initialize = function()end
    }
    
    local EnemyGenerateTimerInitializer = require("scripts.EnemyGenerateTimerInitializer")
    
    EnemyGenerateTimerInitializer.initialize()
    
    assert.stub(timer.performWithDelay).was_called_with(500, EnemyInitializer.initialize, 1)
  end)
  
  it("should create enemy group")
  
  it("should set enemy group to EnemyRepository")
end)