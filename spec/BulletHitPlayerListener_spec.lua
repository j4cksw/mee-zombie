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

  local fakeKilledSfx = {}

  setup(function()
    stub(fakeTargetBulletSprite, "removeSelf")

    _G.SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")

    _G.PlayerDeadAnimateEndedListener = {
      actionPerformed = function()end
    }

    stub(fakePlayerSprite, "addEventListener")

    _G.Runtime = {}
    stub(Runtime, "removeEventListener")

    _G.PlayerAttackCommand = {
      execute = function()end
    }

    _G.timer = {}
    stub(timer, "performWithDelay")

    _G.AudioRepository = {
        get=function()
            return fakeKilledSfx
        end
    }
    spy.on(AudioRepository, "get")

    _G.audio = {}
    stub(audio, "play")

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

  it("should play killed sound", function()
      BulletHitPlayerListener.actionPerformed(event)

      assert.stub(AudioRepository.get).was_called_with("killed_sfx")
      assert.stub(audio.play).was_called_with(fakeKilledSfx)
  end)
end)
