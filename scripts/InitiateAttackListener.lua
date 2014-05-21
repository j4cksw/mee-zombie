InitiateAttackListener = {}

physics = physics or require("physics")

function InitiateAttackListener.actionPerformed(event)
  if event.target.frame < 4 then
    return
  end
  
  physics.addBody(event.target, "dynamic")
  event.target:removeEventListener("sprite", InitiateAttackListener.actionPerformed)
end

return InitiateAttackListener