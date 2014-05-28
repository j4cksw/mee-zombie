describe("ItemInitializer", function()

    local fakeEnemySprite = {
      x=1000,
      y=2000
    }
    
    local fakeItemSprite = {}

    setup(function()
      SpriteInitializer = {
        initializeByData = function()
          return fakeItemSprite
        end
      }
      spy.on(SpriteInitializer, "initializeByData")
      
      ItemRepository = {}
      stub(ItemRepository, "insert")

      ItemInitializer = require("scripts.ItemInitializer")
    end)

    it("should create item sprite at top of dead enemy", function()
      ItemInitializer.initialize(fakeEnemySprite)

      assert.stub(SpriteInitializer.initializeByData).was_called_with({
        name="item",
        x=1000,
        y=1750,
        sequence="item"
      })
    end)

    it("should insert to ItemRepository", function()
      ItemInitializer.initialize(fakeEnemySprite)
      
      assert.stub(ItemRepository.insert).was_called_with(fakeItemSprite)
    end)

    it("should add physics body to item")

    it("should fly the item")

    it("should add PlayerHitItemListener to item")
end)