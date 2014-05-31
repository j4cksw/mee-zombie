describe("ItemHitPlayerListener", function()
  it("should remove itself when hit the player", function()
  
    local fakeItemSprite = {}
    stub(fakeItemSprite, "removeSelf")
    
    local event = {
      target = fakeItemSprite,
      other = {
        type = "player"
      }
    }
  
    ItemHitPlayerListener = require("scripts.ItemHitPlayerListener")
    
    ItemHitPlayerListener.actionPerformed(event)
    
    assert.stub(fakeItemSprite.removeSelf).was_called_with(fakeItemSprite)
  end)
end)