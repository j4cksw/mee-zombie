local PlayerAttackEndedListener = {}

PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
function PlayerAttackEndedListener.actionPerformed(event)

  if event.phase ~= "ended" then
    return
  end

  local playerSprite = PlayerRepository.getPlayerSprite()
  playerSprite:removeEventListener("sprite", PlayerAttackEndedListener.actionPerformed)

  SpriteSequenceTransition.toSequence(playerSprite, "walk")
end

return PlayerAttackEndedListener