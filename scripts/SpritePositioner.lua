local SpritePositioner = {}

function SpritePositioner.setPosition(sprite, x, y)
  sprite.x = x
  sprite.y = y
end

return SpritePositioner