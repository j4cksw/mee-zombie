describe("GameUIInitializer", function()
  local GameUIInitializer

  setup(function()
    display = {}
    stub(display, "newText")
    
    SpriteInitializer = {}
    stub(SpriteInitializer, "initializeByData")

    GameUIInitializer = require("scripts.GameUIInitializer")
  end)

  it("should create rave level sprite", function()
    GameUIInitializer.initialize()
    
    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="rave_level",
      x=-500,
      y=48,
      sequence="rave_level_1"
    })
  end)

  it("should create score", function()
    GameUIInitializer.initialize()

    assert.stub(display.newText).was_called_with("0", -500, 48, "boon-500", 72)
  end)
end)