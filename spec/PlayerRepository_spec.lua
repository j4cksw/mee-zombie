describe("PlayerRepository", function()
  local PlayerRepository
  
  setup(function()
    local PlayerRepository = require("scripts.PlayerRepository")
  end)
  
  it("should return stored player sprite", function()
    local fakePlayerSprite = {}
    PlayerRepository.setPlayerSprite(fakePlayerSprite)
    
    local result = PlayerRepository.getPlayerSprite()
    
    assert.are.equal(result, fakePlayerSprite)
  end)
end)