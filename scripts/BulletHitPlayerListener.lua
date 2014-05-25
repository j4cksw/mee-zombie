BulletHitPlayerListener = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function BulletHitPlayerListener.actionPerformed(event)
  if event.other.type == "player" then
    event.target:removeSelf()
    SpriteSequenceTransition.toSequence(event.other, "dead")
  end
end

return BulletHitPlayerListener