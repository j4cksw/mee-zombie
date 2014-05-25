describe("BulletInitializer", function()
  local BulletInitializer

  local fakeSwatSprite  = {
    x=2000,
    y=1000
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
    stub(fakeBulletSprite, "addEventListener")
    
    PhysicsData = {
      ["bullet"] = {
        type="kinematic",
        options = {
          isSensor = true
        }
      },
    }
    
    BulletHitPlayerListener = {
      actionPerformed = function()end
    }
    
    
    BulletInitializer = require("scripts.BulletInitializer")
  end)

  it("should create bullet sprite", function()
    BulletInitializer.initialize(fakeSwatSprite)

    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="bullet",
      x=1940,
      y=1040,
      sequence="bullet"
    })
  end)

  it("should add physics body to bullet", function()
    BulletInitializer.initialize(fakeSwatSprite)

    assert.stub(physics.addBody).was_called_with(fakeBulletSprite, "kinematic", {isSensor=true})
  end)

  it("should set linear velocity to bullet", function()
    BulletInitializer.initialize(fakeSwatSprite)

    assert.stub(fakeBulletSprite.setLinearVelocity).was_called_with(fakeBulletSprite, -500, 0)
  end)

  it("should add collision with player listener", function()
    BulletInitializer.initialize(fakeSwatSprite)

    assert.stub(fakeBulletSprite.addEventListener).was_called_with(fakeBulletSprite,
      "collision",
      BulletHitPlayerListener.actionPerformed)
  end)
end)