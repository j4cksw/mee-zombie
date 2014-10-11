describe("GameInitializer", function()

    local fakeLoadedAudio = {}

    before_each(function()
      _G.ImageSheetLoader = {
        loadByNames = function(...) end
      }
      stub(ImageSheetLoader, "loadByNames")

      _G.physics = {}
      stub(physics, "start")
      stub(physics, "setDrawMode")

      _G.FloorPhysicsInitializer = {}
      stub(FloorPhysicsInitializer, "initialize")

      _G.BackgroundInitializer = {}
      stub(BackgroundInitializer, "initialize")

      _G.GameInitializeData = {
        ["game_scene"] = {
          physicsDrawMode = "normal",
          loadImageSheets = {"bear_zombie", "floor", "enemy", "bullet", "item", "background", "chairs"}
        }
      }

      _G.GameUIInitializer = {}
      stub(GameUIInitializer, "initialize")

      _G.audio = {
          loadSound = function()
              return fakeLoadedAudio
          end
      }
      spy.on(audio, "loadSound")

      _G.AudioRepository = {
          add = function()end
      }
      stub(AudioRepository, "add")

      _G.GameInitializer = require("scripts.GameInitializer")
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

      assert.stub(physics.setDrawMode).was_called_with("normal")
    end)

    it("should start physics of floor", function()
      GameInitializer.initialize()

      assert.stub(FloorPhysicsInitializer.initialize).was_called()
    end)

    it("should initialize background", function()
      GameInitializer.initialize()

      assert.stub(BackgroundInitializer.initialize).was_called()
    end)

    it("should initialize game UI", function()
      GameInitializer.initialize()

      assert.stub(GameUIInitializer.initialize).was_called()
    end)

    it("should load game background music and add to AudioRepository", function()
        GameInitializer.initialize()

        assert.stub(audio.loadSound).was_called_with("audio/bg.mp3")
        assert.stub(AudioRepository.add).was_called_with("game_bgm", fakeLoadedAudio)
    end)

    it("should load killed sound and add to AudioRepository", function()
        GameInitializer.initialize()

        assert.stub(audio.loadSound).was_called_with("audio/killed.wav")
        assert.stub(AudioRepository.add).was_called_with("killed_sfx", fakeLoadedAudio)
    end)
end)
