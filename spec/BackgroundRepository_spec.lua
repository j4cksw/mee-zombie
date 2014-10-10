describe("BackgroundRepository", function()

    local fakeGroup = {
      numChildren = 1,
      {}
    }
    local fakeBullet = {}

    setup(function()
      _G.display = {
        newGroup = function()
          return fakeGroup
        end
      }
      spy.on(display, "newGroup")
      stub(display, "remove")

      stub(fakeGroup, "insert")
      stub(fakeGroup[1], "removeSelf")

      BackgroundRepository = require("scripts.BackgroundRepository")
    end)

    it("should create group if not available when insert", function()
      BackgroundRepository.insert(fakeBullet)

      assert.stub(display.newGroup).was_called()
    end)

    it("should insert given bullet sprite to group when insert", function()
      BackgroundRepository.insert(fakeBullet)

      assert.stub(fakeGroup.insert).was_called_with(fakeGroup, fakeBullet)
    end)

    it("should remove group when removeAll", function()
      BackgroundRepository.removeAll()

      assert.stub(display.remove).was_called_with(fakeGroup)
    end)
end)
