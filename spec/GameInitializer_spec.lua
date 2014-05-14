describe("GameInitializer", function()

    local fakeBearImageSheet = {}
    local fakeBearSprite = {}
    
    setup(function()
      ImageSheetLoader = {
        loadByNames = function(...) end
      }
      stub(ImageSheetLoader, "loadByNames")

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

      assert.stub(PlayerInitializer.intialize).was_called()
    end)
end)