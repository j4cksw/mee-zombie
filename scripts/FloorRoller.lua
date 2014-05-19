local FloorRoller = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")
FloorChunkSlipDetector = FloorChunkSlipDetector or require("scripts.FloorChunkSlipDetector")

local ROLL_SPEED = 8

function FloorRoller.roll()
  local floorGroup = FloorRepository.getFloorGroup()
  local floorChunk
  
  for chunkIndex=1, floorGroup.numChildren do
    floorChunk = floorGroup[chunkIndex]
    print(floorChunk.x)
    for pieceIndex=1, floorChunk.numChildren do
      floorChunk[pieceIndex].x = floorChunk[pieceIndex].x - ROLL_SPEED
    end
  end
  
  FloorChunkSlipDetector.detect()
end

return FloorRoller