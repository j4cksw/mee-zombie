PlayerBerserkActivator = {}

PlayerRepositry = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
AttackRectInitializer = AttackRectInitializer or require("scripts.AttackRectInitializer")
PlayerAttackEndedListener = PlayerAttackEndedListener or require("scripts.PlayerAttackEndedListener")

function PlayerBerserkActivator.activate()
  local playerSprite = PlayerRepositry.getPlayerSprite()

  if playerSprite.sequence == "berserk" then
    return
  end
  
  playerSprite:removeEventListener("sprite", PlayerAttackEndedListener.actionPerformed)
  
  SpriteSequenceTransition.toSequence(playerSprite, "berserk")
  AttackRectInitializer.initialize(playerSprite)

  GameRule.speed = GameRule.speed * 2
end

return PlayerBerserkActivator