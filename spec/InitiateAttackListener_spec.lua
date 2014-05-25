describe("InitiateAttackListener", function()
  local InitiateAttackListener
  
  local event = {
    target={
      frame=5,
      x=500,
      y=2000
    }
  }
  
  local fakeSlashRect = {}
  
  setup(function()
    physics = {}
    stub(physics, "addBody")
    
    stub(event.target, "removeEventListener")
    
    display = {
      newRect = function()
        return fakeSlashRect
      end
    }
    spy.on(display, "newRect")
    
    InitiateAttackListener = require("scripts.InitiateAttackListener")
  end)
  
  it("should create rectangle for use as slash body", function()
    InitiateAttackListener.actionPerformed(event)
    
    assert.stub(display.newRect).was_called_with(600, 2000, 200, 400)
  end)
  it("should add physics body when reach the 4th frame", function()
    InitiateAttackListener.actionPerformed(event)
    
    assert.stub(physics.addBody).was_called_with(fakeSlashRect, "dynamic")
  end)
   
  it("should remove itself from player sprite event listener", function()
    InitiateAttackListener.actionPerformed(event)
    
    assert.stub(event.target.removeEventListener).was_called_with(event.target, "sprite", InitiateAttackListener.actionPerformed)
  end)
end)