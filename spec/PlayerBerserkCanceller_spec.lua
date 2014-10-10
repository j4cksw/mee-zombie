describe("PlayerBerserkCanceller", function()
  local PlayerBerserkCanceller


  before_each(function()
    _G.GameRule = {
      speed=0
    }

    _G.PlayerWalkCommand = {}
    stub(PlayerWalkCommand, "execute")

    _G.AttackRect = {}
    stub(AttackRect, "removeSelf")

    PlayerBerserkCanceller = require("scripts.PlayerBerserkCanceller")
  end)

  it("should set player state back to walking", function()
    PlayerBerserkCanceller.cancel()

    assert.stub(PlayerWalkCommand.execute).was_called()
  end)

  it("should set game speed back to previous speed", function()
    GameRule.speed = 16

    PlayerBerserkCanceller.cancel()

    assert.are.equal(GameRule.speed, 8)
  end)
end)
