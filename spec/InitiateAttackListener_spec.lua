describe("InitiateAttackListener", function()
  local InitiateAttackListener
  
  local event = {
    target={
      frame=4
    }
  }
  
  setup(function()
    physics = {}
    stub(physics, "addBody")
    
    stub(event.target, "removeEventListener")
  
    InitiateAttackListener = require("scripts.InitiateAttackListener")
  end)
  
  it("should add physics body when reach the 4th frame", function()
    InitiateAttackListener.actionPerformed(event)
    
    assert.stub(physics.addBody).was_called_with(event.target, "static", {isSensor=true})
  end)
  
  it("should remove itself from player sprite event listener", function()
    InitiateAttackListener.actionPerformed(event)
    
    assert.stub(event.target.removeEventListener).was_called_with(event.target, "sprite", InitiateAttackListener.actionPerformed)
  end)
end)