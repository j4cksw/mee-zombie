describe("PlayerInitializer", function()
  local fakeBearSprite = {}
  
  setup(function()
    SpriteFactory = {
      createFromImageSheetName = function(...)
        return fakeBearSprite
      end
    }
    spy.on(SpriteFactory, "createFromImageSheetName")

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

    assert.stub(SpriteFactory.createFromImageSheetName)
      .was_called_with("bear_zombie")
  end)

  it("should set position to center of screen", function()
    PlayerInitializer.initialize()
    
    assert.stub(SpritePositioner.setPosition)
      .was_called_with(fakeBearSprite, 10, 20)
  end)
  
  it("should transition animate sequence to walk", function()
    PlayerInitializer.initialize()
    
    assert.stub(SpriteSequenceTransition.toSequence)
      .was_called_with(fakeBearSprite,
        "walk")
  end)

end)