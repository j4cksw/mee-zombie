PlayerDeadAnimateEndedListener = {}

function PlayerDeadAnimateEndedListener.actionPerformed(event)
  if event.phase == "ended" then
    event.target:removeSelf()
  end
end

return PlayerDeadAnimateEndedListener