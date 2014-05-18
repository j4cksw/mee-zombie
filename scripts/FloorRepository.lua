local FloorRepository = {}

FloorRepository.floorGroup = nil

function FloorRepository.setFloorGroup(floorGroup)
  FloorRepository.floorGroup = floorGroup
end

function FloorRepository.getFloorGroup()
  return FloorRepository.floorGroup
end

return FloorRepository