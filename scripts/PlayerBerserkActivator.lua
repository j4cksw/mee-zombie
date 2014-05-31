PlayerBerserkActivator = {}

PlayerRepositry = PlayerRepository or require("scripts.PlayerRepository")

function PlayerBerserkActivator.activate()
  PlayerRepositry.getPlayerSprite()
end

return PlayerBerserkActivator