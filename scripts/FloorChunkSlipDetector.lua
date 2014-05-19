local FloorChunkSlipDetector = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")

function FloorChunkSlipDetector.detect()
  local floorGroup = FloorRepository.getFloorGroup()
  local floorChunk = floorGroup[1]

  if floorChunk[floorChunk.numChildren].x <= -(floorChunk[floorChunk.numChildren].width/2) then
    floorGroup:remove(1)
  end
end

return FloorChunkSlipDetector