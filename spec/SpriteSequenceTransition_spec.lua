describe("SpriteSequenceTransition", function()
  setup(function()
    SpriteSequenceTransition = require("SpriteSequenceTransition")
  end)
  
  it("should set sprite sequence with a given sequence name", function()
    SpriteSequenceTransition.toSequence(fakeSprite, "walk")
    
    assert.stub(fakeSprite.setSequence).was_called_with(fakeSprite, "walk")
  end)
end)