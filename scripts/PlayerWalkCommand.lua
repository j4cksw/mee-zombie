PlayerWalkCommand = {}

PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
PlaterAttackCommand = PlayerAttackCommand or require("scripts.PlayerAttackCommand")

function PlayerWalkCommand.execute()
  local playerSprite = PlayerRepository.getPlayerSprite()
  SpriteSequenceTransition.toSequence(playerSprite, "walk")
  
  Runtime:addEventListener("tap", PlaterAttackCommand.execute)
end

return PlayerWalkCommand