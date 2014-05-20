describe("PlayerInitializer", function()
  local PlayerInitializer
  
  local fakePlayerSprite = {}
  
  setup(function()
    SpriteInitializer = {
      initializeByData = function()
        return fakePlayerSprite
      end
    }
    spy.on(SpriteInitializer, "initializeByData")

    GameInitializeData = {
      ["bear_zombie"] = {}
    }
    
    PlayerRepository = {}
    stub(PlayerRepository, "setPlayerSprite")

    PlayerInitializer = require("scripts.PlayerInitializer")
  end)

  it("should initialize player", function()
    PlayerInitializer.initialize()

    assert.stub(SpriteInitializer.initializeByData).was_called_with(GameInitializeData["bear_zombie"])
  end)

  it("Should set created playerSprite to PlayerRepository", function()
    PlayerInitializer.initialize()
    
    assert.stub(PlayerRepository.setPlayerSprite).was_called_with(fakePlayerSprite)
  end)
end)