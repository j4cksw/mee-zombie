local PlayerAttackEndedListener = {}

PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")

function PlayerAttackEndedListener.actionPerformed(event)
  local playerSprite = PlayerRepository.getPlayerSprite()
  playerSprite:removeEventListener("sprite", PlayerAttackEndedListener.actionPerformed)
end

return PlayerAttackEndedListener