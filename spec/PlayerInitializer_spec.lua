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

    physics = {}
    stub(physics, "addBody")

    PhysicsData = {
      ["player"] = {
        type="dynamic",
        options = {
          shape = {-42, 118  ,  -142, 120  ,  -142, -93  ,  -42, -97}
        }
      }
    }

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

  it("should add physics body to player sprite", function()
    PlayerInitializer.initialize()

    assert.stub(physics.addBody).was_called_with(fakePlayerSprite, "dynamic", {shape={-42, 118  ,  -142, 120  ,  -142, -93  ,  -42, -97}})
  end)
end)