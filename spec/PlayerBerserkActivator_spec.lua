describe("PlayerBerserkActivator", function()
    
    local fakePlayerSprite = {}
    
    setup(function()
      PlayerRepository = {
        getPlayerSprite = function()
          return fakePlayerSprite
        end
      }
      spy.on(PlayerRepository, "getPlayerSprite")
      
      GameRule = {
        speed = 0
      }

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
    
    it("should create attack rectangle", function()
      PlayerBerserkActivator.activate()
      
      assert.stub(AttackRectInitializer.initialize).was_called_with(fakePlayerSprite)
    end)
    
    it("should multiple game speed by 2", function()
      GameRule.speed = 8
      
      PlayerBerserkActivator.activate()
      
      assert.are.equal(GameRule.speed, 16)
    end)
end)