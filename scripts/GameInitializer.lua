local GameInitializer = {}

ImageSheetLoader = ImageSheetLoader or require("scripts.ImageSheetLoader")
physics = physics or require("physics")
FloorPhysicsInitializer = FloorPhysicsInitializer or require("scripts.FloorPhysicsInitializer")
BackgroundInitializer = BackgroundInitializer or require("scripts.BackgroundInitializer")
GameInitializeData = GameInitializeData or require("config.GameInitializeData")
GameUIInitializer = GameUIInitializer or require("scripts.GameUIInitializer")
AudioRepository = AudioRepository or require("scripts.AudioRepository")

function GameInitializer.initialize()
  ImageSheetLoader.loadByNames(GameInitializeData["game_scene"].loadImageSheets)

  physics.start(false)
  physics.setDrawMode(GameInitializeData["game_scene"].physicsDrawMode)

  FloorPhysicsInitializer.initialize()

  BackgroundInitializer.initialize()

  AudioRepository.add("game_bgm", audio.loadSound("audio/bg.mp3"))

  GameUIInitializer.initialize()
end

return GameInitializer
