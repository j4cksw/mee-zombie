InitiateAttackListener = {}

physics = physics or require("physics")

function InitiateAttackListener.actionPerformed(event)
  if event.target.frame < 5 then
    return
  end

  local slashRect = display.newRect(event.target.x+100,
    event.target.y,
    200,
    400)
  slashRect.alpha = 0
  slashRect.type = "slash"
  physics.addBody(slashRect, "dynamic")
  
  event.target.slash = slashRect
  
  event.target:removeEventListener("sprite", InitiateAttackListener.actionPerformed)
end

return InitiateAttackListener