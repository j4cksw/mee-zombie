SwatShootCommand = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")
SpriteInitializer = SpriteInitializer or require("scripts.SpriteInitializer")

function SwatShootCommand.execute(event)
  local swatSprite = event.source.params.swatSprite
  
  SpriteSequenceTransition.toSequence(swatSprite, "swat_shoot")
  SpriteInitializer.initializeByData({
    name="bullet",
    x=swatSprite.x-60,
    y=swatSprite.y+40,
    sequence="bullet"
  })
end

return SwatShootCommand