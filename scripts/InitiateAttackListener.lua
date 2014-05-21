InitiateAttackListener = {}

physics = physics or require("physics")

function InitiateAttackListener.actionPerformed(event)
  if event.target.frame < 5 then
    return
  end
  
  physics.addBody(event.target, "static", {isSensor=true})
  event.target:removeEventListener("sprite", InitiateAttackListener.actionPerformed)
end

return InitiateAttackListener