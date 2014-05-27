describe("ItemInitializer", function()
  it("should create item sprite at top of dead enemy", function()
    local fakeEnymySprite = {
      x=1000,
      y=2000
    }
    
    ItemInitializer = require("scripts.ItemInitializer")

    ItemInitializer.initialize(fakeEnemySprite)

    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="item",
      x=1000,
      y=1650,
      sequence="item"
    })
  end)

  it("should add physics body to item")

  it("should add PlayerHitItemListener to item")
end)