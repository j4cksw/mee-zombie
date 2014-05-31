describe("GameStarter", function()

    setup(function()
      
      GameRuleInitializer = {}
      stub(GameRuleInitializer, "initialize")
      
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

      EnemiesRoller = {
        roll = function()end
      }
      
      GameStarter = require("scripts.GameStarter")
    end)
    
    it("should initialize game rule", function()
      GameStarter.start()
      
      assert.stub(GameRuleInitializer.initialize).was_called()
    end)
    
    it("should start player", function()
      GameStarter.start()

      assert.stub(PlayerInitializer.initialize).was_called()
    end)

    it("should start floor", function()
      GameStarter.start()

      assert.stub(FloorBuilder.build).was_called()
    end)

    it("should start enemy", function()
      GameStarter.start()

      assert.stub(EnemyGenerateTimerInitializer.initialize).was_called()
    end)

    it("should add FloorRoller as an enterframe listener of Runtime", function()
      GameStarter.start()

      assert.stub(Runtime.addEventListener).was_called_with(Runtime, "enterFrame", FloorRoller.roll)
    end)

    it("should add EnemiesRoller as an enterframe listener of Runtime", function()
      GameStarter.start()

      assert.stub(Runtime.addEventListener).was_called_with(Runtime, "enterFrame", EnemiesRoller.roll)
    end)
end)