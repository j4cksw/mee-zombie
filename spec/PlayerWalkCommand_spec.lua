describe("PlayerWalkCommand", function()
  local PlayerWalkCommand

  local fakePlayerSprite = {}

  setup(function()
    _G.PlayerRepository = {
      getPlayerSprite = function()
        return fakePlayerSprite
      end
    }
    spy.on(PlayerRepository, "getPlayerSprite")

    stub(fakePlayerSprite, "removeEventListener")

    _G.SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")

    _G.Runtime = {}
    stub(Runtime, "addEventListener")

    _G.PlayerAttackCommand = {}
    stub(PlayerAttackCommand, "execute")

    PlayerWalkCommand = require("scripts.PlayerWalkCommand")
  end)

  it("should acquire player sprite from PlayerRepository", function()
    PlayerWalkCommand.execute()

    assert.stub(PlayerRepository.getPlayerSprite).was_called()
  end)

  it("should transit player sequence to walk", function()
    PlayerWalkCommand.execute()

    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakePlayerSprite, "walk")
  end)

  it("should add PlayerAttackCommand back to Runtime tap listener", function()
    PlayerWalkCommand.execute()

    assert.stub(Runtime.addEventListener).was_called_with(Runtime, "tap", PlayerAttackCommand.execute)
  end)

end)
