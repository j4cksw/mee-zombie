describe("ItemRoller", function()
  it("should move item in repository when isMovable was set", function()
    local fakeItem = {
      x = 10,
      isMovable = true
    }

    ItemRepository = {
      getAll = function()
        return {fakeItem, numChildren=1}
      end
    }
    
    GameRule = {
      speed = 8
    }
    
    ItemRoller = require("scripts.ItemRoller")

    ItemRoller.roll()

    assert.are.equal(fakeItem.x, 2)
  end)
end)