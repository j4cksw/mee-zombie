describe("GameInitializer", function()

    local fakeBearImageSheet = {}
    local fakeBearSprite = {}
    
    setup(function()
      ImageSheetFactory = {
        createFromImageSheetData = function(...)
          return fakeBearImageSheet
        end
      }
      spy.on(ImageSheetFactory, "createFromImageSheetData")

      SpriteFactory = {
        createFromImageSheet = function(...)
          return fakeBearSprite
        end
      }
      spy.on(SpriteFactory, "createFromImageSheet")

      PlayerImageSheetConfig = {
        path="path/to/imageSheet",
        options={width=10}
      }
      
      PlayerSpriteSequenceData = {}
      
      SpritePositioner = {}
      stub(SpritePositioner, "setPosition")
      
      display = {
        contentCenterX=500,
        contentCenterY=500
      }
      
      SpriteSequenceTransition = {}
      stub(SpriteSequenceTransition, "toSequence")

      GameInitializer = require("scripts.GameInitializer")
    end)

    it("should create bear zombie imageSheet", function()
      GameInitializer.initialize()
      assert.stub(ImageSheetFactory.createFromImageSheetData).was_called_with(PlayerImageSheetConfig)
    end)

    it("should create bear sprite", function()
      GameInitializer.initialize()

      assert.stub(SpriteFactory.createFromImageSheet).was_called_with(fakeBearImageSheet, PlayerSpriteSequenceData)
    end)
    
    it("should set position of player sprite to center", function()
      GameInitializer.initialize()
      
      assert.stub(SpritePositioner.setPosition).was_called_with(fakeBearSprite, 500, 500)
    end)
    
    it("should change player sprite sequence to walk", function()
      GameInitializer.initialize()
      
      assert.stub(SpriteSequenceTransition.toSequence(fakeBearSprite, "walk"))
    end)
end)