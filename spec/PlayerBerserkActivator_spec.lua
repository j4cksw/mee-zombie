describe("PlayerBerserkActivator", function()

    it("should get player from PlayerRepository", function()
      PlayerRepository = {}
      stub(PlayerBerserkActivator, "getPlayerSprite")
      
      PlayerBerserkActivator = require("scripts.PlayerBerserkActivator")

      PlayerBerserkActivator.activate()

      assert.stub(PlayerRepository.getPlayerSprite).was_called()
    end)

    it("should set player state to berserk", function()
      PlayerBerserkActivator = require("scripts.PlayerBerserkActivator")

      PlayerBerserkActivator.activate()

      assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakePlayerSprite, "berserk")
    end)
end)