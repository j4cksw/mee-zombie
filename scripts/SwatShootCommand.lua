SwatShootCommand = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
BulletInitializer = BulletInitializer or require("scripts.BulletInitializer")

function SwatShootCommand.execute(event)
  local swatSprite = event.source.params.swatSprite
  
  SpriteSequenceTransition.toSequence(swatSprite, "swat_shoot")
  
  BulletInitializer.initialize(swatSprite)
end

return SwatShootCommand