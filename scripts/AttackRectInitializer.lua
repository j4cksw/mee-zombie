AttackRectInitializer = {}

physics = physics or require("physics")

function AttackRectInitializer.initialize(source)
  local slashRect = display.newRect(source.x+100,
    source.y,
    200,
    400)
  slashRect.alpha = 0
  slashRect.type = "slash"
  physics.addBody(slashRect, "dynamic", {isSensor=true})
end

return AttackRectInitializer