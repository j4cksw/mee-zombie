FloorGapRemoveCommand = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")

function getLeftEdgePosition(sprite)
  return sprite.x - (sprite.width/2)
end

function FloorGapRemoveCommand.execute()
  local floorGroup = FloorRepository.getFloorGroup()

  for chunkIndex = 2, floorGroup.numChildren do
    for pieceIndex = 1, floorGroup[chunkIndex].numChildren do
      if getLeftEdgePosition(floorGroup[chunkIndex][pieceIndex])> ((floorGroup[1][1].x + (floorGroup[1][1].x/2))+1) then
        floorGroup[2][1].x = ((floorGroup[1][1].x + (floorGroup[1][1].width/2))+1) + (floorGroup[2][1].width/2)
      end
    end
  end
end

return FloorGapRemoveCommand