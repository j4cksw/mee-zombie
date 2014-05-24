SwatShootCommand = {}

SpriteSequenceTransition = SpriteSequenceTransition or require("scripts.SpriteSequenceTransition")

function SwatShootCommand.execute(event)
  SpriteSequenceTransition.toSequence(event.source.params.swatSprite, "swat_shoot")
end

return SwatShootCommand