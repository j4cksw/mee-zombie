AttackRectInitializer = {}

physics = physics or require("physics")

function createRect(source)
  AttackRect = display.newRect(source.x+100,
    source.y,
    200,
    400)
  AttackRect.alpha = 0
  AttackRect.type = "slash"
end

function setupPhysics()
  physics.addBody(AttackRect, "dynamic", {isSensor=true})
  AttackRect.gravityScale=0
  AttackRect.isSleepingAllowed = false
end

function AttackRectInitializer.initialize(source)
  if AttackRect then
    AttackRect:removeSelf()
  end

  createRect(source)
  setupPhysics()
  return AttackRect
end

return AttackRectInitializer