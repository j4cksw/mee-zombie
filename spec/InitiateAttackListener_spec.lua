describe("InitiateAttackListener", function()
  local InitiateAttackListener
  
  local event = {
    target={
      frame=5
    }
  }
  
  local fakeSlashRect = {}
  
  setup(function()
    stub(event.target, "removeEventListener")
    
    AttackRectInitializer = {}
    stub(AttackRectInitializer, "initialize")
    
    InitiateAttackListener = require("scripts.InitiateAttackListener")
  end)
  
  it("should create rectangle for use as slash body", function()
    InitiateAttackListener.actionPerformed(event)
    
    assert.stub(AttackRectInitializer.initialize).was_called_with(event.target)
  end)
   
  it("should remove itself from player sprite event listener", function()
    InitiateAttackListener.actionPerformed(event)
    
    assert.stub(event.target.removeEventListener).was_called_with(event.target, "sprite", InitiateAttackListener.actionPerformed)
  end)
end)