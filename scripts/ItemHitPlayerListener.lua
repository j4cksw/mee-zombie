ItemHitPlayerListener = {}

PlayerBerserkActivator = PlayerBerserkActivator or require("scripts.PlayerBerserkActivator")

function ItemHitPlayerListener.actionPerformed(event)
  if event.other.type ~= "player" then
    return
  end
  
  event.target:removeSelf()
  PlayerBerserkActivator.activate()
end

return ItemHitPlayerListener