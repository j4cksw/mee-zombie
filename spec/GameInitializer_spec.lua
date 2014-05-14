describe("GameInitializer", function()
    
    setup(function()
      ImageSheetLoader = {
        loadByNames = function(...) end
      }
      stub(ImageSheetLoader, "loadByNames")

      PlayerInitializer = {}
      stub(PlayerInitializer, "initialize")
      
      FloorInitializer = {}
      stub(FloorInitializer, "initialize")

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
      
      assert.stub(FloorInitializer.initialize).was_called()
    end)
end)