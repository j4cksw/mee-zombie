describe("GameInitializer", function()
    
    setup(function()
      ImageSheetLoader = {
        loadByNames = function(...) end
      }
      stub(ImageSheetLoader, "loadByNames")
      
      physics = {}
      stub(physics, "start")
      stub(physics, "setDrawMode")
      
      FloorBuilder = {}
      stub(FloorBuilder, "build")
      
      Runtime = {}
      stub(Runtime, "addEventListener")
      
      FloorRoller = {}
      stub(FloorRoller, "roll")
      
      PlayerInitializer = {}
      stub(PlayerInitializer, "initialize")
      
      EnemyGenerateTimerInitializer = {}
      stub(EnemyGenerateTimerInitializer, "initialize")
      
      FloorPhysicsInitializer = {}
      stub(FloorPhysicsInitializer, "initialize")
      
      EnemiesRoller = {
        roll = function()end
      }

      GameInitializer = require("scripts.GameInitializer")
    end)

    it("should load image sheets which will be use in game", function()
      GameInitializer.initialize()
      
      assert.stub(ImageSheetLoader.loadByNames).was_called_with({"bear_zombie", "floor", "enemy", "bullet"})
    end)
    
    it("should start physics", function()
      GameInitializer.initialize()
      
      assert.stub(physics.start).was_called()
    end)
    
    it("should set physics drawmode to hybrid", function()
      GameInitializer.initialize()
      
      assert.stub(physics.setDrawMode).was_called_with("hybrid")
    end)

    it("should initialize player", function()
      GameInitializer.initialize()

      assert.stub(PlayerInitializer.initialize).was_called()
    end)
    
    it("should initialize floor", function()
      GameInitializer.initialize()
      
      assert.stub(FloorBuilder.build).was_called()
    end)
    
    it("should initialize enemy", function()
      GameInitializer.initialize()
      
      assert.stub(EnemyGenerateTimerInitializer.initialize).was_called()
    end)
    
    it("should initialize physics of floor", function()
      GameInitializer.initialize()
      
      assert.stub(FloorPhysicsInitializer.initialize).was_called()
    end)
    
    it("should add FloorRoller as an enterframe listener of Runtime", function()
      GameInitializer.initialize()
      
      assert.stub(Runtime.addEventListener).was_called_with(Runtime, "enterFrame", FloorRoller.roll)
    end)
    
    it("should add EnemiesRoller as an enterframe listener of Runtime", function()
      GameInitializer.initialize()
      
      assert.stub(Runtime.addEventListener).was_called_with(Runtime, "enterFrame", EnemiesRoller.roll)
    end)
end)