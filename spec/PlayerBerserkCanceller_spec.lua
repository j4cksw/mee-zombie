describe("PlayerBerserkCanceller", function()
  it("should remove attack rectangle", function()
    AttackRect = {}
    stub(AttackRect, "removeSelf")
    
    PlayerBerserkCanceller = require("scripts.PlayerBerserkCanceller")
    
    PlayerBerserkCanceller.cancel()
    
    assert.stub(AttackRect.removeSelf).was_called_with(AttackRect)
  end)
  
  it("should set player state back to walking")
  
  it("should set game speed back to previous speed")
end)