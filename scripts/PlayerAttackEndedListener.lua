local PlayerAttackEndedListener = {}
package.loaded[...] = PlayerAttackEndedListener

PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
PlayerWalkCommand = PlayerWalkCommand or require("scripts.PlayerWalkCommand")
physics = physics or require("physics")

function PlayerAttackEndedListener.actionPerformed(event)

  if event.phase ~= "ended" then
    return
  end

  local playerSprite = PlayerRepository.getPlayerSprite()
  playerSprite:removeEventListener("sprite", PlayerAttackEndedListener.actionPerformed)

  if AttackRect then
    AttackRect:removeSelf()
    AttackRect = nil
  end

  PlayerWalkCommand.execute()
end

return PlayerAttackEndedListener
