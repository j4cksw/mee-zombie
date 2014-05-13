describe("Player", function()
    
    local playerImageSheet = {}
    local playerSprite = {}
    
    setup(function()
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

      

      graphics = {
        newImageSheet = function()
          return playerImageSheet
        end
      }
      spy.on(graphics, "newImageSheet")

      
      stub(playerSprite, "setSequence")
      stub(playerSprite, "play")

      display = {
        newSprite = function()
          return playerSprite
        end
      }
      spy.on(display, "newSprite")

      Player = require("scripts.Player")
    end)
    
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

    it("should set position to its sprite when call setPosition()", function()
      local player = Player:new()

      player:setPosition(50, 200)

      assert.are.equal(50, playerSprite.x)
      assert.are.equal(200, playerSprite.y)
    end)

    it("should set sequence to walk and play when call walk()", function()
      local player = Player:new()

      player:walk()

      assert.stub(playerSprite.setSequence).was_called_with(playerSprite, "walk")
      assert.stub(playerSprite.play).was_called_with(playerSprite)
    end)

    it("should set sequence to run and play when call run()", function()
      local player = Player:new()

      player:run()

      assert.stub(playerSprite.setSequence).was_called_with(playerSprite, "run")
      assert.stub(playerSprite.play).was_called_with(playerSprite)
    end)

end)