local SpriteFactory = {}

PlayerSpriteSequqnceData = PlayerSpriteSequqnceData or require("config.PlayerSpriteSequqnceData")

function SpriteFactory.createFromImageSheet(imageSheet, sequenceData)
  return display.newSprite(imageSheet, sequenceData)
end

return SpriteFactory