describe("GameInitializer", function()
    
    setup(function()
      ImageSheetLoader = {
        loadByNames = function(...) end
      }
      stub(ImageSheetLoader, "loadByNames")
      
      SpriteInitializer = {}
      stub(SpriteInitializer, "initializeByData")
      
      GameInitializeData = {
        ["bear_zombie"] = {},
        ["floor"] = {}
      }
      
      FloorBuilder = {}
      stub(FloorBuilder, "build")
      
      Runtime = {}
      stub(Runtime, "addEventListener")
      
      FloorRoller = {}
      stub(FloorRoller, "roll")

      GameInitializer = require("scripts.GameInitializer")
    end)

    it("should load image sheets which will be use in game", function()
      GameInitializer.initialize()
      
      assert.stub(ImageSheetLoader.loadByNames).was_called_with({"bear_zombie", "floor"})
    end)

    it("should initialize player", function()
      GameInitializer.initialize()

      assert.stub(SpriteInitializer.initializeByData).was_called_with(GameInitializeData["bear_zombie"])
    end)
    
    it("should initialize floor", function()
      GameInitializer.initialize()
      
      assert.stub(FloorBuilder.build).was_called()
    end)
    
    it("should add enterframe to Runtime", function()
      GameInitializer.initialize()
      
      assert.stub(Runtime.addEventListener).was_called_with(Runtime, "enterFrame", FloorRoller.roll)
    end)
end)