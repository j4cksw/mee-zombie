local FloorAppender = {}

FloorRepository = FloorRepository or require("scripts.FloorRepository")
FloorChunkBuilder = FloorChunkBuilder or require("scripts.FloorChunkBuilder")

function FloorAppender.append()
  local floorGroup = FloorRepository.getFloorGroup()
  floorGroup:insert(FloorChunkBuilder.buildFromPatternAndVerticalOffset({"body", "top"}, 5))
end

return FloorAppender