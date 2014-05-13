local SpriteFactory = {}

function SpriteFactory.createFromImageSheet(imageSheet, sequenceData)
  return display.newSprite(imageSheet, sequenceData)
end

return SpriteFactory