describe("PlayerAttackCommand", function()
  local PlayerAttackCommand
  
  local fakePlayerSprite = {}
  
  setup(function()
    PlayerRepository = {
      getPlayerSprite = function()
        return fakePlayerSprite
      end
    }
    spy.on(PlayerRepository, "getPlayerSprite")
    
    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")
    
    PlayerAttackCommand = require("scripts.PlayerAttackCommand")
  end)
  
  it("should acquire player from repository", function()
    PlayerAttackCommand.execute()
    
    assert.stub(PlayerRepository.getPlayerSprite).was_called()
  end)
  
  it("should change player sequence to 'attack'", function()
    PlayerAttackCommand.execute()
    
    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakePlayerSprite, "attack")
  end)
  
  it("should add sprite event listener to player sprite")
end)