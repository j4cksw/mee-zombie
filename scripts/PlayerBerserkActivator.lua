PlayerBerserkActivator = {}

PlayerRepositry = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function PlayerBerserkActivator.activate()
  local playerSprite = PlayerRepositry.getPlayerSprite()
  SpriteSequenceTransition.toSequence(playerSprite, "berserk")  
end

return PlayerBerserkActivator