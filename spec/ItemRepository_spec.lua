describe("ItemRepository", function()

    local fakeGroup = {
      numChildren = 1,
      {}
    }
    local fakeBullet = {}

    setup(function()
      display = {
        newGroup = function()
          return fakeGroup
        end
      }
      spy.on(display, "newGroup")
      stub(display, "remove")

      stub(fakeGroup, "insert")
      stub(fakeGroup[1], "removeSelf")

      ItemRepository = require("scripts.ItemRepository")
    end)

    it("should create group if not available when insert", function()
      ItemRepository.insert(fakeBullet)

      assert.stub(display.newGroup).was_called()
    end)

    it("should insert given bullet sprite to group when insert", function()
      ItemRepository.insert(fakeBullet)

      assert.stub(fakeGroup.insert).was_called_with(fakeGroup, fakeBullet)
    end)

    it("should remove group when removeAll", function()
      ItemRepository.removeAll()

      assert.stub(display.remove).was_called_with(fakeGroup)
    end)
end)