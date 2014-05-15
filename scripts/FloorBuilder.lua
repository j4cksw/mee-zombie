local FloorBuilder = {}

FloorChunkBuilder = FloorChunkBuilder or require("scripts.FloorChunkBuilder")

function FloorBuilder.build()
  for horizontalOffset = 1,16 do
    FloorChunkBuilder.buildFromPatternAndVerticalOffset({"body", "top"}, horizontalOffset)
  end
end

return FloorBuilder