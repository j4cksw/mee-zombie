
display.setStatusBar( display.HiddenStatusBar )

Player = require("Player")

local player = Player:new()
player:walk()
player:setPosition(display.contentCenterX, display.contentCenterY)

timer.performWithDelay(2000, function()
  player:run()
end)
