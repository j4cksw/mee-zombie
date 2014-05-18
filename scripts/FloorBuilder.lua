local FloorBuilder = {}

FloorChunkBuilder = FloorChunkBuilder or require("scripts.FloorChunkBuilder")
FloorPatterns = FloorPatterns or require("config.FloorPatterns")

function FloorBuilder.build()
  local floorGroup = display.newGroup()
  
  for horizontalOffset = 1,16 do
    floorGroup:insert(FloorChunkBuilder.buildFromPatternAndVerticalOffset(FloorPatterns[1],
      horizontalOffset))
  end
end

return FloorBuilder