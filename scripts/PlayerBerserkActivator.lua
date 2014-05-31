PlayerBerserkActivator = {}

PlayerRepositry = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
AttackRectInitializer = AttackRectInitializer or require("scripts.AttackRectInitializer")

function PlayerBerserkActivator.activate()
  local playerSprite = PlayerRepositry.getPlayerSprite()
  SpriteSequenceTransition.toSequence(playerSprite, "berserk")  
  AttackRectInitializer.initialize(playerSprite)
end

return PlayerBerserkActivator