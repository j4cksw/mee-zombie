describe("ItemHitPlayerListener", function()

    local fakeItemSprite = {}
    stub(fakeItemSprite, "removeSelf")

    local event = {
      target = fakeItemSprite,
      other = {
        type = "player"
      }
    }

    setup(function()
      PlayerBerserkActivator = {}
      stub(PlayerBerserkActivator, "activate")
      
      PlayerBerserkCanceller = {}
      stub(PlayerBerserkCanceller, "cancel")

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