local PlayerWalkCommand = {}
package.loaded[...] = PlayerWalkCommand

PlayerRepository = PlayerRepository or require("scripts.PlayerRepository")
SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
PlayerAttackCommand = PlayerAttackCommand or require("scripts.PlayerAttackCommand")

function PlayerWalkCommand.execute()
  local playerSprite = PlayerRepository.getPlayerSprite()
  SpriteSequenceTransition.toSequence(playerSprite, "walk")

  Runtime:addEventListener("tap", PlayerAttackCommand.execute)
end

return PlayerWalkCommand
