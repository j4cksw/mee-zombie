PlayerDeadAnimateEndedListener = {}

GameDestroyer = GameDestroyer or require("scripts.GameDestroyer")
storyboard = storyboard or require("storyboard")

function PlayerDeadAnimateEndedListener.actionPerformed(event)
  if event.phase == "ended" then
    event.target:removeSelf()
    GameDestroyer.destroy()
    --storyboard.reloadScene()
  end
end

return PlayerDeadAnimateEndedListener