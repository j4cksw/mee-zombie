describe("GameRuleInitializer", function()
  it("should create a global GameRule", function()
    GameRuleInitializer = require("scripts.GameRuleInitializer")
    
    GameRuleInitializer.initialize()
    
    assert.are.same(GameRule, { speed = 8})
  end)
end)