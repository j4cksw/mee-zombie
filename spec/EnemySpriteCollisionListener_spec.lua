describe("EnemySpriteCollisionListener", function()
  local EnemySpriteCollisionListener

  local event = {
    target = {},
    other = {
      type="slash"
    }
  }

  local fakeKilledSFX = {}

  setup(function()
    _G.SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")

    stub(event.target, "addEventListener")

    _G.EnemyDeadAnimateEndedListener = {
      actionPerformed = function()end
    }

    _G.timer = {}
    stub(timer, "cancel")
    stub(timer, "performWithDelay")

    _G.ItemInitializer = {}
    stub(ItemInitializer, "initialize")

    _G.CurrentScore = 0
    _G.ScoreText = {}

    _G.ScoreUpdater = {
        update = function()end
    }

    _G.AudioRepository = {
        get = function()
            return fakeKilledSFX
        end
    }
    spy.on(AudioRepository, "get")

    _G.audio = {}
    stub(audio, "play")

    EnemySpriteCollisionListener = require("scripts.EnemySpriteCollisionListener")
  end)

  it("should change sequence of target to dead if other is player", function()
    EnemySpriteCollisionListener.actionPerformed(event)

    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(event.target, "dead")
    assert.stub(audio.play).was_called_with(fakeKilledSFX)
  end)

  it("should cancel the timer if it was attached to sprite", function()
    event.target.shootTimer = {}

    EnemySpriteCollisionListener.actionPerformed(event)

    assert.stub(timer.cancel).was_called_with(event.target.shootTimer)
  end)

  it("should add dead animate ended event listener to target", function()
    EnemySpriteCollisionListener.actionPerformed(event)

    assert.stub(event.target.addEventListener).was_called_with(event.target, "sprite", EnemyDeadAnimateEndedListener.actionPerformed)
  end)

  it("should update score", function()
    stub(ScoreUpdater, "update")

    EnemySpriteCollisionListener.actionPerformed(event)

    assert.stub(ScoreUpdater.update).was_called()
  end)

  it("should play killed sound", function()
      EnemySpriteCollisionListener.actionPerformed(event)

      assert.stub(AudioRepository.get).was_called_with("killed_sfx")
  end)
end)
