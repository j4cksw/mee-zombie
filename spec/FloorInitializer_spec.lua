describe("FloorInitializer", function()
  local fakeFloorSprite = {}
  
  setup(function()
      SpriteFactory = {
        createFromImageSheetName = function(...)
          return fakeFloorSprite
        end
      }
      spy.on(SpriteFactory, "createFromImageSheetName")
      
      SpritePositioner = {}
      stub(SpritePositioner, "setPosition")
      
      SpriteSequenceTransition = {}
      stub(SpriteSequenceTransition, "toSequence")
      
      FloorInitializer = require("scripts.FloorInitializer")
  end)

  it("should create floor piece sprite", function()
    FloorInitializer.initialize()

    assert.stub(SpriteFactory.createFromImageSheetName)
      .was_called_with("floor")
  end)
  
  it("should set position of floor", function()
    FloorInitializer.initialize()
    
    assert.stub(SpritePositioner.setPosition)
      .was_called_with(fakeFloorSprite, 
      10,
      1364)
  end)
  
  it("should set sequence of floor", function()
    FloorInitializer.initialize()
    
    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakeFloorSprite, "top")
  end)
end)