describe("BulletHitPlayerListener", function()
  local BulletHitPlayerListener

  local fakeTargetBulletSprite = {}
  local fakePlayerSprite = {
    type = "player",
  }

  local event = {
    other = fakePlayerSprite,
    target = fakeTargetBulletSprite
  }

  setup(function()
    stub(fakeTargetBulletSprite, "removeSelf")

    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")

    PlayerDeadAnimateEndedListener = {
      actionPerformed = function()end
    }

    stub(fakePlayerSprite, "addEventListener")

    Runtime = {}
    stub(Runtime, "removeEventListener")
    
    PlayerAttackCommand = {
      execute = function()end
    }
    
    timer = {}
    stub(timer, "performWithDelay")
    

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

  it("should add PlayerDeadAnimateEndedListener to player sprite", function()
    BulletHitPlayerListener.actionPerformed(event)

    assert.stub(fakePlayerSprite.addEventListener).was_called_with(fakePlayerSprite,
      "sprite",
      PlayerDeadAnimateEndedListener.actionPerformed)
  end)
end)