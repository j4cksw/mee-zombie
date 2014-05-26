PlayerDeadAnimateEndedListener = {}

storyboard = storyboard or require("storyboard")

function PlayerDeadAnimateEndedListener.actionPerformed(event)
  if event.phase == "ended" then
    event.target:removeSelf()
    storyboard.reloadScene()
  end
end

return PlayerDeadAnimateEndedListener