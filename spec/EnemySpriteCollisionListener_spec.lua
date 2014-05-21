describe("EnemySpriteCollisionListener", function()
  local EnemySpriteCollisionListener
  
  local event = {
    target = {},
    other = {
      type="player"
    }
  }
  
  setup(function()
    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")
    
    EnemySpriteCollisionListener = require("scripts.EnemySpriteCollisionListener")
  end)
  
  it("should change sequence of target to dead if other is player", function()
    EnemySpriteCollisionListener.actionPerformed(event)
    
    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(event.target, "dead")
  end)
end)