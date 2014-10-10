describe("EnemyGenerateTimerInitializer", function()
  local EnemyGenerateTimerInitializer
  local fakeEnemyGroup = {}

  before_each(function()
    timer = {}
    stub(timer, "performWithDelay")

    _G.RandomChanceEnemyInitializer = {
      initialize = function()end
    }

    _G.display = {
      newGroup = function()
        return fakeEnemyGroup
      end
    }
    spy.on(display, "newGroup")

    _G.EnemyRepository = {}
    stub(EnemyRepository, "setEnemyGroup")

    EnemyGenerateTimerInitializer = require("scripts.EnemyGenerateTimerInitializer")
  end)

  it("should start timer for generating enemies", function()
    EnemyGenerateTimerInitializer.initialize()

    assert.stub(timer.performWithDelay).was_called_with(1000, RandomChanceEnemyInitializer.initialize, 0)
  end)

  it("should create enemy group", function()
    EnemyGenerateTimerInitializer.initialize()

    assert.stub(display.newGroup).was_called()
  end)

  it("should set enemy group to EnemyRepository", function()
    EnemyGenerateTimerInitializer.initialize()

    assert.stub(EnemyRepository.setEnemyGroup).was_called_with(fakeEnemyGroup)
  end)
end)
