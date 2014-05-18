describe("FloorChunkBuilder", function()
  local FloorChunkBuilder

  local floorChunkPattern = {"body", "top"}

  setup(function()
    SpriteInitializer = {}
    stub(SpriteInitializer, "initializeByData")

    display = {
      viewableContentHeight=1536,
      newGroup = function()
        return fakeGroup
      end
    }
    spy.on(display, "newGroup")


    ImageSheetsData = {
      ["floor"] = {
        options={
          width=128,
          height=128
        }
      }
    }

    FloorChunkBuilder = require("scripts.FloorChunkBuilder")
  end)

  local testData = {
    [1] = {
      {
        name="floor",
        x=64,
        y=1344,
        sequence="top"
      },
      {
        name="floor",
        x=64,
        y=1472,
        sequence="body"
      }
    },
    [2] = {
      {
        name="floor",
        x=192,
        y=1344,
        sequence="top"
      },
      {
        name="floor",
        x=192,
        y=1472,
        sequence="body"
      }
    },
    [10] = {
      {
        name="floor",
        x=1216,
        y=1344,
        sequence="top"
      },
      {
        name="floor",
        x=1216,
        y=1472,
        sequence="body"
      }
    }
  }
  for verticalOffset, expected in pairs(testData) do
    it("should create the first floor", function()
      FloorChunkBuilder.buildFromPatternAndVerticalOffset(floorChunkPattern, verticalOffset)

      assert.stub(SpriteInitializer.initializeByData).was_called_with(expected[1])
    end)

    it("should create the second floor", function()
      FloorChunkBuilder.buildFromPatternAndVerticalOffset(floorChunkPattern, verticalOffset)

      assert.stub(SpriteInitializer.initializeByData).was_called_with(expected[2])
    end)
  end

  it("should create group of floor chunk", function()
    FloorChunkBuilder.buildFromPatternAndVerticalOffset(testData[1], 1)

    assert.stub(display.newGroup).was_called()
  end)
end)