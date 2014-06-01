PlayerBerserkCanceller = {}
PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function PlayerBerserkCanceller.cancel()
  AttackRect:removeSelf()
  AttackRect = nil

  PlayerWalkCommand.execute()

  GameRule.speed = GameRule.speed/2
end

return PlayerBerserkCanceller