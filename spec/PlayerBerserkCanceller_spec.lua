describe("PlayerBerserkCanceller", function()
  local PlayerBerserkCanceller
  
  
  setup(function()
    
    GameRule = {
      speed=0
    }
    
    PlayerWalkCommand = {}
    stub(PlayerWalkCommand, "execute")
    
    PlayerBerserkCanceller = require("scripts.PlayerBerserkCanceller")
  end)
  
  before_each(function()
    AttackRect = {}
    stub(AttackRect, "removeSelf")
  end)
  
  it("should set player state back to walking", function()
    PlayerBerserkCanceller.cancel()
    
    assert.stub(PlayerWalkCommand.execute).was_called()
  end)
  
  it("should set game speed back to previous speed", function()
    GameRule.speed = 16
    
    PlayerBerserkCanceller.cancel()
    
    assert.are.equal(GameRule.speed, 8)
  end)
end)