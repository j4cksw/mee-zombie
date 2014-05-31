AttackRectInitializer = {}

physics = physics or require("physics")

function AttackRectInitializer.initialize(source)

  if source.sequence == "berserk" then
    return
  end

  local slashRect = display.newRect(source.x+100,
    source.y,
    200,
    400)
  slashRect.alpha = 0
  slashRect.type = "slash"
  physics.addBody(slashRect, "dynamic", {isSensor=true})
  slashRect.gravityScale=0
  slashRect.isSleepingAllowed = false
  return slashRect
end

return AttackRectInitializer