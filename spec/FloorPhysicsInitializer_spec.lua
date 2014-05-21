describe("FloorPhysicsInitializer", function()
  local FloorPhysicsInitializer
  local fakeRect = {}

  setup(function()
    display = {
      newRect=function()
        return fakeRect
      end,
      contentCenterX=1024,
      viewAbleContentWidth=2048
    }
    spy.on(display, "newRect")
    
    GameInitializeData  = {
      ["floor_physics"] = {
        y=1460,
        height=152
      }
    }
    
    
    FloorPhysicsInitializer = require("scripts.FloorPhysicsInitializer")
  end)

  it("should create rectangle", function()
    FloorPhysicsInitializer.initialize()

    assert.stub(display.newRect).was_called_with(display.contentCenterX, 1460, display.viewableContentWidth, 152)
  end)

  it("should add physics body to rectangle", function()
    FloorPhysicsInitializer.initialize()
    
    assert.stub(physics.addBody).was_called_with(fakeRect, "static")
  end)
end)