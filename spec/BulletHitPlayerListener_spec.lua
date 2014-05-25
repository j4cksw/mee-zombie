describe("BulletHitPlayerListener", function()
  local BulletHitPlayerListener

  local fakeTargetBulletSprite = {}

  local event = {
    other = {
      type = "player"
    },
    target = fakeTargetBulletSprite
  }
  
  setup(function()
    stub(fakeTargetBulletSprite, "removeSelf")
    
    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")

    BulletHitPlayerListener = require("scripts.BulletHitPlayerListener")
  end)

  it("should remove bullet itself when hit player", function()
    BulletHitPlayerListener.actionPerformed(event)

    assert.stub(fakeTargetBulletSprite.removeSelf).was_called_with(fakeTargetBulletSprite)
  end)
  
  it("player should dead", function()
    BulletHitPlayerListener.actionPerformed(event)
    
    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(event.other, "dead")
  end)
end)