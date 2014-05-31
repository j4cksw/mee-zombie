ItemHitPlayerListener = {}

PlayerBerserkActivator = PlayerBerserkActivator or require("scripts.PlayerBerserkActivator")
PlayerBerserkCanceller = PlayerBerserkCanceller or require("scripts.PlayerBerserkCanceller")

function ItemHitPlayerListener.actionPerformed(event)
  if event.other.type ~= "player" then
    return
  end
  
  event.target:removeSelf()
  timer.performWithDelay(0, PlayerBerserkActivator.activate)
  timer.performWithDelay(1000, PlayerBerserkCanceller.cancel)
end

return ItemHitPlayerListener