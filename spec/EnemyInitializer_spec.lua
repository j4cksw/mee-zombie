describe("EnemyInitializer", function()
  local EnemyInitializer

  local fakeEnemySprite = {}

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

    display = {
      newGroup = function()
        return fakeEnemyGroup
      end
    }
    spy.on(display, "newGroup")

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

  it("should insert enemy into group")

  it("should set group to EnemyRepository")
end)