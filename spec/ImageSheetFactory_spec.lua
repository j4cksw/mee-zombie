describe("ImageSheetFactory", function()

    local fakeImageSheet = {}

    ImageSheetFactory = require("scripts.ImageSheetFactory")

    setup(function()
      graphics = {
        newImageSheet = function(...)
          return fakeImageSheet
        end
      }
      spy.on(graphics, "newImageSheet")

    end)

    it("should create image sheet from graphics module", function()
      local fakeImageSheetData = {
        path = "path/to/imageSheet",
        options = {
          width=10,
          height=20,
          numFrames=100
        }
      }

      ImageSheetFactory.createFromImageSheetData(fakeImageSheetData)

      assert.stub(graphics.newImageSheet).was_called_with(fakeImageSheetData.path,
        fakeImageSheetData.options)
    end)

    it("should return an imageSheet instance", function()
      local fakeImageSheetData = {
        path = "path/to/imageSheet",
        options = {
          width=10,
          height=20,
          numFrames=100
        }
      }

      local result = ImageSheetFactory.createFromImageSheetData(fakeImageSheetData)

      assert.are.equal(result, fakeImageSheet)
    end)
end)