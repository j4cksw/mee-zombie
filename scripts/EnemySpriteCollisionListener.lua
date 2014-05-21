EnemySpriteCollisionListener = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function EnemySpriteCollisionListener.actionPerformed(event)
  if event.other.type == "player" then
    SpriteSequenceTransition.toSequence(event.target, "dead")
  end
end

return EnemySpriteCollisionListener