describe("AttackRectInitializer", function()

    local AttackRectInitializer

    local fakeAttackRect = {}
    local fakePlayerSprite = {
      x=500,
      y=2000
    }

    before_each(function()
      _G.display = {
        newRect = function()
          return fakeAttackRect
        end
      }
      spy.on(display, "newRect")

      _G.physics = {}
      stub(physics, "addBody")

      _G.AttackRect = nil

      AttackRectInitializer = require("scripts.AttackRectInitializer")
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
