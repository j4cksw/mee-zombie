describe("SpritePositioner", function()

  local fakeSprite = {}

  local SpritePositioner

  setup(function()
    SpritePositioner = require("scripts.SpritePositioner")
  end)

  it("should set x of sprite by a given x position", function()
    SpritePositioner.setPosition(fakeSprite, 10, 20)

    assert.are.equal(fakeSprite.x, 10)
  end)

  it("should set y of sprite by a given y position", function()
    SpritePositioner.setPosition(fakeSprite, 10, 20)

    assert.are.equal(fakeSprite.y, 20)
  end)
end)
