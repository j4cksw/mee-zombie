describe("PlayerAttackEndedListener", function()
  local PlayerAttackEndedListener
  
  local event = {
    phase="ended",
    target = {
      slash = {}
    }
  }
  
  local fakePlayerSprite = {}
  
  setup(function()
    PlayerRepository = {
      getPlayerSprite = function()
        return fakePlayerSprite
      end
    }
    spy.on(PlayerRepository, "getPlayerSprite")
    
    stub(fakePlayerSprite, "removeEventListener")
    
    PlayerWalkCommand = {}
    stub(PlayerWalkCommand, "execute")
    
    PlayerAttackEndedListener = require("scripts.PlayerAttackEndedListener")
  end)
  
  before_each(function()
    AttackRect = nil
  end)
  
  it("should acquire player sprite from PlayerRepository", function()
    PlayerAttackEndedListener.actionPerformed(event)
    
    assert.stub(PlayerRepository.getPlayerSprite).was_called()
  end)
  
  it("should remove itself from player sprite event listener", function()
    PlayerAttackEndedListener.actionPerformed(event)
    
    assert.stub(fakePlayerSprite.removeEventListener).was_called_with(fakePlayerSprite, "sprite", PlayerAttackEndedListener.actionPerformed)
  end)
  
  it("should execute PlayerWalkCommand", function()
    PlayerAttackEndedListener.actionPerformed(event)
    
    assert.stub(PlayerWalkCommand.execute).was_called()
  end)
  
end)