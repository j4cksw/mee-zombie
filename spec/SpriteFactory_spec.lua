describe("SpriteFactory", function()

    local fakeImageSheet = {}

    local SpriteFactory

    setup(function()

        _G.display = {
          newSprite = function(...)
            return fakeImageSheet
          end
        }
        spy.on(display, "newSprite")

        _G.ImageSheetsTable = {
          ["bear_zombie"] = fakeImageSheet
        }
        _G.SpriteSequenceData = {
          ["bear_zombie"] = {
            name="run",
            start=1,
            count=1,
          }
        }

        SpriteFactory = require("scripts.SpriteFactory")
    end)

    it("should create newSprite from display module", function()

        SpriteFactory.createFromImageSheetName("bear_zombie")

        assert.stub(display.newSprite).was_called_with(fakeImageSheet,
          SpriteSequenceData["bear_zombie"] )
    end)

end)
