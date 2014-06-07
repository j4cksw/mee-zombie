describe("GameInitializer", function()
    
    setup(function()
      ImageSheetLoader = {
        loadByNames = function(...) end
      }
      stub(ImageSheetLoader, "loadByNames")
      
      physics = {}
      stub(physics, "start")
      stub(physics, "setDrawMode")

      FloorPhysicsInitializer = {}
      stub(FloorPhysicsInitializer, "initialize")
      
      BackgroundInitializer = {}
      stub(BackgroundInitializer, "initialize")
      
      GameInitializer = require("scripts.GameInitializer")
    end)

    it("should load image sheets which will be use in game", function()
      GameInitializer.initialize()
      
      assert.stub(ImageSheetLoader.loadByNames).was_called_with({"bear_zombie", "floor", "enemy", "bullet", "item", "background", "chairs"})
    end)
    
    it("should start physics", function()
      GameInitializer.initialize()
      
      assert.stub(physics.start).was_called()
    end)
    
    it("should set physics draw mode to hybrid", function()
      GameInitializer.initialize()
      
      assert.stub(physics.setDrawMode).was_called_with("hybrid")
    end)
    
    it("should start physics of floor", function()
      GameInitializer.initialize()

      assert.stub(FloorPhysicsInitializer.initialize).was_called()
    end)
    
    it("should initialize background", function()
      GameInitializer.initialize()
      
      assert.stub(BackgroundInitializer.initialize).was_called()
    end)
end)