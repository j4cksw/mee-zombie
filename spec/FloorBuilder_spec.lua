describe("FloorBuilder", function()
  local FloorBuilder

  setup(function()
    FloorChunkBuilder = {}
    stub(FloorChunkBuilder, "buildFromPatternAndVerticalOffset")

    FloorPatterns = {
      {"body", "top"}
    }

    FloorBuilder = require("scripts.FloorBuilder")
  end)

  it("should create floor chunk for 16 times", function()
    FloorBuilder.build()

    for expectedOffset = 1,16 do
      FloorChunkBuilder.buildFromPatternAndVerticalOffset({"body", "top"}, expectedOffset)
    end
  end)
end)