describe("GameUIInitializer", function()
  local GameUIInitializer

  setup(function()
    _G.SpriteInitializer = {}
    stub(SpriteInitializer, "initializeByData")

    _G.GameInitializeData = {
        ["rave_level"] = {
            name="rave_level",
            x=500,
            y=48,
            sequence="rave_level_1"
        }
    }

    _G.ScoreInitializer = {}
    stub(ScoreInitializer, "initialize")

    GameUIInitializer = require("scripts.GameUIInitializer")
  end)

  it("should create rave level sprite", function()
    GameUIInitializer.initialize()

    assert.stub(SpriteInitializer.initializeByData).was_called_with(GameInitializeData["rave_level"])
  end)

  it("should create score", function()
    GameUIInitializer.initialize()

    assert.stub(ScoreInitializer.initialize).was_called()
  end)
end)
