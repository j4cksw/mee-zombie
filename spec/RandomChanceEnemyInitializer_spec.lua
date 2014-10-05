describe("RandomChanceEnemyInitializer", function()
  local RandomChanceEnemyInitializer

  local randomResult = -1

  setup(function()
    math = {
      random = function()
        return randomResult
      end
    }
    spy.on(math, "random")

    RandomPickEnemyInitializer = {}
    stub(RandomPickEnemyInitializer, "initialize")

    RandomChanceEnemyInitializer = require("scripts.RandomChanceEnemyInitializer")

  end)
  it("should random number 0 - 100", function()
      RandomChanceEnemyInitializer.initialize()

      assert.stub(math.random).was_called_with(0, 100)
  end)

  it("should create enemy sprite if random result lower or equal to 30", function()
    randomResult = 0

    RandomChanceEnemyInitializer.initialize()

    assert.stub(RandomPickEnemyInitializer.initialize).was_called()
  end)

  it("should not create enemy sprite if random result greaterthan 30", function()
    randomResult = 31
    stub(RandomPickEnemyInitializer, "initialize")

    RandomChanceEnemyInitializer.initialize()

    assert.stub(RandomPickEnemyInitializer.initialize).was_not_called()
  end)
end)
