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
    
    FloorPhysicsInitializer = require("scripts.FloorPhysicsInitializer")
  end)

  it("should create rectangle", function()
    FloorPhysicsInitializer.initialize()

    assert.stub(display.newRect).was_called_with(display.contentCenterX, 1460, display.viewableContentWidth, 152)
  end)

  it("should add physics body to rectangle")
end)