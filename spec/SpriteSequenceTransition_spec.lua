describe("SpriteSequenceTransition", function()
  
  local fakeSprite = {}
  
  setup(function()
    stub(fakeSprite, "setSequence")
    stub(fakeSprite, "play")
    
    SpriteSequenceTransition = require("scripts.SpriteSequenceTransition")
  end)
  
  it("should set sprite sequence with a given sequence name", function()
    SpriteSequenceTransition.toSequence(fakeSprite, "walk")
    
    assert.stub(fakeSprite.setSequence).was_called_with(fakeSprite, "walk")
  end)
  
  it("should play sprite after set sequence name", function()
    SpriteSequenceTransition.toSequence(fakeSprite, "walk")
    
    assert.stub(fakeSprite.play).was_called_with(fakeSprite)
  end)
end)