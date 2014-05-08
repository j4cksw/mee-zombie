describe("Player", function()

    PlayerImageSheetConfig = {
      path = "img/player.png",
      options = {
        width = 400,
        height = 400,
        numFrames = 1
      }
    }

    PlayerSpriteSequenceData = {
      {
        name="run",
        start=1,
        count=1,
      }
    }

    local playerImageSheet = {}

    graphics = {
      newImageSheet = function()
        return playerImageSheet
      end
    }
    spy.on(graphics, "newImageSheet")

    display = {}
    stub(display, "newSprite")

    Player = require("Player")

    it("should create Player's image sheet.", function()
      Player:new()

      assert.stub(graphics.newImageSheet).
        was_called_with(PlayerImageSheetConfig.path,
          PlayerImageSheetConfig.options)
    end)

    it("should create Player's sprite.", function()
      Player:new()

      assert.stub(display.newSprite)
        .was_called_with(playerImageSheet,
          {
            {name="run",
              start=1,
              count=1,
            }
          })
    end)

end)