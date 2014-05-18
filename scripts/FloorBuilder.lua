local FloorBuilder = {}

FloorChunkBuilder = FloorChunkBuilder or require("scripts.FloorChunkBuilder")
FloorPatterns = FloorPatterns or require("config.FloorPatterns")
FloorRepository = FloorRepository or require("config.FloorRepository")

function FloorBuilder.build()
  local floorGroup = display.newGroup()
  
  for horizontalOffset = 1,16 do
    floorGroup:insert(FloorChunkBuilder.buildFromPatternAndVerticalOffset(FloorPatterns[1],
      horizontalOffset))
  end
  
  FloorRepository.setFloorGroup(floorGroup)
end

return FloorBuilder