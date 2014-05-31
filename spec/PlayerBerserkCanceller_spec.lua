describe("PlayerBerserkCanceller", function()
  local PlayerBerserkCanceller
  
  local fakePlayerSprite = {}
  
  setup(function()
    
    GameRule = {
      speed=0
    }
    
    AttackRect = {}
    stub(AttackRect, "removeSelf")
    
    PlayerRepository = {
      getPlayerSprite = function()
        return fakePlayerSprite
      end
    }
    spy.on(PlayerRepository, "getPlayerSprite")
    
    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")
    
    PlayerBerserkCanceller = require("scripts.PlayerBerserkCanceller")
  end)

  it("should remove attack rectangle", function()
    PlayerBerserkCanceller.cancel()
    
    assert.stub(AttackRect.removeSelf).was_called_with(AttackRect)
  end)
  
  it("shpuld get player form PlayerRepository", function()
    PlayerBerserkCanceller.cancel()
    
    assert.stub(PlayerRepository.getPlayerSprite).was_called()
  end)
  
  it("should set player state back to walking", function()
    PlayerBerserkCanceller.cancel()
    
    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakePlayerSprite, "walk")
  end)
  
  it("should set game speed back to previous speed", function()
    GameRule.speed = 16
    
    PlayerBerserkCanceller.cancel()
    
    assert.are.equal(GameRule.speed, 8)
  end)
end)