describe("AttackRectInitializer", function()

    local fakeAttackRect = {}

    setup(function()
      display = {
        newRect = function()
          return fakeAttackRect
        end
      }
      spy.on(display, "newRect")
      
      physics = {}
      stub(physics, "addBody")

      AttackRectInitializer = require("scripts.AttackRectInitializer")
    end)

    it("should create rectangle for use as slash body", function()
      AttackRectInitializer.initialize()

      assert.stub(display.newRect).was_called_with(600, 2000, 200, 400)
    end)

    it("should add physics body to attack rectangle", function()
      AttackRectInitializer.initialize()

      assert.stub(physics.addBody).was_called_with(fakeAttackRect, "dynamic", {isSensor=true})
    end)
end)