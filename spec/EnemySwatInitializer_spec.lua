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
    stub(timer, "cancel")
    
    SwatShootCommand = {
      execute = function()end
    }
    
    SwatShootTimerRepository = {
      getAll = function()
        return {}
      end
    }
    stub(SwatShootTimerRepository, "insert")
    spy.on(SwatShootTimerRepository, "getAll")
    
    
    
    FloorRoller = {
      roll = function()end
    }
    
    EnemyRoller = {
      roll = function()end
    }

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
  
  it("should insert timer to repository", function()
    EnemySwatInitializer.initialize()
    
    assert.stub(SwatShootTimerRepository.insert).was_called_with(fakeSwatTimer)
  end)
end)