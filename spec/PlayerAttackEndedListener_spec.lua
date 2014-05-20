describe("PlayerAttackEndedListener", function()
  local PlayerAttackEndedListener
  
  local event = {
    phase="ended"
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
    
    PlayerAttackEndedListener = require("scripts.PlayerAttackEndedListener")
  end)
  
  it("should acquire player sprite from PlayerRepository", function()
    PlayerAttackEndedListener.actionPerformed(event)
    
    assert.stub(PlayerRepository.getPlayerSprite).was_called()
  end)
  
  it("should remove itself from player sprite event listener", function()
    PlayerAttackEndedListener.actionPerformed(event)
    
    assert.stub(fakePlayerSprite.removeEventListener).was_called_with(fakePlayerSprite, "sprite", PlayerAttackEndedListener.actionPerformed)
  end)
  
  it("should transit player sequence to walk")
  
  it("should add PlayerAttackCommand back to Runtime tap listener")
end)