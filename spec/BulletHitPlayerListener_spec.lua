describe("BulletHitPlayerListener", function()
  local BulletHitPlayerListener

  local fakeTargetBulletSprite = {}

  local event = {
    other = {
      type = "player"
    },
    target = fakeTargetBulletSprite
  }

  it("should remove bullet itself when hit player", function()
    stub(fakeTargetBulletSprite, "removeSelf")

    BulletHitPlayerListener = require("scripts.BulletHitPlayerListener")

    BulletHitPlayerListener.actionPerformed(event)

    assert.stub(fakeTargetBulletSprite.removeSelf).was_called()
  end)
end)