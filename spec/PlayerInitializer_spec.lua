describe("PlayerInitializer", function()
  setup(function()
    PlayerInitializer = require("scripts.PlayerInitializer")
  end)
  
  it("should create  bear sprite", function()
    PlayerInitializer.initialize()
    
    assert.stub(SpriteFactory.createFromImageSheet)
      .was_called_with(ImageSheetsTable["bear_zombie"],
        SpriteSequenceData["bear_zombie"])
  end)
  
end)