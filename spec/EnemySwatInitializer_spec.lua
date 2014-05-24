describe("EnemySwatInitializer", function()
  local EnemySwatInitializer
  
  local fakeSwatSprite = {}
  
  local fakeSwatTimer = {}
  
  setup(function()
    EnemyInitializer = {
      initialize = function()
        return fakeSwatSprite
      end
    }
    spy.on(EnemyInitializer, "initialize")
    
    timer = {
      performWithDelay = function()
        return fakeSwatTimer
      end
    }
    spy.on(timer, "performWithDelay")
    
    SwatShootCommand = {
      execute = function()end
    }
    
    SwatTimerTable = {}
    stub(SwatTimerTable, "addEntry")

    EnemySwatInitializer = require("scripts.EnemySwatInitializer")
  end)

  it("should create enemy sprite with 'swat'", function()
    EnemySwatInitializer.initialize()

    assert.stub(EnemyInitializer.initialize).was_called_with("swat")
  end)

  it("should set a timer to shoot", function()
    EnemySwatInitializer.initialize()
    
    assert.stub(timer.performWithDelay).was_called_with(1500, SwatShootCommand.execute, 0)
  end)
  
  it("should set sprite as a parameter of timer", function()
    EnemySwatInitializer.initialize()
    
    assert.are.same(fakeSwatTimer.params, {swatSprite=fakeSwatSprite})
  end)
  
  it("should add timer to SwatTimerTable with swat sprite as a key", function()
    EnemySwatInitializer.initialize()
    
    assert.stub(SwatTimerTable.addEntry).was_called_with(fakeSwatSprite, fakeSwatTimer)
  end)
end)