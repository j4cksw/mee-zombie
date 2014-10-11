local GameStarter = {}
package.loaded[...] = GameStarter

GameRuleInitializer = GameRuleInitializer or require("scripts.GameRuleInitializer")
FloorBuilder = FloorBuilder or require("scripts.FloorBuilder")
FloorRoller = FloorRoller or require("scripts.FloorRoller")
PlayerInitializer = PlayerInitializer or require("scripts.PlayerInitializer")
EnemyGenerateTimerInitializer = EnemyGenerateTimerInitializer or require("scripts.EnemyGenerateTimerInitializer")
EnemiesRoller = EnemiesRoller or require("scripts.EnemiesRoller")
ItemRoller = ItemRoller or require("scripts.ItemRoller")
BackgroundRoller = BackgroundRoller or require("scripts.BackgroundRoller")
AudioRepository = AudioRepository or require("scripts.AudioRepository")

function GameStarter.start()
    audio.play(AudioRepository.get("game_bgm"))
  GameRuleInitializer.initialize()

  FloorBuilder.build()

  PlayerInitializer.initialize()
  EnemyGenerateTimerInitializer.initialize()

  Runtime:addEventListener("enterFrame", FloorRoller.roll)
  Runtime:addEventListener("enterFrame", EnemiesRoller.roll)
  Runtime:addEventListener("enterFrame", ItemRoller.roll)
  Runtime:addEventListener("enterFrame", BackgroundRoller.roll)
end

return GameStarter
