local PlayerAttackCommand = {}

PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function PlayerAttackCommand.execute()
  SpriteSequenceTransition.toSequence(PlayerRepository.getPlayerSprite(), "attack")
end

return PlayerAttackCommand