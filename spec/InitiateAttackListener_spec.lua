describe("InitiateAttackListener", function()
  local InitiateAttackListener
  
  local event = {
    target={
      frame=4
    }
  }
  
  setup(function()
    physics = {}
    stub(physics, "addbody")
  
    InitiateAttackListener = require("scripts.InitiateAttackListener")
  end)
  
  it("should add physics body when reach the 4th frame", function()
    InitiateAttackListener.actionPerformed(event)
    
    assert.stub(physics.addbody).was_called_with(event.target)
  end)
  
  it("should remove itself from player sprite event listener")
end)