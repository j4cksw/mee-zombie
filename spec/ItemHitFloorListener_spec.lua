describe("ItemHitFloorListener", function()
  it("should stop bouncing of an item", function()

      ItemHitFloorListener = require("scripts.ItemHitFloorListener")

      local fakeTarget = {}
      stub(fakeTarget, "setLinearVelocity")

      local event = {
        target=fakeTarget,
        other = {
          type="floor"
        }
      }

      ItemHitFloorListener.actionPerformed(event)

      assert.stub(fakeTarget.setLinearVelocity).was_called_with(fakeTarget, 0, 0)
  end)
end)