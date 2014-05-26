storyboard = storyboard or require("storyboard")
GameInitializer = GameInitializer or require("scripts.GameInitializer")

local scene = storyboard.newScene("game")

function scene:createScene(event)
  GameInitializer.initialize()
end

function scene:enterScene(event)

end

function scene:exitScene(event)
  self.view:removeSelf()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene