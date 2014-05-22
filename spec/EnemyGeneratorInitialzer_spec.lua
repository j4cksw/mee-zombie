describe("EnemyGenerateTimerInitializer", function()
  local EnemyGenerateTimerInitializer
  local fakeEnemyGroup = {}

  setup(function()
    timer = {}
    stub(timer, "performWithDelay")

    EnemyInitializer = {
      initialize = function()end
    }

    display = {
      newGroup = function()
        return fakeEnemyGroup
      end
    }
    spy.on(display, "newGroup")
    
    EnemyRepository = {}
    stub(EnemyRepository, "setEnemyGroup")

    EnemyGenerateTimerInitializer = require("scripts.EnemyGenerateTimerInitializer")
  end)

  it("should start timer for generating enemies", function()
    EnemyGenerateTimerInitializer.initialize()

    assert.stub(timer.performWithDelay).was_called_with(1000, EnemyInitializer.initialize, 0)
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