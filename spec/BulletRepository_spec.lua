describe("BulletRepository", function()
    local BulletRepository

    local fakeGroup = {
      numChildren = 1,
      {}
    }
    local fakeBullet = {}

    before_each(function()
        BulletRepository = require("scripts.BulletRepository")
        
      _G.display = {
        newGroup = function()
            print("calling fakeGroup")
          return fakeGroup
        end
      }
      spy.on(display, "newGroup")
      stub(display, "remove")

      stub(fakeGroup, "insert")
      stub(fakeGroup[1], "removeSelf")
    end)

    it("should create group if not available when insert", function()
      BulletRepository.insert(fakeBullet)

      assert.stub(display.newGroup).was_called()
    end)

    it("should insert given bullet sprite to group when insert", function()
      BulletRepository.insert(fakeBullet)

      assert.stub(fakeGroup.insert).was_called_with(fakeGroup, fakeBullet)
    end)

    it("should remove group when removeAll", function()
      BulletRepository.removeAll()

      assert.stub(display.remove).was_called_with(fakeGroup)
    end)
end)
