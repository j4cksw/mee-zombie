describe("BulletInitializer", function()
  local BulletInitializer

  local fakeSwatSprite  = {
    x=2000,
    y=1000
  }

  local fakeBulletSprite = {}

  setup(function()
    _G.SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")

    _G.SpriteInitializer = {
      initializeByData = function()
        return fakeBulletSprite
      end
    }
    spy.on(SpriteInitializer, "initializeByData")

    physics = {}
    stub(physics, "addBody")

    stub(fakeBulletSprite, "setLinearVelocity")
    stub(fakeBulletSprite, "addEventListener")

    _G.PhysicsData = {
      ["bullet"] = {
        type="kinematic",
        options = {
          isSensor = true
        }
      },
    }

    _G.BulletHitPlayerListener = {
      actionPerformed = function()end
    }

    _G.BulletRepository = {}
    stub(BulletRepository, "insert")

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

  it("should add bullet sprite to BulletRepository", function()
    BulletInitializer.initialize(fakeSwatSprite)

    assert.stub(BulletRepository.insert).was_called_with(fakeBulletSprite)
  end)
end)
