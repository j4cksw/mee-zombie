describe("PlayerInitializer", function()
  local fakeBearSprite = {}
  
  setup(function()
    SpriteFactory = {
      createFromImageSheet = function(...)
        return fakeBearSprite
      end
    }
    spy.on(SpriteFactory, "createFromImageSheet")

    ImageSheetsTable = {
      ["bear_zombe"] = {}
    }
    
    SpriteSequenceData = {
      ["bear-zombie"] = {
        {name="walk"}
      }
    }

    SpritePositioner = {}
    stub(SpritePositioner, "setPosition")

    display = {
      contentCenterX=10,
      contentCenterY=20
    }

    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")

    PlayerInitializer = require("scripts.PlayerInitializer")
  end)

  it("should create  bear sprite", function()
    PlayerInitializer.initialize()

    assert.stub(SpriteFactory.createFromImageSheet)
      .was_called_with(ImageSheetsTable["bear_zombie"],
        SpriteSequenceData["bear_zombie"])
  end)

  it("should set position to center of screen", function()
    PlayerInitializer.initialize()
    
    assert.stub(SpritePositioner.setPosition)
      .was_called_with(fakeBearSprite, 10, 20)
  end)

end)