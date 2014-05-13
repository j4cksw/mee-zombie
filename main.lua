
display.setStatusBar( display.HiddenStatusBar )

Player = require("scripts.Player")

--local player = Player:new()
--player:walk()
--player:setPosition(display.contentCenterX, display.contentCenterY)
--
--timer.performWithDelay(2000, function()
--  player:run()
--end)

GameInitializer = require("scripts.GameInitializer")
GameInitializer.initialize()