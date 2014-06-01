InitiateAttackListener = {}

AttackRectInitializer = AttackRectInitializer or require("scripts.AttackRectInitializer")

function InitiateAttackListener.actionPerformed(event)
  if event.target.frame < 5 then
    return
  end
  event.target:removeEventListener("sprite", InitiateAttackListener.actionPerformed)
  
  AttackRectInitializer.initialize(event.target)
end

return InitiateAttackListener