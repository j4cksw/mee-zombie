local FloorBuilder = {}

FloorChunkBuilder = FloorChunkBuilder or require("scripts.FloorChunkBuilder")
FloorPatterns = FloorPatterns or require("config.FloorPatterns")

function FloorBuilder.build()
  display.newGroup()
  
  for horizontalOffset = 1,16 do
    FloorChunkBuilder.buildFromPatternAndVerticalOffset(FloorPatterns[1],
      horizontalOffset)
  end
end

return FloorBuilder