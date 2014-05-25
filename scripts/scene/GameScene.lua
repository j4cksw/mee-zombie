storyboard = storyboard or require("storyboard")
GameInitializer = GameInitializer or require("scripts.GameInitializer")

local scene = storyboard.newScene("game")

function scene:createScene(event)
  GameInitializer.initialize()
end

return scene