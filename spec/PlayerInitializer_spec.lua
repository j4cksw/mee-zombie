describe("PlayerInitializer", function()
  local PlayerInitializer

  setup(function()
    SpriteInitializer = {}
    stub(SpriteInitializer, "initializeByData")

    GameInitializeData = {
      ["bear_zombie"] = {}
    }

    PlayerInitializer = require("scripts.PlayerInitializer")
  end)

  it("should initialize player", function()
    PlayerInitializer.initialize()

    assert.stub(SpriteInitializer.initializeByData).was_called_with(GameInitializeData["bear_zombie"])
  end)

  it("Should set created playerSprite to PlayerRepository", function()end)
end)