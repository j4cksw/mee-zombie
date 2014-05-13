SpriteSequenceTransition = {}

function SpriteSequenceTransition.toSequence(sprite, sequenceName)
  sprite:setSequence(sequenceName)
  sprite:play()
end

return SpriteSequenceTransition