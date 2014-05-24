describe("SwatShootCommand", function()
  it("should transit sequence to swat shoot", function()
    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")
    
    SwatShootCommand = require("scripts.SwatShootCommand")
    
    local fakeSwatSprite  = {}
    
    local event = {
      source = {
        params = {
          swatSprite = fakeSwatSprite
        }
      }
    }
    
    SwatShootCommand.execute(event)
    
    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakeSwatSprite, "swat_shoot")
  end)
  
  it("should create bullet sprite")
end)