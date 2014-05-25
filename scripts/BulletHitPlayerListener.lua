BulletHitPlayerListener = {}

function BulletHitPlayerListener.actionPerformed(event)
  if event.other.type == "player" then
    event.target:removeSelf()
  end
end

return BulletHitPlayerListener