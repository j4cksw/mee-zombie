local FloorRoller = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")

local ROLL_SPEED = 8

function FloorRoller.roll()
  local floorGroup = FloorRepository.getFloorGroup()
  local floorChunk
  
  for chunkIndex=1, floorGroup.numChildren do
    floorChunk = floorGroup[chunkIndex]
    for pieceIndex=1, floorChunk.numChildren do
      floorChunk[pieceIndex].x = floorChunk[pieceIndex].x - ROLL_SPEED
    end
  end
end

return FloorRoller