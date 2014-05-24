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
    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")

    SpriteInitializer = {
      initializeByData = function()
        return fakeBulletSprite
      end
    }
    spy.on(SpriteInitializer, "initializeByData")

    physics = {}
    stub(physics, "addBody")
    
    stub(fakeBulletSprite, "setLinearVelocity")

    SwatShootCommand = require("scripts.SwatShootCommand")
  end)

  it("should transit sequence to swat shoot", function()
    SwatShootCommand.execute(event)

    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakeSwatSprite, "swat_shoot")
  end)

  it("should create bullet sprite", function()
    SwatShootCommand.execute(event)

    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="bullet",
      x=1940,
      y=1040,
      sequence="bullet"
    })
  end)

  it("should add physics body to bullet", function()
    SwatShootCommand.execute(event)

    assert.stub(physics.addBody).was_called_with(fakeBulletSprite)
  end)

  it("should set linear velocity to bullet", function()
    SwatShootCommand.execute(event)

    assert.stub(fakeBulletSprite.setLinearVelocity).was_called_with(fakeBulletSprite, 1000, 0)
  end)
end)