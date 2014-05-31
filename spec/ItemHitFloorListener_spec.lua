describe("ItemHitFloorListener", function()

    local fakeTarget = {}
    local event = {
      target=fakeTarget,
      other = {
        type="floor"
      }
    }

    setup(function()
      ItemHitFloorListener = require("scripts.ItemHitFloorListener")


      stub(fakeTarget, "setLinearVelocity")
      stub(fakeTarget, "removeEventListener")
    end)

    it("should stop bouncing of an item", function()
      ItemHitFloorListener.actionPerformed(event)

      assert.stub(fakeTarget.setLinearVelocity).was_called_with(fakeTarget, 0, 0)
    end)

    it("should remove itself from sprite collision listener", function()
      ItemHitFloorListener.actionPerformed(event)

      assert.stub(fakeTarget.removeEventListener).was_called_with(fakeTarget, "collision", ItemHitFloorListener.actionPerformed)
    end)
end)