ItemHitFloorListener = {}

function ItemHitFloorListener.actionPerformed(event)
  if event.other.type == "floor" then
    event.target:setLinearVelocity(0, 0)
  end
end

return ItemHitFloorListener