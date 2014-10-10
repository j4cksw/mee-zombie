describe("RandomPickEnemyInitializer", function()
  local RandomPickEnemyInitializer
  local fakeRandomResult = -1

  setup(function()
    _G.math = {
      random = function()
        return fakeRandomResult
      end
    }
    spy.on(math, "random")

    _G.EnemyInitializer = {}
    stub(EnemyInitializer, "initialize")

    RandomPickEnemyInitializer = require("scripts.RandomPickEnemyInitializer")
  end)

  it("should random between 1 to 4", function()
    RandomPickEnemyInitializer.initialize()

    assert.stub(math.random).was_called_with(1, 4)
  end)

  local testData = {
    [1] = "enemy1",
    [2] = "enemy2",
    [3] = "enemy3",
    [4] = "enemy4"
  }

  for index, expectedInput in pairs(testData) do
    it("should call EnemyInitializer with combined 'enemy' with random result "..index, function()
      fakeRandomResult = index

      RandomPickEnemyInitializer.initialize()

      assert.stub(EnemyInitializer.initialize).was_called_with(expectedInput)
    end)
  end

end)
