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

  setup(function()
    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")
    
    SpriteInitializer = {}
    stub(SpriteInitializer, "initialize")

    SwatShootCommand = require("scripts.SwatShootCommand")
  end)

  it("should transit sequence to swat shoot", function()
    SwatShootCommand.execute(event)

    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakeSwatSprite, "swat_shoot")
  end)

  it("should create bullet sprite", function()
    SwatShootCommand.execute(event)

    assert.stub(SpriteInitializer.initialize).was_called_with({
      name="bullet",
      x=1940,
      y=1040,
      sequence="bullet"
    })
  end)
end)