describe("PlayerDeadAnimateEndedListener", function()
  local PlayerDeadAnimateEndedListener

  before_each(function()
    _G.GameDestroyer = {}
    stub(GameDestroyer, "destroy")

    _G.storyboard = {}
    stub(storyboard, "reloadScene")

    PlayerDeadAnimateEndedListener = require("scripts.PlayerDeadAnimateEndedListener")
  end)

  it("should remove itself when sprite has ended", function()
    local event = {
      target = {},
      phase = "ended"
    }
    stub(event.target, "removeSelf")

    PlayerDeadAnimateEndedListener.actionPerformed(event)

    assert.stub(event.target.removeSelf).was_called_with(event.target)
  end)
end)
