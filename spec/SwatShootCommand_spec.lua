describe("SwatShootCommand", function()
  it("should transit sequence to swat shoot", function()
    SwatShootCommand = require("scripts.SwatShootCommand")
    
    SwatShootCommand.execute()
    
    assert.stub(SpriteSequenceTarnsition.toSequence).was_called_with(fakeSwatSprite, "swat_shoot")
  end)
end)