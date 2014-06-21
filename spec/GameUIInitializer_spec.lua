describe("GameUIInitializer", function()
  local GameUIInitializer

  setup(function()
    display = {}
    stub(display, "newText")
    
    SpriteInitializer = {}
    stub(SpriteInitializer, "initializeByData")

    GameInitializeData = {
        ["rave_level"] = {
            name="rave_level",
            x=500,
            y=48,
            sequence="rave_level_1"
        }
    }

    GameUIInitializer = require("scripts.GameUIInitializer")
  end)

  it("should create rave level sprite", function()
    GameUIInitializer.initialize()
    
    assert.stub(SpriteInitializer.initializeByData).was_called_with(GameInitializeData["rave_level"])
  end)

  it("should create score", function()
    GameUIInitializer.initialize()

    assert.stub(display.newText).was_called_with(CurrentScore, -300, 128, "Bookshelf", 72)
  end)
end)