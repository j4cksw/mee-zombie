EnemySpriteCollisionListener = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
EnemyDeadAnimateEndedListener = EnemyDeadAnimateEndedListener or require("scripts.EnemyDeadAnimateEndedListener")
ItemInitializer = ItemInitializer or require("scripts.ItemInitializer")

function EnemySpriteCollisionListener.actionPerformed(event)
  if event.other.type == "slash" then
    SpriteSequenceTransition.toSequence(event.target, "dead")
    if event.target.shootTimer then
      timer.cancel(event.target.shootTimer)
    end
    event.target:addEventListener("sprite", EnemyDeadAnimateEndedListener.actionPerformed)
    
    ItemInitializer.initialize(event.target)
  end
end

return EnemySpriteCollisionListener