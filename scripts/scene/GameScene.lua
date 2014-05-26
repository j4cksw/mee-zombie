storyboard = storyboard or require("storyboard")
GameInitializer = GameInitializer or require("scripts.GameInitializer")
GameStarter = GameStarter or require("scripts.GameStarter")

local scene = storyboard.newScene("game")

function scene:createScene(event)
  GameInitializer.initialize()
end

function scene:enterScene(event)
  GameStarter.start()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene