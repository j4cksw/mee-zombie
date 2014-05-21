describe("EnemyInitializer", function()
  local EnemyInitializer

  local fakeEnemySprite = {}
  
  local fakeEnemyGroup = {}
  
  setup(function()
    SpriteInitializer = {
      initializeByData = function(...)
        return fakeEnemySprite
      end
    }
    spy.on(SpriteInitializer, "initializeByData")

    GameInitializeData = {
      ["enemy"] = {name="enemy",
        x=512,
        y=1150,
        sequence="walk"
      }
    }

    physics = {}
    stub(physics, "addBody")

    stub(fakeEnemySprite, "addEventListener")

    EnemySpriteCollisionListener = {
      actionPerformed = function()end
    }
    
    stub(fakeEnemyGroup, "insert")
    
    display = {
      newGroup = function()
        return fakeEnemyGroup
      end
    }
    spy.on(display, "newGroup")
    
    EnemyRepository = {}
    stub(EnemyRepository, "setEnemyGroup")

    EnemyInitializer = require("scripts.EnemyInitializer")
  end)

  it("should create a sprite of enemy", function()
    EnemyInitializer.initialize()

    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="enemy",
      x=512,
      y=1150,
      sequence="walk"})
  end)

  it("should add physics body to an enemy", function()
    EnemyInitializer.initialize()

    assert.stub(physics.addBody).was_called_with(fakeEnemySprite, "dynamic")
  end)

  it("should add collision listener to enemy", function()
    EnemyInitializer.initialize()

    assert.stub(fakeEnemySprite.addEventListener).was_called_with(fakeEnemySprite, "collision", EnemySpriteCollisionListener.actionPerformed)
  end)

  it("should create enemy group", function()
    EnemyInitializer.initialize()

    assert.stub(display.newGroup).was_called()
  end)

  it("should insert enemy into group", function()
    EnemyInitializer.initialize()

    assert.stub(fakeEnemyGroup.insert).was_called_with(fakeEnemyGroup, fakeEnemySprite)
  end)

  it("should set group to EnemyRepository", function()
    EnemyInitializer.initialize()
    
    assert.stub(EnemyRepository.setEnemyGroup).was_called_with(fakeEnemyGroup)
  end)
end)