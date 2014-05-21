EnemyDeadAnimateEndedListener = {}

function EnemyDeadAnimateEndedListener.actionPerformed(event)
  if event.phase == "ended" then
    event.target.removeSelf()
  end
end

return EnemyDeadAnimateEndedListener