describe("GameInitializer", function()

    local fakeBearImageSheet = {}
    local fakeBearSprite = {}
    
    setup(function()
      ImageSheetLoader = {
        loadByNames = function(...) end
      }
      stub(ImageSheetLoader, "loadByNames")

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

    it("should load image sheets which will be use in game", function()
      GameInitializer.initialize()
      
      assert.stub(ImageSheetLoader.loadByNames).was_called_with({"bear_zombie", "floor"})
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
    
    it("should create floor imageSheet", function()
      GameInitializer.initialize()
      
      assert.stub(ImageSheetFactory.createFromImageSheetData).was_called_with("img/sprite/floor.png", {
        width=128,
        height=128,
        numFrames=2
      })
    end)
end)