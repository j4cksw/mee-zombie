describe("PlayerAttackCommand", function()
  local PlayerAttackCommand
  
  setup(function()
    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")
    
    PlayerAttackCommand = require("scripts.PlayerAttackCommand")
  end)
  
  it("should change player sequence to 'attack'", function()
    PlayerAttackCommand.execute()
    
    assert.stub(SpriteSequenceTransition.toSequence).was_called_with("attack")
  end)
  
  it("should add sprite event listener to player sprite")
end)