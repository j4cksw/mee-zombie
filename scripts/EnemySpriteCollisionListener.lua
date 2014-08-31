EnemySpriteCollisionListener = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
EnemyDeadAnimateEndedListener = EnemyDeadAnimateEndedListener or require("scripts.EnemyDeadAnimateEndedListener")
local itemInitializer = RandomizeItemInitializer or require("scripts.RandomizeItemInitializer")
ScoreUpdater = ScoreUpdater or require("scripts.ScoreUpdater")

function EnemySpriteCollisionListener.actionPerformed(event)
  if event.other.type == "slash" then
    SpriteSequenceTransition.toSequence(event.target, "dead")
    if event.target.shootTimer then
      timer.cancel(event.target.shootTimer)
    end
    event.target:addEventListener("sprite", EnemyDeadAnimateEndedListener.actionPerformed)

    timer.performWithDelay(0, function()
      itemInitializer.initialize(event.target)
    end)

    ScoreUpdater.update()
  end
end

return EnemySpriteCollisionListener
