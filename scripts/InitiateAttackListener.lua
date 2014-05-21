InitiateAttackListener = {}

function InitiateAttackListener.actionPerformed(event)
  if event.target.frame < 4 then
    return
  end
  
  physics.addbody(event.target)
end

return InitiateAttackListener