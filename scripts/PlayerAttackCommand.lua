local PlayerAttackCommand = {}

PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
PlayerAttackEndedListener = PlayerAttackEndedListener or require("scripts.PlayerAttackEndedListener")

function PlayerAttackCommand.execute()
  local playerSprite = PlayerRepository.getPlayerSprite()
  SpriteSequenceTransition.toSequence(playerSprite, "attack")
  playerSprite:addEventListener("sprite", PlayerAttackEndedListener.actionPerformed)
end

return PlayerAttackCommand