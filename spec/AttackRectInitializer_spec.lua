describe("AttackRectInitializer", function()

    local fakeAttackRect = {}
    local fakePlayerSprite = {
      x=500,
      y=2000
    }

    setup(function()
      display = {
        newRect = function()
          return fakeAttackRect
        end
      }
      spy.on(display, "newRect")

      _G.physics = {}
      stub(physics, "addBody")

      AttackRectInitializer = require("scripts.AttackRectInitializer")
    end)

    before_each(function()
      AttackRect = nil
    end)

    it("should create rectangle for use as slash body", function()
      AttackRectInitializer.initialize(fakePlayerSprite)

      assert.stub(display.newRect).was_called_with(600, 2000, 200, 400)
    end)

    it("should add physics body to attack rectangle", function()
      AttackRectInitializer.initialize(fakePlayerSprite)

      assert.stub(physics.addBody).was_called_with(fakeAttackRect, "dynamic", {isSensor=true})
    end)
end)
