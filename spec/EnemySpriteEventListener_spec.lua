describe("EnemySpriteEventListener", function()
  local EnemySpriteEventListener
  
  setup(function()
    EnemySpriteEventListener = require("scripts.EnemySpriteEventListener")
  end)
  
  it("should change sequence of target to dead if other is player", function()
    EnemySpriteEventListener.actionPerformed(event)
    
    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(event.target, "dead")
  end)
end)