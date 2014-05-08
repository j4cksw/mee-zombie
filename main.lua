
display.setStatusBar( display.HiddenStatusBar )

Player = require("Player")

local player = Player:new()
player:setPosition(display.ContentCenterX, display.ContentCenterY)
player:walk()