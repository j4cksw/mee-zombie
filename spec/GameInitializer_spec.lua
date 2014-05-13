describe("GameInitializer", function()

    local fakeBearImageSheet = {}
    
    PlayerImageSheetConfig = {
      path="path/to/imageSheet",
      options={width=10}
    }
    
    setup(function()
      ImageSheetFactory = {
        createFromImageSheetData = function(...)
          return fakeBearImageSheet
        end
      }
      spy.on(ImageSheetFactory, "createFromImageSheetData")
      
      SpriteFactory = {
        createFromImageSheet = function(...)end
      }
      spy.on(SpriteFactory, "createFromImageSheet")
      
      GameInitializer = {
        initialize = function()
          local playerImageSheet = ImageSheetFactory.createFromImageSheetData(PlayerImageSheetConfig)
          local playerSprite = SpriteFactory.createFromImageSheet(playerImageSheet)
        end
      }
    end)

    it("should create bear zombie imageSheet", function()
      GameInitializer.initialize()

      assert.stub(ImageSheetFactory.createFromImageSheetData).was_called_with(PlayerImageSheetConfig)
    end)
    
    it("should create bear sprite", function()
      GameInitializer.initialize()
      
      assert.stub(SpriteFactory.createFromImageSheet).was_called_with(fakeBearImageSheet)
    end)
end)