describe("PlayerBerserkActivator", function()
    
    local fakePlayerSprite = {}
    
    setup(function()
      PlayerRepository = {
        getPlayerSprite = function()
          return fakePlayerSprite
        end
      }
      spy.on(PlayerRepository, "getPlayerSprite")

      PlayerBerserkActivator = require("scripts.PlayerBerserkActivator")
    end)

    it("should get player from PlayerRepository", function()
      PlayerBerserkActivator.activate()

      assert.stub(PlayerRepository.getPlayerSprite).was_called()
    end)

    it("should set player state to berserk", function()
      PlayerBerserkActivator.activate()

      assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakePlayerSprite, "berserk")
    end)
end)