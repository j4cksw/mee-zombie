describe("SpriteFactory", function()

    local fakeImageSheet = {}

    setup(function()
      
      display = {
        newSprite = function(...)
          return fakeImageSheet
        end
      }
      spy.on(display, "newSprite")
      
      PlayerSpriteSequqnceData = {
        {name="run",
          start=1,
          count=1,
        }
      }

      SpriteFactory = require("scripts.SpriteFactory")
    end)

    it("should create newSprite from display module", function()
      SpriteFactory.createFromImageSheet(fakeImageSheet, {
        {name="run",
          start=1,
          count=1,
        }
      })

      assert.stub(display.newSprite).was_called_with(fakeImageSheet, {
        {name="run",
          start=1,
          count=1,
        }
      })
    end)

end)