local FloorRoller = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")
FloorChunkSlipDetector = FloorChunkSlipDetector or require("scripts.FloorChunkSlipDetector")

local ROLL_SPEED = 8

function FloorRoller.roll()
  local floorGroup = FloorRepository.getFloorGroup()
  local floorChunk

  if not floorGroup.numChildren then
    return
  end

  for chunkIndex=1, floorGroup.numChildren do
    floorChunk = floorGroup[chunkIndex]
    for pieceIndex=1, floorChunk.numChildren do
      floorChunk[pieceIndex].x = floorChunk[pieceIndex].x - ROLL_SPEED
    end
  end

  FloorChunkSlipDetector.detect()
end

return FloorRoller