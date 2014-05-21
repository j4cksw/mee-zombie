describe("PlayerAttackCommand", function()
  local PlayerAttackCommand

  local fakePlayerSprite = {}

  setup(function()
    stub(fakePlayerSprite, "addEventListener")

    PlayerRepository = {
      getPlayerSprite = function()
        return fakePlayerSprite
      end
    }
    spy.on(PlayerRepository, "getPlayerSprite")

    SpriteSequenceTransition = {}
    stub(SpriteSequenceTransition, "toSequence")
    
    InitiateAttackListener = {
      actionPerformed = function()end
    }
    
    PlayerAttackEndedListener = {
      actionPerformed = function()end
    }
    
    Runtime = {}
    stub(Runtime, "removeEventListener")

    PlayerAttackCommand = require("scripts.PlayerAttackCommand")
  end)

  it("should acquire player from repository", function()
    PlayerAttackCommand.execute()

    assert.stub(PlayerRepository.getPlayerSprite).was_called()
  end)

  it("should change player sequence to 'attack'", function()
    PlayerAttackCommand.execute()

    assert.stub(SpriteSequenceTransition.toSequence).was_called_with(fakePlayerSprite, "attack")
  end)
  
  it("should add InitiateAttackListener to sprite event listeners of player sprite", function()
    PlayerAttackCommand.execute()

    assert.stub(fakePlayerSprite.addEventListener).was_called_with(fakePlayerSprite, "sprite", InitiateAttackListener.actionPerformed)
  end)
  
  it("should add PlayerAttackEndedListener to sprite event listeners of player sprite", function()
    PlayerAttackCommand.execute()

    assert.stub(fakePlayerSprite.addEventListener).was_called_with(fakePlayerSprite, "sprite", PlayerAttackEndedListener.actionPerformed)
  end)

  it("should remove tap event listener from Runtime", function()
    PlayerAttackCommand.execute()
    
    assert.stub(Runtime.removeEventListener).was_called_with(Runtime, "tap", PlayerAttackCommand.execute)
  end)
end)