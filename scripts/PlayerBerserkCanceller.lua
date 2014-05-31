PlayerBerserkCanceller = {}
PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function PlayerBerserkCanceller.cancel()
  AttackRect:removeSelf()
  
  local playerSprite = PlayerRepository.getPlayerSprite()
  SpriteSequenceTransition.toSequence(playerSprite, "walk")
end

return PlayerBerserkCanceller