BulletHitPlayerListener = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
PlayerDeadAnimateEndedListener = PlayerDeadAnimateEndedListener or require("scripts.PlayerDeadAnimateEndedListener")

function BulletHitPlayerListener.actionPerformed(event)
  if event.other.type == "player" then
    event.target:removeSelf()

    SpriteSequenceTransition.toSequence(event.other, "dead")
    event.other:addEventListener("sprite", PlayerDeadAnimateEndedListener.actionPerformed)
  elseif event.other.type == "slash" then
    event.target:removeSelf()
  end
end

return BulletHitPlayerListener