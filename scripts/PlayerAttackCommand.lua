PlayerAttackCommand = {}

PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
InitiateAttackListener = InitiateAttackListener or require("scripts.InitiateAttackListener")
PlayerAttackEndedListener = PlayerAttackEndedListener or require("scripts.PlayerAttackEndedListener")

function PlayerAttackCommand.execute()
  Runtime:removeEventListener("tap", PlayerAttackCommand.execute)
  
  local playerSprite = PlayerRepository.getPlayerSprite()
  SpriteSequenceTransition.toSequence(playerSprite, "attack")
  
  playerSprite:addEventListener("sprite", InitiateAttackListener.actionPerformed)
  playerSprite:addEventListener("sprite", PlayerAttackEndedListener.actionPerformed)
end

return PlayerAttackCommand