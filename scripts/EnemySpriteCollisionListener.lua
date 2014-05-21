EnemySpriteCollisionListener = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
EnemyDeadAnimateEndedListener = EnemyDeadAnimateEndedListener or require("scripts.EnemyDeadAnimateEndedListener")

function EnemySpriteCollisionListener.actionPerformed(event)
  if event.other.type == "player" then
    SpriteSequenceTransition.toSequence(event.target, "dead")
    event.target:addEventListener("sprite", EnemyDeadAnimateEndedListener.actionPerformed)
  end
end

return EnemySpriteCollisionListener