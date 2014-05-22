describe("RandomPickEnemyInitializer", function()
  it("should random between 1 to 4", function()
    local RandomPickEnemyInitializer = require("scripts.RandomPickEnemyInitializer")
    
    RandomPickEnemyInitializer.initialize()
    
    assert.stub(math.random).was_called_with(1, 4)
  end)
end)