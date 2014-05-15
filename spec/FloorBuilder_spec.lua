describe("FloorBuilder", function()
  local FloorBuilder

  setup(function()
    SpriteInitializer = {}
    stub(SpriteInitializer, "initializeByData")

    display = {
      viewableContentHeight=1536
    }

    ImageSheetsData = {
      ["floor"] = {
        options={
          width=128,
          height=128
        }
      }
    }

    FloorBuilder = require("scripts.FloorBuilder")
  end)

  it("should create the first floor", function()
    FloorBuilder.build()

    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="floor",
      x=64,
      y=1344,
      sequence="top"
    })
  end)

  it("should create the second floor", function()
    FloorBuilder.build()

    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="floor",
      x=64,
      y=1472,
      sequence="body"
    })
  end)

end)