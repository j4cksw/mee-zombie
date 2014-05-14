describe("ImageSheetLoader", function()

    local fakeImageSheet = {}

    setup(function()
      ImageSheetsData = {
        ["bear_zombie"] = {
          path="img/sprite/bear_zombie.png",
          options={
            width=400,
            height=400,
            numFrames=17
          }
        }
      }

      ImageSheetFactory = {
        createFromImageSheetData = function()
          return fakeImageSheet
        end
      }
      spy.on(ImageSheetFactory, "createFromImageSheetData")

      ImageSheetLoader = require("scripts.ImageSheetLoader")
    end)
    
    it("should acquire imageSheet data from config table and assign to ImageFactory.create", function()
      ImageSheetLoader.loadByNames({"bear_zombie"})

      assert.stub(ImageSheetFactory.createFromImageSheetData).was_called_with({
        path="img/sprite/bear_zombie.png",
        options={
          width=400,
          height=400,
          numFrames=17
        }
      })
    end)
    
    it("should create a global ImageSheetsTable")
    
    it("should have imageSheet with a given name")
end)