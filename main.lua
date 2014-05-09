
display.setStatusBar( display.HiddenStatusBar )

Player = require("Player")

local player = Player:new()
--player:walk()
player:run()
player:setPosition(display.contentCenterX, display.contentCenterY)
