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

    local playerSprite = {}
    stub(playerSprite, "setSequence")
    stub(playerSprite, "play")
    
    display = {
      newSprite = function()
        return playerSprite
      end
    }
    spy.on(display, "newSprite")

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

    it("should set sequence to run and play when call walk()", function()
      local player = Player:new()

      player:walk()

      assert.stub(playerSprite.setSequence).was_called_with(playerSprite, "walk")
      assert.stub(playerSprite.play).was_called_with(playerSprite)
    end)

end)