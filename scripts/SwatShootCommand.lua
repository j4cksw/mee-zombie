SwatShootCommand = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")
physics = physics or require("physics")

function SwatShootCommand.execute(event)
  local swatSprite = event.source.params.swatSprite
  
  SpriteSequenceTransition.toSequence(swatSprite, "swat_shoot")
  
  local bulletSprite = SpriteInitializer.initializeByData({
    name="bullet",
    x=swatSprite.x-60,
    y=swatSprite.y+40,
    sequence="bullet"
  })
  
  physics.addBody(bulletSprite)
  
  bulletSprite:setLinearVelocity(1000, 0)
end

return SwatShootCommand