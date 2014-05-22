describe("RandomChanceEnemyInitializer", function()
  it("should random number 0 - 100", function()
    math = {
      random = function()
        return randomResult
      end
    }
    spy.on(math.random)
    local RandomChanceEnemyInitializer = require("scripts.RandomChanceEnemyInitializer")
    
    RandomChanceEnemyInitializer.initialize()
    
    assert.stub(math.random).was_called_with(0, 100)
  end)
  
  it("should create enemy sprite if random result lower or equal to 30")
  
  it("should not create enemy sprite if random result greaterthan 30")
end)