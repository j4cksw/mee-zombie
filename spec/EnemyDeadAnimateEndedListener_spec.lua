describe("EnemyDeadAnimateEndedListener", function()
  local EnemyDeadAnimateEndedListener
  
  setup(function()
    EnemyDeadAnimateEndedListener = require("scripts.EnemyDeadAnimateEndedListener")
  end)
  
  it("should remove itself when sprite has ended", function()
    local event = {
      target = {},
      phase = "ended"
    }
    stub(event.target, "removeSelf")
    
    EnemyDeadAnimateEndedListener.actionPerformed(event)
    
    assert.stub(event.target.removeSelf).was_called()
  end)
end)