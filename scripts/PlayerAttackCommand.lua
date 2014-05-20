local PlayerAttackCommand = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function PlayerAttackCommand.execute()
  SpriteSequenceTransition.toSequence("attack")
end

return PlayerAttackCommand