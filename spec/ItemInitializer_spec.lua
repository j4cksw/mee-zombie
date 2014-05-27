describe("ItemInitializer", function()
  it("should create item sprite at top of dead enemy", function()
    local fakeEnemySprite = {
      x=1000,
      y=2000
    }
    
    SpriteInitializer = {}
    stub(SpriteInitializer, "initializeByData")
    
    ItemInitializer = require("scripts.ItemInitializer")

    ItemInitializer.initialize(fakeEnemySprite)

    assert.stub(SpriteInitializer.initializeByData).was_called_with({
      name="item",
      x=1000,
      y=1750,
      sequence="item"
    })
  end)
  
  it("should insert to ItemRepository")
  
  it("should add physics body to item")
  
  it("should fly the item")

  it("should add PlayerHitItemListener to item")
end)