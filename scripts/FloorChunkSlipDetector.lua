local FloorChunkSlipDetector = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")
FloorAppender = FloorAppender or require("scripts.FloorAppender")

function FloorChunkSlipDetector.detect()
  local floorGroup = FloorRepository.getFloorGroup()
  local floorChunk = floorGroup[1]

  if floorChunk[floorChunk.numChildren].x <= -(floorChunk[floorChunk.numChildren].width/2) - 800 then
    floorGroup:remove(1)
    FloorAppender.append()
  end
  
end

return FloorChunkSlipDetector