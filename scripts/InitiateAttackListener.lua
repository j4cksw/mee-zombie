InitiateAttackListener = {}

physics = physics or require("physics")

function InitiateAttackListener.actionPerformed(event)
  if event.target.frame < 5 then
    return
  end
  
  physics.addBody(event.target, "dynamic", {isSensor=true})
  event.target.gravityScale = 0
  event.target:removeEventListener("sprite", InitiateAttackListener.actionPerformed)
end

return InitiateAttackListener