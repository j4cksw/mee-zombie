local PlayerAttackEndedListener = {}

PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
PlayerWalkCommand = PlayerWalkCommand or require("scripts.PlayerWalkCommand")
physics = physics or require("physics")

function PlayerAttackEndedListener.actionPerformed(event)

  if event.phase ~= "ended" then
    return
  end

  local playerSprite = PlayerRepository.getPlayerSprite()
  playerSprite:removeEventListener("sprite", PlayerAttackEndedListener.actionPerformed)

  --physics.removeBody(event.target.slash)
  event.target.slash:removeSelf()
  
  PlayerWalkCommand.execute()
end

return PlayerAttackEndedListener