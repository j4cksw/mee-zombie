describe("EnemySwatInitializer", function()
  it("should create enemy sprite with 'swat'", function()
    EnemyInitializer = {
      initialize = function()end
    }
    spy.on(EnemyInitializer, "initialize")
    
    EnemySwatInitializer = require("scripts.EnemySwatInitializer")
    
    EnemySwatInitializer.initialize()
    
    assert.stub(EnemyInitializer.initialize).was_called_with("swat")
  end)
  
  it("set a timer to shoot")
end) 