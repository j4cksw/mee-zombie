describe("BackgroundInitializer", function()
  local BackgroundInitializer

  it("should create sprite of background", function()
    local gameData = {
      name="background",
      x=500,
      y=600,
      sequence="background"
    }

    GameInitializeData = {
      ["background"] = gameData
    }
    
    local fakeSprite = {}
    
    SpriteInitializer = {
      initializeByData = function()
        return fakeSprite
      end
    }
    spy.on(SpriteInitializer, "initializeByData")

    BackgroundInitializer = require("scripts.BackgroundInitializer")

    BackgroundInitializer.initialize()

    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="background",
      x=500,
      y=600,
      sequence="background"})
  end)
end)