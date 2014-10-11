describe("GameStarter", function()

    local fakeBackgroundAudio

    setup(function()

      _G.GameRuleInitializer = {}
      stub(GameRuleInitializer, "initialize")

      _G.FloorBuilder = {}
      stub(FloorBuilder, "build")

      _G.Runtime = {}
      stub(Runtime, "addEventListener")

      _G.FloorRoller = {}
      stub(FloorRoller, "roll")

      _G.PlayerInitializer = {}
      stub(PlayerInitializer, "initialize")

      _G.EnemyGenerateTimerInitializer = {}
      stub(EnemyGenerateTimerInitializer, "initialize")

      _G.EnemiesRoller = {
        roll = function()end
      }

      _G.audio = {}
      stub(audio, "play")

      _G.AudioRepository = {
          get = function()
              return fakeBackgroundAudio
          end
      }
      spy.on(AudioRepository, "get")

      GameStarter = require("scripts.GameStarter")
    end)

    it("should play background audio", function()
        GameStarter.start()

        assert.stub(AudioRepository.get).was_called_with("game_bgm")
        assert.stub(audio.play).was_called_with(fakeBackgroundAudio)
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

    it("should start enemy initializer", function()
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
