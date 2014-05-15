local FloorBuilder = {}

FloorChunkBuilder = FloorChunkBuilder or require("scripts.FloorchunkBuilder")

function FloorBuilder.build()
  for horizontalOffset = 1,16 do
    FloorChunkBuilder.createFromPatternAndVerticalOffset({"body", "top"}, horizontalOffset)
  end
end

return FloorBuilder