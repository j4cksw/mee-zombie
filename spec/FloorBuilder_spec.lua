describe("FloorBuilder", function()
  local FloorBuilder

  setup(function()
    FloorChunkBuilder = {}
    stub(FloorChunkBuilder, "createFromPatternAndVerticalOffset")
    
    FloorBuilder = require("scripts.FloorBuilder")
  end)

  it("should create floor chunk for 16 times", function()
    FloorBuilder.build()

    for expectedOffset = 1,16 do
      FloorChunkBuilder.createFromPatternAndVerticalOffset({"body", "top"}, expectedOffset)
    end
  end)
end)