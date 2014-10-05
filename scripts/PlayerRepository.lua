local PlayerRepository = {}
package.loaded[...] = PlayerRepository

PlayerRepository.playerSprite = nil

function PlayerRepository.setPlayerSprite(sprite)
  PlayerRepository.playerSprite = sprite
end

function PlayerRepository.getPlayerSprite()
  return PlayerRepository.playerSprite
end

return PlayerRepository
