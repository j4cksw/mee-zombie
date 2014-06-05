describe("BackgroundInitializer", function()
  local BackgroundInitializer

  local gameData = {
    name="background",
    x=500,
    y=600,
    sequence="background"
  }

  local fakeSprite = {}

  setup(function()
    GameInitializeData = {
      ["background"] = gameData
    }

    SpriteInitializer = {
      initializeByData = function()
        return fakeSprite
      end
    }
    spy.on(SpriteInitializer, "initializeByData")
    
    BackgroundRepository = {}
    stub(BackgroundRepository, "insert")

    BackgroundInitializer = require("scripts.BackgroundInitializer")
  end)

  it("should create sprite of background", function()
    BackgroundInitializer.initialize()

    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="background",
      x=500,
      y=600,
      sequence="background"})
  end)

  it("should insert to background group", function()
    BackgroundInitializer.initialize()

    assert.stub(BackgroundRepository.insert).was_called_with(fakeSprite)
  end)
end)