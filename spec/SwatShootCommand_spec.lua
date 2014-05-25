describe("SwatShootCommand", function()
  local SwatShootCommand

  local fakeSwatSprite  = {
    x=2000,
    y=1000
  }

  local event = {
    source = {
      params = {
        swatSprite = fakeSwatSprite
      }
    }
  }

  local fakeBulletSprite = {}

  setup(function()
    BulletInitializer = {}
    stub(BulletInitializer, "initialize")
    
    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")
    
    SwatShootCommand = require("scripts.SwatShootCommand")
  end)

  it("should transit sequence to swat shoot", function()
    SwatShootCommand.execute(event)

    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakeSwatSprite, "swat_shoot")
  end)

  it("should create bullet sprite", function()
    SwatShootCommand.execute(event)

    assert.stub(BulletInitializer.initialize).was_called_with(fakeSwatSprite)
  end)
end)