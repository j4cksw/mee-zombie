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
      
      physics = {}
      stub(physics, "addBody")
      
      stub(fakeItemSprite, "setLinearVelocity")
      stub(fakeItemSprite, "addEventListener")
      
      ItemHitFloorListener = require("scripts.ItemHitFloorListener")

      ItemInitializer = require("scripts.ItemInitializer")
    end)

    it("should create item sprite at top of dead enemy", function()
      ItemInitializer.initialize(fakeEnemySprite)

      assert.stub(SpriteInitializer.initializeByData).was_called_with({
        name="item",
        x=1000,
        y=1900,
        sequence="item"
      })
    end)

    it("should insert to ItemRepository", function()
      ItemInitializer.initialize(fakeEnemySprite)
      
      assert.stub(ItemRepository.insert).was_called_with(fakeItemSprite)
    end)

    it("should add physics body to item", function()
      ItemInitializer.initialize(fakeEnemySprite)
      
      assert.stub(physics.addBody).was_called_with(fakeItemSprite, "dynamic", {filter={groupIndex=-1}, bounce=0.0, friction=0.0, density=0.0})
    end)

    it("should fly the item", function()
      ItemInitializer.initialize(fakeEnemySprite)
      
      assert.stub(fakeItemSprite.setLinearVelocity).was_called_with(fakeItemSprite, 250, -600)
    end)

    it("should add ItemHitFloorListener to item", function()
      ItemInitializer.initialize(fakeEnemySprite)
      
      assert.stub(fakeItemSprite.addEventListener).was_called_with(fakeItemSprite, "collision", ItemHitFloorListener.actionPerformed)
    end)
end)