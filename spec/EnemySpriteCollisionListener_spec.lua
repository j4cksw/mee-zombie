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
    
    stub(event.target, "addEventListener")
    
    EnemyDeadAnimateEndedListener = {
      actionPerformed = function()end
    }
    
    EnemySpriteCollisionListener = require("scripts.EnemySpriteCollisionListener")
  end)
  
  it("should change sequence of target to dead if other is player", function()
    EnemySpriteCollisionListener.actionPerformed(event)
    
    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(event.target, "dead")
  end)
  
  it("should add dead animate ended event listener to target", function()
    EnemySpriteCollisionListener.actionPerformed(event)
    
    assert.stub(event.target.addEventListener).was_called_with(event.target, "sprite", EnemyDeadAnimateEndedListener.actionPerformed)
  end)
end)