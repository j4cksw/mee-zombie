describe("GameInitializer", function()

    local fakeImageSheetData = {}
    
    PlayerImageSheetConfig = {
      path="path/to/imageSheet",
      options={width=10}
    }
    
    setup(function()
      ImageSheetFactory = {}
      stub(ImageSheetFactory, "createFromImageSheetData")

      GameInitializer = {
        initialize = function()
          ImageSheetFactory.createFromImageSheetData(PlayerImageSheetConfig)
        end
      }
    end)

    it("should create bear zombie imageSheet", function()
      GameInitializer.initialize()

      assert.stub(ImageSheetFactory.createFromImageSheetData).was_called_with(PlayerImageSheetConfig)
    end)
end)