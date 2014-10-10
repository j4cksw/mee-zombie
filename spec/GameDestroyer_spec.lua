describe("GameDestroyer", function()
  local fakeEnemyGroup = {}
  local fakeFloorGroup = {}

    local GameDestroyer

  setup(function()
    stub(fakeEnemyGroup, "removeSelf")

    _G.EnemyRepository = {
      getEnemyGroup = function()
        return fakeEnemyGroup
      end
    }
    spy.on(EnemyRepository, "getEnemyGroup")

    stub(fakeFloorGroup, "removeSelf")

    _G.FloorRepository = {
      getFloorGroup = function()
      return fakeFloorGroup
      end
    }
    spy.on(FloorRepository, "getFloorGroup")

    _G.BulletRepository = {}
    stub(BulletRepository, "removeAll")

    _G.ItemRepository = {}
    stub(ItemRepository, "removeAll")

    GameDestroyer = require("scripts.GameDestroyer")
  end)

  it("should remove enemies", function()
    GameDestroyer.destroy()

    assert.stub(fakeEnemyGroup.removeSelf).was_called_with(fakeEnemyGroup)
  end)

  it("should remove floor", function()
     GameDestroyer.destroy()

    assert.stub(fakeFloorGroup.removeSelf).was_called_with(fakeFloorGroup)
  end)

  it("should remove bullets", function()
    GameDestroyer.destroy()

    assert.stub(BulletRepository.removeAll).was_called()
  end)

  it("should remove items", function()
    GameDestroyer.destroy()

    assert.stub(ItemRepository.removeAll).was_called()
  end)
end)
