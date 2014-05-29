ItemHitFloorListener = {}

function ItemHitFloorListener.actionPerformed(event)
  if event.other.type == "floor" then
    event.target:removeEventListener("collision", ItemHitFloorListener.actionPerformed)
    event.target:setLinearVelocity(0, 0)
    event.target.isMovable = true
  end
end

return ItemHitFloorListener