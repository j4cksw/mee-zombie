local PlayerAttackEndedListener = {}

PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
PlaterAttackCommand = PlayerAttackCommand or require("scripts.PlayerAttackCommand")

function PlayerAttackEndedListener.actionPerformed(event)

  if event.phase ~= "ended" then
    return
  end

  local playerSprite = PlayerRepository.getPlayerSprite()
  playerSprite:removeEventListener("sprite", PlayerAttackEndedListener.actionPerformed)

  SpriteSequenceTransition.toSequence(playerSprite, "walk")
  
  Runtime:addEventListener("tap", PlaterAttackCommand.execute)
end

return PlayerAttackEndedListener