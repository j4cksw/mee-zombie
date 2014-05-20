describe("GameInitializer", function()
    
    setup(function()
      ImageSheetLoader = {
        loadByNames = function(...) end
      }
      stub(ImageSheetLoader, "loadByNames")
      
      FloorBuilder = {}
      stub(FloorBuilder, "build")
      
      Runtime = {}
      stub(Runtime, "addEventListener")
      
      FloorRoller = {}
      stub(FloorRoller, "roll")
      
      PlayerInitializer = {}
      stub(PlayerInitializer, "initialize")

      GameInitializer = require("scripts.GameInitializer")
    end)

    it("should load image sheets which will be use in game", function()
      GameInitializer.initialize()
      
      assert.stub(ImageSheetLoader.loadByNames).was_called_with({"bear_zombie", "floor"})
    end)

    it("should initialize player", function()
      GameInitializer.initialize()

      assert.stub(PlayerInitializer.initialize).was_called()
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