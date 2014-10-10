describe("SpriteInitializer", function()
  local SpriteInitializer

  local fakeSpriteInitializeData = {
    name="bear_zombie",
    x=10,
    y=20,
    sequence="walk"
  }

  local fakeBearSprite = {}

  setup(function()
    _G.SpriteFactory = {
      createFromImageSheetName = function(...)
        return fakeBearSprite
      end
    }
    spy.on(SpriteFactory, "createFromImageSheetName")

    _G.SpritePositioner = {}
    stub(SpritePositioner, "setPosition")

    _G.SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")

    SpriteInitializer = require("scripts.SpriteInitializer")
  end)

  it("should create  bear sprite", function()
    SpriteInitializer.initializeByData(fakeSpriteInitializeData)

    assert.stub(SpriteFactory.createFromImageSheetName)
      .was_called_with("bear_zombie")
  end)

  it("should set position to center of screen", function()
    SpriteInitializer.initializeByData(fakeSpriteInitializeData)

    assert.stub(SpritePositioner.setPosition)
      .was_called_with(fakeBearSprite, 10, 20)
  end)

  it("should transition animate sequence to walk", function()
    SpriteInitializer.initializeByData(fakeSpriteInitializeData)

    assert.stub(SpriteSequenceTransition.toSequence)
      .was_called_with(fakeBearSprite,
        "walk")
  end)
end)
