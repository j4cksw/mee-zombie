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

  it("should create enemy group")
  
  it("should insert enemy into group")
end)