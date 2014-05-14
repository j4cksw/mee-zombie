describe("FloorInitializer", function()
  local fakeFloorSprite = {}
  
  setup(function()
      SpriteFactory = {
        createFromImageSheet = function(...)
          return fakeFloorSprite
        end
      }
      spy.on(SpriteFactory, "createFromImageSheet")
      
      ImageSheetsTable = {
        ["floor"] = {}
      }
      SpriteSequenceData = {
        ["floor"] = {}
      }
      
      SpritePositioner = {}
      stub(SpritePositioner, "setPosition")
      
      FloorInitializer = require("scripts.FloorInitializer")
  end)

  it("should create floor piece sprite", function()
    FloorInitializer.initialize()

    assert.stub(SpriteFactory.createFromImageSheet)
      .was_called_with(ImageSheetsTable["floor"],
        SpriteSequenceData["floor"])
  end)
  
  it("should set sequence of floor to top", function()
    FloorInitializer.initialize()
    
    assert.stub(SpritePositioner.setPosition)
      .was_called_with(fakeFloorSprite, 
      10,
      1364)
  end)
end)