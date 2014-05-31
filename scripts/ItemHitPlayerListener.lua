ItemHitPlayerListener = {}

function ItemHitPlayerListener.actionPerformed(event)
  if event.other.type ~= "player" then
    return
  end
  
  event.target:removeSelf()
end

return ItemHitPlayerListener