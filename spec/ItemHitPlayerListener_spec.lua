describe("ItemHitPlayerListener", function()

    local ItemHitPlayerListener

    local fakeItemSprite = {}
    stub(fakeItemSprite, "removeSelf")

    local event = {
      target = fakeItemSprite,
      other = {
        type = "player"
      }
    }

    before_each(function()
      _G.PlayerBerserkActivator = {}
      stub(PlayerBerserkActivator, "activate")

      _G.PlayerBerserkCanceller = {}
      stub(PlayerBerserkCanceller, "cancel")

      _G.timer = {
          performWithDelay = function()end
      }
      stub(timer, "performWithDelay")

      ItemHitPlayerListener = require("scripts.ItemHitPlayerListener")
    end)

    it("should remove itself when hit the player", function()
      ItemHitPlayerListener.actionPerformed(event)

      assert.stub(fakeItemSprite.removeSelf).was_called_with(fakeItemSprite)
    end)

  it("should start timer for cancel berserk", function()
    ItemHitPlayerListener.actionPerformed(event)

    assert.stub(timer.performWithDelay).was_called_with(1000, PlayerBerserkCanceller.cancel)
  end)
end)
