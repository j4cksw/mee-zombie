local FloorBuilder = {}

FloorChunkBuilder = FloorChunkBuilder or require("scripts.FloorChunkBuilder")
FloorPatterns = FloorPatterns or require("config.FloorPatterns")

function FloorBuilder.build()
  for horizontalOffset = 1,16 do
    FloorChunkBuilder.buildFromPatternAndVerticalOffset(FloorPatterns[1],
      horizontalOffset)
  end
end

return FloorBuilder