BulletHitPlayerListener = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
PlayerDeadAnimateEndedListener = PlayerDeadAnimateEndedListener or require("scripts.PlayerDeadAnimateEndedListener")
AudioRepository = AudioRepository or require("scripts.AudioRepository")

function BulletHitPlayerListener.actionPerformed(event)
  if event.other.type == "player" then
    event.target:removeSelf()

    SpriteSequenceTransition.toSequence(event.other, "dead")
    event.other:addEventListener("sprite", PlayerDeadAnimateEndedListener.actionPerformed)
    timer.performWithDelay(0, function()
      physics.removeBody(event.other)
    end)
    Runtime:removeEventListener("tap", PlayerAttackCommand.execute)

    audio.play(AudioRepository.get("killed_sfx"))

  elseif event.other.type == "slash" then
    event.target:removeSelf()
  end
end

return BulletHitPlayerListener
