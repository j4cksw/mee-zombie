local FloorAppender = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")
FloorChunkBuilder = FloorChunkBuilder or require("scripts.FloorChunkBuilder")
FloorPatterns = FloorPatterns or require("config.FloorPatterns")

function FloorAppender.append()
  local floorGroup = FloorRepository.getFloorGroup()
  floorGroup:insert(FloorChunkBuilder.buildFromPatternAndVerticalOffset(FloorPatterns[1], floorGroup.numChildren+1))
end

return FloorAppender